# 使用 ARMv7 基础镜像
FROM --platform=linux/arm/v7 arm32v7/alpine:3.18

# 设置构建参数
ARG TARGETARCH=arm
ARG TARGETVARIANT=v7
ARG TARGETPLATFORM=linux/arm/v7

# 安装 ARMv7 依赖
RUN apk add --no-cache \
    libgcc \
    libstdc++ \
    icu-libs \
    curl

# 下载 Prowlarr
ARG VERSION=1.8.5.3969
RUN curl -fL "https://github.com/Prowlarr/Prowlarr/releases/download/v${VERSION}/Prowlarr.master.${VERSION}.linux-musl-core-arm32.tar.gz" \
    | tar -xzvf - -C /app --strip-components=1

# 设置工作目录
WORKDIR /app

# 暴露端口
EXPOSE 9696

# 启动命令
CMD ["./Prowlarr", "--data=/config"]
