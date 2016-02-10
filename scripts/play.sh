argc="$#";
argv="$@";

cd ../simplesim-3.0;
tests="tests-pisa/bin.little";
results="../scripts/results";

# sim-bpred, sim-cache, sim-eio, sim-fast, 
# sim-outorder, sim-profile, sim-safe.

if [ ${argc} == 1 ] && [ ${argv[0]} == "help" ]; then
	./sim-outorder -h;
else
	./sim-outorder -redir:prog ${results}/prog.txt -redir:sim ${results}/sim.txt ${tests}/test-printf;
fi

