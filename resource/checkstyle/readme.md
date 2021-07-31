### Setup Custom checkstyle
1. Install `CheckStyle-IDEA` plugin in Intellij Idea
2. Go to `File->Settings->Tools->CheckStyle` and click on `+` under `File Configuration`
3. Add Description and browser local file to `resource/checkstyle/google_checks.xml`
4. (Optional) You can activate your custom Checks for whole project, or you can run checks for individual file.

### Note:
1. `google_checks.xml` is cloned from [checkstyle/checkstyle](https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml)
2. I have made some modification on `google_checks.xml`
   1. commented out some erroneous modules in `google_checks.xml`
   2. change the indentation level from 2 to 4 