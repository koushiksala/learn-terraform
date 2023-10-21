resource "null_resource" "test" {
  count = 5
   provisioner "local-exec" {

     command = " echo index number is ${count.index}"
   }
}