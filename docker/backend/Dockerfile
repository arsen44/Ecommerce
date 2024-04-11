FROM python:3.11-alpine


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app/backend

RUN apk update  \
    && apk add gcc libc-dev make git libffi-dev openssl-dev libxml2-dev libxslt-dev jpeg-dev zlib-dev libjpeg postgresql-dev gcc python3-dev musl-dev


RUN pip install --upgrade pip
ADD ./backend/requirements.txt /app/backend/
RUN pip install -r /app/backend/requirements.txt
RUN pip install gunicorn
ADD ./docker /app/docker
ADD ./backend /app/backend


CMD gunicorn -w 2 -b 0.0.0.0:8000 --chdir /app/backend/server server.wsgi



