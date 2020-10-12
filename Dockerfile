FROM python:3.7

RUN pip install apache-airflow

ENV AIRFLOW_HOME=airflow
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
RUN airflow initdb

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY dags airflow/dags

CMD (airflow scheduler &) && airflow webserver