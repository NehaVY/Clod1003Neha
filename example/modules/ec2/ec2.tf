data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance" {
  #depends_on = [ aws_security_group.allow_tls]
  #count = var.counter
  count = var.create_ec2 ? var.counter : 0

  ami   = data.aws_ami.ubuntu.id
  #ami = "ami-020185d0e5ccf8af0"
  instance_type = "t3.micro"
  vpc_security_group_ids= [var.sg_id]
  #security_groups = [var.sg_id]

  tags = {
    Name = "HelloWorld-${count.index}"
    #Name = "HelloWorld"
    Project = "CLOD1003"
    Owner   = "NehaValsaYeldho"
  }
}