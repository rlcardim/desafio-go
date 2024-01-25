FROM golang:1.21 as contrucao

WORKDIR /usr/src/app

COPY hello.go ./

RUN go mod init exemplo/hello \ 
    && go build -o hello .

FROM scratch

COPY --from=contrucao /usr/src/app/ .

CMD ["/hello"]