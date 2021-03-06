# Zsh-phpunit-dockertests
This is a `oh-my-zsh` plugin that lets you run `phpunit`-tests in a docker container.
This plugin comes with autocompletion for running containers, commands and phpunit groups.

## Installation
In order to install you need `Docker` and `oh-my-zsh`. Then you can install the plugin doing the following:


```
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/windler/zsh-phpunit-docker.git
zsh
```

## Preconditions
After installing the plugin you have to define two variables. This plugin needs to know where the phpunit
executable is located in your containers. If you want to generate coverage reports you also have to define the output folder. The archive this you can add the following variables to your `~/.zshrc` file:

```
__DOCKER_PHPUNIT="./vendor/phpunit/phpunit/phpunit"
__DOCKER_PHPUNIT_COVERAGE_DIR="coverage_report"
```

## Dockertests
The basic command is
```
dockertests <container> [<option> [<arg>]]

##Example
dockertests my_php_fpm_container group integration_tests
```

The argument `<container>` is the name or id of a running container. You can use `tab`
for autocompletion. After choosing a container you have various options:
```
all - Runs all tests except the ignore-group (if used). This is the default command.
group - Runs tests for a phpunit group
filter - provides a filter for e.g. running one tests
coverage - runs all tests except ignore-group and prints coverage (console)
coverage-report - runs all tests except ignore-group with coverage report (html)
```

If the `group` command is provided you can autocomplete the phpunit group (this takes a while).

## Dockerbash
In addition to run tests you can simply start a `bash` on a cotainer using

```
dockerbash <container>
```

The argument `<container>` is the name or id of a running container. You can use `tab`
for autocompletion.
