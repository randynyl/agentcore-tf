data "aws_caller_identity" "current" {}

# data "aws_vpc" "vpc" {}

data "aws_iam_policy_document" "agentcore_runtime_policy" {
  version = "2012-10-17"
  statement {
    actions = [
      "logs:DescribeLogStreams",
      "logs:CreateLogGroup"
    ]
    effect    = "Allow"
    resources = ["arn:aws:logs:ap-southeast-1:975050193152:log-group:/aws/bedrock-agentcore/runtimes/*"]
  }
  statement {
    actions   = ["logs:DescribeLogGroups"]
    effect    = "Allow"
    resources = ["arn:aws:logs:ap-southeast-1:975050193152:log-group:*"]
  }
  statement {
    sid    = "BedrockModelInvocation"
    effect = "Allow"
    actions = ["bedrock:InvokeModel",
    "bedrock:InvokeModelWithResponseStream"]
    resources = ["arn:aws:bedrock:*::foundation-model/*",
    "arn:aws:bedrock:ap-southeast-1:975050193152:*"]
  }
  statement {
    effect = "Allow"
    actions = ["logs:CreateLogStream",
    "logs:PutLogEvents"]
    resources = ["arn:aws:logs:ap-southeast-1:975050193152:log-group:/aws/bedrock-agentcore/runtimes/*:log-stream:*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      values   = ["bedrock-agentcore"]
      variable = "cloudwatch:namespace"
    }
  }
}
