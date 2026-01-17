function dotdot --description 'cd up multiple directories with multiple dots'
    # Count the number of dots in the command name
    set -l dots (string length -- (string replace -a -r '[^.]' '' -- $argv[0]))

    # Need at least 3 dots to trigger (since .. already works)
    if test $dots -ge 3
        # Calculate how many levels to go up (dots - 1)
        set -l levels (math $dots - 1)

        # Build the path
        set -l path ""
        for i in (seq $levels)
            set path "$path../"
        end

        cd $path
    else
        echo "Use ... or more dots to cd up multiple directories"
    end
end

# Create abbreviations for common cases
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
abbr -a ..... 'cd ../../../..'
abbr -a ...... 'cd ../../../../..'
