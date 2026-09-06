FROM ghcr.io/jtsang4/better-qdrant-mcp:latest

USER root

RUN uv pip install \
    --python /opt/venv/bin/python \
    "qdrant-client>=1.19,<1.20"

RUN /opt/venv/bin/python -c \
    "import importlib.metadata; print('qdrant-client:', importlib.metadata.version('qdrant-client'))"

USER mcp