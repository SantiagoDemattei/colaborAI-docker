# 📦 ColaborAI - Infraestructura Docker

Este repositorio contiene los archivos necesarios para levantar el entorno de desarrollo de **ColaborAI**, una aplicación Java Spring Boot con base de datos MySQL, usando Docker y Docker Compose.

## 📁 Estructura del repositorio

```
colaborai-docker/
├── docker-compose.yml       # Orquesta contenedores (backend + base de datos)
├── Dockerfile               # Build de la app Spring Boot usando OpenJDK 24
├── .env                     # Variables de entorno locales (NO se sube al repo)
├── .env.template            # Plantilla editable para .env
├── .gitignore               # Ignora archivos sensibles y temporales
└── README.md                # Esta documentación
```

## ⚙️ Requisitos previos

- Docker Desktop instalado y corriendo
- Git instalado y configurado
- Proyecto `colaborai` (Spring Boot) clonado en **carpeta hermana**, como:

```
/tu-carpeta/
├── colaborai/            ← código fuente del backend (repositorio separado)
└── colaborai-docker/     ← este repositorio
```

## 🚀 Instrucciones de uso

### 1. Clonar este repositorio

```bash
git clone https://github.com/TU_USUARIO/colaborai-docker.git
cd colaborai-docker
```

### 2. Crear archivo `.env`

```bash
cp .env.template .env
```

> 🔐 Editá las variables en `.env` según tus credenciales o entorno local.

### 3. Levantar los contenedores

```bash
docker-compose up --build
```

Esto construirá la imagen de la app usando el código en `../colaborai` y levantará también un contenedor MySQL. Por defecto:

- App estará disponible en: [http://localhost:8080](http://localhost:8080)
- MySQL estará escuchando en: `localhost:3306`

### 4. Apagar los contenedores

```bash
docker-compose down
```

### 5. Limpiar volúmenes (opcional)

```bash
docker-compose down -v
```

## 🛠️ Personalización

Si necesitás perfiles distintos para desarrollo y producción, podés:

- Usar diferentes `.env` y montar por entorno
- Agregar configuración `application-dev.yml` y `application-prod.yml` en el backend

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` si la agregás más adelante.
