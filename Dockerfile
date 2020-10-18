FROM alpine:3.8

LABEL maintainer="Biff Tannen <cryptobiff@protonmail.com>"

RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O /usr/local/bin/jq && \
    echo 'af986793a515d500ab2d35f8d2aecd656e764504b789b66d7e1a0b727a124c44  /usr/local/bin/jq' | sha256sum -c && \
    chmod +x /usr/local/bin/jq

CMD ["jq"]