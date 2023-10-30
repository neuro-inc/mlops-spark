ARG BASE_TAG=v3.4.0
FROM apache/spark-py:${BASE_TAG}
USER root
RUN apt-get update && apt-get install -y maven
COPY requirements/java/pom.xml .
RUN mvn dependency:copy-dependencies -DoutputDirectory=/opt/spark/jars

LABEL org.opencontainers.image.source = "https://github.com/neuro-inc/mlops-spark"
COPY requirements/py py-requirements
RUN pip install --no-cache-dir -r py-requirements/py-reqs.txt
