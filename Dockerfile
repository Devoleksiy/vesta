FROM centos:8

#RUN dnf install epel-release -y \
#&& dnf upgrade -y \
#&& dnf clean all

# ------------------  Server with GUI  ------------------------------
#RUN dnf groupinstall "Server with GUI" --allowerasing -y \
#&& dnf clean all
#RUN systemctl set-default graphical.target
# -------------------------------------------------------------------
USER root
WORKDIR /root

CMD ["/usr/sbin/init"]

#RUN yum -y install httpd; yum clean all; systemctl enable httpd.service