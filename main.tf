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

resource "aws_instance" "my-tomcat" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "Terraf-EC2",
    Step = "Variable and output use",
    ENV = "DEV"
  }
}
