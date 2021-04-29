About
=====
1. Config Server which automatically injects configurations where we import participant configs to our apps

Dependencies
============
- #### Cloud
    - ##### Config Server
        - spring-cloud-config-server
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

Spring Cloud Configuration Server
=================================

2.  In application.properties add application.name and server.port
3.  Add @EnableConfigServer at main class
4.  Link a local repository as Source
5.  Create a file in a local repository about api-composer.properties
6.  Add ls.max and ls.min in this file
7.  Add spring.cloud.config.server.git.uri=location of
    /path/to/git/repo/properties/file
8.  Now we can navigate http://localhost:8888/api-composer/default to
    check the properties of api-composer.properties
9.  10. Now we can create files such as api-composer-dev.properties
    and api-composer-qa, and we have options to navigate to
11. http://localhost:8888/api-composer/dev or
    http://localhost:8888/api-composer/qa

