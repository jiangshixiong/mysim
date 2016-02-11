argv="$@";
argc="$#";

source settings.sh;

cd ${simplesim_directory};

config="";

if [ ${argc} != 1 ]; then 
	echo "alpha or pisa or tests";
	exit;
elif [ ${argv[0]} == "alpha" ]; then
	config="config-alpha";
elif [ ${argv[0]} == "pisa" ]; then 
	config="config-pisa";
elif [ ${argv[0]} == "tests"]; then
	make sim-tests;
	exit;
else 
	echo "alpha or pisa";
	exit;
fi

make clean;
make ${config};
make;
