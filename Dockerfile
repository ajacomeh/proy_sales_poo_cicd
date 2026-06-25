FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# copiar requirements
COPY requirimientos.txt /app/

# instalar dependencias python
RUN pip install --upgrade pip
RUN pip install -r requirimientos.txt

# copiar proyecto
COPY . /app/

# exponer puerto
EXPOSE 8000

# comando de ejecución
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]