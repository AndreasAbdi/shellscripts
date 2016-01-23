######################### This contains the shell colorfulness ##################################


#the name in green. current dir in yellow. and git branch in green. 
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] [\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)] \$ "

#colors here
marine="\[\033[36m\]"
yellow="\[\033[33;1m\]"
white="\[\033[1;37m\]"

#components here
userinfo="$marine\u@\h:"
workingDirectory="$yellow\w"
gitBranch="$white[\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]:"
commands="$white"


export PS1="$userinfo$workingDirectory$gitBranch$commands"



