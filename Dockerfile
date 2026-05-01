# 使用 Rust 官方鏡像作為編譯環境
FROM rust:1.77-bookworm AS builder

# 安裝必要工具
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# 複製並編譯 (工作流中會自動處理源碼，這裡保留手動構建的邏輯)
RUN git clone https://codeberg.org/yggverse/psocks.git . && \
    cargo build --release --locked

# 這裡不設定 CMD 或 ENTRYPOINT，因為我們只需要裡面的文件
