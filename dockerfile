FROM golang:alpine  as build
WORKDIR /bin
ADD . .
#ADD ./*.(mod|go) .
EXPOSE 9000
SHELL [ "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build" ] 
FROM golang:alpine
COPY --from=build /bin/docker-demo-2 ./bin
CMD [ "golang","./bin/docker-demo-2" ]