############################################### THIS HERE FILE IS FOR FUNCTIONS ############################################

###################### VARIABLES HERE ###################################
#AEM VARIABLES ARE HERE
#AEM Access variables
aem_id="admin"
aem_pw="admin"

#locations of the deployment packages here.
ep_4_aem_package_location="/home/andreas/Documents/ep/AEM/AEM-Commerce/deployment-package/target"
geometrixx_package_location="/home/andreas/Documents/ep/AEM/geometrixx-demo/deployment-package/target"
#geometrixx package name
geometrixx_package_name="ep-geometrixx-content"
geometrixx_package_version="0-SNAPSHOT"
geometrixx_package_extension=".zip"
geometrixx_package_full_name="$geometrixx_package_name-$geometrixx_package_version$geometrixx_package_extension"
geometrixx_package_package="com.elasticpath.aem.geometrixx"
geometrixx_package_full="$geometrixx_package_package/$geometrixx_package_full_name"

#EP4AEM package name
ep_4_aem_package_name="ep-commerce-api"
ep_4_aem_package_version="0-SNAPSHOT"
ep_4_aem_package_extension=".zip"
ep_4_aem_package_full_name="$ep_4_aem_package_name-$ep_4_aem_package_version$ep_4_aem_package_extension"
ep_4_aem_package_package="com.elasticpath.aem.commerce"
ep_4_aem_package_full="$ep_4_aem_package_package/$ep_4_aem_package_full_name"


########################### METHODS HERE ############################
function uninstallPackage() {
	echo "[DEBUG] do uninstall package in AEM"

	ip=$1
	port=$2
	package=$3

	curl -u $aem_id:$aem_pw -X POST http://$ip:$port/crx/packmgr/service/.json/etc/packages/$package?cmd=uninstall
}

function deletePackage() {
	echo "[DEBUG] do delete package in AEM"

	ip=$1
	port=$2
	package=$3

	curl -u $aem_id:$aem_pw -X POST http://$ip:$port/crx/packmgr/service/.json/etc/packages/$package?cmd=delete
}

function installPackage() {
	echo "[DEBUG] do install package in AEM"

	ip=$1
	port=$2
	package_name=$3
	package_location=$4

        curl -u $aem_id:$aem_pw -F file=@"$package_location/$package_name" -F name="$package_name" -F force=true -F install=true http://$ip:$port/crx/packmgr/service.jsp
}



function restartPackage() {
	echo "[DEBUG] do restartset["

	ip=$1
	port=$2	
	package_name=$3
	package_package=$4
	package_location=$5

	uninstallPackage $ip $port "$package_package/$package_name"
	deletePackage $ip $port "$package_package/$package_name"
	installPackage $ip $port $package_name $package_location
}

function restartEPCD() {
	echo "[DEBUG] do restart EPCD"

	ip=$1
	port=$2	
	package_name=$geometrixx_package_full_name
	package_package=$geometrixx_package_package
	package_location=$geometrixx_package_location

	restartPackage $ip $port $package_name $package_package $package_location
}

function restartEP4AEM() {
	echo "[DEBUG] do restart EP 4 AEM"

	ip=$1
	port=$2	
	package_name=$ep_4_aem_package_full_name
	package_package=$ep_4_aem_package_package
	package_location=$ep_4_aem_package_location

	restartPackage $ip $port $package_name $package_package $package_location
}

function restartComponents() {
	echo "[DEBUG] do restart all components"
	ip=$1
	port=$2	
	restartEP4AEM $ip $port
	restartEPCD $ip $port
}

function magical_aem_girl_says_hi() {
	printf "							\n\
   ___  								\n\
  /___\\  								\n\
  |- -| 	In AEM, the world glitters on you \\(@_-_-_@)\\   	\n\
 /| - |\   								\n\
/ \___/ \\ 								\n\
	   								\n"

}
function magical_aem_girl() {
	echo "[DEBUG] do start AEM"
	ip=$1	
	mode=$2
	if [ $mode = "publish" ]
	then
		echo "[DEBUG] doing publish mode start of ep 4 aem."
		port=4503
		restartComponents $ip $port
		magical_aem_girl_says_hi
	elif [ $mode = "author" ]
	then
		echo "[DEBUG] doing author mode start of ep 4 aem."
		port=4502
		restartComponents $ip $port
		magical_aem_girl_says_hi
	else
		echo "[ERROR] no valid mode specified"
		return
	fi
}



