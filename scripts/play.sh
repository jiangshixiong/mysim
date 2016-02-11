argc="$#";
argv="$@";

source settings.sh;

# sim-bpred, sim-cache, sim-eio, sim-fast, 
# sim-outorder, sim-profile, sim-safe.

# -----------------------------------------------

simcommand="sim-outorder";
ptrace="ptrace.trc 100:500";
prog="prog.out";
sim="sim.out";
config="config.cfg";
pcstat="sim-num-insn";

dumpconfig="dumpconfig.cfg";
benchmark="test-printf";

# -----------------------------------------------

simcommand="${simplesim_directory}/${simcommand}";
ptrace="-ptrace ${results_directory}/${ptrace}";
prog="-redir:prog ${results_directory}/${prog}";
sim="-redir:sim ${results_directory}/${sim}";
config="-config ${config_directory}/${config}";
pcstat="-pcstat ${simplesim_directory}/${pcstat}";

dumpconfig="-dumpconfig ${config_directory}/${dumpconfig}";
benchmark="${benchmark_directory}/${benchmark}";

# -----------------------------------------------

cmd="";
if [ ${argc} == 1 ]; then
	if [ ${argv[0]} == "help" ]; then
		cmd="${simcommand} -h";
	elif [ ${argv[0]} == "safe" ] || [ ${argv[0]} == "fast" ]; then
		simcommand=${simplesim_directory}/"sim-${argv[0]}";
		cmd="${simcommand} ${prog} ${sim} ${benchmark}";
	elif [ ${argv[0]} == "config" ]; then
		cmd="${simcommand} ${config} ${benchmark}";
	elif [ ${argv[0]} == "dumpconfig" ]; then 
		cmd="${simcommand} ${ptrace} ${prog} ${sim} ${dumpconfig} -q ${benchmark}";
	fi
else 
	cmd="${simcommand} ${ptrace} ${prog} ${sim} ${benchmark}";
fi

echo ${cmd};
${cmd};
