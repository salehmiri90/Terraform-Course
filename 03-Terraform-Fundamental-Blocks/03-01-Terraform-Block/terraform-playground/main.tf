# TASK for HOME
/*
1. Find out your local terraform version. write it here: 
2. Create a terraform block include terraform version
3. In the existing terraform block, findout the proper provider name and version to run below code.
4. Run terraform workflow to do the task
5. Check the new added files under the .terraform directories
*/
# Place to write your code here:

resource "local_file" "saleh" { 
    filename = "/${path.module}/pets.txt" 
    content = "We love pets!"
}