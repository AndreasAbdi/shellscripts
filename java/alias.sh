################################################ ALIASES ############################################

#maven aliases. 

alias mq="mvn -T3 clean install -Dpmd.skip -Dcheckstyle.skip -DskipAllTests -pl cortex-dce/cortex-dce-studio-webapp -am -Dmaven.test.skip=true"
alias mvnci="mvn clean install"
alias mci="mvn clean install -T3 -e"
alias mcis="mvn clean install -DskipTests -DskipITests -DskipAllTests -Dskip.checkstyle -Dcheckstyle.skip -Dpmd.skip -Djacoco.skip"
