# resource "aws_bedrockagentcore_agent_runtime" "stream_agent_runtime" {
#   agent_runtime_name = "stream_agent_runtime"
#   role_arn           = aws_iam_role.this.arn

#   agent_runtime_artifact {
#     container_configuration {
#       container_uri = "${aws_ecr_repository.stream_agent_repository.repository_url}:latest"
#     }
#     # code_configuration {
#     #   entry_point = ["main.py"]
#     #   runtime     = "PYTHON_3_12"
#     #   code {
#     #     s3 {
#     #       bucket = "test-bucket"
#     #       prefix = "test-agent-runtime-code.zip"
#     #     }
#     #   }
#     # }
#   }

#   network_configuration {
#     network_mode = "PUBLIC"
#   }
# }
