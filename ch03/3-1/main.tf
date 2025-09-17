variable "file_name" {
  default = "step0.txt"
}

resource "local_file" "step6" {
  content  = "lifecycle - step6"
  filename = "${path.module}/${var.file_name}"

  lifecycle {
    precondition {
      condition = var.file_name == "step6.txt"
      error_message = "file name is mot \"step6.txt\""
    }
  }
}