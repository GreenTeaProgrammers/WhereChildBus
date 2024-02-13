import sys
import os

# このスクリプトが存在するディレクトリの親ディレクトリを検索パスに追加
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import health_check_pb2_grpc
import health_check_pb2

import grpc

# gRPCクライアントの設定
client = grpc.insecure_channel('where-child-bus-grpc-k3dkun2lpq-uw.a.run.app:443')
stub = health_check_pb2_grpc.HealthcheckServiceStub(client)

reqst = health_check_pb2.PingRequest()
reqst.name = "ping"

res = health_check_pb2.PingResponse(stub.Ping(reqst))

print(res.message)

