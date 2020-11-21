[Amazon EC2](https://aws.amazon.com/ec2/?nc1=h_ls)

- Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers. Amazon EC2’s simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on Amazon’s proven computing environment.

# create instance



# how to access instance

- download pem file

- ssh

```sh
# Open an SSH client.
# Locate your private key file. The key used to launch this instance is KeyPair.pem
# Run this command, if necessary, to ensure your key is not publicly viewable.
$ chmod 400 KeyPair.pem

# Connect to your instance using its Public DNS:
# xxx.compute.amazonaws.com

# Example:
$ ssh -i "/path/to/KeyPairName.pem" ec2-user@xxx.compute.amazonaws.com
```
