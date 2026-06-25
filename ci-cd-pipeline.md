# Flujo CI/CD para Proyecto Django con Docker

## 1. Descripción general

Este pipeline implementa un flujo CI/CD básico para una aplicación Django utilizando GitHub Actions y Docker.

El objetivo es automatizar pruebas, construcción de imagen y simulación de despliegue.

---

## 2. Flujo del pipeline

```text id="p5"
[ Commit en GitHub ]
        ↓
[ GitHub Actions CI ]
        ↓
[ Ejecutar Tests Django ]
        ↓
[ Build Imagen Docker ]
        ↓
[ Guardar Artifact ]
        ↓
[ Simulación de Deploy Local ]
