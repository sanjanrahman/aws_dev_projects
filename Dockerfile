FROM alpine:3.8

# Having issues with Jenkins. Adding the line below to force Jenkins to rebuild the image.
ENV FOO=BAR

ENV TERRAFORM_VERSION=0.11.10
ENV TERRAFORM_SHA256SUM=43543a0e56e31b0952ea3623521917e060f2718ab06fe2b2d506cfaa14d54527
ENV TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV TFLINT_VERSION=0.7.2
ENV TFLINT_SHA256SUM=87db84ee07d396deb8e73dc503104520fff8a2c6399f9b1f1d185f960e51b243
ENV TFLINT_DOWNLOAD_URL=https://github.com/wata727/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip

RUN apk add --no-cache \
        bash \
        curl \
        git \
        jq \
        zip

RUN curl -o /tmp/terraform.zip -L "${TERRAFORM_DOWNLOAD_URL}" \
        && echo "${TERRAFORM_SHA256SUM}  /tmp/terraform.zip" > /tmp/terraform.sha256sum \
        && sha256sum -cs /tmp/terraform.sha256sum \
        && unzip /tmp/terraform.zip \
        && mv terraform /bin \
        && rm /tmp/terraform.*

RUN curl -o /tmp/tflint.zip -L "${TFLINT_DOWNLOAD_URL}" \
        && echo "${TFLINT_SHA256SUM}  /tmp/tflint.zip" > /tmp/tflint.sha256sum \
        && sha256sum -cs /tmp/tflint.sha256sum \
        && unzip /tmp/tflint.zip \
        && mv tflint /bin \
        && rm /tmp/tflint.*

RUN apk add --no-cache \
        build-base \
        graphviz \
        groff \
        less \
        mailcap \
        python \
        python3 \
        python-dev \
        py-pip \
        && pip install --upgrade awscli==1.14.32 s3cmd==2.0.1 python-magic

RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
