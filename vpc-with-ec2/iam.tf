resource "aws_iam_role_policy" "s3-policy" {
  name = "s3_policy"
  role = aws_iam_role.s2_full_access_role.id

  policy = "${file("s3-access-policy.json")}"
}

resource "aws_iam_role" "s2_full_access_role" {
  name = "s2_full_access_role"

  assume_role_policy = "${file("s3-assume-policy.json")}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "s2_full_access_role"
  role = "${aws_iam_role.s2_full_access_role.name}"

}