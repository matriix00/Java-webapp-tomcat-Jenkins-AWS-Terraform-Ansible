resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = tls_private_key.pk.public_key_openssh
  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./mykey.pem"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

