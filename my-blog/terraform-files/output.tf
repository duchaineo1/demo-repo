output "ec2_global_ips"{
    value = "${aws_instance.wp-blog.*.public_dns}"
}