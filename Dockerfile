FROM tiangolo/uwsgi-nginx-flask:python3.6

RUN apt-get update && apt-get install -y postgresql-client postgresql-contrib

USER postgres
RUN /etc/init.d/postgresql start &&\
	psql --command "CREATE USER test WITH PASSWORD 'test';" &&\
	createdb -O test test
USER postgres
#RUN -e POSTGRES_HOST_AUTH_METHOD= "trust"
WORKDIR /docker-fs
COPY . .

  
RUN pip install -r requirements.txt

EXPOSE 5000
ENV FLASK_APP=app.py
#RUN chmod 750 /docker-fs/entrypoint.sh 
ENTRYPOINT ["/docker-fs/entrypoint.sh"]

