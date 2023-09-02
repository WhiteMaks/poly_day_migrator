FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add gcompat
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

ENV WORK_PATH=/usr/migrator

COPY ./entrypoint.sh $WORK_PATH/

WORKDIR $WORK_PATH

RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh