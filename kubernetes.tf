locals = {
  cluster_name                 = "jive.k8s.cl-co.com"
  master_autoscaling_group_ids = ["${aws_autoscaling_group.master-us-east-1a-masters-jive-k8s-cl-co-com.id}"]
  master_security_group_ids    = ["${aws_security_group.masters-jive-k8s-cl-co-com.id}"]
  masters_role_arn             = "${aws_iam_role.masters-jive-k8s-cl-co-com.arn}"
  masters_role_name            = "${aws_iam_role.masters-jive-k8s-cl-co-com.name}"
  node_autoscaling_group_ids   = ["${aws_autoscaling_group.nodes-jive-k8s-cl-co-com.id}"]
  node_security_group_ids      = ["${aws_security_group.nodes-jive-k8s-cl-co-com.id}"]
  node_subnet_ids              = ["${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}", "${aws_subnet.us-east-1b-jive-k8s-cl-co-com.id}", "${aws_subnet.us-east-1c-jive-k8s-cl-co-com.id}"]
  nodes_role_arn               = "${aws_iam_role.nodes-jive-k8s-cl-co-com.arn}"
  nodes_role_name              = "${aws_iam_role.nodes-jive-k8s-cl-co-com.name}"
  region                       = "us-east-1"
  route_table_public_id        = "${aws_route_table.jive-k8s-cl-co-com.id}"
  subnet_us-east-1a_id         = "${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}"
  subnet_us-east-1b_id         = "${aws_subnet.us-east-1b-jive-k8s-cl-co-com.id}"
  subnet_us-east-1c_id         = "${aws_subnet.us-east-1c-jive-k8s-cl-co-com.id}"
  vpc_id                       = "vpc-7c615419"
}

output "cluster_name" {
  value = "jive.k8s.cl-co.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-east-1a-masters-jive-k8s-cl-co-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-jive-k8s-cl-co-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-jive-k8s-cl-co-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-jive-k8s-cl-co-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-jive-k8s-cl-co-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-jive-k8s-cl-co-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}", "${aws_subnet.us-east-1b-jive-k8s-cl-co-com.id}", "${aws_subnet.us-east-1c-jive-k8s-cl-co-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-jive-k8s-cl-co-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-jive-k8s-cl-co-com.name}"
}

output "region" {
  value = "us-east-1"
}

output "route_table_public_id" {
  value = "${aws_route_table.jive-k8s-cl-co-com.id}"
}

output "subnet_us-east-1a_id" {
  value = "${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}"
}

output "subnet_us-east-1b_id" {
  value = "${aws_subnet.us-east-1b-jive-k8s-cl-co-com.id}"
}

output "subnet_us-east-1c_id" {
  value = "${aws_subnet.us-east-1c-jive-k8s-cl-co-com.id}"
}

output "vpc_id" {
  value = "vpc-7c615419"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-jive-k8s-cl-co-com" {
  name                 = "master-us-east-1a.masters.jive.k8s.cl-co.com"
  launch_configuration = "${aws_launch_configuration.master-us-east-1a-masters-jive-k8s-cl-co-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "jive.k8s.cl-co.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1a.masters.jive.k8s.cl-co.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Owner"
    value               = "Jive"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Team"
    value               = "PLOPS"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-east-1a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-jive-k8s-cl-co-com" {
  name                 = "nodes.jive.k8s.cl-co.com"
  launch_configuration = "${aws_launch_configuration.nodes-jive-k8s-cl-co-com.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}", "${aws_subnet.us-east-1b-jive-k8s-cl-co-com.id}", "${aws_subnet.us-east-1c-jive-k8s-cl-co-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "jive.k8s.cl-co.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.jive.k8s.cl-co.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Owner"
    value               = "Jive"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Team"
    value               = "PLOPS"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-jive-k8s-cl-co-com" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "a.etcd-events.jive.k8s.cl-co.com"
    Owner                                      = "Jive"
    Team                                       = "PLOPS"
    "k8s.io/etcd/events"                       = "a/a"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-jive-k8s-cl-co-com" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "a.etcd-main.jive.k8s.cl-co.com"
    Owner                                      = "Jive"
    Team                                       = "PLOPS"
    "k8s.io/etcd/main"                         = "a/a"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-jive-k8s-cl-co-com" {
  name = "masters.jive.k8s.cl-co.com"
  role = "${aws_iam_role.masters-jive-k8s-cl-co-com.name}"
}

resource "aws_iam_instance_profile" "nodes-jive-k8s-cl-co-com" {
  name = "nodes.jive.k8s.cl-co.com"
  role = "${aws_iam_role.nodes-jive-k8s-cl-co-com.name}"
}

resource "aws_iam_role" "masters-jive-k8s-cl-co-com" {
  name               = "masters.jive.k8s.cl-co.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.jive.k8s.cl-co.com_policy")}"
}

