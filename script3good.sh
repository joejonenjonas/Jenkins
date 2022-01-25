#!/bin/bash

git clone https://github.com/nikolayg/sample-python-api
pwd

echo "FROM python:3.6
COPY ./sample-python-api .
COPY requirements.txt .
#RUN pip install pipenv
RUN pip install -r requirements.txt
EXPOSE 5000
CMD python ./src/main.py" > Dockerfile

pwd
#cd tempdir
docker build -t pyapp .
#docker run -t -d -p 4000:4000 --name nikolaygapp pyapp
docker run --network host -d pyapp
docker ps -a 
curl http://127.0.0.1:5000/api/swagger