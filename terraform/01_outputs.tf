output "master_public_ip" {
    value = aws_instance.master_instance.public_ip
}
output "worker1_public_ip" {
    value = aws_instance.worker_instance.public_ip
}
# output "worker2_public_ip" {
#     value = aws_instance.worker_instance.public_ip
# }

output "master_private_ip" {
    value = aws_instance.master_instance.private_ip
}
