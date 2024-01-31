function nurlol --description "Get the nurl output and copy to clipboard. Usage: nurlol user/repo"
    # Split the input argument by '/'
    set -l parts (string split '/' $argv[1])
    set -l user $parts[1]
    set -l repo $parts[2]
    # Check if both user and repo are provided
    if test (count $parts) -ne 2
        echo "Usage: nurlol user/repo"
        return 1
    end
    # set the command to a variable: "nurl https://github.com/$user/$repo 2>/dev/null"
    set -l nurlol_command "nurl https://github.com/$user/$repo 2>/dev/null"
    # Execute the command, copy to clipboard using pbcopy, and print the command
    set -l nurlol_output (eval $nurlol_command); echo $nurlol_output | pbcopy; echo $nurlol_output
end
