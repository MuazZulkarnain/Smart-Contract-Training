const fs = require('fs-extra')
const path = require('path')
const {Web3} = require('web3')

async function interact() {
    try {
        console.log(`>>> Starting interaction...`)
    } catch (error){
        console.error(`>>> Failed interaction :(`)
    }
}

// Run compliation if this script is executred directly 
if(require.main == module) {
    interact();
}

module.exports = interact; 