# python_meetup-api snippets

http://meetup-api.readthedocs.io/en/latest/getting_started.html

## install
```bash
pip install meetup-api
```

## get apikey & setting
https://secure.meetup.com/meetup_api/key/
```bash
export MEETUP_API_KEY=<VALUE>
```

## example
```python
import meetup.api
client = meetup.api.Client()

#get group info
group_info_dict = {'urlname': 'Meetup-API-Testing'}
#group_info_dict = {'urlname': 'The-Tokyo-Django-Meetup-Group'}
group_info = client.GetGroup(group_info_dict)
#print(group_info)
#print(type(group_info))
"""
print(group_info.__dict__.keys())
dict_keys(['id', 'description', 'state', 'country', 'localized_country_name', 'urlname', 'lat', 'city', 'untranslated_city', 'join_mode', 'who', 'name', 'status', 'organizer', 'timezone', 'key_photo', 'lon', 'category', 'next_event', 'link', 'meta_category', 'localized_location', 'members', 'visibility', 'created', 'group_photo'])
"""

for key in group_info.__dict__.keys():
    print('key:{}, value:{}'.format(key, group_info.__dict__[key]))

"""
key:urlname, value:Meetup-API-Testing
key:status, value:active
key:lat, value:40.7
key:organizer, value:{'name': 'Doug Tangren', 'photo': {'photo_link': 'https://secure.meetupstatic.com/photos/member/e/3/d/0/member_267178320.jpeg', 'thumb_link': 'https://secure.meetupstatic.com/photos/member/e/3/d/0/thumb_267178320.jpeg', 'base_url': 'https://secure.meetupstatic.com', 'type': 'member', 'highres_link': 'https://secure.meetupstatic.com/photos/member/e/3/d/0/highres_267178320.jpeg', 'id': 267178320}, 'bio': 'lessis.me', 'id': 8157820}
key:created, value:1258123610000
key:visibility, value:public_limited
key:name, value:Meetup API Testing Sandbox
key:meta_category, value:{'name': 'Tech', 'category_ids': [34], 'shortname': 'tech', 'photo': {'photo_link': 'https://secure.meetupstatic.com/photos/event/2/e/a/d/600_450131949.jpeg', 'thumb_link': 'https://secure.meetupstatic.com/photos/event/2/e/a/d/thumb_450131949.jpeg', 'base_url': 'https://secure.meetupstatic.com', 'type': 'event', 'highres_link': 'https://secure.meetupstatic.com/photos/event/2/e/a/d/highres_450131949.jpeg', 'id': 450131949}, 'sort_name': 'Tech', 'id': 292}
key:group_photo, value:{'photo_link': 'https://secure.meetupstatic.com/photos/event/9/2/5/6/600_459337462.jpeg', 'thumb_link': 'https://secure.meetupstatic.com/photos/event/9/2/5/6/thumb_459337462.jpeg', 'base_url': 'https://secure.meetupstatic.com', 'type': 'event', 'highres_link': 'https://secure.meetupstatic.com/photos/event/9/2/5/6/highres_459337462.jpeg', 'id': 459337462}
key:localized_country_name, value:USA
key:key_photo, value:{'photo_link': 'https://secure.meetupstatic.com/photos/event/2/b/c/a/600_468011210.jpeg', 'thumb_link': 'https://secure.meetupstatic.com/photos/event/2/b/c/a/thumb_468011210.jpeg', 'base_url': 'https://secure.meetupstatic.com', 'type': 'event', 'highres_link': 'https://secure.meetupstatic.com/photos/event/2/b/c/a/highres_468011210.jpeg', 'id': 468011210}
key:city, value:Brooklyn
key:members, value:7449
key:join_mode, value:open
key:description, value:<p>This group is <b>intended to be used only by developers testing the Meetup API</b>. The Meetups listed in this group are<b> not likely to</b><b> exist in the real world</b>. You will probably also want to <b>turn off email and notifications for this group</b>.</p>
<p>If you are working on an application that uses the Meetup API and want a sandbox for testing, feel free to join.</p>
<p>Be conscientious about the content you post in this group. You may test posting content but please be courteous about cleaning up that content after you've completed your test. Inappropriate content can and will be removed at any time.</p>
<p>If you need to test features prohibited to standard membership, you may contact one of the organizers for the lead role designed to test your software. &lt;br&gt;</p>
<p>For additional questions feel free to browse <a href="http://www.meetup.com/help/keyword/?search=api">help section</a> and Meetup API <a href="https://secure.meetup.com/meetup_api/docs/">documentation</a>.</p>
key:country, value:US
key:lon, value:-73.99
key:localized_location, value:Brooklyn, NY
key:next_event, value:{'name': 'Meetup Comment Test', 'yes_rsvp_count': 1, 'utc_offset': -14400000, 'time': 1535238000000, 'id': '253161106'}
key:link, value:https://www.meetup.com/Meetup-API-Testing/
key:who, value:Developers
key:state, value:NY
key:id, value:1556336
key:untranslated_city, value:Brooklyn
key:timezone, value:US/Eastern
key:category, value:{'name': 'Tech', 'sort_name': 'Tech', 'shortname': 'tech', 'id': 34}
"""
```
