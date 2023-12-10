# imports
. constants.sh

function matchFormat() {
    local migrations=("$@")
    local invalid_migration_files=()

    for migration in "${migrations[@]}"; do
        if [[ ! $migration =~ $ALLOWED_MIGRATION_FORMAT ]]; then
            invalid_migration_files+=($migration)
        fi
    done

    echo
    if [[ ${#invalid_migration_files[@]} -gt 0 ]]; then
        echo "${#invalid_migration_files[@]} migration(s) do not match regex: '$ALLOWED_MIGRATION_FORMAT'"
        for element in "${invalid_migration_files[@]}"; do
            echo -e "- $element $CROSS"
        done

        return 1
    fi
    echo "${#migrations[@]} migration(s) match the allowed format: '$ALLOWED_MIGRATION_FORMAT'"
    return 0
}