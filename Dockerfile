FROM ubuntu:22.04

# 非対話モードでパッケージインストール
ENV DEBIAN_FRONTEND=noninteractive

# 基本パッケージとGodotのインストール
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    xvfb \
    x11-utils \
    libxcursor1 \
    libxinerama1 \
    libxrandr2 \
    libxss1 \
    libgconf-2-4 \
    libasound2 \
    libpulse0 \
    libnss3 \
    && rm -rf /var/lib/apt/lists/*

# Godot Engine のダウンロードとインストール
RUN wget -q https://downloads.tuxfamily.org/godotengine/4.2.1/Godot_v4.2.1-stable_linux.x86_64.zip -O /tmp/godot.zip \
    && unzip /tmp/godot.zip -d /tmp/ \
    && mv /tmp/Godot_v4.2.1-stable_linux.x86_64 /usr/local/bin/godot \
    && chmod +x /usr/local/bin/godot \
    && rm /tmp/godot.zip

# 作業ディレクトリの設定
WORKDIR /workspace

# 開発者ユーザーの作成（権限問題を回避）
RUN groupadd -g 1000 developer && \
    useradd -m -u 1000 -g developer developer && \
    chown -R developer:developer /workspace

USER developer

# エントリーポイントの設定
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
USER root
RUN chmod +x /usr/local/bin/entrypoint.sh
USER developer

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]