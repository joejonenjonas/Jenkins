FROM python:3.6
COPY ./sample-python-api .
COPY requirements.txt .
#RUN pip install pipenv
RUN pip install -r requirements.txt
EXPOSE 4000
CMD python ./src/main.py
