[Continuous Integration and Delivery - CircleCI](https://circleci.com/)

# doc
[Welcome to CircleCI Documentation - CircleCI](https://circleci.com/docs/)


# Sign Up

https://circleci.com/signup/
```
Sign Up with GitHub
```

# config

```sh
mkdir .circleci
vi .circleci/config.yml
```

```
version: 2.1
jobs:
  build:
    docker: 
      - image: circleci/node:4.8.2 # the primary container, where your job's commands are run
    steps:
      - checkout # check out the code in the project directory
      - run: echo "hello world" # run the `echo` command
```

# other

[Welcome to CircleCI Documentation - CircleCI](https://circleci.com/docs/)

