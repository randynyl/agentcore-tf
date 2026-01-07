resource "aws_ecr_repository" "stream_agent_repository" {
  name                 = "agentcore-runtime-stream-agent-repository"
  image_tag_mutability = "MUTABLE"
}

