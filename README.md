# terraform

# Terraform Lab for DevOps 
## Azure 
Your client is an US company, they hire you to create the Infrastructure for the new project base on MS Azure Cloud. They are using Terraform as their Infrastructure as Code and they also want you to use it.
- Create a VNET for Dev and Staging, the VNET will have 3 subnets, we will name them `subnet-a`, `subnet-b` and `subnet-c`
- Create Azure Bastion service in the `subnet-a`
- Create 2 VMs, `vm-a` and `vm-b`, these VMs will be placed in the `subnet-b`
- VMs and their attributes should be declared in a list so we can add or remove VM easily
- VMs only have private ip address
- Create 01 AppService Plan and 02 AppServices which will run on the same AppService Plan. These AppServices need to have VNET Integration to the subnet-c

Terraform state must be store in the `Azure Storage Container` and must have server side encrypted 

We should write Terraform module and use it to create all resources above. 

##AWS

Your client is an US company, they hire you to create the Infrastructure for the new project base on AWS Cloud. They are using Terraform as their Infrastructure as Code and they also want you to use it.
- Create a VPC for Dev and Staging, the VPC will have 2 subnets, 1 public subnet and 1 private subnets, we will name them `subnet-a`, `subnet-b`
- Create an EC2 as for Bastion Host which will be placed in the public subnet
- Create 2 EC2 instances,  these instances will be placed in the `subnet-b`
- EC2 instances and their attributes should be declared in a list so we can add or remove instances easily
- EC2  only have private ip address instances (except Bastion host)

Terraform state must be store in the `S3 Object Storage` and must have server side encrypted 

We should write Terraform module and use it to create all resources above. 

###Bonus Lab

Your name is John Doe. You are working in the startup company. You are the very first DevOps engineer, but your team will be grew up soon, you need to have a solution to manage your team members (Dev and DevOps) and their permission. Dev Team will have different permission from DevOps team, and your will have an outsource DevOps team in the future. You need to setup and organize policies, group, and role for all of them via Terraform

Dev Team:
- Brian (Lead)
- Cody (Dev)
- Adam (Dev)

Policies:
- All of them will have readonly for all resources except SSM Parameter for troubleshooting when needed
- Brian have permission to provision new EC2 and modify anything related to ASG

DevOps Team:
Doe (You) (Lead)
Harry (DevOps)
Zach (Junior DevOps)


Policies:
- You and Harry will have full control permission for the infrastructure
- Zach is junior devops but he's smart, Zach will have permission same to Brian (Dev Lead) but he also have read permission for SSM Parameter Store

Outsource DevOps team:
Andrea
Mina
Filipe

Policies:
- They should have permission to provision new network, setup EKS and ELB

All team will use the same repo for Terraform to provision new infrastructure resource
