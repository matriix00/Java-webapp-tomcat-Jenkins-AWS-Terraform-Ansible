resource "aws_instance" "tomcat_server" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
  tags = {
   Name = "tomcat_server"
 }
  # VPC
  subnet_id = aws_subnet.public_subnet.id
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  # the Public SSH key
  key_name = aws_key_pair.mykey.id
  }