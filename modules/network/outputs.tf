output "subnet_id" {
  value = {for subnet in azurerm_subnet.subnet: subnet.name => subnet.id}
}