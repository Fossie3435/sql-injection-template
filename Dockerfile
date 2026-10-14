FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git \
	php \
	postgresql \    
	php-pgsql \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /sql-injection-demo

COPY . /sql-injection-demo

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/sql-injection-demo"]

