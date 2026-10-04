output "ec2-id" {
  value = aws_instance.web-ec2.id
}

output "ec2-ip" {
  value = aws_instance.web-ec2.private_ip
}

output "ebs-volume_id" {
  value = aws_ebs_volume.additional.id
}

