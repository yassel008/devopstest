# demo-devops

Este repositorio contiene una aplicación Django dockerizada, diseñada para pruebas técnicas DevOps.

## Contenido

- Dockerfile para contenerización
- GitHub Actions workflow (`.github/workflows/pipeline.yml`) con:
  - Build
  - Unit tests
  - Análisis estático con flake8
  - Reporte de cobertura
  - Build & Push de Docker (simulado)
- Manifiestos de Kubernetes en el directorio `k8s/`

## Uso

```bash
# Construir la imagen
docker build -t demo-devops .

# Ejecutar contenedor
docker run -p 8000:8000 demo-devops
```

## Kubernetes

Despliegue local con minikube o Docker Desktop:

```bash
kubectl apply -f k8s/
```

Visita `http://localhost:30080/api/` para probar el servicio.