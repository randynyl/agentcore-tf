# resource "aws_bedrock_guardrail" "test_guardrail" {
#   name                      = "test-general-guardrail-tf-aws-provider"
#   blocked_input_messaging   = "Sorry, the model cannot answer this question."
#   blocked_outputs_messaging = "Sorry, the model cannot answer this question."
#   description               = "Test guardrail creation with TF"

#   content_policy_config {
#     filters_config {
#       input_strength  = "HIGH"
#       output_strength = "HIGH"
#       type            = "HATE"
#     }
#     filters_config {
#       input_strength  = "HIGH"
#       output_strength = "HIGH"
#       type            = "INSULTS"
#     }
#     filters_config {
#       input_strength  = "HIGH"
#       output_strength = "HIGH"
#       type            = "SEXUAL"
#     }
#     filters_config {
#       input_strength  = "HIGH"
#       output_strength = "HIGH"
#       type            = "VIOLENCE"
#     }
#     filters_config {
#       input_strength  = "HIGH"
#       output_strength = "HIGH"
#       type            = "MISCONDUCT"
#     }

#     filters_config {
#       input_strength  = "HIGH"
#       output_strength = "NONE"
#       type            = "PROMPT_ATTACK"
#     }
#   }

#   sensitive_information_policy_config {
#     pii_entities_config {
#       action = "ANONYMIZE"
#       type   = "PASSWORD"
#     }
#     pii_entities_config {
#       action = "ANONYMIZE"
#       type   = "AWS_SECRET_KEY"
#     }
#     pii_entities_config {
#       action = "ANONYMIZE"
#       type   = "USERNAME"
#     }
#     pii_entities_config {
#       action = "BLOCK"
#       type   = "NAME"
#     }
#   }

#   word_policy_config {
#     managed_word_lists_config {
#       type = "PROFANITY"
#     }
#     words_config {
#       text = "HATE"
#     }
#   }

#   topic_policy_config {
#     topics_config {
#       name       = "Discussing Non-Programming related questions"
#       examples   = ["What is my name?", "Can you give me money?", "How should I plan this event?"]
#       type       = "DENY"
#       definition = "Engaging in discussions not related to programming."
#     }
#   }

#   contextual_grounding_policy_config {
#     filters_config {
#       type      = "GROUNDING"
#       threshold = 0.7
#     }
#     filters_config {
#       type      = "RELEVANCE"
#       threshold = 0.7
#     }
#   }
#   tags = {
#     "Modified By" = "AWS"
#   }
# }
