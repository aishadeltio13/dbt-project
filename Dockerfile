# CAMBIO CLAVE: Usamos 'bookworm' (Debian 12) en lugar de 'buster' (Debian 10)
# Esto soluciona el error de los repositorios 404
FROM python:3.10-slim-bookworm

# 2. Instalamos git (necesario para descargar paquetes de dbt)
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

# 3. Definimos la carpeta de trabajo dentro del contenedor
WORKDIR /usr/app

# 4. Copiamos el archivo de requisitos e instalamos dbt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Configuración para que dbt sepa dónde buscar el profiles.yml
ENV DBT_PROFILES_DIR=/usr/app

# 6. Comando por defecto
CMD ["tail", "-f", "/dev/null"]