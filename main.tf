provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "eu-west-2"
}

resource "aws_db_instance" "caci_database" {
  identifier = "caci_rds_instance"
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = "20"
  storage_type = "gp2"
  availability_zone = "eu-west-2"
  multi_az = true
  publicly_accessible = false
}


resource "aws_security_group" "caci_db_security_group" {
  name        = "db-security-group-caci"
  description = "Security group for caci RDS instance"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["116.30.45.50/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["116.30.45.50/32"]
  }
}



