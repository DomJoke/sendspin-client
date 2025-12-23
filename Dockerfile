FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libasound2 \
    libasound2-plugins \
    libportaudio2 \
    jq \
 && rm -rf /var/lib/apt/lists/*

 # 🔒 Pin numpy to a CPU-safe version
RUN pip install --no-cache-dir "numpy<2"

RUN pip install --no-cache-dir \
    git+https://github.com/Sendspin/sendspin-cli.git

COPY run.sh /run.sh

RUN sed -i 's/\r$//' /run.sh && chmod +x /run.sh

CMD ["/run.sh"]
