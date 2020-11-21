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

# how to install nginx

```sh
$ uname -a
Linux xxx.compute.internal xxx.amzn2.x86_64 #1 SMP Fri Oct 30 19:19:33 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
$ sudo amazon-linux-extras install nginx1.12
$ nginx -v
nginx version: nginx/1.12.2

# check process
$ ps aux | grep nginx
ec2-user 32469  0.0  0.0 119484   980 pts/0    S+   02:52   0:00 grep --color=auto nginx

# start service
$ sudo service nginx start
Redirecting to /bin/systemctl start nginx.service

# check process
$ ps aux | grep nginx
root     32491  0.0  0.2 123740  2184 ?        Ss   02:52   0:00 nginx: master process /usr/sbin/nginx
nginx    32492  0.0  0.3 124196  4000 ?        S    02:52   0:00 nginx: worker process
ec2-user 32494  0.0  0.0 119484   936 pts/0    S+   02:53   0:00 grep --color=auto nginx

# access to Public IPv4 address
```


