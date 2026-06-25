# Flujo CI/CD para Proyecto Django con Docker

## 1. Descripción general

Este pipeline implementa un flujo CI/CD básico para una aplicación Django utilizando GitHub Actions y Docker.

El objetivo es automatizar pruebas, construcción de imagen y simulación de despliegue, garantizando la integridad del código, la reproducibilidad del entorno y la ejecución consistente del sistema en diferentes ambientes.

---

## 2. Flujo del pipeline

```text
[ Commit en GitHub ]
        ↓
[ GitHub Actions CI ]
        ↓
[ Instalación de dependencias ]
        ↓
[ Ejecución de Tests Django ]
        ↓
[ Validación del proyecto ]
        ↓
[ Build Imagen Docker ]
        ↓
[ Exportación de artifact (.tar) ]
        ↓
[ Almacenamiento en GitHub Actions ]
        ↓
[ Simulación de Deploy Local con Docker Compose ]
        ↓
[ Aplicación Django en ejecución ]
        ↓
[ Base de datos PostgreSQL activa ]
```

---

## 3. Explicación del archivo `ci.yml` (GitHub Actions)

El archivo `.github/workflows/ci.yml` define el pipeline de integración continua y automatización del proceso CI/CD.

Este workflow se ejecuta automáticamente cuando ocurre un push o pull request hacia la rama `ci-setup`.

El pipeline está compuesto por dos etapas principales: CI (Testing) y Build (Docker).

---

### 3.1 Instalación de dependencias

Se configura un entorno con Python 3.10 y se instalan las dependencias del proyecto:

```bash
pip install -r requirimientos.txt
```

Esto permite asegurar que todas las librerías necesarias estén disponibles antes de ejecutar el proyecto.

---

### 3.2 Ejecución de tests

Se ejecutan las pruebas automáticas del proyecto Django:

```bash
python manage.py test
```

Esto garantiza que la lógica del sistema funcione correctamente antes de generar el build.

---

### 3.3 Build de imagen Docker

Se construye una imagen del proyecto para encapsular la aplicación:

```bash
docker build -t django-app .
```

Esto permite que la aplicación sea portable y ejecutable en cualquier entorno con Docker.

---

### 3.4 Exportación del artifact

La imagen generada se guarda como artifact en GitHub Actions:

```bash
docker save django-app > image.tar
```

Este archivo puede descargarse posteriormente para despliegues o pruebas.

---

## 4. Simulación de despliegue (CD)

El despliegue se realiza en un entorno local externo utilizando Docker Compose.

El objetivo es simular un entorno de producción real.

### Pasos de ejecución:

```bash
git clone https://github.com/ajacomeh/proy_sales_poo_cicd.git
cd proy_sales_poo_cicd
docker-compose up --build
```

---

## 5. Recomendaciones finales

Para garantizar buenas prácticas en el flujo CI/CD se recomienda:

- No subir archivos `.env` al repositorio.
- Evitar credenciales hardcodeadas.
- No usar container_name en producción.
- Usar imágenes ligeras (python slim).
- Separar servicios en contenedores independientes.
- Ejecutar tests antes del build.
- Mantener workflows simples.
- Separar CI, BUILD y DEPLOY.
- Usar ramas main y ci-setup.

---
