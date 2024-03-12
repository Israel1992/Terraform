//AWS Packer Builder 

packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "packerami" {
    region = "us-east-1"
    ami_name = "my-first-ami{{timestamp}}"
    source_ami = "ami-0f403e3180720dd7e"
    instance_type = "t2.micro"
    subnet_id = "subnet-0801af72560dbf4f0"
    ssh_username = "ec2-user"
    tags = {
        OS_version = "test os packer"
        Release = "Latest"
        Base_AMI_Name = "{{ .SourceAMIName }}"
        Name = "pkr-consul-img-v0.1"
    }
}

build {
    sources = ["source.amazon-ebs.packerami"]

    provisioner "shell" {
        script = "./scripts/amazonLinux.sh"
    }
}