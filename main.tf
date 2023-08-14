provider "aws" {
  region = var.aws_region
}

data "aws_ami" "dev_amazon_linux" {
  provider    = aws.dev
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "dev_web" {
#  provider      = aws.dev
  ami           = data.aws_ami.dev_amazon_linux.id
  instance_type = var.instance_type

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<html><body><div>Hello, world!</div></body></html>" > /var/www/html/index.html
    EOF

  tags = var.tags
}
