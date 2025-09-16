resource "local_file" "example" {
content = "bye!"
filename = "${path.module}/example.txt"
  }