resource "aws_instance" "server2" {
ami="ami-0756a1c858554433e"
instance_type = "t2.micro"


}

tags={
    name=var.tag_name1
}