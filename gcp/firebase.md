
# version
```sh
$ firebase -V
6.7.2
```


# firestore

## js client

## py client

```sh
pip install --upgrade firebase-admin
```







# help

```sh
$ firebase -V
6.7.2

$ firebase --help
Usage: firebase [options] [command]

Options:
  -V, --version                                   output the version number
  -P, --project <alias_or_project_id>             the Firebase project to use for this command
  -j, --json                                      output JSON instead of text, also triggers non-interactive mode
  --token <token>                                 supply an auth token for this command
  --non-interactive                               error out of the command instead of waiting for prompts
  --interactive                                   force interactive shell treatment even when not detected
  --debug                                         print verbose debug output and keep a debug log file
  -h, --help                                      output usage information

Commands:
  auth:import [options] [dataFile]                import users into your Firebase project from a data file(.csv or .json)
  auth:export [options] [dataFile]                Export accounts from your Firebase project into a data file
  database:get [options] <path>                   fetch and print JSON data at the specified path
  database:push [options] <path> [infile]         add a new JSON object to a list of data in your Firebase
  database:set [options] <path> [infile]          store JSON data at the specified path via STDIN, arg, or file
  database:remove [options] <path>                remove data from your Firebase at the specified path
  database:update [options] <path> [infile]       update some of the keys for the defined path in your Firebase
  database:profile [options]                      profile the Realtime Database and generate a usage report
  database:settings:get [options] <path>          read the realtime database setting at path
  database:settings:set [options] <path> <value>  set the realtime database setting at path.
  firestore:delete [options] [path]               Delete data from Cloud Firestore.
  firestore:indexes [options]                     List indexes in your project's Cloud Firestore database.
  deploy [options]                                deploy code and assets to your Firebase project
  hosting:disable [options]                       stop serving web traffic to your Firebase Hosting site
  functions:log [options]                         read logs from deployed functions
  functions:shell [options]                       launch full Node shell with emulated functions
  functions:config:clone [options]                clone environment config from another project
  functions:config:get [path]                     fetch environment config stored at the given path
  functions:config:set [values...]                set environment config with key=value syntax
  functions:config:unset [keys...]                unset environment config at the specified path(s)
  functions:delete [options] [filters...]         delete one or more Cloud Functions by name or group name.
  experimental:functions:shell [options]          launch full Node shell with emulated functions. (Alias for `firebase functions:shell.)
  help [command]                                  display help information
  init [feature]                                  setup a Firebase project in the current directory
  list                                            list the Firebase projects you have access to
  login [options]                                 log the CLI into Firebase
  login:ci [options]                              generate an access token for use in non-interactive environments
  logout                                          log the CLI out of Firebase
  open [link]                                     quickly open a browser to relevant project resources
  serve [options]                                 start a local server for your static assets
  setup:web                                       display this project's setup information for the Firebase JS SDK
  setup:emulators:database                        downloads the database emulator
  setup:emulators:firestore                       downloads the firestore emulator
  target [type]                                   display configured deploy targets for the current project
  target:apply <type> <name> <resources...>       apply a deploy target to a resource
  target:clear <type> <target>                    clear all resources from a named resource target
  target:remove <type> <resource>                 remove a resource target
  tools:migrate [options]                         ensure your firebase.json format is up to date
  use [options] [alias_or_project_id]             set an active Firebase project for your working directory
```

# Cloud Firestore

## export & import

ref. https://firebase.google.com/docs/firestore/manage-data/export-import



# Firebase Hosting

[Firebase Hosting を使ってみる  |  Firebase](https://firebase.google.com/docs/hosting/quickstart?hl=ja)

