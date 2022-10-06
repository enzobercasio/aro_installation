variable "deploy" {
  description = "Enter true to deploy and false to delete an aro cluster"
}

locals {
   ms = "master-sub"
   wk = "worker-sub"
   rg = azurerm_resource_group.aro.name
   loc = azurerm_resource_group.aro.location
   vnet = module.arovnet.vnet_name
   name = "lbercasi01"
   domain = azurerm_dns_zone.aro.name
}

resource "null_resource" "lbercasi02" {
  count = var.deploy? 1:0
  provisioner "local-exec" {
   command ="az aro create -g ${local.rg} -n ${local.name} --vnet ${local.vnet} --master-subnet ${local.ms} --worker-subnet ${local.wk} --domain ${local.domain} --location ${local.loc} --pull-secret @pull-secret.txt"
  }
}

resource "null_resource" "delete" {
  count = var.deploy? 0:1
  provisioner "local-exec" {
    command = "az aro delete -n ${local.name} -g ${local.rg} --yes"
  }
}
