# imports
. constants.sh

function migrationFinder() {

    local directory=$1  
    local migrations=$( find "$directory" -type f -name '*.py' ! -name '__init__.py' -exec basename {} \; ) 
    echo "${migrations[@]}"
}