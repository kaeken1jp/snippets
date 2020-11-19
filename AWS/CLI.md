[AWS Command Line Interface](https://aws.amazon.com/cli/?nc1=h_ls)

[aws/aws-cli: Universal Command Line Interface for Amazon Web Services](https://github.com/aws/aws-cli)

[Search · aws cli](https://gist.github.com/search?q=aws+cli)

# common

```sh
$ aws <command> <subcommand> [options and parameters]
```

# create a new configuration (default)

```sh
# To create a new configuration:
$ aws configure
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]: # https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-region
Default output format [None]: # https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-format
```


# create a new configuration (profile)

```sh
$ aws configure --profile PROFILE_NAME
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]:
Default output format [None]:
```

# show configuration

```sh
$ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile             PROFILE_NAME             manual    --profile
access_key     ****************aaaa shared-credentials-file
secret_key     ****************bbbb shared-credentials-file
    region                <not set>             None    None
```

# change profile

```sh
$ export AWS_DEFAULT_PROFILE=profile-name
```


# all command

[AWS CLI Command Reference — AWS CLI 1.18.181 Command Reference](https://docs.aws.amazon.com/cli/latest/index.html)

```
accessanalyzer
acm
acm-pca
alexaforbusiness
amplify
apigateway
apigatewaymanagementapi
apigatewayv2
appconfig
appflow
application-autoscaling
application-insights
appmesh
appstream
appsync
athena
autoscaling
autoscaling-plans
backup
batch
braket
budgets
ce
chime
cloud9
clouddirectory
cloudformation
cloudfront
cloudhsm
cloudhsmv2
cloudsearch
cloudsearchdomain
cloudtrail
cloudwatch
codeartifact
codebuild
codecommit
codeguru-reviewer
codeguruprofiler
codepipeline
codestar
codestar-connections
codestar-notifications
cognito-identity
cognito-idp
cognito-sync
comprehend
comprehendmedical
compute-optimizer
configservice
configure
connect
connectparticipant
cur
databrew
dataexchange
datapipeline
datasync
dax
deploy
detective
devicefarm
directconnect
discovery
dlm
dms
docdb
ds
dynamodb
dynamodbstreams
ebs
ec2
ec2-instance-connect
ecr
ecs
efs
eks
elastic-inference
elasticache
elasticbeanstalk
elastictranscoder
elb
elbv2
emr
es
events
firehose
fms
forecast
forecastquery
frauddetector
fsx
gamelift
glacier
globalaccelerator
glue
greengrass
groundstation
guardduty
health
history
honeycode
iam
identitystore
imagebuilder
importexport
inspector
iot
iot-data
iot-jobs-data
iot1click-devices
iot1click-projects
iotanalytics
iotevents
iotevents-data
iotsecuretunneling
iotsitewise
iotthingsgraph
ivs
kafka
kendra
kinesis
kinesis-video-archived-media
kinesis-video-media
kinesis-video-signaling
kinesisanalytics
kinesisanalyticsv2
kinesisvideo
kms
lakeformation
lambda
lex-models
lex-runtime
license-manager
lightsail
logs
machinelearning
macie
macie2
managedblockchain
marketplace-catalog
marketplace-entitlement
marketplacecommerceanalytics
mediaconnect
mediaconvert
medialive
mediapackage
mediapackage-vod
mediastore
mediastore-data
mediatailor
meteringmarketplace
mgh
migrationhub-config
mobile
mq
mturk
neptune
network-firewall
networkmanager
opsworks
opsworks-cm
organizations
outposts
personalize
personalize-events
personalize-runtime
pi
pinpoint
pinpoint-email
pinpoint-sms-voice
polly
pricing
qldb
qldb-session
quicksight
ram
rds
rds-data
redshift
redshift-data
rekognition
resource-groups
resourcegroupstaggingapi
robomaker
route53
route53domains
route53resolver
s3
s3api
s3control
s3outposts
sagemaker
sagemaker-a2i-runtime
sagemaker-runtime
savingsplans
schemas
sdb
secretsmanager
securityhub
serverlessrepo
service-quotas
servicecatalog
servicecatalog-appregistry
servicediscovery
ses
sesv2
shield
signer
sms
snowball
sns
sqs
ssm
sso
sso-admin
sso-oidc
stepfunctions
storagegateway
sts
support
swf
synthetics
textract
timestream-query
timestream-write
transcribe
transfer
translate
waf
waf-regional
wafv2
workdocs
worklink
workmail
workmailmessageflow
workspaces
xray
```
