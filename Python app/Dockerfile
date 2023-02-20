FROM python:3.9

WORKDIR /app
ENV ENVIRONMENT=DEV HOST=localhost PORT=8000 REDIS_HOST=localhost REDIS_PORT=6379 REDIS_DB=0
COPY . .
RUN pip install -r requirements.txt
CMD ["python3", "hello.py"]