if type -q bun
    function __use_bun_clean_args
        # remove the opt-in flag before handing arguments to the real tooling
        set -l cleaned
        for arg in $argv
            if test $arg = --real
                continue
            end
            set cleaned $cleaned $arg
        end

        if test (count $cleaned) -gt 0
            printf '%s\n' $cleaned
        end
    end

    function __use_bun_run_real --argument-names env_var command_name
        set -l args $argv[3..-1]
        set -l clean_args (__use_bun_clean_args $args)
        set -lx $env_var 1

        if test (count $clean_args) -gt 0
            command $command_name $clean_args
        else
            command $command_name
        end
    end

    function npm
        if contains -- --real $argv
            __use_bun_run_real USE_REAL_NPM npm $argv
        else if set -q USE_REAL_NPM
            __use_bun_run_real USE_REAL_NPM npm $argv
        else
            bun $argv
        end
    end

    function npx
        if contains -- --real $argv
            __use_bun_run_real USE_REAL_NPX npx $argv
        else if set -q USE_REAL_NPX
            __use_bun_run_real USE_REAL_NPX npx $argv
        else
            bunx $argv
        end
    end

    function pnpm
        set -l clean_args (__use_bun_clean_args $argv)
        set -l is_real 0

        if contains -- --real $argv
            set is_real 1
        else if set -q USE_REAL_PNPM
            set is_real 1
        end

        if test (count $clean_args) -gt 0 -a $clean_args[1] = dlx
            set -l pnpx_args $clean_args[2..-1]

            if test $is_real -eq 1
                set -lx USE_REAL_PNPM 1
                if test (count $pnpx_args) -gt 0
                    command pnpx $pnpx_args
                else
                    command pnpx
                end
            else
                if test (count $pnpx_args) -gt 0
                    pnpx $pnpx_args
                else
                    pnpx
                end
            end
            return
        end

        if test $is_real -eq 1
            set -lx USE_REAL_PNPM 1

            if test (count $clean_args) -gt 0
                command pnpm $clean_args
            else
                command pnpm
            end
        else
            bun $argv
        end
    end

    function pnpx
        if contains -- --real $argv
            __use_bun_run_real USE_REAL_PNPM pnpx $argv
        else if set -q USE_REAL_PNPM
            __use_bun_run_real USE_REAL_PNPM pnpx $argv
        else
            bunx $argv
        end
    end

    function yarn
        if contains -- --real $argv
            __use_bun_run_real USE_REAL_YARN yarn $argv
        else if set -q USE_REAL_YARN
            __use_bun_run_real USE_REAL_YARN yarn $argv
        else
            bun $argv
        end
    end
else
    function npm
        command npm $argv
    end

    function npx
        command npx $argv
    end

    function pnpm
        command pnpm $argv
    end

    function pnpx
        command pnpx $argv
    end

    function yarn
        command yarn $argv
    end
end
