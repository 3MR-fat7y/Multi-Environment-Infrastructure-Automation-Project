# variable "access_key" {
#   description = "AWS Access Key ID"
# }
# variable "secret_key" {
#   description = "AWS Secret Access Key"
# }
# variable "session_token" {
#   description = "AWS Session Token"
# }


variable "secret_key_file_path" {
  type        = string
  description = "Path to the file containing the AWS Secret Access Key"
  default     = abspath("./.credentials.txt")
}