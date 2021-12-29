FROM alpine:latest

LABEL MAINTAINER "CasjaysDev" \
  AUTHOR "CasjaysDev" \
  EMAIL "" \
  DESCRIPTION "Django notes api" \
  VERSION "1.0.0" \
  LICENSE "MIT" \
  URL "https://github.com/casjay-projects/django-notes-api" \
  BUILD_DATE "$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

WORKDIR /app
RUN apk upgrade --no-cache && apk add --no-cache tzdata python3 python3-dev py3-pip

COPY ./requirements.txt /app/requirements.txt
RUN pip3 --no-cache-dir install --upgrade pip && pip3 --no-cache-dir install -r /app/requirements.txt

COPY ./ /app

COPY ./notes-api /usr/bin/

EXPOSE 14300

ENTRYPOINT [ "/usr/bin/notes-api" ]
