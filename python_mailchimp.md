# python_mailchimp snippets

## install
```bash
pip install mailchimp3
```

## example
```python
from mailchimp3 import MailChimp
import sys

mc_api='YOUR_MAILCHIMP_API_KEY'
mc_user='YOUR_MAILCHIMP_USER_NAME'

client = MailChimp(mc_api=mc_api, mc_user=mc_user)
all_list = client.lists.all(get_all=True, fields="lists.name,lists.id")

# all list info
print(all_list)

# list_name
mc_list_name = 'YOUR_MAILCHIMP_LIST_NAME'


# init
user_data = {}

# mail_address
user_data['user_mail_address'] = sys.argv[1]

# user_first_name
user_data['user_first_name'] = sys.argv[2]

# user_last_name
user_data['user_last_name'] = sys.argv[3]

print(user_data)

res = client.lists.members.create(mc_list_name, {
    'email_address': user_data['user_mail_address'],
    'status': 'subscribed',
    'merge_fields': {
        'FNAME': user_data['user_first_name'],
        'LNAME': user_data['user_last_name'],
    },
})
print(res)
```




