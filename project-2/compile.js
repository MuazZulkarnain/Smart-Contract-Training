const fs = require('fs-extra')
const path = require('path')
const solc = require('solc')

async function compile() {
    try {
        console.log('Compiling SimpleStorage Contract...')

        // Read the contract source code
        const contractPath = path.resolve(__dirname, '..', 'contracts','SimpleStorage.sol')
        const contractSource = await fs.readFile(contractPath, 'utf8')

        // Prepare the infput for the Solidity compiler
        const input = {
            language: 'Solidity',
            sources: {
                'SimpleStorage.sol':{
                    content: contractSource
                }
            },
            settings: {
                outputSelection: {
                    '*': {
                        '*': ['abi','evm.bytecode']
                    }
                }
            }
        };

    } catch (error) {
        console.error('[X] Compilation failed', error.message);
        process.exit(1);
    }
}

// Run compilation if this script is executed directly
if(require.main == module) {
    compile();
}

module.exports = compile();