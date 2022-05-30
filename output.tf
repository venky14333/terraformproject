output "ec1_ip"{
  value=aws_instance.server1.public_ip
}

output "ec2_ip"{
  value=aws_instance.server2.public_ip
}