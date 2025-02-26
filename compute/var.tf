variable "instance_name" {
    type=string
    
  
}
variable "project_id" {
    type=string 
   
  
}
variable "region" {
    type = string 
    default = "us-central1"
  
}
variable "zone" {
    type = string
    
  
}
variable "machine_type" {
    type = string
   

  
}
variable "network" {
    type = string
    default = "default"
   
  
}
variable "image" {
    type = string
    
  
}
variable "credentials_file" {
    type = string
  
}