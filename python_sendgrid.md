# python_sendgrid snippets

https://github.com/sendgrid/sendgrid-python#example

## Setup Environment Variables
```bash
echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
echo "sendgrid.env" >> .gitignore
source ./sendgrid.env
```

## Install Package
```bash
pip install sendgrid
```

## Sample
```python
import sendgrid
import os
from sendgrid.helpers.mail import *

sg = sendgrid.SendGridAPIClient(apikey=os.environ.get('SENDGRID_API_KEY'))
from_email = Email("test@example.com")
to_email = Email("test@example.com")
subject = "Sending with SendGrid is Fun"
content = Content("text/plain", "and easy to do anywhere, even with Python")
mail = Mail(from_email, subject, to_email, content)
response = sg.client.mail.send.post(request_body=mail.get())
print(response.status_code)
print(response.body)
print(response.headers)
```

```python
import sendgrid
from sendgrid.helpers.mail import *

def sendGridMail(apikey, mail_from, mail_to, mail_subject, mail_body):
    sg = sendgrid.SendGridAPIClient(apikey=apikey)
    from_email = Email(mail_from)
    to_email = Email(mail_to)
    subject = mail_subject
    content = Content("text/plain", mail_body)
    mail = Mail(from_email, subject, to_email, content)
    response = sg.client.mail.send.post(request_body=mail.get())
    print(response.status_code)
    print(response.body)
    print(response.headers)

if __name__ == '__main__':
    apikey = 'API_KEY'
    mail_from = 'MAIL_ADDRESS'
    mail_to = 'MAIL_ADDRESS'
    mail_subject = 'subject string'
    mail_body = "body string"

    sendGridMail(apikey, mail_from, mail_to, mail_subject, mail_body)
```


