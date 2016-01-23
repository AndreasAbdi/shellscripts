############################################### THIS HERE FILE IS FOR FUNCTIONS ############################################

im=(":_:" "-_-" "^_^" "%_%")
function spin () {
  rotations=3
  delay=0.5
  for i in `seq 0 $rotations`; do
    for char in ${im[@]}; do
      #'# inserted to correct broken syntax highlighting
 	echo -en "$char\r"	
	sleep $delay
    done
  done
}
