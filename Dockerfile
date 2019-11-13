FROM python:3.7.5-slim-buster

LABEL maintainer="Igor Davydenko <iam@igordavydenko.com>"
LABEL description="Add poetry, pre-commit, and other dev-tools to official Python slim Docker image."

RUN apt update -qq && apt upgrade -y && apt install -y curl gcc git locales locales-all make nano openssh-client && apt autoremove -y

ENV PATH="/root/.local/bin:/root/.poetry/bin:${PATH}"

RUN pip install pip==19.3.1 pre-commit==1.20.0 tox==3.14.0 virtualenv==16.7.7

ENV POETRY_VERSION=1.0.0b4
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

WORKDIR /app
CMD ["python3"]
