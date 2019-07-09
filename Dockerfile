FROM python:3.6

MAINTAINER Jesse DeFer <aws-amicleaner@dotd.com>

RUN apt-get update \
    && apt-get install -y python-pip \
    && pip install aws-amicleaner \
    && amicleaner -v

RUN addgroup --gid 1000 jenkins \ 
    && adduser --ingroup jenkins --uid 1000 --disabled-password --gecos '' jenkins

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["aws-amicleaner"]
