variable "project_id" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "subnet_names" {
  type = list(string)
}
variable "cidr_ranges" {
  type = list(string)
}
variable "bucket_name" {
  type = string
}
variable "region" {
  type = string
}
variable "bucket_class" {
  type = string
}
variable "router_name" {
  type = string
}
variable "nat_name" {
  type = string
}
variable "zone" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "vm_image" {
  type = string
}
variable "master_ipv4_cidr_block" {
  type = string
}
variable "nodepool_name" {
    type = string
}
variable "cluster_name" {
  
}
variable "workern_type" {
  
}
variable "workern_disktype" {
  
}
variable "workern_disksize" {
  
}
variable "workern_imagetype" {
  
}
variable "workern_oauthscopes" {
  
}
variable "accounts" {
}
variable "roles" {
  
}