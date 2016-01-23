
########################################DO THE LINKER STUFF HERE ################################################
#### Add all of the disparate shell files to one main one.  ###
echo "[INFO] [AEM] This is the AEM folder linker file."
### Add the elements in order :
# aliases
# paths
# functions

#Set here are shell files that are to be included with path relative to this shell file. 
relpath[0]="/alias.sh"
relpath[1]="/path.sh"
relpath[2]="/function.sh"

#getting the directory of this file. 
currpath=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "[INFO] [AEM] directory is : $currpath"

#changing the path variables to the static variables. 
echo "[INFO] [AEM] converting the scripts. "
count=0
for j in "${relpath[@]}"
do
	path_array[$count]="$currpath$j"
	#echo "[DEBUG] [AEM] processed object path: ${path_array[ $count ] } "
	((count++))
done

#adding the paths to the location of the parent. 
echo "[INFO] [AEM] Adding the shell scripts. "
for j in "${path_array[@]}"
do
	echo "[INFO] [AEM] Adding the file: $j"
	if [ -f $j ]; then
	    	. $j
		echo "[INFO] [AEM] The following file was linked: $j"
	fi
done

