FROM ghcr.io/astral-sh/uv:latest AS uv

FROM ghcr.io/jtsang4/better-qdrant-mcp:latest

USER root

COPY --from=uv /uv /usr/local/bin/uv

RUN uv pip install \
    --python /opt/venv/bin/python \
    --upgrade \
    "qdrant-client>=1.19,<1.20"

RUN /opt/venv/bin/python -c \
    "import importlib.metadata; print('qdrant-client:', importlib.metadata.version('qdrant-client'))"

# A imagem original testa /health, mas esse endpoint não existe
HEALTHCHECK NONE

USER mcp