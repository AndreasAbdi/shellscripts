########################################DO THE MAIN STUFF HERE #################################################3
#### Add all of the disparate shell files to one main one.  ###

### Add the elements in order : 
# paths
# aliases
# functions

#Get the current working directory for all the shell scripts. 
shellscripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export shellscripts


echo "[INFO]	[MAIN] Adding on the additional shell scripts at : $shellscripts"

#processing the path variables. 
currpath=$shellscripts

#Set here are shell files that are to be included with path relative to this shell file. 
relpath[0]="/default/linker.sh"
relpath[1]="/git/linker.sh"
relpath[2]="/java/linker.sh"
relpath[3]="/aem/linker.sh"
relpath[4]="/ep/linker.sh"
relpath[5]="/fun/linker.sh"
#getting the directory of this file. 
currpath=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "[INFO]	[MAIN] directory is : $currpath"

#changing the path variables to the static path values. 
echo "[INFO]	[MAIN] converting the scripts. "
count=0
for j in "${relpath[@]}"
do
	main_path_array[$count]="$currpath$j"
	#echo "[DEBUG]	[DEFAULT] processed object path: ${path_array[ $count ] } "
	((count++))
done



#echo "[DEBUG] [MAIN] Concatenated Test value: ${paths[0]}"
echo "[INFO]	[MAIN] Adding the shell scripts from main"
for i in "${main_path_array[@]}"
do
	echo "[INFO]	[MAIN] Adding the file: $i"
	if [ -f $i ]; then
	    	. $i
		echo "[INFO]	[MAIN] The following file was linked: $i"
	fi
done
