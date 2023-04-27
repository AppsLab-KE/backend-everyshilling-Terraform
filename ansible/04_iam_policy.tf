resource "aws_iam_policy" "ecr_pull_policy" {
  name_prefix = "ecr-pull-policy-"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_pull_policy_attachment" {
  policy_arn = aws_iam_policy.ecr_pull_policy.arn
  role       = var.ecs_task_execution_role_name
}
