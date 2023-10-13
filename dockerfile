FROM golang:alpine  as build
WORKDIR /bin
ADD . .
#ADD ./*.(mod|go) .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
FROM scratch
#SHELL [ "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build" ] 
#FROM golang:alpine
COPY --from=build /bin/docker-demo-2 /bin/docker-demo-2
CMD [ "/bin/docker-demo-2" ]
EXPOSE 9000