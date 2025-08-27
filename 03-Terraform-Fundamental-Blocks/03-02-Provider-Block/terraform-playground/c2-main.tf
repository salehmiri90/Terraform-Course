# Lets have fun on Linux!
/*
Play with provider version base on the information on terraform webiste, 
then 
run terraform init and check the .terraform.lock.hcl file content
*/

# resource block
resource "local_file" "saleh" { 
    filename = "playground-03-02-pets.txt" 
    content = "We love pets!"
}