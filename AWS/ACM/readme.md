[AWS Certificate Manager - Amazon Web Services (AWS)](https://aws.amazon.com/certificate-manager/)

- AWS Certificate Manager is a service that lets you easily provision, manage, and deploy public and private Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificates for use with AWS services and your internal connected resources. SSL/TLS certificates are used to secure network communications and establish the identity of websites over the Internet as well as resources on private networks. AWS Certificate Manager removes the time-consuming manual process of purchasing, uploading, and renewing SSL/TLS certificates.

- With AWS Certificate Manager, you can quickly request a certificate, deploy it on ACM-integrated AWS resources, such as Elastic Load Balancers, Amazon CloudFront distributions, and APIs on API Gateway, and let AWS Certificate Manager handle certificate renewals. It also enables you to create private certificates for your internal resources and manage the certificate lifecycle centrally. Public and private certificates provisioned through AWS Certificate Manager for use with ACM-integrated services are free. You pay only for the AWS resources you create to run your application. With AWS Certificate Manager Private Certificate Authority, you pay monthly for the operation of the private CA and for the private certificates you issue.


# solutions

## How can I associate an ACM SSL/TLS certificate with a Classic, Application, or Network Load Balancer?

[Associate an ACM/SSL certificate with a load balancer](https://aws.amazon.com/premiumsupport/knowledge-center/associate-acm-certificate-alb-nlb/?nc1=h_ls)


## To use an ACM certificate with Amazon CloudFront, you must request or import the certificate in the US East (N. Virginia) region.

- ACM certificates in this region that are associated with a CloudFront distribution are distributed to all the geographic locations configured for that distribution.

[Supported Regions - AWS Certificate Manager](https://docs.aws.amazon.com/acm/latest/userguide/acm-regions.html)
