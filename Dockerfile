FROM python:3
USER root

#set timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y upgrade
RUN apt-get update && apt-get -y install locales && \
  dpkg-reconfigure locales && \
  locale-gen en_US.UTF-8

RUN apt-get update && apt-get -y install sudo screen vim less

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ARG user="build"
ARG group="build"

RUN id ${user} 2>/dev/null || useradd --uid 1000 --create-home ${user}
RUN echo ${user} " ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

WORKDIR /home/${user}

RUN chown ${user}:${group} .*
RUN chown -R ${user}:${group} .

USER ${user}
RUN mkdir -p /home/${user}/src
COPY requirements.txt /home/${user}/src
WORKDIR /home/${user}/src

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install -r requirements.txt