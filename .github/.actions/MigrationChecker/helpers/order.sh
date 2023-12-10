function migrationOrder(){
    local migrations=("$@")
    local previous_number=0

    migrations=($(for migration in "${migrations[@]}"; do echo "$migration"; done | sort))
    
    for migration in "${migrations[@]}"; do
    
        current_number=$(echo "$migration" | cut -d'_' -f1)

        if [ "$current_number" -ne "$((previous_number + 1))" ]; then
            echo -e "$migration $CROSS";
            echo "Error: Files are not in order or have skipped values."
            return 1
        fi

        echo -e "$migration $TICK";

        previous_number=$current_number
    done

    return 0

}