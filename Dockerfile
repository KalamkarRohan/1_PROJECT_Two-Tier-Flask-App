FROM python:3.14.3-slim

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . . 

CMD ["python","app.py"]
