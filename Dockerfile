FROM python:3.9-slim

WORKDIR /app

# Copia o arquivo de requisitos e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