resource "aws_iam_role" "nodes-jive-k8s-cl-co-com" {
  name               = "nodes.jive.k8s.cl-co.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.jive.k8s.cl-co.com_policy")}"
}

resource "aws_iam_role_policy" "masters-jive-k8s-cl-co-com" {
  name   = "masters.jive.k8s.cl-co.com"
  role   = "${aws_iam_role.masters-jive-k8s-cl-co-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.jive.k8s.cl-co.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-jive-k8s-cl-co-com" {
  name   = "nodes.jive.k8s.cl-co.com"
  role   = "${aws_iam_role.nodes-jive-k8s-cl-co-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.jive.k8s.cl-co.com_policy")}"
}

resource "aws_key_pair" "kubernetes-jive-k8s-cl-co-com-869e2c45f67958c33ec404889f4a8082" {
  key_name   = "kubernetes.jive.k8s.cl-co.com-86:9e:2c:45:f6:79:58:c3:3e:c4:04:88:9f:4a:80:82"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.jive.k8s.cl-co.com-869e2c45f67958c33ec404889f4a8082_public_key")}"
}

resource "aws_launch_configuration" "master-us-east-1a-masters-jive-k8s-cl-co-com" {
  name_prefix                 = "master-us-east-1a.masters.jive.k8s.cl-co.com-"
  image_id                    = "ami-dbd611a6"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-jive-k8s-cl-co-com-869e2c45f67958c33ec404889f4a8082.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-jive-k8s-cl-co-com.id}"
  security_groups             = ["${aws_security_group.masters-jive-k8s-cl-co-com.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1a.masters.jive.k8s.cl-co.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-jive-k8s-cl-co-com" {
  name_prefix                 = "nodes.jive.k8s.cl-co.com-"
  image_id                    = "ami-dbd611a6"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-jive-k8s-cl-co-com-869e2c45f67958c33ec404889f4a8082.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-jive-k8s-cl-co-com.id}"
  security_groups             = ["${aws_security_group.nodes-jive-k8s-cl-co-com.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.jive.k8s.cl-co.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.jive-k8s-cl-co-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "igw-47066822"
}

resource "aws_route_table" "jive-k8s-cl-co-com" {
  vpc_id = "vpc-7c615419"

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "jive.k8s.cl-co.com"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
    "kubernetes.io/kops/role"                  = "public"
  }
}

resource "aws_route_table_association" "us-east-1a-jive-k8s-cl-co-com" {
  subnet_id      = "${aws_subnet.us-east-1a-jive-k8s-cl-co-com.id}"
  route_table_id = "${aws_route_table.jive-k8s-cl-co-com.id}"
}

resource "aws_route_table_association" "us-east-1b-jive-k8s-cl-co-com" {
  subnet_id      = "${aws_subnet.us-east-1b-jive-k8s-cl-co-com.id}"
  route_table_id = "${aws_route_table.jive-k8s-cl-co-com.id}"
}

resource "aws_route_table_association" "us-east-1c-jive-k8s-cl-co-com" {
  subnet_id      = "${aws_subnet.us-east-1c-jive-k8s-cl-co-com.id}"
  route_table_id = "${aws_route_table.jive-k8s-cl-co-com.id}"
}

resource "aws_security_group" "masters-jive-k8s-cl-co-com" {
  name        = "masters.jive.k8s.cl-co.com"
  vpc_id      = "vpc-7c615419"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "masters.jive.k8s.cl-co.com"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
  }
}

resource "aws_security_group" "nodes-jive-k8s-cl-co-com" {
  name        = "nodes.jive.k8s.cl-co.com"
  vpc_id      = "vpc-7c615419"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "nodes.jive.k8s.cl-co.com"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-protocol-ipip" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "4"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4001" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port                = 2382
  to_port                  = 4001
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  source_security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-jive-k8s-cl-co-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-jive-k8s-cl-co-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-east-1a-jive-k8s-cl-co-com" {
  vpc_id            = "vpc-7c615419"
  cidr_block        = "172.31.32.0/19"
  availability_zone = "us-east-1a"

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "us-east-1a.jive.k8s.cl-co.com"
    SubnetType                                 = "Public"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_subnet" "us-east-1b-jive-k8s-cl-co-com" {
  vpc_id            = "vpc-7c615419"
  cidr_block        = "172.31.64.0/19"
  availability_zone = "us-east-1b"

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "us-east-1b.jive.k8s.cl-co.com"
    SubnetType                                 = "Public"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_subnet" "us-east-1c-jive-k8s-cl-co-com" {
  vpc_id            = "vpc-7c615419"
  cidr_block        = "172.31.96.0/19"
  availability_zone = "us-east-1c"

  tags = {
    KubernetesCluster                          = "jive.k8s.cl-co.com"
    Name                                       = "us-east-1c.jive.k8s.cl-co.com"
    SubnetType                                 = "Public"
    "kubernetes.io/cluster/jive.k8s.cl-co.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

terraform = {
  required_version = ">= 0.9.3"
}
