# ruby_goodbye_chatwork snippets

https://github.com/swdyh/goodbye_chatwork

## install
```bash
$ sudo gem install goodbye_chatwork

$ gem list | grep goodbye
goodbye_chatwork (0.0.8)
```

## download chatwork data
```bash
$ cat room_list.sh
#!/bin/bash

goodbye_chatwork -i ID_NAME -p PASSWORD



$ cat download_data_from_room.sh
#!/bin/bash

room_id=$1
goodbye_chatwork -i ID_NAME-p PASSWORD \
  -x "$room_id"
```
