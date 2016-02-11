argc="$#";
argv="$@";

source settings.sh;

objdump="objdump";
textprof="textprof.pl";

objdump="${objdump} -dl ${benchmark}";
dis="${benchmark}.dis";

${objdump} >! ${dis};

${textprof} ${dis} ${out} sim_num_insn_by_pc;

echo "${cmd} > ${result}";
${cmd} > ${result};
