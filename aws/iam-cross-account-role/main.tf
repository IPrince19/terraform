#Create Cross Account Role
resource "aws_iam_role" "cross_account" {
  name = "${var.role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.permitted_account_id}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


#Attach policy
resource "aws_iam_role_policy_attachment" "poweruser" {
  role       = "${aws_iam_role.cross_account.name}"
  policy_arn = "${data.aws_iam_policy.power_user.arn}"
}

resource "aws_iam_role_policy_attachment" "read_permission" {
  role       = "${aws_iam_role.cross_account.name}"
  policy_arn = "${data.aws_iam_policy.readonly.arn}"
}

resource "aws_iam_role_policy_attachment" "iam_limit" {
  role       = "${aws_iam_role.cross_account.name}"
  policy_arn = "${aws_iam_policy.iam_limit_access.arn}"
}
