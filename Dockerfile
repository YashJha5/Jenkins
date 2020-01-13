FROM ubuntu:latest
MAINTAINER Yash Jha "jhayash55@gmail.com"
RUN apt-get update -y
RUN apt-get install -y python3-pip python-dev build-essential
ADD . /flask-app
WORKDIR /flask-app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["flask-docker.py"]
