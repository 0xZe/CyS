FROM python:3.8

WORKDIR /app


COPY . /app


RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate &&  python manage.py runserver 0.0.0.0:8000"]