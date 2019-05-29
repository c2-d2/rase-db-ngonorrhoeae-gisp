#! /usr/bin/env bash

set -e
set -o pipefail
set -u

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(dirname $0)
readonly -a ARGS=("$@")
readonly NARGS="$#"

if [[ $NARGS -ne 1 ]]; then
	>&2 echo "usage: $PROGNAME ref.fa"
	exit 1
fi

seqtk seq contigs/GCGS0326.fa \
	| perl -pe 's/\n/\t/g' \
	| perl -pe 's/\t>/\n>/g' \
	| awk 'BEGIN{while((getline<"../published/plasmids.txt")>0)l[">"$1]=1}/^>/{f=!l[$1]}f' \
	| perl -pe 's/\t/\n/g' \
	| egrep -v "^$"

