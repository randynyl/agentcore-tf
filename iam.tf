resource "aws_iam_openid_connect_provider" "github" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}


resource "aws_iam_role" "stream_agent_role" {
  name               = "agentcore-stream-agent-role"
  assume_role_policy = data.aws_iam_policy_document.assume_agentcore_role.json
}

# resource "aws_iam_role_policy_attachment" "BedrockAgentCoreFullAccess" {
#   role       = aws_iam_role.stream_agent_role.name
#   policy_arn = "arn:aws:iam::aws:policy/BedrockAgentCoreFullAccess"
# }

resource "aws_iam_policy" "agentcore_runtime_policy" {
  name        = "agentcore-stream-agent-policy"
  description = "Policy json that is attached to agentcore-stream-agent"
  policy      = data.aws_iam_policy_document.agentcore_runtime_policy.json
}

resource "aws_iam_role_policy_attachment" "agentcore_runtime_policy" {
  role       = aws_iam_role.stream_agent_role.name
  policy_arn = aws_iam_policy.agentcore_runtime_policy.arn
}

resource "aws_iam_role" "github_actions_role" {
  name               = "personal-github-actions-oidc-role"
  assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role.json
}

resource "aws_iam_role_policy_attachment" "attach_admin" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
