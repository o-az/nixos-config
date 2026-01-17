# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_forge_global_optspecs
    string join \n v/verbosity q/quiet json color= j/threads= h/help V/version
end

function __fish_forge_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_forge_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_forge_using_subcommand
    set -l cmd (__fish_forge_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c forge -n __fish_forge_needs_command -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n __fish_forge_needs_command -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n __fish_forge_needs_command -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n __fish_forge_needs_command -s q -l quiet -d 'Do not print log messages'
complete -c forge -n __fish_forge_needs_command -l json -d 'Format log messages as JSON'
complete -c forge -n __fish_forge_needs_command -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n __fish_forge_needs_command -s V -l version -d 'Print version'
complete -c forge -n __fish_forge_needs_command -f -a test -d 'Run the project\'s tests'
complete -c forge -n __fish_forge_needs_command -f -a t -d 'Run the project\'s tests'
complete -c forge -n __fish_forge_needs_command -f -a script -d 'Run a smart contract as a script, building transactions that can be sent onchain'
complete -c forge -n __fish_forge_needs_command -f -a coverage -d 'Generate coverage reports'
complete -c forge -n __fish_forge_needs_command -f -a bind -d 'Generate Rust bindings for smart contracts'
complete -c forge -n __fish_forge_needs_command -f -a build -d 'Build the project\'s smart contracts'
complete -c forge -n __fish_forge_needs_command -f -a b -d 'Build the project\'s smart contracts'
complete -c forge -n __fish_forge_needs_command -f -a compile -d 'Build the project\'s smart contracts'
complete -c forge -n __fish_forge_needs_command -f -a clone -d 'Clone a contract from Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a update -d 'Update one or multiple dependencies'
complete -c forge -n __fish_forge_needs_command -f -a u -d 'Update one or multiple dependencies'
complete -c forge -n __fish_forge_needs_command -f -a install -d 'Install one or multiple dependencies'
complete -c forge -n __fish_forge_needs_command -f -a i -d 'Install one or multiple dependencies'
complete -c forge -n __fish_forge_needs_command -f -a remove -d 'Remove one or multiple dependencies'
complete -c forge -n __fish_forge_needs_command -f -a rm -d 'Remove one or multiple dependencies'
complete -c forge -n __fish_forge_needs_command -f -a remappings -d 'Get the automatically inferred remappings for the project'
complete -c forge -n __fish_forge_needs_command -f -a re -d 'Get the automatically inferred remappings for the project'
complete -c forge -n __fish_forge_needs_command -f -a verify-contract -d 'Verify smart contracts on Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a v -d 'Verify smart contracts on Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a verify-check -d 'Check verification status on Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a vc -d 'Check verification status on Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a verify-bytecode -d 'Verify the deployed bytecode against its source on Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a vb -d 'Verify the deployed bytecode against its source on Etherscan'
complete -c forge -n __fish_forge_needs_command -f -a create -d 'Deploy a smart contract'
complete -c forge -n __fish_forge_needs_command -f -a c -d 'Deploy a smart contract'
complete -c forge -n __fish_forge_needs_command -f -a init -d 'Create a new Forge project'
complete -c forge -n __fish_forge_needs_command -f -a completions -d 'Generate shell completions script'
complete -c forge -n __fish_forge_needs_command -f -a com -d 'Generate shell completions script'
complete -c forge -n __fish_forge_needs_command -f -a generate-fig-spec -d 'Generate Fig autocompletion spec'
complete -c forge -n __fish_forge_needs_command -f -a fig -d 'Generate Fig autocompletion spec'
complete -c forge -n __fish_forge_needs_command -f -a clean -d 'Remove the build artifacts and cache directories'
complete -c forge -n __fish_forge_needs_command -f -a cl -d 'Remove the build artifacts and cache directories'
complete -c forge -n __fish_forge_needs_command -f -a cache -d 'Manage the Foundry cache'
complete -c forge -n __fish_forge_needs_command -f -a snapshot -d 'Create a gas snapshot of each test\'s gas usage'
complete -c forge -n __fish_forge_needs_command -f -a s -d 'Create a gas snapshot of each test\'s gas usage'
complete -c forge -n __fish_forge_needs_command -f -a config -d 'Display the current config'
complete -c forge -n __fish_forge_needs_command -f -a co -d 'Display the current config'
complete -c forge -n __fish_forge_needs_command -f -a flatten -d 'Flatten a source file and all of its imports into one file'
complete -c forge -n __fish_forge_needs_command -f -a f -d 'Flatten a source file and all of its imports into one file'
complete -c forge -n __fish_forge_needs_command -f -a fmt -d 'Format Solidity source files'
complete -c forge -n __fish_forge_needs_command -f -a inspect -d 'Get specialized information about a smart contract'
complete -c forge -n __fish_forge_needs_command -f -a in -d 'Get specialized information about a smart contract'
complete -c forge -n __fish_forge_needs_command -f -a tree -d 'Display a tree visualization of the project\'s dependency graph'
complete -c forge -n __fish_forge_needs_command -f -a tr -d 'Display a tree visualization of the project\'s dependency graph'
complete -c forge -n __fish_forge_needs_command -f -a geiger -d 'Detects usage of unsafe cheat codes in a project and its dependencies'
complete -c forge -n __fish_forge_needs_command -f -a doc -d 'Generate documentation for the project'
complete -c forge -n __fish_forge_needs_command -f -a selectors -d 'Function selector utilities'
complete -c forge -n __fish_forge_needs_command -f -a se -d 'Function selector utilities'
complete -c forge -n __fish_forge_needs_command -f -a generate -d 'Generate scaffold files'
complete -c forge -n __fish_forge_needs_command -f -a compiler -d 'Compiler utilities'
complete -c forge -n __fish_forge_needs_command -f -a soldeer -d 'Soldeer dependency manager'
complete -c forge -n __fish_forge_needs_command -f -a eip712 -d 'Generate EIP-712 struct encodings for structs from a given file'
complete -c forge -n __fish_forge_needs_command -f -a bind-json -d 'Generate bindings for serialization/deserialization of project structs via JSON cheatcodes'
complete -c forge -n __fish_forge_needs_command -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand test" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand test" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l dump -d 'Dumps all debugger steps to file' -r -F
complete -c forge -n "__fish_forge_using_subcommand test" -l gas-snapshot-check -d 'Check gas snapshots against previous runs' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand test" -l gas-snapshot-emit -d 'Enable/disable recording of gas snapshot results' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand test" -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fuzz-seed -d 'Set seed used to generate randomness during your fuzz runs' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fuzz-runs -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fuzz-timeout -d 'Timeout for each fuzz run in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fuzz-input-file -d 'File to rerun fuzz failures from' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l match-test -l mt -d 'Only run test functions matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l no-match-test -l nmt -d 'Only run test functions that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l match-contract -l mc -d 'Only run tests in contracts matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l no-match-contract -l nmc -d 'Only run tests in contracts that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l match-path -l mp -d 'Only run tests in source files matching the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l no-match-path -l nmp -d 'Only run tests in source files that do not match the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l no-match-coverage -l nmco -d 'Only show coverage for files that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand test" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand test" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand test" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand test" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand test" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand test" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand test" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand test" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand test" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand test" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand test" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand test" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand test" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand test" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand test" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand test" -l debug -d 'Run a single test in the debugger'
complete -c forge -n "__fish_forge_using_subcommand test" -l flamegraph -d 'Generate a flamegraph for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand test" -l flamechart -d 'Generate a flamechart for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand test" -l decode-internal -d 'Identify internal functions in traces'
complete -c forge -n "__fish_forge_using_subcommand test" -l gas-report -d 'Print a gas report'
complete -c forge -n "__fish_forge_using_subcommand test" -l allow-failure -d 'Exit with code 0 even if a test fails'
complete -c forge -n "__fish_forge_using_subcommand test" -s s -l suppress-successful-traces -d 'Suppress successful test traces and show only traces for failures'
complete -c forge -n "__fish_forge_using_subcommand test" -l junit -d 'Output test results as JUnit XML report'
complete -c forge -n "__fish_forge_using_subcommand test" -l fail-fast -d 'Stop running tests after the first failure'
complete -c forge -n "__fish_forge_using_subcommand test" -s l -l list -d 'List tests instead of running them'
complete -c forge -n "__fish_forge_using_subcommand test" -l show-progress -d 'Show test execution progress'
complete -c forge -n "__fish_forge_using_subcommand test" -l rerun -d 'Re-run recorded test failures from last run. If no failure recorded then regular test run is performed'
complete -c forge -n "__fish_forge_using_subcommand test" -l summary -d 'Print test summary table'
complete -c forge -n "__fish_forge_using_subcommand test" -l detailed -d 'Print detailed test summary table'
complete -c forge -n "__fish_forge_using_subcommand test" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand test" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand test" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand test" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand test" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand test" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand test" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand test" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand test" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand test" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand test" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand test" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand test" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand test" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand test" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand test" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand test" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand test" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand test" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand test" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand test" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand test" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand test" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand t" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand t" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l dump -d 'Dumps all debugger steps to file' -r -F
complete -c forge -n "__fish_forge_using_subcommand t" -l gas-snapshot-check -d 'Check gas snapshots against previous runs' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand t" -l gas-snapshot-emit -d 'Enable/disable recording of gas snapshot results' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand t" -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fuzz-seed -d 'Set seed used to generate randomness during your fuzz runs' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fuzz-runs -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fuzz-timeout -d 'Timeout for each fuzz run in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fuzz-input-file -d 'File to rerun fuzz failures from' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l match-test -l mt -d 'Only run test functions matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l no-match-test -l nmt -d 'Only run test functions that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l match-contract -l mc -d 'Only run tests in contracts matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l no-match-contract -l nmc -d 'Only run tests in contracts that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l match-path -l mp -d 'Only run tests in source files matching the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l no-match-path -l nmp -d 'Only run tests in source files that do not match the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l no-match-coverage -l nmco -d 'Only show coverage for files that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand t" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand t" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand t" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand t" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand t" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand t" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand t" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand t" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand t" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand t" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand t" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand t" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand t" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand t" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand t" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand t" -l debug -d 'Run a single test in the debugger'
complete -c forge -n "__fish_forge_using_subcommand t" -l flamegraph -d 'Generate a flamegraph for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand t" -l flamechart -d 'Generate a flamechart for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand t" -l decode-internal -d 'Identify internal functions in traces'
complete -c forge -n "__fish_forge_using_subcommand t" -l gas-report -d 'Print a gas report'
complete -c forge -n "__fish_forge_using_subcommand t" -l allow-failure -d 'Exit with code 0 even if a test fails'
complete -c forge -n "__fish_forge_using_subcommand t" -s s -l suppress-successful-traces -d 'Suppress successful test traces and show only traces for failures'
complete -c forge -n "__fish_forge_using_subcommand t" -l junit -d 'Output test results as JUnit XML report'
complete -c forge -n "__fish_forge_using_subcommand t" -l fail-fast -d 'Stop running tests after the first failure'
complete -c forge -n "__fish_forge_using_subcommand t" -s l -l list -d 'List tests instead of running them'
complete -c forge -n "__fish_forge_using_subcommand t" -l show-progress -d 'Show test execution progress'
complete -c forge -n "__fish_forge_using_subcommand t" -l rerun -d 'Re-run recorded test failures from last run. If no failure recorded then regular test run is performed'
complete -c forge -n "__fish_forge_using_subcommand t" -l summary -d 'Print test summary table'
complete -c forge -n "__fish_forge_using_subcommand t" -l detailed -d 'Print detailed test summary table'
complete -c forge -n "__fish_forge_using_subcommand t" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand t" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand t" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand t" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand t" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand t" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand t" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand t" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand t" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand t" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand t" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand t" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand t" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand t" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand t" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand t" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand t" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand t" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand t" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand t" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand t" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand t" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand script" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand script" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l target-contract -l tc -d 'The name of the contract you want to run' -r
complete -c forge -n "__fish_forge_using_subcommand script" -s s -l sig -d 'The signature of the function you want to call in the contract, or raw calldata' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l batch-size -d 'Batch size of transactions' -r
complete -c forge -n "__fish_forge_using_subcommand script" -s g -l gas-estimate-multiplier -d 'Relative percentage to multiply gas estimates by' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l dump -d 'Dumps all debugger steps to file' -r -F
complete -c forge -n "__fish_forge_using_subcommand script" -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l with-gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l timeout -d 'Timeout to use for broadcasting transactions' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand script" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand script" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand script" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand script" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand script" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand script" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand script" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand script" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand script" -s a -l froms -d 'The sender accounts' -r
complete -c forge -n "__fish_forge_using_subcommand script" -s i -l interactives -d 'Open an interactive prompt to enter your private key' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l private-keys -d 'Use the provided private keys' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l private-key -d 'Use the provided private key' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l mnemonics -d 'Use the mnemonic phrases of mnemonic files at the specified paths' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l mnemonic-passphrases -d 'Use a BIP39 passphrases for the mnemonic' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l mnemonic-derivation-paths -d 'The wallet derivation path' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l mnemonic-indexes -d 'Use the private key from the given mnemonic index' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l keystore -l keystores -d 'Use the keystore by its filename in the given folder' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l account -l accounts -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l password -d 'The keystore password' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l password-file -d 'The keystore password file path' -r
complete -c forge -n "__fish_forge_using_subcommand script" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand script" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand script" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand script" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand script" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand script" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand script" -l legacy -d 'Use legacy transactions instead of EIP1559 ones'
complete -c forge -n "__fish_forge_using_subcommand script" -l broadcast -d 'Broadcasts the transactions'
complete -c forge -n "__fish_forge_using_subcommand script" -l skip-simulation -d 'Skips on-chain simulation'
complete -c forge -n "__fish_forge_using_subcommand script" -l unlocked -d 'Send via `eth_sendTransaction` using the `--from` argument or `$ETH_FROM` as sender'
complete -c forge -n "__fish_forge_using_subcommand script" -l resume -d 'Resumes submitting transactions that failed or timed-out previously'
complete -c forge -n "__fish_forge_using_subcommand script" -l multi -d 'If present, --resume or --verify will be assumed to be a multi chain deployment'
complete -c forge -n "__fish_forge_using_subcommand script" -l debug -d 'Open the script in the debugger'
complete -c forge -n "__fish_forge_using_subcommand script" -l slow -d 'Makes sure a transaction is sent, only after its previous one has been confirmed and succeeded'
complete -c forge -n "__fish_forge_using_subcommand script" -l non-interactive -d 'Disables interactive prompts that might appear when deploying big contracts'
complete -c forge -n "__fish_forge_using_subcommand script" -l verify -d 'Verifies all the contracts found in the receipts of a script, if any'
complete -c forge -n "__fish_forge_using_subcommand script" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand script" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand script" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand script" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand script" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand script" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand script" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand script" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand script" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand script" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand script" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand script" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand script" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand script" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c forge -n "__fish_forge_using_subcommand script" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c forge -n "__fish_forge_using_subcommand script" -l aws -d 'Use AWS Key Management Service'
complete -c forge -n "__fish_forge_using_subcommand script" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c forge -n "__fish_forge_using_subcommand script" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand script" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand script" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand script" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand script" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand script" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand script" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand script" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l report -d 'The report type to use for coverage' -r -f -a "summary\t''
lcov\t''
debug\t''
bytecode\t''"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l lcov-version -d 'The version of the LCOV "tracefile" format to use' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -s r -l report-file -d 'The path to output the report' -r -F
complete -c forge -n "__fish_forge_using_subcommand coverage" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand coverage" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l dump -d 'Dumps all debugger steps to file' -r -F
complete -c forge -n "__fish_forge_using_subcommand coverage" -l gas-snapshot-check -d 'Check gas snapshots against previous runs' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l gas-snapshot-emit -d 'Enable/disable recording of gas snapshot results' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fuzz-seed -d 'Set seed used to generate randomness during your fuzz runs' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fuzz-runs -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fuzz-timeout -d 'Timeout for each fuzz run in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fuzz-input-file -d 'File to rerun fuzz failures from' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l match-test -l mt -d 'Only run test functions matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-match-test -l nmt -d 'Only run test functions that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l match-contract -l mc -d 'Only run tests in contracts matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-match-contract -l nmc -d 'Only run tests in contracts that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l match-path -l mp -d 'Only run tests in source files matching the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-match-path -l nmp -d 'Only run tests in source files that do not match the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-match-coverage -l nmco -d 'Only show coverage for files that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand coverage" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand coverage" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand coverage" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand coverage" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand coverage" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand coverage" -l ir-minimum -d 'Enable viaIR with minimum optimization'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l include-libs -d 'Whether to include libraries in the coverage report'
complete -c forge -n "__fish_forge_using_subcommand coverage" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand coverage" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l debug -d 'Run a single test in the debugger'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l flamegraph -d 'Generate a flamegraph for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l flamechart -d 'Generate a flamechart for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l decode-internal -d 'Identify internal functions in traces'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l gas-report -d 'Print a gas report'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l allow-failure -d 'Exit with code 0 even if a test fails'
complete -c forge -n "__fish_forge_using_subcommand coverage" -s s -l suppress-successful-traces -d 'Suppress successful test traces and show only traces for failures'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l junit -d 'Output test results as JUnit XML report'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l fail-fast -d 'Stop running tests after the first failure'
complete -c forge -n "__fish_forge_using_subcommand coverage" -s l -l list -d 'List tests instead of running them'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l show-progress -d 'Show test execution progress'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l rerun -d 'Re-run recorded test failures from last run. If no failure recorded then regular test run is performed'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l summary -d 'Print test summary table'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l detailed -d 'Print detailed test summary table'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand coverage" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand coverage" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand bind" -s b -l bindings-path -d 'Path to where the contract artifacts are stored' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -l select -d 'Create bindings only for contracts whose names match the specified filter(s)' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l crate-name -d 'The name of the Rust crate to generate' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l crate-version -d 'The version of the Rust crate to generate' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l crate-description -d 'The description of the Rust crate to generate' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l crate-license -d 'The license of the Rust crate to generate' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l alloy-version -d 'Specify the `alloy` version on Crates' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l alloy-rev -d 'Specify the `alloy` revision on GitHub' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand bind" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand bind" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand bind" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand bind" -l select-all -d 'Explicitly generate bindings for all contracts'
complete -c forge -n "__fish_forge_using_subcommand bind" -l module -d 'Generate the bindings as a module instead of a crate'
complete -c forge -n "__fish_forge_using_subcommand bind" -l overwrite -d 'Overwrite existing generated bindings'
complete -c forge -n "__fish_forge_using_subcommand bind" -l single-file -d 'Generate bindings as a single file'
complete -c forge -n "__fish_forge_using_subcommand bind" -l skip-cargo-toml -d 'Skip Cargo.toml consistency checks'
complete -c forge -n "__fish_forge_using_subcommand bind" -l skip-build -d 'Skips running forge build before generating binding'
complete -c forge -n "__fish_forge_using_subcommand bind" -l skip-extra-derives -d 'Don\'t add any additional derives to generated bindings'
complete -c forge -n "__fish_forge_using_subcommand bind" -l alloy -d 'Generate bindings for the `alloy` library, instead of `ethers`'
complete -c forge -n "__fish_forge_using_subcommand bind" -l ethers -d 'Generate bindings for the `ethers` library (removed), instead of `alloy`'
complete -c forge -n "__fish_forge_using_subcommand bind" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand bind" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand bind" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand bind" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand bind" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand bind" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand bind" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand bind" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand bind" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand bind" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand bind" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand bind" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand bind" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand bind" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand bind" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand bind" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand bind" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand build" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand build" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand build" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand build" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand build" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand build" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand build" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand build" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand build" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand build" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand build" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand build" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand build" -l names -d 'Print compiled contract names'
complete -c forge -n "__fish_forge_using_subcommand build" -l sizes -d 'Print compiled contract sizes. Constructor argument length is not included in the calculation of initcode size'
complete -c forge -n "__fish_forge_using_subcommand build" -l ignore-eip-3860 -d 'Ignore initcode contract bytecode size limit introduced by EIP-3860'
complete -c forge -n "__fish_forge_using_subcommand build" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand build" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand build" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand build" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand build" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand build" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand build" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand build" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand build" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand build" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand build" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand build" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand build" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand build" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand build" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand build" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand build" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand build" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand build" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand b" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand b" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand b" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand b" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand b" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand b" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand b" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand b" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand b" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand b" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand b" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand b" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand b" -l names -d 'Print compiled contract names'
complete -c forge -n "__fish_forge_using_subcommand b" -l sizes -d 'Print compiled contract sizes. Constructor argument length is not included in the calculation of initcode size'
complete -c forge -n "__fish_forge_using_subcommand b" -l ignore-eip-3860 -d 'Ignore initcode contract bytecode size limit introduced by EIP-3860'
complete -c forge -n "__fish_forge_using_subcommand b" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand b" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand b" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand b" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand b" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand b" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand b" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand b" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand b" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand b" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand b" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand b" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand b" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand b" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand b" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand b" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand b" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand b" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand b" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand compile" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compile" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compile" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand compile" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compile" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compile" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compile" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compile" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand compile" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand compile" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand compile" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand compile" -l names -d 'Print compiled contract names'
complete -c forge -n "__fish_forge_using_subcommand compile" -l sizes -d 'Print compiled contract sizes. Constructor argument length is not included in the calculation of initcode size'
complete -c forge -n "__fish_forge_using_subcommand compile" -l ignore-eip-3860 -d 'Ignore initcode contract bytecode size limit introduced by EIP-3860'
complete -c forge -n "__fish_forge_using_subcommand compile" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand compile" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand compile" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand compile" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand compile" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand compile" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand compile" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand compile" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand compile" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand compile" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand compile" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand compile" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand compile" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand compile" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand compile" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand compile" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand compile" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand compile" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand compile" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand clone" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand clone" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand clone" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand clone" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand clone" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand clone" -l no-remappings-txt -d 'Do not generate the remappings.txt file. Instead, keep the remappings in the configuration'
complete -c forge -n "__fish_forge_using_subcommand clone" -l keep-directory-structure -d 'Keep the original directory structure collected from Etherscan'
complete -c forge -n "__fish_forge_using_subcommand clone" -l shallow -d 'Perform shallow clones instead of deep ones'
complete -c forge -n "__fish_forge_using_subcommand clone" -l no-git -d 'Install without adding the dependency as a submodule'
complete -c forge -n "__fish_forge_using_subcommand clone" -l commit -d 'Create a commit after installing the dependencies'
complete -c forge -n "__fish_forge_using_subcommand clone" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand clone" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand clone" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand clone" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand update" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand update" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand update" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand update" -s f -l force -d 'Override the up-to-date check'
complete -c forge -n "__fish_forge_using_subcommand update" -s r -l recursive -d 'Recursively update submodules'
complete -c forge -n "__fish_forge_using_subcommand update" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand update" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand update" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand u" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand u" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand u" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand u" -s f -l force -d 'Override the up-to-date check'
complete -c forge -n "__fish_forge_using_subcommand u" -s r -l recursive -d 'Recursively update submodules'
complete -c forge -n "__fish_forge_using_subcommand u" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand u" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand u" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand install" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand install" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand install" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand install" -l shallow -d 'Perform shallow clones instead of deep ones'
complete -c forge -n "__fish_forge_using_subcommand install" -l no-git -d 'Install without adding the dependency as a submodule'
complete -c forge -n "__fish_forge_using_subcommand install" -l commit -d 'Create a commit after installing the dependencies'
complete -c forge -n "__fish_forge_using_subcommand install" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand install" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand install" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand i" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand i" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand i" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand i" -l shallow -d 'Perform shallow clones instead of deep ones'
complete -c forge -n "__fish_forge_using_subcommand i" -l no-git -d 'Install without adding the dependency as a submodule'
complete -c forge -n "__fish_forge_using_subcommand i" -l commit -d 'Create a commit after installing the dependencies'
complete -c forge -n "__fish_forge_using_subcommand i" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand i" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand i" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand remove" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand remove" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand remove" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand remove" -s f -l force -d 'Override the up-to-date check'
complete -c forge -n "__fish_forge_using_subcommand remove" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand remove" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand remove" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand rm" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand rm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand rm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand rm" -s f -l force -d 'Override the up-to-date check'
complete -c forge -n "__fish_forge_using_subcommand rm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand rm" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand rm" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand remappings" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand remappings" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand remappings" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand remappings" -l pretty -d 'Pretty-print the remappings, grouping each of them by context'
complete -c forge -n "__fish_forge_using_subcommand remappings" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand remappings" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand remappings" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand remappings" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand re" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand re" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand re" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand re" -l pretty -d 'Pretty-print the remappings, grouping each of them by context'
complete -c forge -n "__fish_forge_using_subcommand re" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand re" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand re" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand re" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l constructor-args -l encoded-constructor-args -d 'The ABI-encoded constructor arguments' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l constructor-args-path -d 'The path to a file containing the constructor arguments' -r -F
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l compiler-version -d 'The `solc` version to use to build the smart contract' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l compilation-profile -d 'The compilation profile to use to build the smart contract' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l num-of-optimizations -l optimizer-runs -d 'The number of optimization runs used to build the smart contract' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l evm-version -d 'The EVM version to use' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l guess-constructor-args -d 'Try to extract constructor arguments from on-chain creation code'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l flatten -d 'Flatten the source code before verifying'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s f -l force -d 'Do not compile the flattened smart contract before verifying (if --flatten is passed)'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l skip-is-verified-check -d 'Do not check if the contract is already verified before verifying'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l watch -d 'Wait for verification result after submission'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l show-standard-json-input -d 'Prints the standard json compiler input'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand verify-contract" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand v" -l constructor-args -l encoded-constructor-args -d 'The ABI-encoded constructor arguments' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l constructor-args-path -d 'The path to a file containing the constructor arguments' -r -F
complete -c forge -n "__fish_forge_using_subcommand v" -l compiler-version -d 'The `solc` version to use to build the smart contract' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l compilation-profile -d 'The compilation profile to use to build the smart contract' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l num-of-optimizations -l optimizer-runs -d 'The number of optimization runs used to build the smart contract' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand v" -l evm-version -d 'The EVM version to use' -r
complete -c forge -n "__fish_forge_using_subcommand v" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand v" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand v" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand v" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand v" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand v" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand v" -l guess-constructor-args -d 'Try to extract constructor arguments from on-chain creation code'
complete -c forge -n "__fish_forge_using_subcommand v" -l flatten -d 'Flatten the source code before verifying'
complete -c forge -n "__fish_forge_using_subcommand v" -s f -l force -d 'Do not compile the flattened smart contract before verifying (if --flatten is passed)'
complete -c forge -n "__fish_forge_using_subcommand v" -l skip-is-verified-check -d 'Do not check if the contract is already verified before verifying'
complete -c forge -n "__fish_forge_using_subcommand v" -l watch -d 'Wait for verification result after submission'
complete -c forge -n "__fish_forge_using_subcommand v" -l show-standard-json-input -d 'Prints the standard json compiler input'
complete -c forge -n "__fish_forge_using_subcommand v" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand v" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c forge -n "__fish_forge_using_subcommand v" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand v" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand v" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand v" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand verify-check" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand verify-check" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand vc" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand vc" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand vc" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand vc" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand vc" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand vc" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand vc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l block -d 'The block at which the bytecode should be verified' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l constructor-args -d 'The constructor args to generate the creation code' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l encoded-constructor-args -d 'The ABI-encoded constructor arguments' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l constructor-args-path -d 'The path to a file containing the constructor arguments' -r -F
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s r -l rpc-url -d 'The rpc url to use for verification' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l ignore -d 'Ignore verification for creation or runtime bytecode' -r -f -a "creation\t''
runtime\t''"
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand verify-bytecode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand vb" -l block -d 'The block at which the bytecode should be verified' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l constructor-args -d 'The constructor args to generate the creation code' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l encoded-constructor-args -d 'The ABI-encoded constructor arguments' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l constructor-args-path -d 'The path to a file containing the constructor arguments' -r -F
complete -c forge -n "__fish_forge_using_subcommand vb" -s r -l rpc-url -d 'The rpc url to use for verification' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand vb" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand vb" -l ignore -d 'Ignore verification for creation or runtime bytecode' -r -f -a "creation\t''
runtime\t''"
complete -c forge -n "__fish_forge_using_subcommand vb" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand vb" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand vb" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand vb" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand vb" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand vb" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand create" -l constructor-args -d 'The constructor arguments' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l constructor-args-path -d 'The path to a file containing the constructor arguments' -r -F
complete -c forge -n "__fish_forge_using_subcommand create" -l timeout -d 'Timeout to use for broadcasting transactions' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand create" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand create" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand create" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand create" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand create" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand create" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand create" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand create" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand create" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l nonce -d 'Nonce for the transaction' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l auth -d 'EIP-7702 authorization list' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l access-list -d 'EIP-2930 access list' -r
complete -c forge -n "__fish_forge_using_subcommand create" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c forge -n "__fish_forge_using_subcommand create" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand create" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand create" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand create" -s f -l from -d 'The sender account' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l private-key -d 'Use the provided private key' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l password -d 'The keystore password' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l password-file -d 'The keystore password file path' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand create" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand create" -l broadcast -d 'Broadcast the transaction'
complete -c forge -n "__fish_forge_using_subcommand create" -l verify -d 'Verify contract after creation'
complete -c forge -n "__fish_forge_using_subcommand create" -l unlocked -d 'Send via `eth_sendTransaction` using the `--from` argument or `$ETH_FROM` as sender'
complete -c forge -n "__fish_forge_using_subcommand create" -l show-standard-json-input -d 'Prints the standard json compiler input if `--verify` is provided'
complete -c forge -n "__fish_forge_using_subcommand create" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand create" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand create" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand create" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand create" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand create" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand create" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand create" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand create" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand create" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand create" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand create" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand create" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand create" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c forge -n "__fish_forge_using_subcommand create" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c forge -n "__fish_forge_using_subcommand create" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c forge -n "__fish_forge_using_subcommand create" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c forge -n "__fish_forge_using_subcommand create" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c forge -n "__fish_forge_using_subcommand create" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c forge -n "__fish_forge_using_subcommand create" -l aws -d 'Use AWS Key Management Service'
complete -c forge -n "__fish_forge_using_subcommand create" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c forge -n "__fish_forge_using_subcommand create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand create" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand create" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand c" -l constructor-args -d 'The constructor arguments' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l constructor-args-path -d 'The path to a file containing the constructor arguments' -r -F
complete -c forge -n "__fish_forge_using_subcommand c" -l timeout -d 'Timeout to use for broadcasting transactions' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand c" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand c" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand c" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand c" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand c" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand c" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand c" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand c" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand c" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l nonce -d 'Nonce for the transaction' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l auth -d 'EIP-7702 authorization list' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l access-list -d 'EIP-2930 access list' -r
complete -c forge -n "__fish_forge_using_subcommand c" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c forge -n "__fish_forge_using_subcommand c" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand c" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand c" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand c" -s f -l from -d 'The sender account' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l private-key -d 'Use the provided private key' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l password -d 'The keystore password' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l password-file -d 'The keystore password file path' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l verifier -d 'The contract verification provider to use' -r -f -a "etherscan\t''
sourcify\t''
blockscout\t''
oklink\t''
custom\t'Custom verification provider, requires compatibility with the Etherscan API'"
complete -c forge -n "__fish_forge_using_subcommand c" -l verifier-api-key -d 'The verifier API KEY, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l verifier-url -d 'The verifier URL, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l verifier-api-version -d 'The verifier API version, if using a custom provider' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l retries -d 'Number of attempts for retrying verification' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l delay -d 'Optional delay to apply in between verification attempts, in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand c" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand c" -l broadcast -d 'Broadcast the transaction'
complete -c forge -n "__fish_forge_using_subcommand c" -l verify -d 'Verify contract after creation'
complete -c forge -n "__fish_forge_using_subcommand c" -l unlocked -d 'Send via `eth_sendTransaction` using the `--from` argument or `$ETH_FROM` as sender'
complete -c forge -n "__fish_forge_using_subcommand c" -l show-standard-json-input -d 'Prints the standard json compiler input if `--verify` is provided'
complete -c forge -n "__fish_forge_using_subcommand c" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand c" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand c" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand c" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand c" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand c" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand c" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand c" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand c" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand c" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand c" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand c" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand c" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand c" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c forge -n "__fish_forge_using_subcommand c" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c forge -n "__fish_forge_using_subcommand c" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c forge -n "__fish_forge_using_subcommand c" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c forge -n "__fish_forge_using_subcommand c" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c forge -n "__fish_forge_using_subcommand c" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c forge -n "__fish_forge_using_subcommand c" -l aws -d 'Use AWS Key Management Service'
complete -c forge -n "__fish_forge_using_subcommand c" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c forge -n "__fish_forge_using_subcommand c" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand c" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand c" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand init" -s t -l template -d 'The template to start from' -r
complete -c forge -n "__fish_forge_using_subcommand init" -s b -l branch -d 'Branch argument that can only be used with template option. If not specified, the default branch is used' -r
complete -c forge -n "__fish_forge_using_subcommand init" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand init" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand init" -l offline -l no-deps -d 'Do not install dependencies from the network'
complete -c forge -n "__fish_forge_using_subcommand init" -l force -d 'Create the project even if the specified root directory is not empty'
complete -c forge -n "__fish_forge_using_subcommand init" -l vscode -d 'Create a .vscode/settings.json file with Solidity settings, and generate a remappings.txt file'
complete -c forge -n "__fish_forge_using_subcommand init" -l shallow -d 'Perform shallow clones instead of deep ones'
complete -c forge -n "__fish_forge_using_subcommand init" -l no-git -d 'Install without adding the dependency as a submodule'
complete -c forge -n "__fish_forge_using_subcommand init" -l commit -d 'Create a commit after installing the dependencies'
complete -c forge -n "__fish_forge_using_subcommand init" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand init" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand init" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand completions" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand completions" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand completions" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand completions" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand completions" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand com" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand com" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand com" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand com" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand com" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand com" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand generate-fig-spec" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand generate-fig-spec" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand generate-fig-spec" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand generate-fig-spec" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand generate-fig-spec" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand generate-fig-spec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand fig" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand fig" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand fig" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand fig" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand fig" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand fig" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand clean" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand clean" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand clean" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand clean" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand clean" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand clean" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand clean" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand cl" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand cl" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand cl" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand cl" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand cl" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand cl" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand cl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -f -a clean -d 'Cleans cached data from the global foundry directory'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -f -a ls -d 'Shows cached data from the global foundry directory'
complete -c forge -n "__fish_forge_using_subcommand cache; and not __fish_seen_subcommand_from clean ls help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -s b -l blocks -d 'The blocks to clean the cache for' -r
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -l etherscan -d 'Whether to clean the Etherscan cache'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from clean" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from ls" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from ls" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from ls" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from ls" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from help" -f -a clean -d 'Cleans cached data from the global foundry directory'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from help" -f -a ls -d 'Shows cached data from the global foundry directory'
complete -c forge -n "__fish_forge_using_subcommand cache; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l diff -d 'Output a diff against a pre-existing gas snapshot' -r -F
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l check -d 'Compare against a pre-existing gas snapshot, exiting with code 1 if they do not match' -r -F
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l format -d 'How to format the output' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l snap -d 'Output file for the gas snapshot' -r -F
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l tolerance -d 'Tolerates gas deviations up to the specified percentage' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l dump -d 'Dumps all debugger steps to file' -r -F
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l gas-snapshot-check -d 'Check gas snapshots against previous runs' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l gas-snapshot-emit -d 'Enable/disable recording of gas snapshot results' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fuzz-seed -d 'Set seed used to generate randomness during your fuzz runs' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fuzz-runs -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fuzz-timeout -d 'Timeout for each fuzz run in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fuzz-input-file -d 'File to rerun fuzz failures from' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l match-test -l mt -d 'Only run test functions matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-match-test -l nmt -d 'Only run test functions that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l match-contract -l mc -d 'Only run tests in contracts matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-match-contract -l nmc -d 'Only run tests in contracts that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l match-path -l mp -d 'Only run tests in source files matching the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-match-path -l nmp -d 'Only run tests in source files that do not match the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-match-coverage -l nmco -d 'Only show coverage for files that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l min -d 'Only include tests that used more gas that the given amount' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l max -d 'Only include tests that used less gas that the given amount' -r
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l debug -d 'Run a single test in the debugger'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l flamegraph -d 'Generate a flamegraph for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l flamechart -d 'Generate a flamechart for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l decode-internal -d 'Identify internal functions in traces'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l gas-report -d 'Print a gas report'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l allow-failure -d 'Exit with code 0 even if a test fails'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s s -l suppress-successful-traces -d 'Suppress successful test traces and show only traces for failures'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l junit -d 'Output test results as JUnit XML report'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l fail-fast -d 'Stop running tests after the first failure'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s l -l list -d 'List tests instead of running them'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l show-progress -d 'Show test execution progress'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l rerun -d 'Re-run recorded test failures from last run. If no failure recorded then regular test run is performed'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l summary -d 'Print test summary table'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l detailed -d 'Print detailed test summary table'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l asc -d 'Sort results by gas used (ascending)'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -l desc -d 'Sort results by gas used (descending)'
complete -c forge -n "__fish_forge_using_subcommand snapshot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand s" -l diff -d 'Output a diff against a pre-existing gas snapshot' -r -F
complete -c forge -n "__fish_forge_using_subcommand s" -l check -d 'Compare against a pre-existing gas snapshot, exiting with code 1 if they do not match' -r -F
complete -c forge -n "__fish_forge_using_subcommand s" -l format -d 'How to format the output' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l snap -d 'Output file for the gas snapshot' -r -F
complete -c forge -n "__fish_forge_using_subcommand s" -l tolerance -d 'Tolerates gas deviations up to the specified percentage' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand s" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l dump -d 'Dumps all debugger steps to file' -r -F
complete -c forge -n "__fish_forge_using_subcommand s" -l gas-snapshot-check -d 'Check gas snapshots against previous runs' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand s" -l gas-snapshot-emit -d 'Enable/disable recording of gas snapshot results' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand s" -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fuzz-seed -d 'Set seed used to generate randomness during your fuzz runs' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fuzz-runs -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fuzz-timeout -d 'Timeout for each fuzz run in seconds' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fuzz-input-file -d 'File to rerun fuzz failures from' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l match-test -l mt -d 'Only run test functions matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l no-match-test -l nmt -d 'Only run test functions that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l match-contract -l mc -d 'Only run tests in contracts matching the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l no-match-contract -l nmc -d 'Only run tests in contracts that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l match-path -l mp -d 'Only run tests in source files matching the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l no-match-path -l nmp -d 'Only run tests in source files that do not match the specified glob pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l no-match-coverage -l nmco -d 'Only show coverage for files that do not match the specified regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand s" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand s" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand s" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand s" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand s" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand s" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand s" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand s" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand s" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand s" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand s" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l min -d 'Only include tests that used more gas that the given amount' -r
complete -c forge -n "__fish_forge_using_subcommand s" -l max -d 'Only include tests that used less gas that the given amount' -r
complete -c forge -n "__fish_forge_using_subcommand s" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand s" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand s" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand s" -l debug -d 'Run a single test in the debugger'
complete -c forge -n "__fish_forge_using_subcommand s" -l flamegraph -d 'Generate a flamegraph for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand s" -l flamechart -d 'Generate a flamechart for a single test. Implies `--decode-internal`'
complete -c forge -n "__fish_forge_using_subcommand s" -l decode-internal -d 'Identify internal functions in traces'
complete -c forge -n "__fish_forge_using_subcommand s" -l gas-report -d 'Print a gas report'
complete -c forge -n "__fish_forge_using_subcommand s" -l allow-failure -d 'Exit with code 0 even if a test fails'
complete -c forge -n "__fish_forge_using_subcommand s" -s s -l suppress-successful-traces -d 'Suppress successful test traces and show only traces for failures'
complete -c forge -n "__fish_forge_using_subcommand s" -l junit -d 'Output test results as JUnit XML report'
complete -c forge -n "__fish_forge_using_subcommand s" -l fail-fast -d 'Stop running tests after the first failure'
complete -c forge -n "__fish_forge_using_subcommand s" -s l -l list -d 'List tests instead of running them'
complete -c forge -n "__fish_forge_using_subcommand s" -l show-progress -d 'Show test execution progress'
complete -c forge -n "__fish_forge_using_subcommand s" -l rerun -d 'Re-run recorded test failures from last run. If no failure recorded then regular test run is performed'
complete -c forge -n "__fish_forge_using_subcommand s" -l summary -d 'Print test summary table'
complete -c forge -n "__fish_forge_using_subcommand s" -l detailed -d 'Print detailed test summary table'
complete -c forge -n "__fish_forge_using_subcommand s" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand s" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand s" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand s" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand s" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand s" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand s" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand s" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand s" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand s" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand s" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand s" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand s" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand s" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand s" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand s" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand s" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand s" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand s" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand s" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand s" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand s" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand s" -l asc -d 'Sort results by gas used (ascending)'
complete -c forge -n "__fish_forge_using_subcommand s" -l desc -d 'Sort results by gas used (descending)'
complete -c forge -n "__fish_forge_using_subcommand s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand config" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand config" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand config" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand config" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand config" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand config" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand config" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand config" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand config" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand config" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand config" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand config" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand config" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand config" -l basic -d 'Print only a basic set of the currently set config values'
complete -c forge -n "__fish_forge_using_subcommand config" -l fix -d 'Attempt to fix any configuration warnings'
complete -c forge -n "__fish_forge_using_subcommand config" -l names -d 'Print compiled contract names'
complete -c forge -n "__fish_forge_using_subcommand config" -l sizes -d 'Print compiled contract sizes. Constructor argument length is not included in the calculation of initcode size'
complete -c forge -n "__fish_forge_using_subcommand config" -l ignore-eip-3860 -d 'Ignore initcode contract bytecode size limit introduced by EIP-3860'
complete -c forge -n "__fish_forge_using_subcommand config" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand config" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand config" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand config" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand config" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand config" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand config" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand config" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand config" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand config" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand config" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand config" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand config" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand config" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand config" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand config" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand config" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand config" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand config" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand config" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand config" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand config" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand config" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand config" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand config" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand config" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand co" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand co" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand co" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand co" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand co" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand co" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand co" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand co" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand co" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand co" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand co" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand co" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l fork-retries -d 'Number of retries' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l initial-balance -d 'The initial balance of deployed test contracts' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l sender -d 'The address which will be executing tests/scripts' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l create2-deployer -d 'The CREATE2 deployer address to use, this will override the one in the config' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. By default, it is 0x6000 (~25kb)' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l chain -l chain-id -d 'The chain name or EIP-155 chain ID' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l gas-price -d 'The gas price' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l tx-origin -d 'The transaction origin' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-coinbase -d 'The coinbase of the block' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-timestamp -d 'The timestamp of the block' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-number -d 'The block number' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-difficulty -d 'The block difficulty' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-prevrandao -d 'The block prevrandao value. NOTE: Before merge this field was mix_hash' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l block-gas-limit -l gas-limit -d 'The block gas limit' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l memory-limit -d 'The memory limit per EVM execution in bytes. If this limit is exceeded, a `MemoryLimitOOG` result is thrown' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand co" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand co" -l basic -d 'Print only a basic set of the currently set config values'
complete -c forge -n "__fish_forge_using_subcommand co" -l fix -d 'Attempt to fix any configuration warnings'
complete -c forge -n "__fish_forge_using_subcommand co" -l names -d 'Print compiled contract names'
complete -c forge -n "__fish_forge_using_subcommand co" -l sizes -d 'Print compiled contract sizes. Constructor argument length is not included in the calculation of initcode size'
complete -c forge -n "__fish_forge_using_subcommand co" -l ignore-eip-3860 -d 'Ignore initcode contract bytecode size limit introduced by EIP-3860'
complete -c forge -n "__fish_forge_using_subcommand co" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand co" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand co" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand co" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand co" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand co" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand co" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand co" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand co" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand co" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand co" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand co" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand co" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand co" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand co" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand co" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c forge -n "__fish_forge_using_subcommand co" -l ffi -d 'Enable the FFI cheatcode'
complete -c forge -n "__fish_forge_using_subcommand co" -l always-use-create-2-factory -d 'Use the create 2 factory in all cases including tests and non-broadcasting scripts'
complete -c forge -n "__fish_forge_using_subcommand co" -l no-rpc-rate-limit -l no-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c forge -n "__fish_forge_using_subcommand co" -l disable-block-gas-limit -l no-gas-limit -d 'Whether to disable the block gas limit checks'
complete -c forge -n "__fish_forge_using_subcommand co" -l isolate -d 'Whether to enable isolation of calls. In isolation mode all top-level calls are executed as a separate transaction in a separate EVM context, enabling more precise gas accounting and transaction state changes'
complete -c forge -n "__fish_forge_using_subcommand co" -l odyssey -d 'Whether to enable Odyssey features'
complete -c forge -n "__fish_forge_using_subcommand co" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand co" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand co" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand co" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand flatten" -s o -l output -d 'The path to output the flattened contract' -r -F
complete -c forge -n "__fish_forge_using_subcommand flatten" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand flatten" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand flatten" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand flatten" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand flatten" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand flatten" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand flatten" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand flatten" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand flatten" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand flatten" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand flatten" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand flatten" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand flatten" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand flatten" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand f" -s o -l output -d 'The path to output the flattened contract' -r -F
complete -c forge -n "__fish_forge_using_subcommand f" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand f" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand f" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand f" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand f" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand f" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand f" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand f" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand f" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand f" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand f" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand f" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand f" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand fmt" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand fmt" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand fmt" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand fmt" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand fmt" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand fmt" -l check -d 'Run in \'check\' mode'
complete -c forge -n "__fish_forge_using_subcommand fmt" -s r -l raw -d 'In \'check\' and stdin modes, outputs raw formatted code instead of the diff'
complete -c forge -n "__fish_forge_using_subcommand fmt" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand fmt" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand fmt" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand fmt" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand fmt" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand fmt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand inspect" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand inspect" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand inspect" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand inspect" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand inspect" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand inspect" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand inspect" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand inspect" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand inspect" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand inspect" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand inspect" -s s -l strip-yul-comments -d 'Whether to remove comments when inspecting `ir` and `irOptimized` artifact fields'
complete -c forge -n "__fish_forge_using_subcommand inspect" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand inspect" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand inspect" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand inspect" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand in" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand in" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand in" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand in" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand in" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand in" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand in" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand in" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand in" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand in" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand in" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand in" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand in" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand in" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand in" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand in" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand in" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand in" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand in" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand in" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand in" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand in" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand in" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand in" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand in" -s s -l strip-yul-comments -d 'Whether to remove comments when inspecting `ir` and `irOptimized` artifact fields'
complete -c forge -n "__fish_forge_using_subcommand in" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand in" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand in" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand in" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand tree" -l charset -d 'Character set to use in output' -r
complete -c forge -n "__fish_forge_using_subcommand tree" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tree" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tree" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand tree" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand tree" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tree" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tree" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand tree" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand tree" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand tree" -l no-dedupe -d 'Do not de-duplicate (repeats all shared dependencies)'
complete -c forge -n "__fish_forge_using_subcommand tree" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand tree" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand tree" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand tree" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand tree" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand tr" -l charset -d 'Character set to use in output' -r
complete -c forge -n "__fish_forge_using_subcommand tr" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tr" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tr" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand tr" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand tr" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tr" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand tr" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand tr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand tr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand tr" -l no-dedupe -d 'Do not de-duplicate (repeats all shared dependencies)'
complete -c forge -n "__fish_forge_using_subcommand tr" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand tr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand tr" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand tr" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand tr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand geiger" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand geiger" -l ignore -d 'Globs to ignore' -r -F
complete -c forge -n "__fish_forge_using_subcommand geiger" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand geiger" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand geiger" -l check
complete -c forge -n "__fish_forge_using_subcommand geiger" -l full
complete -c forge -n "__fish_forge_using_subcommand geiger" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand geiger" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand geiger" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand geiger" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand doc" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand doc" -s o -l out -d 'The doc\'s output path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand doc" -l hostname -d 'Hostname for serving documentation' -r
complete -c forge -n "__fish_forge_using_subcommand doc" -s w -l watch -d 'Watch the given files or directories for changes' -r -F
complete -c forge -n "__fish_forge_using_subcommand doc" -l watch-delay -d 'File update debounce delay' -r
complete -c forge -n "__fish_forge_using_subcommand doc" -s p -l port -d 'Port for serving documentation' -r
complete -c forge -n "__fish_forge_using_subcommand doc" -l deployments -d 'The relative path to the `hardhat-deploy` or `forge-deploy` artifact directory. Leave blank for default' -r -F
complete -c forge -n "__fish_forge_using_subcommand doc" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand doc" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand doc" -s b -l build -d 'Build the `mdbook` from generated files'
complete -c forge -n "__fish_forge_using_subcommand doc" -s s -l serve -d 'Serve the documentation'
complete -c forge -n "__fish_forge_using_subcommand doc" -l open -d 'Open the documentation in a browser after serving'
complete -c forge -n "__fish_forge_using_subcommand doc" -l no-restart -d 'Do not restart the command while it\'s still running'
complete -c forge -n "__fish_forge_using_subcommand doc" -l run-all -d 'Explicitly re-run all tests when a change is made'
complete -c forge -n "__fish_forge_using_subcommand doc" -s i -l include-libraries -d 'Whether to create docs for external libraries'
complete -c forge -n "__fish_forge_using_subcommand doc" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand doc" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand doc" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand doc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a collision -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a co -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a upload -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a up -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a list -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a ls -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a find -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a f -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a cache -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a c -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand selectors; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from collision" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from co" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l all -d 'Upload selectors for all contracts in the project'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l all -d 'Upload selectors for all contracts in the project'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from up" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from cache" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from help" -f -a collision -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from help" -f -a upload -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from help" -f -a list -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from help" -f -a find -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from help" -f -a cache -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand selectors; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a collision -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a co -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a upload -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a up -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a list -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a ls -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a find -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a f -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a cache -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a c -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand se; and not __fish_seen_subcommand_from collision co upload up list ls find f cache c help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from collision" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from co" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l all -d 'Upload selectors for all contracts in the project'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l all -d 'Upload selectors for all contracts in the project'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from up" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from cache" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from help" -f -a collision -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from help" -f -a upload -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from help" -f -a list -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from help" -f -a find -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from help" -f -a cache -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand se; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -f -a test -d 'Scaffolds test file for given contract'
complete -c forge -n "__fish_forge_using_subcommand generate; and not __fish_seen_subcommand_from test help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -s c -l contract-name -d 'Contract name for test generation' -r
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from test" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from help" -f -a test -d 'Scaffolds test file for given contract'
complete -c forge -n "__fish_forge_using_subcommand generate; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -f -a resolve -d 'Retrieves the resolved version(s) of the compiler within the project'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -f -a r -d 'Retrieves the resolved version(s) of the compiler within the project'
complete -c forge -n "__fish_forge_using_subcommand compiler; and not __fish_seen_subcommand_from resolve r help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -s r -l root -d 'The root directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -s s -l skip -d 'Skip files that match the given regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from resolve" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -s r -l root -d 'The root directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -s s -l skip -d 'Skip files that match the given regex pattern' -r
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from help" -f -a resolve -d 'Retrieves the resolved version(s) of the compiler within the project'
complete -c forge -n "__fish_forge_using_subcommand compiler; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a init -d 'Convert a Foundry project to use Soldeer'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a install -d 'Install a dependency'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a update -d 'Update dependencies by reading the config file'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a login -d 'Log into the central repository to push packages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a push -d 'Push a dependency to the repository'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a uninstall -d 'Uninstall a dependency'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a version -d 'Display the version of Soldeer'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and not __fish_seen_subcommand_from init install update login push uninstall version help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -l config-location -d 'Specify the config location' -r -f -a "foundry\t''
soldeer\t''"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -l clean -d 'Clean the Foundry project by removing .gitmodules and the lib directory'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l url -d 'The URL to the dependency zip file' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l git -d 'The URL to the dependency repository' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l rev -d 'A Git commit hash' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l tag -d 'A Git tag' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l branch -d 'A Git branch' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l config-location -d 'Specify the config location without prompting' -r -f -a "foundry\t''
soldeer\t''"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -s g -l regenerate-remappings -d 'If set, this command will delete the existing remappings and re-create them'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -s d -l recursive-deps -d 'If set, this command will install dependencies recursively (via git submodules or via soldeer)'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l clean -d 'Perform a clean install by re-installing all dependencies'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -l config-location -d 'Specify the config location without prompting' -r -f -a "foundry\t''
soldeer\t''"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -s g -l regenerate-remappings -d 'If set, this command will delete the existing remappings and re-create them'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -s d -l recursive-deps -d 'If set, this command will install the dependencies recursively (via submodules or via soldeer)'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -l email -d 'Specify the email without prompting' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -l password -d 'Specify the password without prompting' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -s d -l dry-run -d 'If set, does not publish the package but generates a zip file that can be inspected'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -l skip-warnings -d 'Use this if you want to skip the warnings that can be triggered when trying to push dotfiles like .env'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from push" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from uninstall" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from uninstall" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from uninstall" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from uninstall" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from version" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from version" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from version" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from version" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from version" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from version" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a init -d 'Convert a Foundry project to use Soldeer'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a install -d 'Install a dependency'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a update -d 'Update dependencies by reading the config file'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a login -d 'Log into the central repository to push packages'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a push -d 'Push a dependency to the repository'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a uninstall -d 'Uninstall a dependency'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a version -d 'Display the version of Soldeer'
complete -c forge -n "__fish_forge_using_subcommand soldeer; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand eip712" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand eip712" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand eip712" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand eip712" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand eip712" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand eip712" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand eip712" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand eip712" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand eip712" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand eip712" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand eip712" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand eip712" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand eip712" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand eip712" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l libraries -d 'Set pre-linked libraries' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l revert-strings -d 'Revert string configuration' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l evm-version -d 'The target EVM version' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s R -l remappings -d 'The project\'s remappings' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l config-path -d 'Path to the config file' -r -F
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l no-cache -d 'Disable the cache'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l offline -d 'Do not access the network'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l build-info -d 'Generate build info files'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s q -l quiet -d 'Do not print log messages'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -l json -d 'Format log messages as JSON'
complete -c forge -n "__fish_forge_using_subcommand bind-json" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a test -d 'Run the project\'s tests'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a script -d 'Run a smart contract as a script, building transactions that can be sent onchain'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a coverage -d 'Generate coverage reports'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a bind -d 'Generate Rust bindings for smart contracts'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a build -d 'Build the project\'s smart contracts'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a clone -d 'Clone a contract from Etherscan'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a update -d 'Update one or multiple dependencies'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a install -d 'Install one or multiple dependencies'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a remove -d 'Remove one or multiple dependencies'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a remappings -d 'Get the automatically inferred remappings for the project'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a verify-contract -d 'Verify smart contracts on Etherscan'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a verify-check -d 'Check verification status on Etherscan'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a verify-bytecode -d 'Verify the deployed bytecode against its source on Etherscan'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a create -d 'Deploy a smart contract'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a init -d 'Create a new Forge project'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a completions -d 'Generate shell completions script'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a generate-fig-spec -d 'Generate Fig autocompletion spec'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a clean -d 'Remove the build artifacts and cache directories'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a cache -d 'Manage the Foundry cache'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a snapshot -d 'Create a gas snapshot of each test\'s gas usage'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a config -d 'Display the current config'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a flatten -d 'Flatten a source file and all of its imports into one file'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a fmt -d 'Format Solidity source files'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a inspect -d 'Get specialized information about a smart contract'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a tree -d 'Display a tree visualization of the project\'s dependency graph'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a geiger -d 'Detects usage of unsafe cheat codes in a project and its dependencies'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a doc -d 'Generate documentation for the project'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a selectors -d 'Function selector utilities'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a generate -d 'Generate scaffold files'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a compiler -d 'Compiler utilities'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a soldeer -d 'Soldeer dependency manager'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a eip712 -d 'Generate EIP-712 struct encodings for structs from a given file'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a bind-json -d 'Generate bindings for serialization/deserialization of project structs via JSON cheatcodes'
complete -c forge -n "__fish_forge_using_subcommand help; and not __fish_seen_subcommand_from test script coverage bind build clone update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate compiler soldeer eip712 bind-json help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from cache" -f -a clean -d 'Cleans cached data from the global foundry directory'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from cache" -f -a ls -d 'Shows cached data from the global foundry directory'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from selectors" -f -a collision -d 'Check for selector collisions between contracts'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from selectors" -f -a upload -d 'Upload selectors to registry'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from selectors" -f -a list -d 'List selectors from current workspace'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from selectors" -f -a find -d 'Find if a selector is present in the project'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from selectors" -f -a cache -d 'Cache project selectors (enables trace with local contracts functions and events)'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from generate" -f -a test -d 'Scaffolds test file for given contract'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from compiler" -f -a resolve -d 'Retrieves the resolved version(s) of the compiler within the project'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a init -d 'Convert a Foundry project to use Soldeer'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a install -d 'Install a dependency'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a update -d 'Update dependencies by reading the config file'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a login -d 'Log into the central repository to push packages'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a push -d 'Push a dependency to the repository'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a uninstall -d 'Uninstall a dependency'
complete -c forge -n "__fish_forge_using_subcommand help; and __fish_seen_subcommand_from soldeer" -f -a version -d 'Display the version of Soldeer'
