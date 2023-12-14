FROM almalinux:8
RUN yum install nginx -y
RUN echo "This is nginx"
CMD ["nginx", "-g", "daemon off;"]
