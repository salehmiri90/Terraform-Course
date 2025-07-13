# TASK for HOME
/*
1. Run terraform workflow on this file and focus on outputs
*/
resource "local_file" "pet" { 
    filename = "/root/pets.txt" 
    content = "We love pets!"
}