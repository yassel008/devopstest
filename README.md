# DevOps Demo Project - Django + PostgreSQL en Kubernetes

Este proyecto es una aplicación Django dockerizada, desplegada en un cluster de Kubernetes local (Docker Desktop o Minikube). Incluye un pipeline CI/CD completo con pruebas, analisis de calidad de código, construcción y despliegue automatizado.

## 🚀 Tecnologias utilizadas
- Python 3.11 + Django
- PostgreSQL
- Docker
- Kubernetes (Docker Desktop o Minikube)
- GitHub Actions (CI/CD)
- Horizontal Pod Autoscaler
- Liveness y Readiness Probes

## 📁 Estructura del proyecto
.
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── hpa.yaml
├── .github/workflows/
│   └── pipeline.yaml
├── Dockerfile
├── requirements.txt
├── manage.py
├── demo/
│   └── ...
└── README.md

## 🐳 Docker
### Construccion de la imagen local
docker build -t myapp:latest .

## ☸️ Kubernetes local con Docker Desktop
### Activar cluster local
- Docker Desktop:
  - Activar Kubernetes desde Settings → Kubernetes → Enable

### Desplegar recursos
kubectl apply -f k8s/
kubectl get pods,svc,deploy,hpa

### Acceder a la aplicación
#  NodePort ( 30080)
http://localhost:30080

## ⚙️ CI/CD con GitHub Actions
Incluye:
- Linter (flake8)
- Formateador (black)
- Pruebas con coverage
- Subida de cobertura a Codecov
- Build/push de imagen a DockerHub
- Despliegue en Kubernetes

El pipeline se activa al hacer push a main

# 📈 Autoescalado con HPA
El hpa.yaml escala entre 2 y 5 réplicas según uso de CPU:
spec:
  minReplicas: 2
  maxReplicas: 5
  targetCPUUtilizationPercentage: 50

# 🔍 Observabilidad
- Liveness y Readiness Probes para asegurar salud del contenedor

# 📌 Consideraciones de producción
- Uso de Ingress con TLS y dominio propio (no incluido por entorno local)
- Secrets y ConfigMaps para separar configuración
- Alertas/monitorización con Prometheus + Grafana (fuera de alcance de esta entrega)

## 📊 Diagrama de arquitectura
[GitHub] → (CI/CD) → [DockerHub] → [Kubernetes (Docker Desktop)]
                                     ↓
                             [Deployment + Service + HPA]
                                     ↓
                             [Django App + PostgreSQL]

# ✅ Verificación final
- [x] Dockerfile con buenas prácticas
- [x] Kubernetes con despliegue, servicio y autoescalado
- [x] Pipeline funcional y seguro
- [x] Prolijidad y documentación

## ❗ Requerimientos no cumplidos
- Infraestructura como código con Terraform en la nube fue descartada por temas técnicos del entorno local.

## 📬By
Yassel Leonardo












   
