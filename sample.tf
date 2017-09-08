provider "aws" {
  region  = "us-east-1"
  version = "~> 0.1"
}

resource "aws_instance" "sample" {
  ami           = "ami-2757f631"
  instance_type = "m3.medium"
}
