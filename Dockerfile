FROM docker.trd.zedge.net:5001/zedge/java8_centos7

RUN yum install -y python-pip

RUN pip install -U "pip>=1.4" "setuptools>=0.9" "wheel>=0.21" twine

# TODO: Use ENV which can be replaced on build time? When building in datacenter
RUN pip install -i "https://calculon.trd.zedge.net/python/simple/" zsd kazoo docopt

ADD target/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar /zkui.jar
ADD config.cfg /config.cfg
ADD /run-zsd.sh /run-zsd.sh

CMD /run-zsd.sh
