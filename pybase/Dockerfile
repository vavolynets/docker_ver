FROM alpine:3.7

LABEL name="PIP Onbuild Base Image based on alpine:3.7" \
      vendor="L30NET Home" \
      maintainer="vavolynets@gmail.com" \
      base="py2-pip" \
      build-date="20181001"

ARG Work_Dir="/opt/python"

RUN apk update && \
    apk upgrade && \
    apk add alpine-sdk && \
    apk add py2-pip && \
    rm -rf /var/cache/apk/*

WORKDIR $Work_Dir
ONBUILD COPY requirements.txt .
ONBUILD RUN pip install --upgrade pip && \
            pip install --no-cache-dir -r requirements.txt
ONBUILD COPY . $Work_Dir

ENTRYPOINT ["/usr/bin/python"]
