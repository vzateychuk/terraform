data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "terraform_course_vez" {
  bucket = "vzateychuk-terraform-20220826"
  acl = "public-read"
}

resource "aws_instance" "blog" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform",
    Step = "Change instance name",
    ENV = "DEV"
  }
}
