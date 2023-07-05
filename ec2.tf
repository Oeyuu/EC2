resource "aws_instance" "zk1" {
    ami = "ami-0749e2c902c836c08"
    instance_type = "t2.small"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [aws_security_group.zk.id]
    key_name = aws_key_pair.deployer.key_name
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    associate_public_ip_address = true

     # user_data = "${file("../zookeeper.sh")}"
    tags = {
        Name = "Zookeeper1"
    }
}

resource "aws_instance" "k1" {
    ami = "ami-0749e2c902c836c08"
    instance_type = "t2.small"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [aws_security_group.kafka.id]
    key_name = aws_key_pair.deployer.key_name
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags = {
        Name = "Broker1"
    }
}
