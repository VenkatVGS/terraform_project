output myvpc_output {
  value       = aws_vpc.myvpc.id
}

output public_subnet_1_output {
  value       = aws_subnet.public_subnet_1.id

}

output public_subnet_2_output {
  value       = aws_subnet.public_subnet_2.id
}


output private_subnet_1_output {
  value       = aws_subnet.private_subnet_1.id
  
}

output private_subnet_2_output {
  value       = aws_subnet.private_subnet_2.id

}

output public_sg_output {
  value       = aws_security_group.public_sg.id
}

output private_sg_output {
  value       = aws_security_group.private_sg.id
}
