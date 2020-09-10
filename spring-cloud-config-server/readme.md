Spring Cloud Configuration Server
=================================

1.  Dependencies: Server Config and Dev Tools
2.  In application.properties add application.name and server.port
3.  Add @EnableConfigServer at main class
4.  Link a local repository as Source
5.  Create a file in a local repository about limits-service.properties
6.  Add limits-service.max and limits-service.min in this file
7.  Add spring.cloud.config.server.git.uri=location of
    /path/to/git/repo/properties/file
8.  Now we can navigate http://localhost:8888/limits-service/default to
    check the properties of limits-service.properties
9.  10. Now we can create files such as limits-service-dev.properties
    and limits-service-qa, and we have options to navigate to
11. http://localhost:8888/limits-service/dev or
    http://localhost:8888/limits-service/qa

