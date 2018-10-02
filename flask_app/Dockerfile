ARG Img=$Img
FROM ${Img}

LABEL name="Flask Python Image based on Alpine" \
      vendor="L30NET Home" \
      maintainer="vavolynets@gmail.com" \
      base="Flask,docker" \
      build-date="20181001"

# Build Environment
ARG Docker_GID=$Docker_GID
ARG TIMEZONE="Europe/Kiev"
ARG Web_User="www"
ARG Web_Group="www"
ARG Web_Home="/var/www"
ARG Def_App="docker_version.py"

# Env

ENV LANG C.UTF-8
ENV FLASK_APP="/opt/python/app/${Def_App}"

RUN apk update && \ 
    apk upgrade && \
    apk add tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    echo "${TIMEZONE}" > /etc/TZ && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

RUN addgroup -S $Web_Group && \
    addgroup -g $Docker_GID docker && \
    adduser -H -h $Web_Home -S \
            -g 'Flask web user' -G $Web_Group -s /bin/ash $Web_User && \
    adduser $Web_User docker && \
    install -d -m 770 -o $Web_User -g $Web_Group $Web_Home
 

STOPSIGNAL SIGINT

WORKDIR $Web_Home

USER $Web_User

ENTRYPOINT ["flask"]

CMD ["run", "-h", "0.0.0.0", "-p", "5000"]
