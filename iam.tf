resource "aws_iam_role" "this" {
  name               = "agentcore-stream-agent-role"
  assume_role_policy = data.aws_iam_policy_document.assume_agentcore_role.json
}

data "aws_iam_policy_document" "assume_agentcore_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["bedrock-agentcore.amazonaws.com"]
    }
  }
}

# resource "aws_iam_role_policy_attachment" "BedrockAgentCoreFullAccess" {
#   role       = aws_iam_role.this.name
#   policy_arn = "arn:aws:iam::aws:policy/BedrockAgentCoreFullAccess"
# }

resource "aws_iam_policy" "agentcore_runtime_policy" {
  name        = "agentcore-stream-agent-policy"
  description = "Policy json that is attached to agentcore-stream-agent"
  policy      = data.aws_iam_policy_document.agentcore_runtime_policy.json
}

resource "aws_iam_role_policy_attachment" "agentcore_runtime_policy" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.agentcore_runtime_policy.arn
}
