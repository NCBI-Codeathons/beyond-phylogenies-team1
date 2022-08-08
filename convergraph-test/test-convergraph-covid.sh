#!/bin/bash
# Sam Shepard - 2022.07

convergraph="convergraph/target/release/convergraph"
output_file="covid-test-graph.dot"
query_file="query-data-aa.txt.gz"
ref_file="Wuhan-MT019531-AA.txt"
log="covid-test-log.txt"

if [ ! -x "$convergraph" ]; then
    echo "No convergraph, installing." \
        && ./install.sh \
        || {
            echo "Install failed."
            exit 1
        }
fi

if [ "$(uname)" == "Darwin" ]; then
    set -x
    zcat <"$query_file" | cut -f2 | time -l -- "$convergraph" --query-has-header --reference-file "$ref_file" >"$output_file" 2>"$log" \
        || {
            cat "$log"
            exit 1
        }
# Linux
else
    set -x
    zcat "$query_file" | cut -f2 | time -v -- "$convergraph" --query-has-header --reference-file "$ref_file" >"$output_file" 2>"$log" \
        || {
            cat "$log"
            exit 1
        }
fi
