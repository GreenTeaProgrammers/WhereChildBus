# proto-gen

`proto-gen`は、gRPC と Protocol Buffers を使用して API を定義し、Python クライアントのために生成されたコードをまとめたディレクトリです

## クライアントの実装例

`where_child_bus/v1`ディレクトリ内の`client.py`に API クライアントの実装例が含まれています。このクライアントを使用して、API を介してバスに乗っている子供の位置情報を取得することができます。

## gRPC ファイルの修正

生成された`*_grpc.py`ファイルには、いくつかの場合において import 文が不足している可能性があります。この問題は、`import grpc.experimental`を追加することで解決できます。

### 解決方法

1. `*_grpc.py`ファイルを開きます。
2. ファイルの先頭に`import grpc.experimental`を追加します。

これにより、不足していた import による問題が解決され、ファイルが正常に機能するようになります。
