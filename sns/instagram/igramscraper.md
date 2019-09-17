[realsirjoe/instagram-scraper: scrapes medias, likes, followers, tags and all metadata. Inspired by instagram-php-scraper,bot](https://github.com/realsirjoe/instagram-scraper)

# install

```
pip install igramscraper
```

# example

[instagram-scraper/examples at master · realsirjoe/instagram-scraper](https://github.com/realsirjoe/instagram-scraper/tree/master/examples)

## get_account_by_username

```py
from igramscraper.instagram import Instagram
instagram = Instagram()

username = 'foo'
account = instagram.get_account(username)

# Available fields
print('Account info:')
print('Id', account.identifier)
print('Username', account.username)
print('Full name', account.full_name)
print('Biography', account.biography)
print('Profile pic url', account.get_profile_picture_url())
print('External Url', account.external_url)
print('Number of published posts', account.media_count)
print('Number of followers', account.followed_by_count)
print('Number of follows', account.follows_count)
print('Is private', account.is_private)
print('Is verified', account.is_verified)
```

## get_account_medias_by_username

```py
from igramscraper.instagram import Instagram

instagram = Instagram()
username = 'foo'

medias = instagram.get_medias(username, 3)
"""
for m in medias:
  print(m)
"""
media = medias[0]
print('Media info:')
print('Id:', media.identifier)
print('Shortcode:', media.short_code)
print('Created at:', media.created_time)
print('Caption:', media.caption)
print('Link:', media.link)
print('Media type:', media.type)
print('Hig res image:', media.image_high_resolution_url)
print('Number of likes:', media.likes_count)
```
