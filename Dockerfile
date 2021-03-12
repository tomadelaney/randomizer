FROM python:3

LABEL maintainer="Tom Delaney"

COPY ./requirements.txt /app/
COPY ./mysql_faker.py /app/

WORKDIR /app

RUN pip install -r requirements.txt

# Note that SQL_HOST is not needed IF you're connecting to
# a localhost db or Cloud SQL Proxy AND you're not using Docker on MacOS
# Docker on MacOS uses hypervisor and doesn't share network with
# the host machine even when you set -net=host

# Uncomment SQL_HOST line and specify the IP to connect to
ENV SQL_HOST "127.0.0.1"

# passing the --auto flag to remove interactivity from the script
CMD [ "python", "mysql_faker.py", "--auto", "--locations=10", "--employees=100", "--dontclean" ]
