# ベースイメージ
FROM python:3.11.6-slim

# ビルド引数を定義
ARG GCP_PROJECT_ID
ARG BUCKET_NAME_FOR_ML

# 作業ディレクトリの設定
WORKDIR /machine-learning

# pipのアップグレード
RUN pip install --upgrade pip

# 必要なパッケージのインストール
COPY ./requirements.lock /machine-learning/

RUN sed '/-e/d' requirements.lock > requirements.txt
RUN pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cpu

# 必要なライブラリをインストール
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

# アプリケーションコードをコピー
COPY ./src /machine-learning/src

# .envファイルを作成し、ビルド引数の値を書き込む
RUN mkdir -p /machine-learning/secrets && \
    echo "PROJECT_ID=$GCP_PROJECT_ID" > /machine-learning/secrets/.env && \
    echo "BUCKET_NAME=$BUCKET_NAME_FOR_ML" >> /machine-learning/secrets/.env && \
    echo "BUCKET_NAME_FOR_FACE=$BUCKET_NAME_FOR_FACE" >> /machine-learning/secrets/.env

# 環境変数PATHの設定
ENV PYTHONPATH "${PYTHONPATH}:/machine-learning/src/"

# サーバー起動
ENTRYPOINT ["python", "src/proto-gen/machine_learning/v1/server.py"]