Spring Cloud Configuration Server
=================================

1.  Dependencies: Server Config and Dev Tools
2.  In application.properties add application.name and server.port
3.  Add @EnableConfigServer at main class
4.  Link a local repository as Source
5.  Create a file in a local repository about rest-api.properties
6.  Add ls.max and ls.min in this file
7.  Add spring.cloud.config.server.git.uri=location of
    /path/to/git/repo/properties/file
8.  Now we can navigate http://localhost:8888/rest-api/default to
    check the properties of rest-api.properties
9.  10. Now we can create files such as rest-api-dev.properties
    and rest-api-qa, and we have options to navigate to
11. http://localhost:8888/rest-api/dev or
    http://localhost:8888/rest-api/qa

