# Terraform AWS EC2 Instance

This GitHub repository demonstrates how to use Terraform to automate the provisioning of an AWS EC2 instance. The Terraform configuration defines an AWS provider, specifies an Amazon Machine Image (AMI), and launches a t2.micro EC2 instance in the eu-west-2 region.

## Prerequisites

Before running the Terraform configuration, ensure you have the following installed:

- Terraform (v1.2 or higher)
- AWS CLI (configured with appropriate access and permissions)
- Git
- An AWS account with permission to create EC2 instances

## Usage

1. Clone the repository

```git clone https://github.com/jourzy/terraform-aws-instance.git```

```cd terraform-aws-instance```

2. Configure AWS credentials

Ensure that your AWS credentials are properly configured either through environment variables or by using the AWS CLI:

```aws configure```

This will prompt you to enter your AWS Access Key, Secret Key, and the default region (set to eu-west-2 in this example).


3. Initialize the Terraform working directory

Initialize Terraform to download the required providers:

```terraform init```

4. Preview the infrastructure changes

You can preview the changes that will be applied to your Docker environment by running:

```terraform plan```

5. Apply the configuration

Deploy the EC2 instance using Terraform:

```terraform apply```

Type ```yes``` when prompted to confirm the changes.

6. Verify the EC2 instance

Once the instance is launched, you can verify it in the AWS Management Console under EC2 in the eu-west-2 (London) region. The instance will have the tag Name=MyServerInstance.

6. Destroy the instance

To remove the EC2 instance and associated resources, run:

```terraform destroy```

Confirm with ```yes``` when prompted.

## Explanation of ```main.tf```

- **Providers:** The configuration uses the AWS provider, sourced from hashicorp/aws, to interact with AWS services.

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}
```

- **AWS Provider:** The aws provider is configured to use the eu-west-2 (London) region for provisioning the EC2 instance.

```
provider "aws" {
  region = "eu-west-2"
}
```

- **EC2 Instance:** The aws_instance resource creates a new EC2 instance using the t2.micro instance type (eligible for free tier) and an AMI ID (ami-07c1b39b7b3d2525d), which should be available in the specified region.

```
resource "aws_instance" "my_server" {
  ami           = "ami-07c1b39b7b3d2525d"
  instance_type = "t2.micro"

  tags = {
    Name = "MyServerInstance"
  }
}
```
## Notes

- Ensure that your AWS credentials are configured with appropriate permissions to create EC2 instances.
- The provided AMI (ami-07c1b39b7b3d2525d) is specific to the eu-west-2 region. You may need to adjust the AMI if using a different region.
- The t2.micro instance type is free-tier eligible, but ensure your account is within free-tier limits to avoid charges.

## License

This project is licensed under the MIT License. See the [LICENSE](https://opensource.org/license/MIT) file for details.



Feel free to contribute or raise issues in the repository to improve the project!



