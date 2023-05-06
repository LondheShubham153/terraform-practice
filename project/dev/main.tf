module "dev-app"{
    source = "../modules/my-app"
    my_enviroment = "dev"
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
}

module "prd-app"{
    source = "../modules/my-app"
    my_enviroment = "prd"
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
}