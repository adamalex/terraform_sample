resource "local_file" "hello" {
    content     = "hello"
    filename = "/tmp/hello"
}