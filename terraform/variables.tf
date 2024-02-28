variable "access_key" {
  description = "access_key"
  type = string
}

variable "secret_key" {
  description = "secret_key"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "bucket_name" {
  description = "bucket_name"
  type        = string
  default     = "test-bucket-rahul-delete"
}

variable "force_destroy" {
  description = "force_destroy"
  type        = string
  default     = true
}

variable "tags" {
  description = "tags"
  type        = map(any)
  default     = { "env" : "test" }
}