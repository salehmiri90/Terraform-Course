# TASK for HOME
/*
1. Install terraform on a linux machine, then
2. Run terraform workflow on this file and focus on outputs
*/
resource "local_file" "saleh" { 
    filename = "/root/pets.txt"
    #filename = "/${path.module}/pets.txt"
    content = "We love pets!"
}