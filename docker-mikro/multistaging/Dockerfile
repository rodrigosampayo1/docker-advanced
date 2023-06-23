FROM golang:1.18-alpine as ARTIFACT
RUN apk add -U git && \
    go install github.com/suntong/html2md@latest
FROM alpine
COPY --from=ARTIFACT /go/bin/html2md /html2md
ENTRYPOINT ["/html2md"]
CMD ["-h"]

#docker build -t mikroways/html2md .
#docker run --rm -it mikroways/html2md -i https://mikroways.net