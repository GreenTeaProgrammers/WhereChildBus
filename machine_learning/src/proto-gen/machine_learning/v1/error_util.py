from google.protobuf import any_pb2
from google.rpc import code_pb2
from google.rpc import error_details_pb2
from google.rpc import status_pb2


def create_service_error_status(error_message):
    detail = any_pb2.Any()
    detail.Pack(
        error_details_pb2.QuotaFailure(
            violations=[
                error_details_pb2.QuotaFailure.Violation(
                    subject=f"error {error_message}",
                    description="some error occured. Please check the error message.",
                )
            ],
        )
    )
    return status_pb2.Status(
        code=code_pb2.RESOURCE_EXHAUSTED,
        message="some error occured. Please check the error message.",
        details=[detail],
    )
