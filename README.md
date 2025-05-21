# DevOps Demo Project - Django + PostgreSQL en Kubernetes

Una aplicación de ejemplo construida con Django que demuestra una pipeline completa de DevOps:

Dockerización
CI/CD con GitHub Actions
Despliegue en Kubernetes local con Docker Desktop
Seguridad y buenas prácticas

##  Tecnologias utilizadas
- Python 3.12 + Django
- PostgreSQL
- Docker
- Kubernetes (Docker Desktop)
- GitHub Actions (CI/CD)
- Infraestructura como Código: Terraform (planificado para AWS EKS)
- Horizontal Pod Autoscaler
- Escaneo de vulnerabilidades: Trivy
- Cobertura y análisis estático: pytest-cov, flake8, bandit

## 📁 Estructura del proyecto
.
├── k8s/
│   ├── deployment.yaml
│   ├── postgres-deployment.yaml
│   ├── secret.yaml
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

## CI/CD: Flujo automatizado (GitHub Actions)
Ejecuta pruebas y análisis estático:

pytest, coverage, flake8, bandit
Genera cobertura de código.
Escanea vulnerabilidades con Trivy.
Construye y sube imagen a Docker Hub.
Aplica despliegue en Kubernetes (local por ahora)

##  Docker
### Construccion de la imagen local
docker build -t yasselreyes8x/demo-app .

##  Kubernetes local con Docker Desktop
### Activar cluster local
- Docker Desktop:
  - Activar Kubernetes desde Settings → Kubernetes → Enable
Despliegue de la app en local con Kubernetes via Docker Desktop.
Incluye:

deployment.yaml: con configuración de réplicas, probes, recursos, etc.
service.yaml: servicio tipo ClusterIP.
postgres.yaml: base de datos PostgreSQL.
secrets.yaml: secretos manejados vía envFrom.

## Seguridad

Uso de Secrets en Kubernetes con stringData
Escaneo de código (Bandit)
Escaneo de imágenes Docker (Trivy)
Usuario no root en contenedor


### Desplegar recursos
kubectl apply -f k8s/
kubectl get pods,svc,deploy,hpa

### Acceder a la aplicación
#  NodePort ( 30080)
http://localhost:30080/api

## ⚙️ CI/CD con GitHub Actions
Incluye:
- Linter (flake8)
- Formateador (black)
- Pruebas con coverage
- Subida de cobertura a Codecov
- Build/push de imagen a DockerHub
- Despliegue en Kubernetes

El pipeline se activa al hacer push a main

#  Autoescalado con HPA
El hpa.yaml escala entre 2 y 5 réplicas según uso de CPU:
spec:
  minReplicas: 2
  maxReplicas: 5
  targetCPUUtilizationPercentage: 50

# Observabilidad
- Liveness y Readiness Probes para asegurar salud del contenedor ## lo desactive estaba causando inconvenientes con los contenedores

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

## Pendiente / Planeado
Uso de Terraform para infraestructura en AWS (EKS)
Monitoreo (Prometheus, Grafana)
Ingress + TLS
CD en AWS real
Backups

## ❗ Requerimientos no cumplidos
- Infraestructura como código con Terraform en la nube fue descartada por temas técnicos del entorno local.

## 📬By
Yassel Leonardo












   
