#######################################
#Variaveis de configuração
#######################################

variable "project_id" {
  type        = string
  description = "Id do projeto do GCP onde o modulo project-name será instalado"
}

variable "region" {
  type        = string
  description = "Região do GCP onde os modulos do projeto serão criados https://cloud.google.com/compute/docs/regions-zones?hl=pt-br, default: us-central1"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Zona do GCP onde os modulos do projeto serão criados https://cloud.google.com/compute/docs/regions-zones?hl=pt-br, default: us-central1-a"
  default     = "us-central1-a"
}

variable "location" {
  type        = string
  description = "Localização do projeto GCP https://cloud.google.com/compute/docs/regions-zones?hl=pt-br, default: us"
  default     = "us"
}

variable "vm_name" {
  type        = string
  description = "Virtual machine instance name"
}

variable "machine_type" {
  type        = string
  description = "Virtual machine instance name, default: n2-standard-2"
  default = "n2-standard-2"
}