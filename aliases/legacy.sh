# a random assorment of deprecated
# aliases that I'm not ready to delete
# but don't plan on using
alias sTest='mvn clean install -DskipTests  && notify-send "build done" || notify-send "build failed"'
alias wTest='mvn clean install  && notify-send "build and tests done" || notify-send "build or tests failed"'
alias wTestLog='mvn clean install 2>&1 | tee mvn-log.txt && notify-send "passed" || notify-send "failure logged"'

alias fwTest='mvn clean install -t 4 && notify-send "build and tests done quickly" || notify-send "build or tests quickly failed"'
alias fsTest='mvn clean install -DskipTests -t 4 && notify-send "build done quickly" || notify-send "build failed quickly"'

#smart bear tests
alias sptst='mvn com.smartbear.soapui:soapui-maven-plugin:test'

#wipeout targets
alias whipeout="find -type d -name '*target' | sudo xargs rm -r"
alias rmMvn='rm -r ~/.m2/repository'
repo='$HOME/.m2/repository'
alias magic="rmMvn && whipeout && sTest && notify-send 'magic performed' || notify-send 'probably a network problem'"
