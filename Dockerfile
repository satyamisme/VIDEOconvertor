FROM python:3.9.2-slim-buster


RUN mkdir /app && chmod 777 /app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive

RUN pip install --upgrade pip


RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d


RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt -qq update && apt -qq install -y gcc git ffmpeg


COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash","convertor.sh"]
