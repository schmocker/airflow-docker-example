FROM python:3.7

# install and initialize airflow
RUN pip install apache-airflow

ENV AIRFLOW_HOME=airflow
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
RUN airflow initdb

# copy dags and install requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY dags airflow/dags

# run airflow scheduler and webserver
CMD (airflow scheduler &) && airflow webserver