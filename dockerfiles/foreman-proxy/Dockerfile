FROM centos:7

RUN echo "tsflags=nodocs" >> /etc/yum.conf && \
    yum -y install epel-release && \
    yum -y install http://yum.theforeman.org/releases/2.0/el7/x86_64/foreman-release.rpm && \
    yum -y install foreman-release-scl ansible && \
    yum -y install foreman-proxy  && \
    yum clean all

COPY container-assets/logs.yml /etc/foreman-proxy/settings.d/logs.yml
COPY container-assets/settings.yml /etc/foreman-proxy/settings.yml
COPY container-assets/register.yaml /root/register.yaml


RUN echo "stdout_callback = yaml" >> /etc/ansible/ansible.cfg

RUN ln -s /etc/foreman-proxy/settings.d /usr/share/foreman-proxy/config/settings.d

CMD ["/usr/share/foreman-proxy/bin/smart-proxy"]
