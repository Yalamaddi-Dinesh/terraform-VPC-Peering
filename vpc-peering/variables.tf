#subnet for vpc 01
variable "ipaddress" {  #vpc 01
    default = "10.0.0.0/16"
}

#subnet for vpc 02
variable "ipaddress01" {  #vpc 02
    default = "10.1.0.0/16"
}


variable "subnet01" {}
variable "subnet02" {}
variable "any" {}