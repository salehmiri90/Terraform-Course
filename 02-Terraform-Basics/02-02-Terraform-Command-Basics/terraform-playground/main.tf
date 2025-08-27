# Lets have fun on Linux!
/*
1. Install terraform on a linux machine, then
2. Run terraform workflow on this file and focus on outputs
*/
resource "local_file" "saleh" { 
    filename = "playground-02-02-pets.txt"
    content = "We love pets!"
}