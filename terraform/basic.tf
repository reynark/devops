resource local_file "games" {
  filename="/root/fav_games.txt"
  content="fallout,arcanum"
}

#1st terraform init to initialize the working dir
#2sd terraform plan to see what steps will be taken
#3rd terraform apply to apply what you want

#as the plan command shows "" or spaces before = don't matter

#then terraform destroy to undo what you did

####### HOW TO UPDATE A RESOURCE?
##for example if you add ----  file_permission = "0755"  it will destroy the resources etc and recreate
#### YOU CAN HOWEVER CHANGE the order: First create then Destroy the existing

#### State file and other files created by Terraform
#### How is terraform Idempotent?
    ## terraform.tfstate file : state of the managed resources
    ## Never edit manually. There are state commands
    ## terraform state list  >>> shows managed resources
    ## terraform state show local_file (specify resource name)
    ## You can move resources to different state files...
    ## .terraform.lock.hcl locks provider and the version
    ## .terraform/ contains the provider


#### How to define Variables?
#### Input and output variables
 ### You can define vars in variables.tf (there are more ways. keep reading)
### 1. Declaring a variable (filename is the var name. if you don't specify default value, it'll ask you during apply)
    ## variable "filename" {
    ##        default = "/root/games.txt"
    ##        }
### 2. Reference a variable
    ## resource "local_file" games {
    ##  filename=var.filename
    ##  content=var.content
    ##        }
### 3. You can also define a type : list, number, map (like dict), string, any, bool : You can also pass an optional description parameter
    ## variable "filename" {
    ##        default = "/root/games.txt"
    ##      type = string
    ##  description = the path of the local file
    ##      }

#### main.tf file with variables
#resource local_file "games" {
#        filename=var.myfile
#        sensitive_content="var.content"
#        file_permission = "0755"
#}

#### variables.tf file for variables above
#resource local_file "games" {
#       variable "myfile" {
#	        default = "/home/rhyme/test.txt"
#	        type = string
#         }

#       variable "content" {
#      	  type=string
#         }

#### If you want to override the variables.tf you can do: terraform plan/apply -var myfile=/other/value

#### You can also define envir variables. After doing so terraform plan will read these vars
  ## export TF_VAR_myfile="/root/anothertest"
  ## export TF_VAR_content="Deus ex"


#### Passing vars with terraform.tfvars file
  ## this seems to have precedence (not sure)
  ##  define vars like in BASH!

#### It can also be a JSON (specify file with -var-file="terraform.tfvars.json" )
  ## terraform.tfvars.json



############# Create a resource in Azure Cloud
### Connect to your Azure CLI or configure auth from your VM or something

  ## Create a resource group which is like a general container for resources like VMs and so on. (I think it's a Project in GCP)
        ## You should create your project in GCP beforehand
        ## Looks like terraform can create the resource group
  ## Since we're using Azure, we need to insert provider info as well (same with GCP, remember)
        ## either in main.tf or you can create provider.tf
        ## just get the code form registry.terraform.io's relevant provider main page

  







