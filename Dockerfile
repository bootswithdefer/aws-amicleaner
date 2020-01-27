FROM python:3

MAINTAINER Jesse DeFer <aws-amicleaner@dotd.com>

RUN apt-get update \
    && apt-get install -y python-pip

ADD . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install -e .

RUN addgroup --gid 1000 jenkins \ 
    && adduser --ingroup jenkins --uid 1000 --disabled-password --gecos '' jenkins

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["amicleaner"]
