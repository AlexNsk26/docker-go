FROM golang:alpine  as build
WORKDIR /bin
ADD ./*.(mod|go) .
EXPOSE 9000
RUN /bin/bash -c 'CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build'
FROM golang:alpine
COPY --from=build /bin ./bin
CMD [ "golang","./bin/docker-demo-2" ]