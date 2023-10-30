FROM jupyter/pyspark-notebook:python-3.10
# for spark-3.4.0, spark-3.5.0 Hadoop is 3.3.4

# use Maven
USER root
RUN apt-get update -qq && apt-get install --no-install-recommends -y maven
COPY requirements/java/pom.xml .
RUN mvn dependency:copy-dependencies -DoutputDirectory=$SPARK_HOME/jars

# Alternative: use direct download 
# RUN cd /opt/spark/jars && \
# wget "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar"

USER $NB_USER

COPY requirements/py py-requirements
RUN pip install --no-cache-dir -r py-requirements/jupyter-reqs.txt && \
    ipython profile create && \
    echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >> \
    $(ipython profile locate default)/ipython_kernel_config.py && \
    jupyter nbextension install sparkmonitor --py --user && \
    jupyter nbextension enable  sparkmonitor --py --user