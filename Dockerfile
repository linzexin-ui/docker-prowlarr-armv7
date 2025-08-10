# prowlarr-armv7-docker/Dockerfile
FROM arm32v7/alpine:3.18

# 安装依赖
RUN apk add --no-cache \
    curl \
    icu-libs \
    libgcc \
    libstdc++

# 下载 Prowlarr
ARG VERSION=1.8.5.3969
RUN curl -L "https://github.com/Prowlarr/Prowlarr/releases/download/v${VERSION}/Prowlarr.master.${VERSION}.linux-musl-core-arm32.tar.gz" -o /tmp/prowlarr.tar.gz \
    && tar -xvzf /tmp/prowlarr.tar.gz -C /app --strip-components=1 \
    && rm /tmp/prowlarr.tar.gz

# 设置工作目录
WORKDIR /app

# 暴露端口
EXPOSE 9696

# 启动命令
CMD ["./Prowlarr", "--data=/config"]
