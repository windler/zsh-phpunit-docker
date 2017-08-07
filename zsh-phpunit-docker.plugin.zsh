## AUTHOR: Nico Windler
## 07.2017
## NEEDS:
### __DOCKER_PHPUNIT: phpunit executable within docker containers
### __DOCKER_PHPUNIT_COVERAGE_DIR: phpunit coverage report dir

dockerbash() {
    docker exec -it $1 bash
}

dockertests() {
    case "$2" in
      group)
        docker exec -it $1 /bin/bash -c "export TERM=xterm; exec $__DOCKER_PHPUNIT --group $3"
        return 0
        ;;
      filter)
        docker exec -it $1 /bin/bash -c "export TERM=xterm; exec $__DOCKER_PHPUNIT --filter $3"
        return 0
        ;;
      all)
        docker exec -it $1 /bin/bash -c "export TERM=xterm; exec $__DOCKER_PHPUNIT --exclude-group ignore"
        return 0
        ;;
      coverage)
        docker exec -it $1 /bin/bash -c "export TERM=xterm; exec $__DOCKER_PHPUNIT --exclude-group ignore --coverage-text"
        return 0
        ;;
      coverage-report)
        docker exec -it $1 /bin/bash -c "export TERM=xterm; exec $__DOCKER_PHPUNIT --exclude-group ignore --coverage-html $__DOCKER_PHPUNIT_COVERAGE_DIR"
        return 0
        ;;
    esac

    docker exec -it $1 /bin/bash -c "export TERM=xterm; exec $__DOCKER_PHPUNIT"
}

#helper for completion, needed in different compdefs
__docker_get_containers() {
    IFS=$'\n'
    names=($(docker ps --format '{{.Names}}'))
    for name in $names; do
        values=($values $name)
    done
    _describe 'values' values
    return 1
}
