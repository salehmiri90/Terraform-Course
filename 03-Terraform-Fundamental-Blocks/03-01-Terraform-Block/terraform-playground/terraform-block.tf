# Lets have fun on Linux!
/*
1. Find out local terraform version. 
2. Check ls -al on the directory.
3. In the existing terraform block, findout the proper provider name and version to run below code.
4. Run terraform workflow to do the task
5. Check the new added files under the .terraform directories
*/

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.5.0"
    }
  }
}