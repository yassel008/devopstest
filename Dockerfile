FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=10s --retries=3   CMD curl -f http://localhost:8000/api/ || exit 1

RUN useradd -m myuser
USER myuser

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]