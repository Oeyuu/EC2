resource "aws_ebs_volume" "zk1_ebs" {
    availability_zone = aws_instance.zk1.availability_zone
    size = 5
}


resource "aws_volume_attachment" "zk1_ebs_vol" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.zk1_ebs.id
    instance_id = aws_instance.zk1.id
}

resource "aws_ebs_volume" "k1_ebs" {
    availability_zone = aws_instance.k1.availability_zone
    size = 5
}


resource "aws_volume_attachment" "k1_ebs_vol" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.k1_ebs.id
    instance_id = aws_instance.k1.id
}