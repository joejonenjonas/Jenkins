#!/bin/bash
#docker container rm -f $(docker ps -a -q)
#rm -rf tempdir
#mkdir tempdir

cd tempdir
git clone https://github.com/nikolayg/sample-python-api
#rm Pipfile
#rm Pipfile.Lock

#cmd command om python script uit te voeren
echo "FROM python:3.6
COPY ./sample-python-api .
COPY requirements.txt .
#RUN pip install pipenv
RUN pip install -r requirements.txt
EXPOSE 4000
CMD python ./src/main.py" > Dockerfile

pwd
#cd tempdir
docker build -t pyapp .
#docker run -t -d -p 4000:4000 --name nikolaygapp pyapp
docker run --network host -d pyapp
docker ps -a 
curl http://127.0.0.1:4000/api/swagger