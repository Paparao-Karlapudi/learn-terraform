# Default variable Type
variable "sample" {
 default = 10
}

output "sample" {
  value = var.sample
}
#Strings
variable "sample2" {
  default = "rao"
}
output "sample2" {
  value = var.sample2
}
#Boolean
variable "sample3" {
  default = true
}

output "sample3" {
  value = var.sample3
}
#List type
variable "sample4" {
  default = [
    "rao",
    100,
    true,
    "fruit"
    ]
}

output "sample4" {
  value = var.sample4[0]
}

#Map Type
variable "sample5" {
  default = {
    number  = 30,
    boolean = true,
    string  = "rao"
  }
  }
output "sample5" {
  value = var.sample5["number"]
}

#send variable from tfvars
variable "demo1" {}

output "demo1" {
  value = var.demo1
}

#vars from SHELL env Vars

