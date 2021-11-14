provider "aws" {
  region  = "us-east-1"
  profile = "test"
}

resource "aws_s3_bucket" "b" {
  bucket = "thundering-ops-apache-log-bucket"
  acl    = "private"
  tags = {
    Name = "apache-log-bucket"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "apache-log-bucket-wo"
  path        = "/"
  description = "Bucket for apache logs with number of hits by ip"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action = [
          "s3:PutObject",
        ]
        Resource = "arn:aws:s3:::/thundering-ops-apache-log-bucket/*"
      },
    ]
  })
}

resource "aws_iam_user" "user" {
  name = "apache-log-writer"
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.user.name
}

