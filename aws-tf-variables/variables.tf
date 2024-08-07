variable "aws_instance" {
    description = "what you need"
    type = string
    validation {
      condition = var.aws_instance== "t2.micro" || var.aws_instance == "t3.micro"
      error_message = "only t2 & t3 micro allowd"
    }
}