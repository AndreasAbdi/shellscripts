############################################### THIS HERE FILE IS FOR FUNCTIONS ############################################

function up() {
	count=$1
	if [ -z %count ]; then
		while [ $count -gt 0 ]
		do
			cd ../
			((count-- ))
		done
	else
		cd ../
	fi

}

function search_f() {
	find $1 -name "$2"
}

function delete_f() {
	find . -name "S1" -delete
}

function replace_f() {
	xargs -sed -i "s/$1/$2/g"
}
