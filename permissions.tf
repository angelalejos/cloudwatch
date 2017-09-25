# add permissions to an existing role to allow writing to the newly created log streams

data "aws_iam_role" "example" {
  role_name = "${var.elasticsearch-cluster-role-name}"
}
