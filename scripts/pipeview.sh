argc="$#";
argv="$@";

source settings.sh;

# sim-bpred, sim-cache, sim-eio, sim-fast, 
# sim-outorder, sim-profile, sim-safe.

pipeview="pipeview.pl";
pipeview="${simplesim_directory}/${pipeview}";

ptrace="ptrace.trc";
ptrace="${results_directory}/${ptrace}";

result="pipeview.out";
result="${results_directory}/${result}";

cmd="${pipeview} ${ptrace}";

echo "${cmd} > ${result}";
${cmd} > ${result};
