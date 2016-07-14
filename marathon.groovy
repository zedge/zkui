app('/backend-zkbrowser-con-servers') {
    container(DOCKER) {
        docker {
            image sl1('zedge/zkui')
            network BRIDGE
            forcePullImage true

            portMapping {
                name 'http'
                containerPort 9090
            }
        }
    }
    healthCheck(COMMAND) {
        command '/bin/true'
        maxConsecutiveFailures 0
    }
    instances 1
    cpus 0.5
    mem 1024
    upgradeStrategy {
        minimumHealthCapacity 1
        maximumOverCapacity 1
    }
    env MARATHON_API: marathonApiUrl(),
            LOG_LEVEL: 'INFO',
            ZSD: zookeeperHostPorts().join(','),
            ZSD_ROOT: 'test',
            ZSD_ZK_NAME: 'filedist-zookeeper.zk'
}
