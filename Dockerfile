FROM centos:7.2.1511

RUN yum -y install gcc libffi-devel make openssl-devel python-devel python-setuptools 

RUN easy_install pip 

RUN pip install --upgrade setuptools --user python
