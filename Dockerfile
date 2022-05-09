FROM alpine:latest

FROM python:latest

RUN pip3 install pipenv

RUN pip3 install flask

RUN pip3 install flask_restful

ENV PROJECT_DIR /rest-api-cicd

WORKDIR ${PROJECT_DIR}

COPY Pipfile .

COPY Pipfile.lock .

COPY . .

RUN pipenv install --deploy

EXPOSE 5000

CMD ["pipenv", "run", "python", "api.py"]

