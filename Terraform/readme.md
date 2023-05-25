# link

https://www.terraform.io/

# def

Terraform is an open-source infrastructure-as-code (IAC) tool created by HashiCorp. It allows developers and operators to define and manage cloud infrastructure as code, enabling automation of the deployment, configuration, and management of infrastructure resources across multiple cloud providers, including AWS, Azure, Google Cloud, and more.

Terraform uses a declarative language called HashiCorp Configuration Language (HCL) to define infrastructure resources and their dependencies. This language enables users to specify infrastructure requirements in a human-readable format, which Terraform then uses to create, update, and destroy resources in a consistent, repeatable way.

With Terraform, users can create infrastructure as code, manage infrastructure changes through version control systems, and automate the provisioning of infrastructure resources using continuous integration/continuous delivery (CI/CD) pipelines. Terraform also provides a robust ecosystem of plugins, modules, and providers that extend its functionality and make it easier to manage complex cloud environments.

# how to use

Here are the high-level steps to get started with using Terraform:

1. Install Terraform: Download the latest version of Terraform from the official website and install it on your local machine.

2. Define your infrastructure: Create a Terraform configuration file (.tf file) in which you define the infrastructure resources you want to create, update or delete. You can define resources in the HashiCorp Configuration Language (HCL), which is human-readable and easy to use.

3. Initialize the working directory: Run the `terraform init` command in the directory where your Terraform configuration file is located. This command initializes the backend, downloads the necessary provider plugins, and sets up the environment.

4. Plan and preview changes: Run the `terraform plan` command to see what changes Terraform will make to your infrastructure resources. This command generates a plan that shows the resources that will be created, updated, or destroyed.

5. Apply changes: If the plan looks good, run the `terraform apply` command to apply the changes to your infrastructure resources. Terraform will create, update, or destroy the resources as defined in your configuration file.

6. Manage infrastructure: Terraform maintains the state of your infrastructure resources in a state file, which tracks the current configuration and state of each resource. You can use Terraform to update, modify, or delete resources as needed by updating the configuration file and running the apply command again.

These are the basic steps for using Terraform, but there are many more advanced features and best practices that you can learn as you become more proficient with the tool. It's important to thoroughly test and validate your Terraform code before applying changes to production environments.




# command

Here are some basic Terraform commands that are frequently used:

## `terraform init`: 

This command initializes a Terraform working directory by downloading the necessary provider plugins and setting up the backend configuration.

## `terraform plan`: 

This command creates an execution plan that shows the changes Terraform will make to the infrastructure. It compares the current state to the desired state defined in your Terraform configuration files.

## `terraform apply`: 

This command applies the changes and provisions the infrastructure based on the Terraform configuration. It prompts for confirmation before making any changes unless the `-auto-approve` flag is used.

## `terraform destroy`: 

This command destroys the infrastructure defined in the Terraform configuration. It prompts for confirmation before destroying unless the `-auto-approve` flag is used.

## `terraform validate`: 

This command checks the syntax and validates the configuration files in the current directory, ensuring that the Terraform code is correctly written.

## `terraform fmt`: 

This command automatically formats the Terraform code in the current directory, following Terraform's style conventions.

## `terraform show`: 

This command displays the current state or a previously generated execution plan in a human-readable format. It provides an overview of the resources managed by Terraform.

## `terraform state`: 

This command allows for advanced management of the Terraform state. It provides subcommands to inspect, modify, and manage the state file directly.

These are some of the fundamental Terraform commands used in managing infrastructure. Terraform provides many other commands and options to handle more complex scenarios and interact with various aspects of the Terraform workflow. You can explore the Terraform documentation for more details on each command and its usage.

## terraform import

Terraform can import existing infrastructure resources. This functionality lets you bring existing resources under Terraform management.

To import a resource, first write a resource block for it in your configuration, establishing the name by which it will be known to Terraform:

```tf
resource "aws_instance" "example" {
  # ...instance configuration...
}
```

The name "example" here is local to the module where it is declared and is chosen by the configuration author. This is distinct from any ID issued by the remote system, which may change over time while the resource name remains constant.

If desired, you can leave the body of the resource block blank for now and return to fill it in once the instance is imported.

Now terraform import can be run to attach an existing instance to this resource configuration:

```sh
terraform import aws_instance.example i-abcd1234
```

This command locates the AWS EC2 instance with ID i-abcd1234. Then it attaches the existing settings of the instance, as described by the EC2 API, to the name aws_instance.example of a module. In this example the module path implies that the root module is used. Finally, the mapping is saved in the Terraform state.


```
Modules
Hands-on: Try the Reuse Configuration with Modules tutorials.

Modules are containers for multiple resources that are used together. A module consists of a collection of .tf and/or .tf.json files kept together in a directory.

Modules are the main way to package and reuse resource configurations with Terraform.

The Root Module
Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

Child Modules
A Terraform module (usually the root module of a configuration) can call other modules to include their resources into the configuration. A module that has been called by another module is often referred to as a child module.

Child modules can be called multiple times within the same configuration, and multiple configurations can use the same child module.
```


