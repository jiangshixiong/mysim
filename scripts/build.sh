argv="$@";
argc="$#";

cd ../simplesim-3.0;

make clean;

if [ ${argc} != 1 ]; then 
	echo "alpha or pisa";
	exit;
elif [ ${argv[0]} == "alpha" ]; then
	make config-alpha;
elif [ ${argv[0]} == "pisa" ]; then 
	make config-pisa;
else 
	echo "alpha or pisa";
	exit;
fi

make;

make sim-tests;
