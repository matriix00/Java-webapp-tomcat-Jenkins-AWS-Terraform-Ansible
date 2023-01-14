data "aws_ami" "ubuntu" {

    most_recent = true
    owners = ["099720109477"] // Ubuntu's account ID.
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
    name   = "architecture"
    values = ["x86_64"]
  }

    
}


data "aws_ami" "redhat" {

    most_recent = true
    owners = ["309956199498"] // Red Hat's account ID.

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
    name   = "architecture"
    values = ["x86_64"]
    }


    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }


    filter {
        name   = "name"
        values = ["RHEL-9*"]
    }
 


}


# Define an Amazon Linux AMI.
data "aws_ami" "amazonlinux" {
  most_recent = true

  owners = ["137112412989"] // Amazon's account ID.

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

}
