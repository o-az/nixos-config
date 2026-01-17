# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_cast_global_optspecs
    string join \n v/verbosity q/quiet json color= j/threads= h/help V/version
end

function __fish_cast_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_cast_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_cast_using_subcommand
    set -l cmd (__fish_cast_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c cast -n __fish_cast_needs_command -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n __fish_cast_needs_command -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n __fish_cast_needs_command -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n __fish_cast_needs_command -s q -l quiet -d 'Do not print log messages'
complete -c cast -n __fish_cast_needs_command -l json -d 'Format log messages as JSON'
complete -c cast -n __fish_cast_needs_command -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n __fish_cast_needs_command -s V -l version -d 'Print version'
complete -c cast -n __fish_cast_needs_command -f -a max-int -d 'Prints the maximum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a --max-int -d 'Prints the maximum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a maxi -d 'Prints the maximum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a min-int -d 'Prints the minimum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a --min-int -d 'Prints the minimum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a mini -d 'Prints the minimum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a max-uint -d 'Prints the maximum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a --max-uint -d 'Prints the maximum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a maxu -d 'Prints the maximum value of the given integer type'
complete -c cast -n __fish_cast_needs_command -f -a address-zero -d 'Prints the zero address'
complete -c cast -n __fish_cast_needs_command -f -a --address-zero -d 'Prints the zero address'
complete -c cast -n __fish_cast_needs_command -f -a az -d 'Prints the zero address'
complete -c cast -n __fish_cast_needs_command -f -a hash-zero -d 'Prints the zero hash'
complete -c cast -n __fish_cast_needs_command -f -a --hash-zero -d 'Prints the zero hash'
complete -c cast -n __fish_cast_needs_command -f -a hz -d 'Prints the zero hash'
complete -c cast -n __fish_cast_needs_command -f -a from-utf8 -d 'Convert UTF8 text to hex'
complete -c cast -n __fish_cast_needs_command -f -a --from-ascii -d 'Convert UTF8 text to hex'
complete -c cast -n __fish_cast_needs_command -f -a --from-utf8 -d 'Convert UTF8 text to hex'
complete -c cast -n __fish_cast_needs_command -f -a from-ascii -d 'Convert UTF8 text to hex'
complete -c cast -n __fish_cast_needs_command -f -a fu -d 'Convert UTF8 text to hex'
complete -c cast -n __fish_cast_needs_command -f -a fa -d 'Convert UTF8 text to hex'
complete -c cast -n __fish_cast_needs_command -f -a concat-hex -d 'Concatenate hex strings'
complete -c cast -n __fish_cast_needs_command -f -a --concat-hex -d 'Concatenate hex strings'
complete -c cast -n __fish_cast_needs_command -f -a ch -d 'Concatenate hex strings'
complete -c cast -n __fish_cast_needs_command -f -a from-bin -d 'Convert binary data into hex data'
complete -c cast -n __fish_cast_needs_command -f -a --from-bin -d 'Convert binary data into hex data'
complete -c cast -n __fish_cast_needs_command -f -a from-binx -d 'Convert binary data into hex data'
complete -c cast -n __fish_cast_needs_command -f -a fb -d 'Convert binary data into hex data'
complete -c cast -n __fish_cast_needs_command -f -a to-hexdata -d 'Normalize the input to lowercase, 0x-prefixed hex'
complete -c cast -n __fish_cast_needs_command -f -a --to-hexdata -d 'Normalize the input to lowercase, 0x-prefixed hex'
complete -c cast -n __fish_cast_needs_command -f -a thd -d 'Normalize the input to lowercase, 0x-prefixed hex'
complete -c cast -n __fish_cast_needs_command -f -a 2hd -d 'Normalize the input to lowercase, 0x-prefixed hex'
complete -c cast -n __fish_cast_needs_command -f -a to-check-sum-address -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n __fish_cast_needs_command -f -a --to-checksum-address -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n __fish_cast_needs_command -f -a --to-checksum -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n __fish_cast_needs_command -f -a to-checksum -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n __fish_cast_needs_command -f -a ta -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n __fish_cast_needs_command -f -a 2a -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n __fish_cast_needs_command -f -a to-ascii -d 'Convert hex data to an ASCII string'
complete -c cast -n __fish_cast_needs_command -f -a --to-ascii -d 'Convert hex data to an ASCII string'
complete -c cast -n __fish_cast_needs_command -f -a tas -d 'Convert hex data to an ASCII string'
complete -c cast -n __fish_cast_needs_command -f -a 2as -d 'Convert hex data to an ASCII string'
complete -c cast -n __fish_cast_needs_command -f -a to-utf8 -d 'Convert hex data to a utf-8 string'
complete -c cast -n __fish_cast_needs_command -f -a --to-utf8 -d 'Convert hex data to a utf-8 string'
complete -c cast -n __fish_cast_needs_command -f -a tu8 -d 'Convert hex data to a utf-8 string'
complete -c cast -n __fish_cast_needs_command -f -a 2u8 -d 'Convert hex data to a utf-8 string'
complete -c cast -n __fish_cast_needs_command -f -a from-fixed-point -d 'Convert a fixed point number into an integer'
complete -c cast -n __fish_cast_needs_command -f -a --from-fix -d 'Convert a fixed point number into an integer'
complete -c cast -n __fish_cast_needs_command -f -a ff -d 'Convert a fixed point number into an integer'
complete -c cast -n __fish_cast_needs_command -f -a to-bytes32 -d 'Right-pads hex data to 32 bytes'
complete -c cast -n __fish_cast_needs_command -f -a --to-bytes32 -d 'Right-pads hex data to 32 bytes'
complete -c cast -n __fish_cast_needs_command -f -a tb -d 'Right-pads hex data to 32 bytes'
complete -c cast -n __fish_cast_needs_command -f -a 2b -d 'Right-pads hex data to 32 bytes'
complete -c cast -n __fish_cast_needs_command -f -a to-fixed-point -d 'Convert an integer into a fixed point number'
complete -c cast -n __fish_cast_needs_command -f -a --to-fix -d 'Convert an integer into a fixed point number'
complete -c cast -n __fish_cast_needs_command -f -a tf -d 'Convert an integer into a fixed point number'
complete -c cast -n __fish_cast_needs_command -f -a 2f -d 'Convert an integer into a fixed point number'
complete -c cast -n __fish_cast_needs_command -f -a to-uint256 -d 'Convert a number to a hex-encoded uint256'
complete -c cast -n __fish_cast_needs_command -f -a --to-uint256 -d 'Convert a number to a hex-encoded uint256'
complete -c cast -n __fish_cast_needs_command -f -a tu -d 'Convert a number to a hex-encoded uint256'
complete -c cast -n __fish_cast_needs_command -f -a 2u -d 'Convert a number to a hex-encoded uint256'
complete -c cast -n __fish_cast_needs_command -f -a to-int256 -d 'Convert a number to a hex-encoded int256'
complete -c cast -n __fish_cast_needs_command -f -a --to-int256 -d 'Convert a number to a hex-encoded int256'
complete -c cast -n __fish_cast_needs_command -f -a ti -d 'Convert a number to a hex-encoded int256'
complete -c cast -n __fish_cast_needs_command -f -a 2i -d 'Convert a number to a hex-encoded int256'
complete -c cast -n __fish_cast_needs_command -f -a shl -d 'Perform a left shifting operation'
complete -c cast -n __fish_cast_needs_command -f -a shr -d 'Perform a right shifting operation'
complete -c cast -n __fish_cast_needs_command -f -a to-unit -d 'Convert an ETH amount into another unit (ether, gwei or wei)'
complete -c cast -n __fish_cast_needs_command -f -a --to-unit -d 'Convert an ETH amount into another unit (ether, gwei or wei)'
complete -c cast -n __fish_cast_needs_command -f -a tun -d 'Convert an ETH amount into another unit (ether, gwei or wei)'
complete -c cast -n __fish_cast_needs_command -f -a 2un -d 'Convert an ETH amount into another unit (ether, gwei or wei)'
complete -c cast -n __fish_cast_needs_command -f -a parse-units -d 'Convert a number from decimal to smallest unit with arbitrary decimals'
complete -c cast -n __fish_cast_needs_command -f -a --parse-units -d 'Convert a number from decimal to smallest unit with arbitrary decimals'
complete -c cast -n __fish_cast_needs_command -f -a pun -d 'Convert a number from decimal to smallest unit with arbitrary decimals'
complete -c cast -n __fish_cast_needs_command -f -a format-units -d 'Format a number from smallest unit to decimal with arbitrary decimals'
complete -c cast -n __fish_cast_needs_command -f -a --format-units -d 'Format a number from smallest unit to decimal with arbitrary decimals'
complete -c cast -n __fish_cast_needs_command -f -a fun -d 'Format a number from smallest unit to decimal with arbitrary decimals'
complete -c cast -n __fish_cast_needs_command -f -a to-wei -d 'Convert an ETH amount to wei'
complete -c cast -n __fish_cast_needs_command -f -a --to-wei -d 'Convert an ETH amount to wei'
complete -c cast -n __fish_cast_needs_command -f -a tw -d 'Convert an ETH amount to wei'
complete -c cast -n __fish_cast_needs_command -f -a 2w -d 'Convert an ETH amount to wei'
complete -c cast -n __fish_cast_needs_command -f -a from-wei -d 'Convert wei into an ETH amount'
complete -c cast -n __fish_cast_needs_command -f -a --from-wei -d 'Convert wei into an ETH amount'
complete -c cast -n __fish_cast_needs_command -f -a fw -d 'Convert wei into an ETH amount'
complete -c cast -n __fish_cast_needs_command -f -a to-rlp -d 'RLP encodes hex data, or an array of hex data'
complete -c cast -n __fish_cast_needs_command -f -a --to-rlp -d 'RLP encodes hex data, or an array of hex data'
complete -c cast -n __fish_cast_needs_command -f -a from-rlp -d 'Decodes RLP hex-encoded data'
complete -c cast -n __fish_cast_needs_command -f -a --from-rlp -d 'Decodes RLP hex-encoded data'
complete -c cast -n __fish_cast_needs_command -f -a to-hex -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a --to-hex -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a th -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a 2h -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a to-dec -d 'Converts a number of one base to decimal'
complete -c cast -n __fish_cast_needs_command -f -a --to-dec -d 'Converts a number of one base to decimal'
complete -c cast -n __fish_cast_needs_command -f -a td -d 'Converts a number of one base to decimal'
complete -c cast -n __fish_cast_needs_command -f -a 2d -d 'Converts a number of one base to decimal'
complete -c cast -n __fish_cast_needs_command -f -a to-base -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a --to-base -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a --to-radix -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a to-radix -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a tr -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a 2r -d 'Converts a number of one base to another'
complete -c cast -n __fish_cast_needs_command -f -a access-list -d 'Create an access list for a transaction'
complete -c cast -n __fish_cast_needs_command -f -a ac -d 'Create an access list for a transaction'
complete -c cast -n __fish_cast_needs_command -f -a acl -d 'Create an access list for a transaction'
complete -c cast -n __fish_cast_needs_command -f -a logs -d 'Get logs by signature or topic'
complete -c cast -n __fish_cast_needs_command -f -a l -d 'Get logs by signature or topic'
complete -c cast -n __fish_cast_needs_command -f -a block -d 'Get information about a block'
complete -c cast -n __fish_cast_needs_command -f -a bl -d 'Get information about a block'
complete -c cast -n __fish_cast_needs_command -f -a block-number -d 'Get the latest block number'
complete -c cast -n __fish_cast_needs_command -f -a bn -d 'Get the latest block number'
complete -c cast -n __fish_cast_needs_command -f -a call -d 'Perform a call on an account without publishing a transaction'
complete -c cast -n __fish_cast_needs_command -f -a c -d 'Perform a call on an account without publishing a transaction'
complete -c cast -n __fish_cast_needs_command -f -a calldata -d 'ABI-encode a function with arguments'
complete -c cast -n __fish_cast_needs_command -f -a cd -d 'ABI-encode a function with arguments'
complete -c cast -n __fish_cast_needs_command -f -a chain -d 'Get the symbolic name of the current chain'
complete -c cast -n __fish_cast_needs_command -f -a chain-id -d 'Get the Ethereum chain ID'
complete -c cast -n __fish_cast_needs_command -f -a ci -d 'Get the Ethereum chain ID'
complete -c cast -n __fish_cast_needs_command -f -a cid -d 'Get the Ethereum chain ID'
complete -c cast -n __fish_cast_needs_command -f -a client -d 'Get the current client version'
complete -c cast -n __fish_cast_needs_command -f -a cl -d 'Get the current client version'
complete -c cast -n __fish_cast_needs_command -f -a compute-address -d 'Compute the contract address from a given nonce and deployer address'
complete -c cast -n __fish_cast_needs_command -f -a ca -d 'Compute the contract address from a given nonce and deployer address'
complete -c cast -n __fish_cast_needs_command -f -a disassemble -d 'Disassembles a hex-encoded bytecode into a human-readable representation'
complete -c cast -n __fish_cast_needs_command -f -a da -d 'Disassembles a hex-encoded bytecode into a human-readable representation'
complete -c cast -n __fish_cast_needs_command -f -a mktx -d 'Build and sign a transaction'
complete -c cast -n __fish_cast_needs_command -f -a m -d 'Build and sign a transaction'
complete -c cast -n __fish_cast_needs_command -f -a namehash -d 'Calculate the ENS namehash of a name'
complete -c cast -n __fish_cast_needs_command -f -a na -d 'Calculate the ENS namehash of a name'
complete -c cast -n __fish_cast_needs_command -f -a nh -d 'Calculate the ENS namehash of a name'
complete -c cast -n __fish_cast_needs_command -f -a tx -d 'Get information about a transaction'
complete -c cast -n __fish_cast_needs_command -f -a t -d 'Get information about a transaction'
complete -c cast -n __fish_cast_needs_command -f -a receipt -d 'Get the transaction receipt for a transaction'
complete -c cast -n __fish_cast_needs_command -f -a re -d 'Get the transaction receipt for a transaction'
complete -c cast -n __fish_cast_needs_command -f -a send -d 'Sign and publish a transaction'
complete -c cast -n __fish_cast_needs_command -f -a s -d 'Sign and publish a transaction'
complete -c cast -n __fish_cast_needs_command -f -a publish -d 'Publish a raw transaction to the network'
complete -c cast -n __fish_cast_needs_command -f -a p -d 'Publish a raw transaction to the network'
complete -c cast -n __fish_cast_needs_command -f -a estimate -d 'Estimate the gas cost of a transaction'
complete -c cast -n __fish_cast_needs_command -f -a e -d 'Estimate the gas cost of a transaction'
complete -c cast -n __fish_cast_needs_command -f -a decode-calldata -d 'Decode ABI-encoded input data'
complete -c cast -n __fish_cast_needs_command -f -a calldata-decode -d 'Decode ABI-encoded input data'
complete -c cast -n __fish_cast_needs_command -f -a --calldata-decode -d 'Decode ABI-encoded input data'
complete -c cast -n __fish_cast_needs_command -f -a cdd -d 'Decode ABI-encoded input data'
complete -c cast -n __fish_cast_needs_command -f -a decode-string -d 'Decode ABI-encoded string'
complete -c cast -n __fish_cast_needs_command -f -a string-decode -d 'Decode ABI-encoded string'
complete -c cast -n __fish_cast_needs_command -f -a --string-decode -d 'Decode ABI-encoded string'
complete -c cast -n __fish_cast_needs_command -f -a sd -d 'Decode ABI-encoded string'
complete -c cast -n __fish_cast_needs_command -f -a decode-event -d 'Decode event data'
complete -c cast -n __fish_cast_needs_command -f -a event-decode -d 'Decode event data'
complete -c cast -n __fish_cast_needs_command -f -a --event-decode -d 'Decode event data'
complete -c cast -n __fish_cast_needs_command -f -a ed -d 'Decode event data'
complete -c cast -n __fish_cast_needs_command -f -a decode-error -d 'Decode custom error data'
complete -c cast -n __fish_cast_needs_command -f -a error-decode -d 'Decode custom error data'
complete -c cast -n __fish_cast_needs_command -f -a --error-decode -d 'Decode custom error data'
complete -c cast -n __fish_cast_needs_command -f -a erd -d 'Decode custom error data'
complete -c cast -n __fish_cast_needs_command -f -a decode-abi -d 'Decode ABI-encoded input or output data'
complete -c cast -n __fish_cast_needs_command -f -a abi-decode -d 'Decode ABI-encoded input or output data'
complete -c cast -n __fish_cast_needs_command -f -a --abi-decode -d 'Decode ABI-encoded input or output data'
complete -c cast -n __fish_cast_needs_command -f -a ad -d 'Decode ABI-encoded input or output data'
complete -c cast -n __fish_cast_needs_command -f -a abi-encode -d 'ABI encode the given function argument, excluding the selector'
complete -c cast -n __fish_cast_needs_command -f -a ae -d 'ABI encode the given function argument, excluding the selector'
complete -c cast -n __fish_cast_needs_command -f -a index -d 'Compute the storage slot for an entry in a mapping'
complete -c cast -n __fish_cast_needs_command -f -a in -d 'Compute the storage slot for an entry in a mapping'
complete -c cast -n __fish_cast_needs_command -f -a index-erc7201 -d 'Compute storage slots as specified by `ERC-7201: Namespaced Storage Layout`'
complete -c cast -n __fish_cast_needs_command -f -a index7201 -d 'Compute storage slots as specified by `ERC-7201: Namespaced Storage Layout`'
complete -c cast -n __fish_cast_needs_command -f -a in7201 -d 'Compute storage slots as specified by `ERC-7201: Namespaced Storage Layout`'
complete -c cast -n __fish_cast_needs_command -f -a implementation -d 'Fetch the EIP-1967 implementation for a contract Can read from the implementation slot or the beacon slot'
complete -c cast -n __fish_cast_needs_command -f -a impl -d 'Fetch the EIP-1967 implementation for a contract Can read from the implementation slot or the beacon slot'
complete -c cast -n __fish_cast_needs_command -f -a admin -d 'Fetch the EIP-1967 admin account'
complete -c cast -n __fish_cast_needs_command -f -a adm -d 'Fetch the EIP-1967 admin account'
complete -c cast -n __fish_cast_needs_command -f -a 4byte -d 'Get the function signatures for the given selector from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4 -d 'Get the function signatures for the given selector from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4b -d 'Get the function signatures for the given selector from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4byte-calldata -d 'Decode ABI-encoded calldata using <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4c -d 'Decode ABI-encoded calldata using <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4bc -d 'Decode ABI-encoded calldata using <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4byte-event -d 'Get the event signature for a given topic 0 from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4e -d 'Get the event signature for a given topic 0 from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a 4be -d 'Get the event signature for a given topic 0 from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a topic0-event -d 'Get the event signature for a given topic 0 from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a t0e -d 'Get the event signature for a given topic 0 from <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a upload-signature -d 'Upload the given signatures to <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a ups -d 'Upload the given signatures to <https://openchain.xyz>'
complete -c cast -n __fish_cast_needs_command -f -a pretty-calldata -d 'Pretty print calldata'
complete -c cast -n __fish_cast_needs_command -f -a pc -d 'Pretty print calldata'
complete -c cast -n __fish_cast_needs_command -f -a age -d 'Get the timestamp of a block'
complete -c cast -n __fish_cast_needs_command -f -a a -d 'Get the timestamp of a block'
complete -c cast -n __fish_cast_needs_command -f -a balance -d 'Get the balance of an account in wei'
complete -c cast -n __fish_cast_needs_command -f -a b -d 'Get the balance of an account in wei'
complete -c cast -n __fish_cast_needs_command -f -a base-fee -d 'Get the basefee of a block'
complete -c cast -n __fish_cast_needs_command -f -a ba -d 'Get the basefee of a block'
complete -c cast -n __fish_cast_needs_command -f -a fee -d 'Get the basefee of a block'
complete -c cast -n __fish_cast_needs_command -f -a basefee -d 'Get the basefee of a block'
complete -c cast -n __fish_cast_needs_command -f -a code -d 'Get the runtime bytecode of a contract'
complete -c cast -n __fish_cast_needs_command -f -a co -d 'Get the runtime bytecode of a contract'
complete -c cast -n __fish_cast_needs_command -f -a codesize -d 'Get the runtime bytecode size of a contract'
complete -c cast -n __fish_cast_needs_command -f -a cs -d 'Get the runtime bytecode size of a contract'
complete -c cast -n __fish_cast_needs_command -f -a gas-price -d 'Get the current gas price'
complete -c cast -n __fish_cast_needs_command -f -a g -d 'Get the current gas price'
complete -c cast -n __fish_cast_needs_command -f -a sig-event -d 'Generate event signatures from event string'
complete -c cast -n __fish_cast_needs_command -f -a se -d 'Generate event signatures from event string'
complete -c cast -n __fish_cast_needs_command -f -a keccak -d 'Hash arbitrary data using Keccak-256'
complete -c cast -n __fish_cast_needs_command -f -a k -d 'Hash arbitrary data using Keccak-256'
complete -c cast -n __fish_cast_needs_command -f -a keccak256 -d 'Hash arbitrary data using Keccak-256'
complete -c cast -n __fish_cast_needs_command -f -a hash-message -d 'Hash a message according to EIP-191'
complete -c cast -n __fish_cast_needs_command -f -a --hash-message -d 'Hash a message according to EIP-191'
complete -c cast -n __fish_cast_needs_command -f -a hm -d 'Hash a message according to EIP-191'
complete -c cast -n __fish_cast_needs_command -f -a resolve-name -d 'Perform an ENS lookup'
complete -c cast -n __fish_cast_needs_command -f -a rn -d 'Perform an ENS lookup'
complete -c cast -n __fish_cast_needs_command -f -a lookup-address -d 'Perform an ENS reverse lookup'
complete -c cast -n __fish_cast_needs_command -f -a la -d 'Perform an ENS reverse lookup'
complete -c cast -n __fish_cast_needs_command -f -a storage -d 'Get the raw value of a contract\'s storage slot'
complete -c cast -n __fish_cast_needs_command -f -a st -d 'Get the raw value of a contract\'s storage slot'
complete -c cast -n __fish_cast_needs_command -f -a proof -d 'Generate a storage proof for a given storage slot'
complete -c cast -n __fish_cast_needs_command -f -a pr -d 'Generate a storage proof for a given storage slot'
complete -c cast -n __fish_cast_needs_command -f -a nonce -d 'Get the nonce for an account'
complete -c cast -n __fish_cast_needs_command -f -a n -d 'Get the nonce for an account'
complete -c cast -n __fish_cast_needs_command -f -a codehash -d 'Get the codehash for an account'
complete -c cast -n __fish_cast_needs_command -f -a storage-root -d 'Get the storage root for an account'
complete -c cast -n __fish_cast_needs_command -f -a sr -d 'Get the storage root for an account'
complete -c cast -n __fish_cast_needs_command -f -a source -d 'Get the source code of a contract from a block explorer'
complete -c cast -n __fish_cast_needs_command -f -a et -d 'Get the source code of a contract from a block explorer'
complete -c cast -n __fish_cast_needs_command -f -a src -d 'Get the source code of a contract from a block explorer'
complete -c cast -n __fish_cast_needs_command -f -a wallet -d 'Wallet management utilities'
complete -c cast -n __fish_cast_needs_command -f -a w -d 'Wallet management utilities'
complete -c cast -n __fish_cast_needs_command -f -a creation-code -d 'Download a contract creation code from Etherscan and RPC'
complete -c cast -n __fish_cast_needs_command -f -a cc -d 'Download a contract creation code from Etherscan and RPC'
complete -c cast -n __fish_cast_needs_command -f -a artifact -d 'Generate an artifact file, that can be used to deploy a contract locally'
complete -c cast -n __fish_cast_needs_command -f -a ar -d 'Generate an artifact file, that can be used to deploy a contract locally'
complete -c cast -n __fish_cast_needs_command -f -a constructor-args -d 'Display constructor arguments used for the contract initialization'
complete -c cast -n __fish_cast_needs_command -f -a cra -d 'Display constructor arguments used for the contract initialization'
complete -c cast -n __fish_cast_needs_command -f -a interface -d 'Generate a Solidity interface from a given ABI'
complete -c cast -n __fish_cast_needs_command -f -a i -d 'Generate a Solidity interface from a given ABI'
complete -c cast -n __fish_cast_needs_command -f -a bind -d 'Generate a rust binding from a given ABI'
complete -c cast -n __fish_cast_needs_command -f -a bi -d 'Generate a rust binding from a given ABI'
complete -c cast -n __fish_cast_needs_command -f -a sig -d 'Get the selector for a function'
complete -c cast -n __fish_cast_needs_command -f -a si -d 'Get the selector for a function'
complete -c cast -n __fish_cast_needs_command -f -a create2 -d 'Generate a deterministic contract address using CREATE2'
complete -c cast -n __fish_cast_needs_command -f -a c2 -d 'Generate a deterministic contract address using CREATE2'
complete -c cast -n __fish_cast_needs_command -f -a find-block -d 'Get the block number closest to the provided timestamp'
complete -c cast -n __fish_cast_needs_command -f -a f -d 'Get the block number closest to the provided timestamp'
complete -c cast -n __fish_cast_needs_command -f -a completions -d 'Generate shell completions script'
complete -c cast -n __fish_cast_needs_command -f -a com -d 'Generate shell completions script'
complete -c cast -n __fish_cast_needs_command -f -a generate-fig-spec -d 'Generate Fig autocompletion spec'
complete -c cast -n __fish_cast_needs_command -f -a fig -d 'Generate Fig autocompletion spec'
complete -c cast -n __fish_cast_needs_command -f -a run -d 'Runs a published transaction in a local environment and prints the trace'
complete -c cast -n __fish_cast_needs_command -f -a r -d 'Runs a published transaction in a local environment and prints the trace'
complete -c cast -n __fish_cast_needs_command -f -a rpc -d 'Perform a raw JSON-RPC request'
complete -c cast -n __fish_cast_needs_command -f -a rp -d 'Perform a raw JSON-RPC request'
complete -c cast -n __fish_cast_needs_command -f -a format-bytes32-string -d 'Formats a string into bytes32 encoding'
complete -c cast -n __fish_cast_needs_command -f -a --format-bytes32-string -d 'Formats a string into bytes32 encoding'
complete -c cast -n __fish_cast_needs_command -f -a parse-bytes32-string -d 'Parses a string from bytes32 encoding'
complete -c cast -n __fish_cast_needs_command -f -a --parse-bytes32-string -d 'Parses a string from bytes32 encoding'
complete -c cast -n __fish_cast_needs_command -f -a parse-bytes32-address -d 'Parses a checksummed address from bytes32 encoding.'
complete -c cast -n __fish_cast_needs_command -f -a --parse-bytes32-address -d 'Parses a checksummed address from bytes32 encoding.'
complete -c cast -n __fish_cast_needs_command -f -a decode-transaction -d 'Decodes a raw signed EIP 2718 typed transaction'
complete -c cast -n __fish_cast_needs_command -f -a dt -d 'Decodes a raw signed EIP 2718 typed transaction'
complete -c cast -n __fish_cast_needs_command -f -a decode-tx -d 'Decodes a raw signed EIP 2718 typed transaction'
complete -c cast -n __fish_cast_needs_command -f -a selectors -d 'Extracts function selectors and arguments from bytecode'
complete -c cast -n __fish_cast_needs_command -f -a sel -d 'Extracts function selectors and arguments from bytecode'
complete -c cast -n __fish_cast_needs_command -f -a tx-pool -d 'Inspect the TxPool of a node'
complete -c cast -n __fish_cast_needs_command -f -a tp -d 'Inspect the TxPool of a node'
complete -c cast -n __fish_cast_needs_command -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand max-int" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand max-int" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand max-int" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand max-int" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand max-int" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand max-int" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --max-int" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --max-int" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --max-int" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --max-int" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --max-int" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --max-int" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand maxi" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand maxi" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand maxi" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand maxi" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand maxi" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand maxi" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand min-int" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand min-int" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand min-int" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand min-int" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand min-int" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand min-int" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --min-int" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --min-int" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --min-int" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --min-int" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --min-int" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --min-int" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand mini" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand mini" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand mini" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand mini" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand mini" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand mini" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand max-uint" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand max-uint" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand max-uint" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand max-uint" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand max-uint" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand max-uint" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --max-uint" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --max-uint" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --max-uint" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --max-uint" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --max-uint" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --max-uint" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand maxu" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand maxu" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand maxu" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand maxu" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand maxu" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand maxu" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand address-zero" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand address-zero" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand address-zero" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand address-zero" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand address-zero" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand address-zero" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --address-zero" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --address-zero" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --address-zero" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --address-zero" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --address-zero" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --address-zero" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand az" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand az" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand az" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand az" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand az" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand az" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand hash-zero" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand hash-zero" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand hash-zero" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand hash-zero" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand hash-zero" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand hash-zero" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --hash-zero" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --hash-zero" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --hash-zero" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --hash-zero" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --hash-zero" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --hash-zero" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand hz" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand hz" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand hz" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand hz" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand hz" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand hz" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-utf8" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-utf8" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-utf8" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-utf8" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-utf8" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-utf8" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --from-ascii" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --from-ascii" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --from-ascii" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --from-ascii" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --from-ascii" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --from-ascii" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --from-utf8" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --from-utf8" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --from-utf8" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --from-utf8" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --from-utf8" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --from-utf8" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-ascii" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-ascii" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-ascii" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-ascii" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-ascii" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-ascii" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fu" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fu" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fu" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fu" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fu" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fu" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fa" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fa" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fa" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fa" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fa" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fa" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand concat-hex" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand concat-hex" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand concat-hex" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand concat-hex" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand concat-hex" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand concat-hex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --concat-hex" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --concat-hex" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --concat-hex" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --concat-hex" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --concat-hex" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --concat-hex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ch" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ch" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ch" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ch" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ch" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-bin" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-bin" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-bin" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-bin" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-bin" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-bin" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --from-bin" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --from-bin" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --from-bin" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --from-bin" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --from-bin" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --from-bin" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-binx" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-binx" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-binx" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-binx" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-binx" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-binx" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fb" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fb" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fb" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fb" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fb" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fb" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-hexdata" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-hexdata" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-hexdata" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-hexdata" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-hexdata" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-hexdata" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-hexdata" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-hexdata" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-hexdata" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-hexdata" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-hexdata" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-hexdata" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand thd" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand thd" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand thd" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand thd" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand thd" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand thd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2hd" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2hd" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2hd" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2hd" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2hd" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2hd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-check-sum-address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-check-sum-address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-check-sum-address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-check-sum-address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-check-sum-address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-check-sum-address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum-address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-checksum-address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-checksum-address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum-address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum-address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum-address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-checksum" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-checksum" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-checksum" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-checksum" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-checksum" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-checksum" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-checksum" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-checksum" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-checksum" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ta" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ta" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ta" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ta" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ta" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ta" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2a" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2a" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2a" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2a" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2a" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-ascii" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-ascii" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-ascii" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-ascii" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-ascii" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-ascii" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-ascii" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-ascii" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-ascii" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-ascii" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-ascii" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-ascii" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tas" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tas" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tas" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tas" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tas" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tas" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2as" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2as" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2as" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2as" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2as" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2as" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-utf8" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-utf8" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-utf8" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-utf8" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-utf8" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-utf8" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-utf8" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-utf8" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-utf8" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-utf8" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-utf8" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-utf8" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tu8" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tu8" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tu8" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tu8" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tu8" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tu8" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2u8" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2u8" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2u8" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2u8" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2u8" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2u8" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-fixed-point" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-fixed-point" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-fixed-point" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-fixed-point" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-fixed-point" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-fixed-point" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --from-fix" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --from-fix" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --from-fix" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --from-fix" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --from-fix" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --from-fix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ff" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ff" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ff" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ff" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ff" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-bytes32" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-bytes32" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-bytes32" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-bytes32" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-bytes32" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-bytes32" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-bytes32" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-bytes32" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-bytes32" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-bytes32" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-bytes32" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-bytes32" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tb" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tb" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tb" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tb" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tb" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tb" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2b" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2b" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2b" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2b" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2b" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2b" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-fixed-point" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-fixed-point" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-fixed-point" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-fixed-point" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-fixed-point" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-fixed-point" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-fix" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-fix" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-fix" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-fix" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-fix" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-fix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tf" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tf" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tf" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tf" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tf" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tf" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2f" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2f" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2f" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2f" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2f" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-uint256" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-uint256" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-uint256" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-uint256" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-uint256" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-uint256" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-uint256" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-uint256" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-uint256" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-uint256" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-uint256" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-uint256" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tu" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tu" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tu" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tu" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tu" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tu" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2u" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2u" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2u" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2u" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2u" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-int256" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-int256" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-int256" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-int256" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-int256" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-int256" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-int256" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-int256" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-int256" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-int256" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-int256" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-int256" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ti" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ti" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ti" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ti" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ti" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ti" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2i" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2i" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2i" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2i" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2i" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand shl" -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand shl" -l base-out -d 'The output base' -r
complete -c cast -n "__fish_cast_using_subcommand shl" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand shl" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand shl" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand shl" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand shl" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand shl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand shr" -l base-in -d 'The input base,' -r
complete -c cast -n "__fish_cast_using_subcommand shr" -l base-out -d 'The output base,' -r
complete -c cast -n "__fish_cast_using_subcommand shr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand shr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand shr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand shr" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand shr" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand shr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-unit" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-unit" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-unit" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-unit" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-unit" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-unit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-unit" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-unit" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-unit" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-unit" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-unit" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-unit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tun" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tun" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tun" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tun" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tun" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tun" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2un" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2un" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2un" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2un" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2un" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2un" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand parse-units" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand parse-units" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand parse-units" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand parse-units" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand parse-units" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand parse-units" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --parse-units" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --parse-units" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --parse-units" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --parse-units" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --parse-units" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --parse-units" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand pun" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand pun" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand pun" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand pun" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand pun" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand pun" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand format-units" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand format-units" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand format-units" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand format-units" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand format-units" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand format-units" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --format-units" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --format-units" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --format-units" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --format-units" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --format-units" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --format-units" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fun" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fun" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fun" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fun" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fun" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fun" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-wei" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-wei" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-wei" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-wei" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-wei" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-wei" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-wei" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-wei" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-wei" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-wei" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-wei" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-wei" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tw" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tw" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tw" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tw" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tw" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tw" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2w" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2w" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2w" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2w" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2w" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2w" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-wei" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-wei" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-wei" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-wei" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-wei" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-wei" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --from-wei" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --from-wei" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --from-wei" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --from-wei" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --from-wei" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --from-wei" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fw" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fw" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fw" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fw" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fw" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fw" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-rlp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-rlp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-rlp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-rlp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-rlp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-rlp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-rlp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-rlp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-rlp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-rlp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-rlp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-rlp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -l as-int -d 'Decode the RLP data as int'
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand from-rlp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -l as-int -d 'Decode the RLP data as int'
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --from-rlp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-hex" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand to-hex" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-hex" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-hex" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-hex" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-hex" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-hex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-hex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand th" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand th" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand th" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand th" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand th" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand th" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand th" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2h" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand 2h" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2h" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2h" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2h" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2h" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2h" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-dec" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand to-dec" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-dec" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-dec" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-dec" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-dec" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-dec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-dec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand td" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand td" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand td" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand td" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand td" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand td" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand td" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2d" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand 2d" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2d" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2d" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2d" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2d" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2d" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-base" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand to-base" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-base" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-base" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-base" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-base" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-base" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-base" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand --to-base" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-base" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-base" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-base" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-base" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-base" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --to-radix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand to-radix" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand to-radix" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand to-radix" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand to-radix" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand to-radix" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand to-radix" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand to-radix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tr" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand tr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tr" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tr" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 2r" -s i -l base-in -d 'The input base' -r
complete -c cast -n "__fish_cast_using_subcommand 2r" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 2r" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 2r" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 2r" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 2r" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 2r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand access-list" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand access-list" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand access-list" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand access-list" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand access-list" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand access-list" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand access-list" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand access-list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ac" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ac" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ac" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand ac" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand ac" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand ac" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand ac" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand ac" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand ac" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand ac" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand ac" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ac" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ac" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ac" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand acl" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand acl" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand acl" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand acl" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand acl" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand acl" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand acl" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand acl" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand acl" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand acl" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand acl" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand acl" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand acl" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand acl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand logs" -l from-block -d 'The block height to start query at' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l to-block -d 'The block height to stop query at' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l address -d 'The contract address to filter on' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand logs" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand logs" -l subscribe -d 'If the RPC type and endpoints supports `eth_subscribe` stream logs instead of printing and exiting. Will continue until interrupted or TO_BLOCK is reached'
complete -c cast -n "__fish_cast_using_subcommand logs" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand logs" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand logs" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand logs" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand logs" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand logs" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand logs" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand logs" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand logs" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand logs" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand l" -l from-block -d 'The block height to start query at' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l to-block -d 'The block height to stop query at' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l address -d 'The contract address to filter on' -r
complete -c cast -n "__fish_cast_using_subcommand l" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand l" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand l" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand l" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand l" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand l" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand l" -l subscribe -d 'If the RPC type and endpoints supports `eth_subscribe` stream logs instead of printing and exiting. Will continue until interrupted or TO_BLOCK is reached'
complete -c cast -n "__fish_cast_using_subcommand l" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand l" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand l" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand l" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand l" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand l" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand l" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand l" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand l" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand block" -s f -l field -d 'If specified, only get the given field of the block' -r
complete -c cast -n "__fish_cast_using_subcommand block" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand block" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand block" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand block" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand block" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand block" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand block" -l full
complete -c cast -n "__fish_cast_using_subcommand block" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand block" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand block" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand block" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand block" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand bl" -s f -l field -d 'If specified, only get the given field of the block' -r
complete -c cast -n "__fish_cast_using_subcommand bl" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand bl" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand bl" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand bl" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand bl" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand bl" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand bl" -l full
complete -c cast -n "__fish_cast_using_subcommand bl" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand bl" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand bl" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand bl" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand bl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand block-number" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand block-number" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand block-number" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand block-number" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand block-number" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand block-number" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand block-number" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand block-number" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand block-number" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand block-number" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand block-number" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand bn" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand bn" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand bn" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand bn" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand bn" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand bn" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand bn" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand bn" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand bn" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand bn" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand bn" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l data -d 'Raw hex-encoded data for the transaction. Used instead of \\[SIG\\] and \\[ARGS\\]' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l labels -d 'Labels to apply to the traces; format: `address:label`. Can only be used with `--trace`' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l evm-version -d 'The EVM Version to use. Can only be used with `--trace`' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s b -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l override-balance -d 'Override the balance of an account. Format: address:balance' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l override-nonce -d 'Override the nonce of an account. Format: address:nonce' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l override-code -d 'Override the code of an account. Format: address:code' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l override-state -d 'Override the state of an account. Format: address:slot:value' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l override-state-diff -d 'Override the state diff of an account. Format: address:slot:value' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l trace -d 'Forks the remote rpc, executes the transaction locally and prints a trace'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l debug -d 'Opens an interactive debugger. Can only be used with `--trace`'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l decode-internal
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l odyssey -d 'Enable Odyssey features'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l with-local-artifacts -l la -d 'Use current project artifacts for trace decoding'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -a --create -d 'ignores the address field and simulates creating a contract'
complete -c cast -n "__fish_cast_using_subcommand call; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -l value -d 'Ether to send in the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from help" -f -a --create -d 'ignores the address field and simulates creating a contract'
complete -c cast -n "__fish_cast_using_subcommand call; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l data -d 'Raw hex-encoded data for the transaction. Used instead of \\[SIG\\] and \\[ARGS\\]' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l labels -d 'Labels to apply to the traces; format: `address:label`. Can only be used with `--trace`' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l evm-version -d 'The EVM Version to use. Can only be used with `--trace`' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s b -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l override-balance -d 'Override the balance of an account. Format: address:balance' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l override-nonce -d 'Override the nonce of an account. Format: address:nonce' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l override-code -d 'Override the code of an account. Format: address:code' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l override-state -d 'Override the state of an account. Format: address:slot:value' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l override-state-diff -d 'Override the state diff of an account. Format: address:slot:value' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l trace -d 'Forks the remote rpc, executes the transaction locally and prints a trace'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l debug -d 'Opens an interactive debugger. Can only be used with `--trace`'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l decode-internal
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l odyssey -d 'Enable Odyssey features'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l with-local-artifacts -l la -d 'Use current project artifacts for trace decoding'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -a --create -d 'ignores the address field and simulates creating a contract'
complete -c cast -n "__fish_cast_using_subcommand c; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -l value -d 'Ether to send in the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from help" -f -a --create -d 'ignores the address field and simulates creating a contract'
complete -c cast -n "__fish_cast_using_subcommand c; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand calldata" -l file -r -F
complete -c cast -n "__fish_cast_using_subcommand calldata" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand calldata" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand calldata" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand calldata" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand calldata" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand calldata" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cd" -l file -r -F
complete -c cast -n "__fish_cast_using_subcommand cd" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cd" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cd" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cd" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cd" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand chain" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand chain" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand chain" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand chain" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand chain" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand chain" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand chain" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand chain" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand chain" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand chain" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand chain" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand chain-id" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand chain-id" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand chain-id" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand chain-id" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand chain-id" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand chain-id" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand chain-id" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand chain-id" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand chain-id" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand chain-id" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand chain-id" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ci" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand ci" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand ci" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand ci" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand ci" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ci" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ci" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand ci" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ci" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ci" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ci" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cid" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand cid" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand cid" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand cid" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand cid" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cid" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cid" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand cid" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cid" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cid" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cid" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand client" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand client" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand client" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand client" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand client" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand client" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand client" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand client" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand client" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand client" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand client" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cl" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand cl" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand cl" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand cl" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand cl" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cl" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cl" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand cl" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cl" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cl" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l nonce -d 'The nonce of the deployer address' -r
complete -c cast -n "__fish_cast_using_subcommand compute-address" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand compute-address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand compute-address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand compute-address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand compute-address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand compute-address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ca" -l nonce -d 'The nonce of the deployer address' -r
complete -c cast -n "__fish_cast_using_subcommand ca" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand ca" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand ca" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand ca" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand ca" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ca" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ca" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand ca" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ca" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ca" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ca" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand disassemble" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand disassemble" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand disassemble" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand disassemble" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand disassemble" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand disassemble" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand da" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand da" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand da" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand da" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand da" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand da" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l path -d 'The path of blob data to be sent' -r -F
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l raw-unsigned -d 'Generate a raw RLP-encoded unsigned transaction'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand mktx; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from help" -f -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand mktx; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l path -d 'The path of blob data to be sent' -r -F
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l raw-unsigned -d 'Generate a raw RLP-encoded unsigned transaction'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand m; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from help" -f -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand m; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand namehash" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand namehash" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand namehash" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand namehash" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand namehash" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand namehash" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand na" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand na" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand na" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand na" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand na" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand na" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand nh" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand nh" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand nh" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand nh" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand nh" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand nh" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx" -l from -d 'The sender of the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -l nonce -d 'Nonce of the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tx" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tx" -l raw -d 'Print the raw RLP encoded transaction'
complete -c cast -n "__fish_cast_using_subcommand tx" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tx" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tx" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tx" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tx" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand t" -l from -d 'The sender of the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand t" -l nonce -d 'Nonce of the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand t" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand t" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand t" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand t" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand t" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand t" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand t" -l raw -d 'Print the raw RLP encoded transaction'
complete -c cast -n "__fish_cast_using_subcommand t" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand t" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand t" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand t" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand receipt" -l confirmations -d 'The number of confirmations until the receipt is fetched' -r
complete -c cast -n "__fish_cast_using_subcommand receipt" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand receipt" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand receipt" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand receipt" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand receipt" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand receipt" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand receipt" -l async -d 'Exit immediately if the transaction was not found'
complete -c cast -n "__fish_cast_using_subcommand receipt" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand receipt" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand receipt" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand receipt" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand receipt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand re" -l confirmations -d 'The number of confirmations until the receipt is fetched' -r
complete -c cast -n "__fish_cast_using_subcommand re" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand re" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand re" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand re" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand re" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand re" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand re" -l async -d 'Exit immediately if the transaction was not found'
complete -c cast -n "__fish_cast_using_subcommand re" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand re" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand re" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand re" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand re" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l confirmations -d 'The number of confirmations until the receipt is fetched' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l timeout -d 'Timeout for sending the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l path -d 'The path of blob data to be sent' -r -F
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l async -d 'Only print the transaction hash and exit immediately'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l unlocked -d 'Send via `eth_sendTransaction` using the `--from` argument or $ETH_FROM as sender'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand send; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from help" -f -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand send; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l confirmations -d 'The number of confirmations until the receipt is fetched' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l timeout -d 'Timeout for sending the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l path -d 'The path of blob data to be sent' -r -F
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l async -d 'Only print the transaction hash and exit immediately'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l unlocked -d 'Send via `eth_sendTransaction` using the `--from` argument or $ETH_FROM as sender'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand s; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from help" -f -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand s; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand publish" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand publish" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand publish" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand publish" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand publish" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand publish" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand publish" -l async -d 'Only print the transaction hash and exit immediately'
complete -c cast -n "__fish_cast_using_subcommand publish" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand publish" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand publish" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand publish" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand publish" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand p" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand p" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand p" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand p" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand p" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand p" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand p" -l async -d 'Only print the transaction hash and exit immediately'
complete -c cast -n "__fish_cast_using_subcommand p" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand p" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand p" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand p" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand p" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -a --create -d 'Estimate gas cost to deploy a smart contract'
complete -c cast -n "__fish_cast_using_subcommand estimate; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -l value -d 'Ether to send in the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from help" -f -a --create -d 'Estimate gas cost to deploy a smart contract'
complete -c cast -n "__fish_cast_using_subcommand estimate; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l gas-limit -d 'Gas limit for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l gas-price -d 'Gas price for legacy transactions, or max fee per gas for EIP1559 transactions, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l priority-gas-price -d 'Max priority fee per gas for EIP1559 transactions' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l value -d 'Ether to send in the transaction, either specified in wei, or as a string with a unit type' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l nonce -d 'Nonce for the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l blob-gas-price -d 'Gas price for EIP-4844 blob transaction' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l auth -d 'EIP-7702 authorization list' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l access-list -d 'EIP-2930 access list' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l legacy -d 'Send a legacy transaction instead of an EIP1559 transaction'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l blob -d 'Send a EIP-4844 blob transaction'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -a --create -d 'Estimate gas cost to deploy a smart contract'
complete -c cast -n "__fish_cast_using_subcommand e; and not __fish_seen_subcommand_from --create help" -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -l value -d 'Ether to send in the transaction' -r
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from --create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from help" -f -a --create -d 'Estimate gas cost to deploy a smart contract'
complete -c cast -n "__fish_cast_using_subcommand e; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand decode-calldata" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-calldata" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-calldata" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-calldata" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-calldata" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-calldata" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand calldata-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand calldata-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand calldata-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand calldata-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand calldata-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand calldata-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --calldata-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --calldata-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --calldata-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --calldata-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --calldata-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --calldata-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cdd" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cdd" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cdd" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cdd" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cdd" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cdd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand decode-string" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-string" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-string" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-string" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-string" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-string" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand string-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand string-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand string-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand string-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand string-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand string-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --string-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --string-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --string-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --string-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --string-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --string-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand sd" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand sd" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand sd" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand sd" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand sd" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand sd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand decode-event" -l sig -l event-sig -d 'The event signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand decode-event" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-event" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-event" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-event" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-event" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-event" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand event-decode" -l sig -l event-sig -d 'The event signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand event-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand event-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand event-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand event-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand event-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand event-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -l sig -l event-sig -d 'The event signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --event-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ed" -l sig -l event-sig -d 'The event signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand ed" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ed" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ed" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ed" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ed" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ed" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand decode-error" -l sig -l error-sig -d 'The error signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand decode-error" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-error" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-error" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-error" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-error" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-error" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand error-decode" -l sig -l error-sig -d 'The error signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand error-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand error-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand error-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand error-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand error-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand error-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -l sig -l error-sig -d 'The error signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --error-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand erd" -l sig -l error-sig -d 'The error signature. If none provided then tries to decode from local cache or <https://api.openchain.xyz>' -r
complete -c cast -n "__fish_cast_using_subcommand erd" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand erd" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand erd" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand erd" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand erd" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand erd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -s i -l input -d 'Whether to decode the input or output data'
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-abi" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -s i -l input -d 'Whether to decode the input or output data'
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand abi-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -s i -l input -d 'Whether to decode the input or output data'
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --abi-decode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ad" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ad" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ad" -s i -l input -d 'Whether to decode the input or output data'
complete -c cast -n "__fish_cast_using_subcommand ad" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ad" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ad" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ad" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -l packed -d 'Whether to use packed encoding'
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand abi-encode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ae" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ae" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ae" -l packed -d 'Whether to use packed encoding'
complete -c cast -n "__fish_cast_using_subcommand ae" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ae" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ae" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ae" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand index" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand index" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand index" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand index" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand index" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand index" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand in" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand in" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand in" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand in" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand in" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand in" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -l formula-id -d 'The formula ID. Currently the only supported formula is `erc7201`' -r
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand index-erc7201" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand index7201" -l formula-id -d 'The formula ID. Currently the only supported formula is `erc7201`' -r
complete -c cast -n "__fish_cast_using_subcommand index7201" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand index7201" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand index7201" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand index7201" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand index7201" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand index7201" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand in7201" -l formula-id -d 'The formula ID. Currently the only supported formula is `erc7201`' -r
complete -c cast -n "__fish_cast_using_subcommand in7201" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand in7201" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand in7201" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand in7201" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand in7201" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand in7201" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand implementation" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand implementation" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand implementation" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand implementation" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand implementation" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand implementation" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand implementation" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand implementation" -l beacon -d 'Fetch the implementation from the beacon slot'
complete -c cast -n "__fish_cast_using_subcommand implementation" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand implementation" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand implementation" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand implementation" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand implementation" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand impl" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand impl" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand impl" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand impl" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand impl" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand impl" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand impl" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand impl" -l beacon -d 'Fetch the implementation from the beacon slot'
complete -c cast -n "__fish_cast_using_subcommand impl" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand impl" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand impl" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand impl" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand impl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand admin" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand admin" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand admin" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand admin" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand admin" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand admin" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand admin" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand admin" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand admin" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand admin" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand admin" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand admin" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand adm" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand adm" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand adm" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand adm" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand adm" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand adm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand adm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand adm" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand adm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand adm" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand adm" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand adm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4byte" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4byte" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4byte" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4byte" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4byte" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4byte" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4b" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4b" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4b" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4b" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4b" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4b" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4byte-calldata" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4byte-calldata" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4byte-calldata" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4byte-calldata" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4byte-calldata" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4byte-calldata" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4c" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4c" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4c" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4c" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4c" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4bc" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4bc" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4bc" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4bc" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4bc" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4bc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4byte-event" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4byte-event" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4byte-event" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4byte-event" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4byte-event" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4byte-event" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4e" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4e" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4e" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4e" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4e" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand 4be" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand 4be" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand 4be" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand 4be" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand 4be" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand 4be" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand topic0-event" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand topic0-event" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand topic0-event" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand topic0-event" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand topic0-event" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand topic0-event" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand t0e" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand t0e" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand t0e" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand t0e" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand t0e" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand t0e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand upload-signature" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand upload-signature" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand upload-signature" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand upload-signature" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand upload-signature" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand upload-signature" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ups" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ups" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ups" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ups" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ups" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ups" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -s o -l offline -d 'Skip the <https://openchain.xyz> lookup'
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand pretty-calldata" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand pc" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand pc" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand pc" -s o -l offline -d 'Skip the <https://openchain.xyz> lookup'
complete -c cast -n "__fish_cast_using_subcommand pc" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand pc" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand pc" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand pc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand age" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand age" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand age" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand age" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand age" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand age" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand age" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand age" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand age" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand age" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand age" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand a" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand a" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand a" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand a" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand a" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand a" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand a" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand a" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand a" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand a" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand balance" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -l erc20 -d 'erc20 address to query, with the method `balanceOf(address) return (uint256)`, alias with \'--erc721\'' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand balance" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand balance" -s e -l ether -d 'Format the balance in ether'
complete -c cast -n "__fish_cast_using_subcommand balance" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand balance" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand balance" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand balance" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand balance" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand b" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand b" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand b" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand b" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand b" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand b" -l erc20 -d 'erc20 address to query, with the method `balanceOf(address) return (uint256)`, alias with \'--erc721\'' -r
complete -c cast -n "__fish_cast_using_subcommand b" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand b" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand b" -s e -l ether -d 'Format the balance in ether'
complete -c cast -n "__fish_cast_using_subcommand b" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand b" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand b" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand b" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand b" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand base-fee" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand base-fee" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand base-fee" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand base-fee" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand base-fee" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand base-fee" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand base-fee" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand base-fee" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand base-fee" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand base-fee" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand base-fee" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ba" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand ba" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand ba" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand ba" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand ba" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ba" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ba" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand ba" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ba" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ba" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ba" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fee" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand fee" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand fee" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand fee" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand fee" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fee" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fee" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand fee" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fee" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fee" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fee" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand basefee" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand basefee" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand basefee" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand basefee" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand basefee" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand basefee" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand basefee" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand basefee" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand basefee" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand basefee" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand basefee" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand code" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand code" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand code" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand code" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand code" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand code" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand code" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand code" -s d -l disassemble -d 'Disassemble bytecodes'
complete -c cast -n "__fish_cast_using_subcommand code" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand code" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand code" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand code" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand code" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand co" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand co" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand co" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand co" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand co" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand co" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand co" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand co" -s d -l disassemble -d 'Disassemble bytecodes'
complete -c cast -n "__fish_cast_using_subcommand co" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand co" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand co" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand co" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand co" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand codesize" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand codesize" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand codesize" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand codesize" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand codesize" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand codesize" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand codesize" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand codesize" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand codesize" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand codesize" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand codesize" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand codesize" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cs" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand cs" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand cs" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand cs" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand cs" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand cs" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cs" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cs" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand cs" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cs" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cs" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cs" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand gas-price" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand gas-price" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand gas-price" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand gas-price" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand gas-price" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand gas-price" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand gas-price" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand gas-price" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand gas-price" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand gas-price" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand gas-price" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand g" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand g" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand g" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand g" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand g" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand g" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand g" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand g" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand g" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand g" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand g" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand sig-event" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand sig-event" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand sig-event" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand sig-event" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand sig-event" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand sig-event" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand se" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand se" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand se" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand se" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand se" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand se" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand keccak" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand keccak" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand keccak" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand keccak" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand keccak" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand keccak" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand k" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand k" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand k" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand k" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand k" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand k" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand keccak256" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand keccak256" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand keccak256" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand keccak256" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand keccak256" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand keccak256" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand hash-message" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand hash-message" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand hash-message" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand hash-message" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand hash-message" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand hash-message" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --hash-message" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --hash-message" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --hash-message" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --hash-message" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --hash-message" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --hash-message" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand hm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand hm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand hm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand hm" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand hm" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand hm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l verify -d 'Perform a reverse lookup to verify that the name is correct'
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand resolve-name" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand rn" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand rn" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand rn" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand rn" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand rn" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand rn" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand rn" -l verify -d 'Perform a reverse lookup to verify that the name is correct'
complete -c cast -n "__fish_cast_using_subcommand rn" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand rn" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand rn" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand rn" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand rn" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l verify -d 'Perform a normal lookup to verify that the address is correct'
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand lookup-address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand la" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand la" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand la" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand la" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand la" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand la" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand la" -l verify -d 'Perform a normal lookup to verify that the address is correct'
complete -c cast -n "__fish_cast_using_subcommand la" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand la" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand la" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand la" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand la" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand storage" -l proxy -d 'The known proxy address. If provided, the storage layout is retrieved from this address' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -s b -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l libraries -d 'Set pre-linked libraries' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand storage" -l revert-strings -d 'Revert string configuration' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand storage" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l evm-version -d 'The target EVM version' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c cast -n "__fish_cast_using_subcommand storage" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand storage" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand storage" -s R -l remappings -d 'The project\'s remappings' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand storage" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand storage" -l config-path -d 'Path to the config file' -r -F
complete -c cast -n "__fish_cast_using_subcommand storage" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand storage" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand storage" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand storage" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c cast -n "__fish_cast_using_subcommand storage" -l no-cache -d 'Disable the cache'
complete -c cast -n "__fish_cast_using_subcommand storage" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c cast -n "__fish_cast_using_subcommand storage" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c cast -n "__fish_cast_using_subcommand storage" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c cast -n "__fish_cast_using_subcommand storage" -l offline -d 'Do not access the network'
complete -c cast -n "__fish_cast_using_subcommand storage" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c cast -n "__fish_cast_using_subcommand storage" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c cast -n "__fish_cast_using_subcommand storage" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c cast -n "__fish_cast_using_subcommand storage" -l build-info -d 'Generate build info files'
complete -c cast -n "__fish_cast_using_subcommand storage" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c cast -n "__fish_cast_using_subcommand storage" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c cast -n "__fish_cast_using_subcommand storage" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c cast -n "__fish_cast_using_subcommand storage" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand storage" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand storage" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand storage" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand st" -l proxy -d 'The known proxy address. If provided, the storage layout is retrieved from this address' -r
complete -c cast -n "__fish_cast_using_subcommand st" -s b -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand st" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand st" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand st" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand st" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l libraries -d 'Set pre-linked libraries' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l ignored-error-codes -d 'Ignore solc warnings by error code' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l use -d 'Specify the solc version, or a path to a local solc, to build with' -r
complete -c cast -n "__fish_cast_using_subcommand st" -s o -l out -d 'The path to the contract artifacts folder' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand st" -l revert-strings -d 'Revert string configuration' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l build-info-path -d 'Output path to directory that build info files will be written to' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand st" -l skip -d 'Skip building files whose names contain the given filter' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l evm-version -d 'The target EVM version' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l optimize -d 'Activate the Solidity optimizer' -r -f -a "true\t''
false\t''"
complete -c cast -n "__fish_cast_using_subcommand st" -l optimizer-runs -d 'The number of runs specifies roughly how often each opcode of the deployed code will be executed across the life-time of the contract. This means it is a trade-off parameter between code size (deploy cost) and code execution cost (cost after deployment). An `optimizer_runs` parameter of `1` will produce short but expensive code. In contrast, a larger `optimizer_runs` parameter will produce longer but more gas efficient code' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l extra-output -d 'Extra output to include in the contract\'s artifact' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l extra-output-files -d 'Extra output to write to separate files' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l root -d 'The project\'s root path' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand st" -s C -l contracts -d 'The contracts source directory' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand st" -s R -l remappings -d 'The project\'s remappings' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l remappings-env -d 'The project\'s remappings from the environment' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l cache-path -d 'The path to the compiler cache' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand st" -l lib-paths -d 'The path to the library folder' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand st" -l config-path -d 'Path to the config file' -r -F
complete -c cast -n "__fish_cast_using_subcommand st" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand st" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand st" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand st" -l force -d 'Clear the cache and artifacts folder and recompile'
complete -c cast -n "__fish_cast_using_subcommand st" -l no-cache -d 'Disable the cache'
complete -c cast -n "__fish_cast_using_subcommand st" -l dynamic-test-linking -d 'Enable dynamic test linking'
complete -c cast -n "__fish_cast_using_subcommand st" -l deny-warnings -d 'Warnings will trigger a compiler error'
complete -c cast -n "__fish_cast_using_subcommand st" -l no-auto-detect -d 'Do not auto-detect the `solc` version'
complete -c cast -n "__fish_cast_using_subcommand st" -l offline -d 'Do not access the network'
complete -c cast -n "__fish_cast_using_subcommand st" -l via-ir -d 'Use the Yul intermediate representation compilation pipeline'
complete -c cast -n "__fish_cast_using_subcommand st" -l use-literal-content -d 'Changes compilation to only use literal content and not URLs'
complete -c cast -n "__fish_cast_using_subcommand st" -l no-metadata -d 'Do not append any metadata to the bytecode'
complete -c cast -n "__fish_cast_using_subcommand st" -l build-info -d 'Generate build info files'
complete -c cast -n "__fish_cast_using_subcommand st" -l eof -d 'Whether to compile contracts to EOF bytecode'
complete -c cast -n "__fish_cast_using_subcommand st" -l ast -d 'Includes the AST as JSON in the compiler output'
complete -c cast -n "__fish_cast_using_subcommand st" -l hardhat -l hh -d 'Use the Hardhat-style project layout'
complete -c cast -n "__fish_cast_using_subcommand st" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand st" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand st" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand st" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand proof" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand proof" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand proof" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand proof" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand proof" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand proof" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand proof" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand proof" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand proof" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand proof" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand proof" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand proof" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand pr" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand pr" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand pr" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand pr" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand pr" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand pr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand pr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand pr" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand pr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand pr" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand pr" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand pr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand nonce" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand nonce" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand nonce" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand nonce" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand nonce" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand nonce" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand nonce" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand nonce" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand nonce" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand nonce" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand nonce" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand nonce" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand n" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand n" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand n" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand n" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand n" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand n" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand n" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand n" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand n" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand n" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand n" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand n" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand codehash" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand codehash" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand codehash" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand codehash" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand codehash" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand codehash" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand codehash" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand codehash" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand codehash" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand codehash" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand codehash" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand codehash" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand storage-root" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand storage-root" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand storage-root" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand storage-root" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand storage-root" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand storage-root" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand storage-root" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand storage-root" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand storage-root" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand storage-root" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand storage-root" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand storage-root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand sr" -s B -l block -d 'The block height to query at' -r
complete -c cast -n "__fish_cast_using_subcommand sr" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand sr" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand sr" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand sr" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand sr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand sr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand sr" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand sr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand sr" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand sr" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand sr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand source" -s d -d 'The output directory/file to expand source tree into' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand source" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand source" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand source" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand source" -l explorer-api-url -d 'Alternative explorer API URL to use that adheres to the Etherscan API. If not provided, defaults to Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand source" -l explorer-url -d 'Alternative explorer browser URL' -r
complete -c cast -n "__fish_cast_using_subcommand source" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand source" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand source" -s f -l flatten -d 'Whether to flatten the source code'
complete -c cast -n "__fish_cast_using_subcommand source" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand source" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand source" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand source" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand et" -s d -d 'The output directory/file to expand source tree into' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand et" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand et" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand et" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand et" -l explorer-api-url -d 'Alternative explorer API URL to use that adheres to the Etherscan API. If not provided, defaults to Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand et" -l explorer-url -d 'Alternative explorer browser URL' -r
complete -c cast -n "__fish_cast_using_subcommand et" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand et" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand et" -s f -l flatten -d 'Whether to flatten the source code'
complete -c cast -n "__fish_cast_using_subcommand et" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand et" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand et" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand et" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand src" -s d -d 'The output directory/file to expand source tree into' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand src" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand src" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand src" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand src" -l explorer-api-url -d 'Alternative explorer API URL to use that adheres to the Etherscan API. If not provided, defaults to Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand src" -l explorer-url -d 'Alternative explorer browser URL' -r
complete -c cast -n "__fish_cast_using_subcommand src" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand src" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand src" -s f -l flatten -d 'Whether to flatten the source code'
complete -c cast -n "__fish_cast_using_subcommand src" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand src" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand src" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand src" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a new -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a n -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a new-mnemonic -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a nm -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a vanity -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a va -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a address -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a a -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a addr -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a sign -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a s -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a sign-auth -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a sa -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a verify -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a v -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a import -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a i -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a list -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a ls -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a remove -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a rm -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a private-key -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a pk -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a public-key -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a pubkey -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a decrypt-keystore -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a dk -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a change-password -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a cp -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand wallet; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -l unsafe-password -d 'Password for the JSON keystore in cleartext' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -s n -l number -d 'Number of wallets to generate' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -s p -l password -d 'Triggers a hidden password prompt for the JSON keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -l unsafe-password -d 'Password for the JSON keystore in cleartext' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -s n -l number -d 'Number of wallets to generate' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -s p -l password -d 'Triggers a hidden password prompt for the JSON keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from n" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s w -l words -d 'Number of words for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s a -l accounts -d 'Number of accounts to display' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s e -l entropy -d 'Entropy to use for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from new-mnemonic" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s w -l words -d 'Number of words for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s a -l accounts -d 'Number of accounts to display' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s e -l entropy -d 'Entropy to use for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from nm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -l starts-with -d 'Prefix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -l ends-with -d 'Suffix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -l nonce -d 'Generate a vanity contract address created by the generated keypair with the specified nonce' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -l save-path -d 'Path to save the generated vanity contract address to' -r -F
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from vanity" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -l starts-with -d 'Prefix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -l ends-with -d 'Suffix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -l nonce -d 'Generate a vanity contract address created by the generated keypair with the specified nonce' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -l save-path -d 'Path to save the generated vanity contract address to' -r -F
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from va" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from addr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l data -d 'Treat the message as JSON typed data'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l from-file -d 'Treat the message as a file containing JSON typed data. Requires `--data`'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l no-hash -d 'Treat the message as a raw 32-byte hash and sign it directly without hashing it again'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l data -d 'Treat the message as JSON typed data'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l from-file -d 'Treat the message as a file containing JSON typed data. Requires `--data`'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l no-hash -d 'Treat the message as a raw 32-byte hash and sign it directly without hashing it again'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l nonce -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l chain -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sign-auth" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l nonce -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l chain -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from sa" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -s a -l address -d 'The address of the message signer' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from verify" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -s a -l address -d 'The address of the message signer' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from v" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -s k -l keystore-dir -d 'If provided, keystore will be saved here instead of the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -s k -l keystore-dir -d 'If provided, keystore will be saved here instead of the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -l dir -d 'List all the accounts in the keystore directory. Default keystore directory is used if no path provided' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s m -l max-senders -d 'Max number of addresses to display from hardware wallets' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s l -l ledger -d 'List accounts from a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s t -l trezor -d 'List accounts from a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -l aws -d 'List accounts from AWS KMS'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -l gcp -d 'List accounts from Google Cloud KMS'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -l all -d 'List all configured accounts'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -l dir -d 'List all the accounts in the keystore directory. Default keystore directory is used if no path provided' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s m -l max-senders -d 'Max number of addresses to display from hardware wallets' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s l -l ledger -d 'List accounts from a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s t -l trezor -d 'List accounts from a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -l aws -d 'List accounts from AWS KMS'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -l gcp -d 'List accounts from Google Cloud KMS'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -l all -d 'List all configured accounts'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -l name -d 'The alias (or name) of the wallet to remove' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -l dir -d 'Optionally provide the keystore directory if not provided. default directory will be used (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -l name -d 'The alias (or name) of the wallet to remove' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -l dir -d 'Optionally provide the keystore directory if not provided. default directory will be used (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from private-key" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pk" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l raw-private-key -d 'If provided, the public key will be derived from the specified private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from public-key" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l raw-private-key -d 'If provided, the public key will be derived from the specified private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from pubkey" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from decrypt-keystore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from dk" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -l unsafe-password -d 'Current password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -l unsafe-new-password -d 'New password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from change-password" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -l unsafe-password -d 'Current password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -l unsafe-new-password -d 'New password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from cp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a new -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a new-mnemonic -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a vanity -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a address -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a sign -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a sign-auth -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a verify -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a import -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a list -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a remove -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a private-key -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a public-key -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a decrypt-keystore -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a change-password -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand wallet; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a new -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a n -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a new-mnemonic -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a nm -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a vanity -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a va -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a address -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a a -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a addr -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a sign -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a s -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a sign-auth -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a sa -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a verify -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a v -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a import -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a i -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a list -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a ls -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a remove -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a rm -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a private-key -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a pk -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a public-key -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a pubkey -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a decrypt-keystore -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a dk -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a change-password -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a cp -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand w; and not __fish_seen_subcommand_from new n new-mnemonic nm vanity va address a addr sign s sign-auth sa verify v import i list ls remove rm private-key pk public-key pubkey decrypt-keystore dk change-password cp help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -l unsafe-password -d 'Password for the JSON keystore in cleartext' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -s n -l number -d 'Number of wallets to generate' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -s p -l password -d 'Triggers a hidden password prompt for the JSON keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -l unsafe-password -d 'Password for the JSON keystore in cleartext' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -s n -l number -d 'Number of wallets to generate' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -s p -l password -d 'Triggers a hidden password prompt for the JSON keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from n" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s w -l words -d 'Number of words for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s a -l accounts -d 'Number of accounts to display' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s e -l entropy -d 'Entropy to use for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from new-mnemonic" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s w -l words -d 'Number of words for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s a -l accounts -d 'Number of accounts to display' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s e -l entropy -d 'Entropy to use for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from nm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -l starts-with -d 'Prefix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -l ends-with -d 'Suffix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -l nonce -d 'Generate a vanity contract address created by the generated keypair with the specified nonce' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -l save-path -d 'Path to save the generated vanity contract address to' -r -F
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from vanity" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -l starts-with -d 'Prefix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -l ends-with -d 'Suffix regex pattern or hex string' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -l nonce -d 'Generate a vanity contract address created by the generated keypair with the specified nonce' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -l save-path -d 'Path to save the generated vanity contract address to' -r -F
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from va" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from addr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l data -d 'Treat the message as JSON typed data'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l from-file -d 'Treat the message as a file containing JSON typed data. Requires `--data`'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l no-hash -d 'Treat the message as a raw 32-byte hash and sign it directly without hashing it again'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l data -d 'Treat the message as JSON typed data'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l from-file -d 'Treat the message as a file containing JSON typed data. Requires `--data`'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l no-hash -d 'Treat the message as a raw 32-byte hash and sign it directly without hashing it again'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l nonce -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l chain -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sign-auth" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l nonce -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l chain -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from sa" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -s a -l address -d 'The address of the message signer' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from verify" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -s a -l address -d 'The address of the message signer' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from v" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -s k -l keystore-dir -d 'If provided, keystore will be saved here instead of the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -s k -l keystore-dir -d 'If provided, keystore will be saved here instead of the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -l dir -d 'List all the accounts in the keystore directory. Default keystore directory is used if no path provided' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s m -l max-senders -d 'Max number of addresses to display from hardware wallets' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s l -l ledger -d 'List accounts from a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s t -l trezor -d 'List accounts from a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -l aws -d 'List accounts from AWS KMS'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -l gcp -d 'List accounts from Google Cloud KMS'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -l all -d 'List all configured accounts'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -l dir -d 'List all the accounts in the keystore directory. Default keystore directory is used if no path provided' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s m -l max-senders -d 'Max number of addresses to display from hardware wallets' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s l -l ledger -d 'List accounts from a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s t -l trezor -d 'List accounts from a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -l aws -d 'List accounts from AWS KMS'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -l gcp -d 'List accounts from Google Cloud KMS'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -l all -d 'List all configured accounts'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -l name -d 'The alias (or name) of the wallet to remove' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -l dir -d 'Optionally provide the keystore directory if not provided. default directory will be used (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -l name -d 'The alias (or name) of the wallet to remove' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -l dir -d 'Optionally provide the keystore directory if not provided. default directory will be used (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from private-key" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pk" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l raw-private-key -d 'If provided, the public key will be derived from the specified private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from public-key" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l raw-private-key -d 'If provided, the public key will be derived from the specified private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s f -l from -d 'The sender account' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l private-key -d 'Use the provided private key' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l mnemonic -d 'Use the mnemonic phrase of mnemonic file at the specified path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l mnemonic-passphrase -d 'Use a BIP39 passphrase for the mnemonic' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l mnemonic-derivation-path -d 'The wallet derivation path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l mnemonic-index -d 'Use the private key from the given mnemonic index' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l keystore -d 'Use the keystore in the given folder or file' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l account -d 'Use a keystore from the default keystores folder (~/.foundry/keystores) by its filename' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l password -d 'The keystore password' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l password-file -d 'The keystore password file path' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s i -l interactive -d 'Open an interactive prompt to enter your private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s l -l ledger -d 'Use a Ledger hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s t -l trezor -d 'Use a Trezor hardware wallet'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l aws -d 'Use AWS Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l gcp -d 'Use Google Cloud Key Management Service'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from pubkey" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from decrypt-keystore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -l unsafe-password -d 'Password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from dk" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -l unsafe-password -d 'Current password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -l unsafe-new-password -d 'New password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from change-password" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -s k -l keystore-dir -d 'If not provided, keystore will try to be located at the default keystores directory (~/.foundry/keystores)' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -l unsafe-password -d 'Current password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -l unsafe-new-password -d 'New password for the JSON keystore in cleartext This is unsafe, we recommend using the default hidden password prompt' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from cp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a new -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a new-mnemonic -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a vanity -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a address -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a sign -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a sign-auth -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a verify -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a import -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a list -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a remove -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a private-key -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a public-key -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a decrypt-keystore -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a change-password -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand w; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l abi-path -d 'Path to file containing the contract\'s JSON ABI. It\'s necessary if the target contract is not verified on Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l disassemble -d 'Disassemble bytecodes into individual opcodes'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l without-args -d 'Return creation bytecode without constructor arguments appended'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l only-args -d 'Return only constructor arguments'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand creation-code" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cc" -l abi-path -d 'Path to file containing the contract\'s JSON ABI. It\'s necessary if the target contract is not verified on Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cc" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cc" -l disassemble -d 'Disassemble bytecodes into individual opcodes'
complete -c cast -n "__fish_cast_using_subcommand cc" -l without-args -d 'Return creation bytecode without constructor arguments appended'
complete -c cast -n "__fish_cast_using_subcommand cc" -l only-args -d 'Return only constructor arguments'
complete -c cast -n "__fish_cast_using_subcommand cc" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand cc" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cc" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cc" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand artifact" -l abi-path -d 'Path to file containing the contract\'s JSON ABI. It\'s necessary if the target contract is not verified on Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -s o -l output -d 'The path to the output file' -r -F
complete -c cast -n "__fish_cast_using_subcommand artifact" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand artifact" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand artifact" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand artifact" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand artifact" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand artifact" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand artifact" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand ar" -l abi-path -d 'Path to file containing the contract\'s JSON ABI. It\'s necessary if the target contract is not verified on Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -s o -l output -d 'The path to the output file' -r -F
complete -c cast -n "__fish_cast_using_subcommand ar" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand ar" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand ar" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand ar" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand ar" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand ar" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand ar" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l abi-path -d 'Path to file containing the contract\'s JSON ABI. It\'s necessary if the target contract is not verified on Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand constructor-args" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand cra" -l abi-path -d 'Path to file containing the contract\'s JSON ABI. It\'s necessary if the target contract is not verified on Etherscan' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand cra" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand cra" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand cra" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand cra" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand cra" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand cra" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand interface" -s n -l name -d 'The name to use for the generated interface' -r
complete -c cast -n "__fish_cast_using_subcommand interface" -s p -l pragma -d 'Solidity pragma version' -r
complete -c cast -n "__fish_cast_using_subcommand interface" -s o -l output -d 'The path to the output file' -r -F
complete -c cast -n "__fish_cast_using_subcommand interface" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand interface" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand interface" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand interface" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand interface" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand interface" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand interface" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand interface" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand interface" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand i" -s n -l name -d 'The name to use for the generated interface' -r
complete -c cast -n "__fish_cast_using_subcommand i" -s p -l pragma -d 'Solidity pragma version' -r
complete -c cast -n "__fish_cast_using_subcommand i" -s o -l output -d 'The path to the output file' -r -F
complete -c cast -n "__fish_cast_using_subcommand i" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand i" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand i" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand i" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand i" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand i" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand i" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand i" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand bind" -s o -l output-dir -d 'Path to where bindings will be stored' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand bind" -l crate-name -d 'The name of the Rust crate to generate' -r
complete -c cast -n "__fish_cast_using_subcommand bind" -l crate-version -d 'The version of the Rust crate to generate' -r
complete -c cast -n "__fish_cast_using_subcommand bind" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand bind" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand bind" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand bind" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand bind" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand bind" -l separate-files -d 'Generate bindings as separate files'
complete -c cast -n "__fish_cast_using_subcommand bind" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand bind" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand bind" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand bind" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand bi" -s o -l output-dir -d 'Path to where bindings will be stored' -r -f -a "(__fish_complete_directories)"
complete -c cast -n "__fish_cast_using_subcommand bi" -l crate-name -d 'The name of the Rust crate to generate' -r
complete -c cast -n "__fish_cast_using_subcommand bi" -l crate-version -d 'The version of the Rust crate to generate' -r
complete -c cast -n "__fish_cast_using_subcommand bi" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand bi" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand bi" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand bi" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand bi" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand bi" -l separate-files -d 'Generate bindings as separate files'
complete -c cast -n "__fish_cast_using_subcommand bi" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand bi" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand bi" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand bi" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand sig" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand sig" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand sig" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand sig" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand sig" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand sig" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand si" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand si" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand si" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand si" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand si" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand si" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand create2" -s s -l starts-with -d 'Prefix for the contract address' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -s e -l ends-with -d 'Suffix for the contract address' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -s m -l matching -d 'Sequence that the address has to match' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -s d -l deployer -d 'Address of the contract deployer' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -l salt -d 'Salt to be used for the contract deployment. This option separate from the default salt mining with filters' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -s i -l init-code -d 'Init code of the contract to be deployed' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -l init-code-hash -d 'Init code hash of the contract to be deployed' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -l caller -d 'Address of the caller. Used for the first 20 bytes of the salt' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -l seed -d 'The random number generator\'s seed, used to initialize the salt' -r
complete -c cast -n "__fish_cast_using_subcommand create2" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand create2" -s c -l case-sensitive -d 'Case sensitive matching'
complete -c cast -n "__fish_cast_using_subcommand create2" -l no-random -d 'Don\'t initialize the salt with a random value, and instead use the default value of 0'
complete -c cast -n "__fish_cast_using_subcommand create2" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand create2" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand create2" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand create2" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand c2" -s s -l starts-with -d 'Prefix for the contract address' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -s e -l ends-with -d 'Suffix for the contract address' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -s m -l matching -d 'Sequence that the address has to match' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -s d -l deployer -d 'Address of the contract deployer' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -l salt -d 'Salt to be used for the contract deployment. This option separate from the default salt mining with filters' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -s i -l init-code -d 'Init code of the contract to be deployed' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -l init-code-hash -d 'Init code hash of the contract to be deployed' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -l caller -d 'Address of the caller. Used for the first 20 bytes of the salt' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -l seed -d 'The random number generator\'s seed, used to initialize the salt' -r
complete -c cast -n "__fish_cast_using_subcommand c2" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand c2" -s c -l case-sensitive -d 'Case sensitive matching'
complete -c cast -n "__fish_cast_using_subcommand c2" -l no-random -d 'Don\'t initialize the salt with a random value, and instead use the default value of 0'
complete -c cast -n "__fish_cast_using_subcommand c2" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand c2" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand c2" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand c2" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand find-block" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand find-block" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand find-block" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand find-block" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand find-block" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand find-block" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand find-block" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand find-block" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand find-block" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand find-block" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand find-block" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand f" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand f" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand f" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand f" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand f" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand f" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand f" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand f" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand f" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand f" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand completions" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand completions" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand completions" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand completions" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand completions" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand com" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand com" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand com" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand com" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand com" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand com" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand generate-fig-spec" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand generate-fig-spec" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand generate-fig-spec" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand generate-fig-spec" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand generate-fig-spec" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand generate-fig-spec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand fig" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand fig" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand fig" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand fig" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand fig" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand fig" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand run" -s l -l label -d 'Label addresses in the trace' -r
complete -c cast -n "__fish_cast_using_subcommand run" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand run" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand run" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand run" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand run" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand run" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand run" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand run" -l evm-version -d 'The EVM version to use' -r
complete -c cast -n "__fish_cast_using_subcommand run" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c cast -n "__fish_cast_using_subcommand run" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand run" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand run" -s d -l debug -d 'Opens the transaction in the debugger'
complete -c cast -n "__fish_cast_using_subcommand run" -l decode-internal -d 'Whether to identify internal functions in traces'
complete -c cast -n "__fish_cast_using_subcommand run" -s t -l trace-printer -d 'Print out opcode traces'
complete -c cast -n "__fish_cast_using_subcommand run" -l quick -d 'Executes the transaction only with the state from the previous block'
complete -c cast -n "__fish_cast_using_subcommand run" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand run" -l no-rate-limit -l no-rpc-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c cast -n "__fish_cast_using_subcommand run" -l odyssey -d 'Enables Odyssey features'
complete -c cast -n "__fish_cast_using_subcommand run" -l with-local-artifacts -l la -d 'Use current project artifacts for trace decoding'
complete -c cast -n "__fish_cast_using_subcommand run" -l disable-block-gas-limit -d 'Disable block gas limit check'
complete -c cast -n "__fish_cast_using_subcommand run" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand run" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand run" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand r" -s l -l label -d 'Label addresses in the trace' -r
complete -c cast -n "__fish_cast_using_subcommand r" -s e -l etherscan-api-key -d 'The Etherscan (or equivalent) API key' -r
complete -c cast -n "__fish_cast_using_subcommand r" -s a -l etherscan-api-version -d 'The Etherscan API version' -r
complete -c cast -n "__fish_cast_using_subcommand r" -s c -l chain -d 'The chain name or EIP-155 chain ID' -r
complete -c cast -n "__fish_cast_using_subcommand r" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand r" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand r" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand r" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand r" -l evm-version -d 'The EVM version to use' -r
complete -c cast -n "__fish_cast_using_subcommand r" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c cast -n "__fish_cast_using_subcommand r" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand r" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand r" -s d -l debug -d 'Opens the transaction in the debugger'
complete -c cast -n "__fish_cast_using_subcommand r" -l decode-internal -d 'Whether to identify internal functions in traces'
complete -c cast -n "__fish_cast_using_subcommand r" -s t -l trace-printer -d 'Print out opcode traces'
complete -c cast -n "__fish_cast_using_subcommand r" -l quick -d 'Executes the transaction only with the state from the previous block'
complete -c cast -n "__fish_cast_using_subcommand r" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand r" -l no-rate-limit -l no-rpc-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c cast -n "__fish_cast_using_subcommand r" -l odyssey -d 'Enables Odyssey features'
complete -c cast -n "__fish_cast_using_subcommand r" -l with-local-artifacts -l la -d 'Use current project artifacts for trace decoding'
complete -c cast -n "__fish_cast_using_subcommand r" -l disable-block-gas-limit -d 'Disable block gas limit check'
complete -c cast -n "__fish_cast_using_subcommand r" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand r" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand r" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand rpc" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand rpc" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand rpc" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand rpc" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand rpc" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand rpc" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand rpc" -s w -l raw -d 'Send raw JSON parameters'
complete -c cast -n "__fish_cast_using_subcommand rpc" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand rpc" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand rpc" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand rpc" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand rpc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand rp" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand rp" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand rp" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand rp" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand rp" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand rp" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand rp" -s w -l raw -d 'Send raw JSON parameters'
complete -c cast -n "__fish_cast_using_subcommand rp" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand rp" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand rp" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand rp" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand rp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand format-bytes32-string" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand format-bytes32-string" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand format-bytes32-string" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand format-bytes32-string" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand format-bytes32-string" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand format-bytes32-string" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --format-bytes32-string" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --format-bytes32-string" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --format-bytes32-string" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --format-bytes32-string" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --format-bytes32-string" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --format-bytes32-string" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-string" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-string" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-string" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-string" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-string" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-string" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-string" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-string" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-string" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-string" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-string" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-string" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand parse-bytes32-address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-address" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-address" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-address" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-address" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-address" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand --parse-bytes32-address" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand decode-transaction" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-transaction" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-transaction" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-transaction" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-transaction" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-transaction" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand dt" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand dt" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand dt" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand dt" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand dt" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand dt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand decode-tx" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand decode-tx" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand decode-tx" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand decode-tx" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand decode-tx" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand decode-tx" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand selectors" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand selectors" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand selectors" -s r -l resolve -d 'Resolve the function signatures for the extracted selectors using <https://openchain.xyz>'
complete -c cast -n "__fish_cast_using_subcommand selectors" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand selectors" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand selectors" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand selectors" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand sel" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand sel" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand sel" -s r -l resolve -d 'Resolve the function signatures for the extracted selectors using <https://openchain.xyz>'
complete -c cast -n "__fish_cast_using_subcommand sel" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand sel" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand sel" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand sel" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a content -d 'Fetches the content of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a content-from -d 'Fetches the content of the transaction pool filtered by a specific address'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a inspect -d 'Fetches a textual summary of each transaction in the pool'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a status -d 'Fetches the current status of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -s f -l from -d 'The Signer to filter the transactions by' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from content-from" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from inspect" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from help" -f -a content -d 'Fetches the content of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from help" -f -a content-from -d 'Fetches the content of the transaction pool filtered by a specific address'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from help" -f -a inspect -d 'Fetches a textual summary of each transaction in the pool'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from help" -f -a status -d 'Fetches the current status of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tx-pool; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a content -d 'Fetches the content of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a content-from -d 'Fetches the content of the transaction pool filtered by a specific address'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a inspect -d 'Fetches a textual summary of each transaction in the pool'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a status -d 'Fetches the current status of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tp; and not __fish_seen_subcommand_from content content-from inspect status help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -s f -l from -d 'The Signer to filter the transactions by' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from content-from" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from inspect" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -s r -l rpc-url -d 'The RPC endpoint, default value is http://localhost:8545' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -l jwt-secret -d 'JWT Secret for the RPC endpoint' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -l rpc-timeout -d 'Timeout for the RPC request in seconds' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -l rpc-headers -d 'Specify custom headers for RPC requests' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -l color -d 'The color of the log messages' -r -f -a "auto\t'Intelligently guess whether to use color output (default)'
always\t'Force color output'
never\t'Force disable color output'"
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -s j -l threads -l jobs -d 'Number of threads to use. Specifying 0 defaults to the number of logical cores' -r
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -l flashbots -d 'Use the Flashbots RPC URL with fast mode (<https://rpc.flashbots.net/fast>)'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -s v -l verbosity -d 'Verbosity level of the log messages.'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -s q -l quiet -d 'Do not print log messages'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -l json -d 'Format log messages as JSON'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from help" -f -a content -d 'Fetches the content of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from help" -f -a content-from -d 'Fetches the content of the transaction pool filtered by a specific address'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from help" -f -a inspect -d 'Fetches a textual summary of each transaction in the pool'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from help" -f -a status -d 'Fetches the current status of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand tp; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a max-int -d 'Prints the maximum value of the given integer type'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a min-int -d 'Prints the minimum value of the given integer type'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a max-uint -d 'Prints the maximum value of the given integer type'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a address-zero -d 'Prints the zero address'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a hash-zero -d 'Prints the zero hash'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a from-utf8 -d 'Convert UTF8 text to hex'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a concat-hex -d 'Concatenate hex strings'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a from-bin -d 'Convert binary data into hex data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-hexdata -d 'Normalize the input to lowercase, 0x-prefixed hex'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-check-sum-address -d 'Convert an address to a checksummed format (EIP-55)'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-ascii -d 'Convert hex data to an ASCII string'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-utf8 -d 'Convert hex data to a utf-8 string'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a from-fixed-point -d 'Convert a fixed point number into an integer'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-bytes32 -d 'Right-pads hex data to 32 bytes'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-fixed-point -d 'Convert an integer into a fixed point number'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-uint256 -d 'Convert a number to a hex-encoded uint256'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-int256 -d 'Convert a number to a hex-encoded int256'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a shl -d 'Perform a left shifting operation'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a shr -d 'Perform a right shifting operation'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-unit -d 'Convert an ETH amount into another unit (ether, gwei or wei)'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a parse-units -d 'Convert a number from decimal to smallest unit with arbitrary decimals'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a format-units -d 'Format a number from smallest unit to decimal with arbitrary decimals'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-wei -d 'Convert an ETH amount to wei'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a from-wei -d 'Convert wei into an ETH amount'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-rlp -d 'RLP encodes hex data, or an array of hex data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a from-rlp -d 'Decodes RLP hex-encoded data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-hex -d 'Converts a number of one base to another'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-dec -d 'Converts a number of one base to decimal'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a to-base -d 'Converts a number of one base to another'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a access-list -d 'Create an access list for a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a logs -d 'Get logs by signature or topic'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a block -d 'Get information about a block'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a block-number -d 'Get the latest block number'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a call -d 'Perform a call on an account without publishing a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a calldata -d 'ABI-encode a function with arguments'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a chain -d 'Get the symbolic name of the current chain'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a chain-id -d 'Get the Ethereum chain ID'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a client -d 'Get the current client version'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a compute-address -d 'Compute the contract address from a given nonce and deployer address'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a disassemble -d 'Disassembles a hex-encoded bytecode into a human-readable representation'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a mktx -d 'Build and sign a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a namehash -d 'Calculate the ENS namehash of a name'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a tx -d 'Get information about a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a receipt -d 'Get the transaction receipt for a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a send -d 'Sign and publish a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a publish -d 'Publish a raw transaction to the network'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a estimate -d 'Estimate the gas cost of a transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a decode-calldata -d 'Decode ABI-encoded input data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a decode-string -d 'Decode ABI-encoded string'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a decode-event -d 'Decode event data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a decode-error -d 'Decode custom error data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a decode-abi -d 'Decode ABI-encoded input or output data'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a abi-encode -d 'ABI encode the given function argument, excluding the selector'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a index -d 'Compute the storage slot for an entry in a mapping'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a index-erc7201 -d 'Compute storage slots as specified by `ERC-7201: Namespaced Storage Layout`'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a implementation -d 'Fetch the EIP-1967 implementation for a contract Can read from the implementation slot or the beacon slot'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a admin -d 'Fetch the EIP-1967 admin account'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a 4byte -d 'Get the function signatures for the given selector from <https://openchain.xyz>'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a 4byte-calldata -d 'Decode ABI-encoded calldata using <https://openchain.xyz>'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a 4byte-event -d 'Get the event signature for a given topic 0 from <https://openchain.xyz>'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a upload-signature -d 'Upload the given signatures to <https://openchain.xyz>'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a pretty-calldata -d 'Pretty print calldata'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a age -d 'Get the timestamp of a block'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a balance -d 'Get the balance of an account in wei'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a base-fee -d 'Get the basefee of a block'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a code -d 'Get the runtime bytecode of a contract'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a codesize -d 'Get the runtime bytecode size of a contract'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a gas-price -d 'Get the current gas price'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a sig-event -d 'Generate event signatures from event string'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a keccak -d 'Hash arbitrary data using Keccak-256'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a hash-message -d 'Hash a message according to EIP-191'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a resolve-name -d 'Perform an ENS lookup'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a lookup-address -d 'Perform an ENS reverse lookup'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a storage -d 'Get the raw value of a contract\'s storage slot'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a proof -d 'Generate a storage proof for a given storage slot'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a nonce -d 'Get the nonce for an account'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a codehash -d 'Get the codehash for an account'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a storage-root -d 'Get the storage root for an account'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a source -d 'Get the source code of a contract from a block explorer'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a wallet -d 'Wallet management utilities'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a creation-code -d 'Download a contract creation code from Etherscan and RPC'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a artifact -d 'Generate an artifact file, that can be used to deploy a contract locally'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a constructor-args -d 'Display constructor arguments used for the contract initialization'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a interface -d 'Generate a Solidity interface from a given ABI'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a bind -d 'Generate a rust binding from a given ABI'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a sig -d 'Get the selector for a function'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a create2 -d 'Generate a deterministic contract address using CREATE2'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a find-block -d 'Get the block number closest to the provided timestamp'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a completions -d 'Generate shell completions script'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a generate-fig-spec -d 'Generate Fig autocompletion spec'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a run -d 'Runs a published transaction in a local environment and prints the trace'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a rpc -d 'Perform a raw JSON-RPC request'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a format-bytes32-string -d 'Formats a string into bytes32 encoding'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a parse-bytes32-string -d 'Parses a string from bytes32 encoding'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a parse-bytes32-address -d 'Parses a checksummed address from bytes32 encoding.'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a decode-transaction -d 'Decodes a raw signed EIP 2718 typed transaction'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a selectors -d 'Extracts function selectors and arguments from bytecode'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a tx-pool -d 'Inspect the TxPool of a node'
complete -c cast -n "__fish_cast_using_subcommand help; and not __fish_seen_subcommand_from max-int min-int max-uint address-zero hash-zero from-utf8 concat-hex from-bin to-hexdata to-check-sum-address to-ascii to-utf8 from-fixed-point to-bytes32 to-fixed-point to-uint256 to-int256 shl shr to-unit parse-units format-units to-wei from-wei to-rlp from-rlp to-hex to-dec to-base access-list logs block block-number call calldata chain chain-id client compute-address disassemble mktx namehash tx receipt send publish estimate decode-calldata decode-string decode-event decode-error decode-abi abi-encode index index-erc7201 implementation admin 4byte 4byte-calldata 4byte-event upload-signature pretty-calldata age balance base-fee code codesize gas-price sig-event keccak hash-message resolve-name lookup-address storage proof nonce codehash storage-root source wallet creation-code artifact constructor-args interface bind sig create2 find-block completions generate-fig-spec run rpc format-bytes32-string parse-bytes32-string parse-bytes32-address decode-transaction selectors tx-pool help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from call" -f -a --create -d 'ignores the address field and simulates creating a contract'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from mktx" -f -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from send" -f -a --create -d 'Use to deploy raw contract bytecode'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from estimate" -f -a --create -d 'Estimate gas cost to deploy a smart contract'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a new -d 'Create a new random keypair'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a new-mnemonic -d 'Generates a random BIP39 mnemonic phrase'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a vanity -d 'Generate a vanity address'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a address -d 'Convert a private key to an address'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a sign -d 'Sign a message or typed data'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a sign-auth -d 'EIP-7702 sign authorization'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a verify -d 'Verify the signature of a message'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a import -d 'Import a private key into an encrypted keystore'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a list -d 'List all the accounts in the keystore default directory'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a remove -d 'Remove a wallet from the keystore'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a private-key -d 'Derives private key from mnemonic'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a public-key -d 'Get the public key for the given private key'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a decrypt-keystore -d 'Decrypt a keystore file to get the private key'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from wallet" -f -a change-password -d 'Change the password of a keystore file'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from tx-pool" -f -a content -d 'Fetches the content of the transaction pool'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from tx-pool" -f -a content-from -d 'Fetches the content of the transaction pool filtered by a specific address'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from tx-pool" -f -a inspect -d 'Fetches a textual summary of each transaction in the pool'
complete -c cast -n "__fish_cast_using_subcommand help; and __fish_seen_subcommand_from tx-pool" -f -a status -d 'Fetches the current status of the transaction pool'
