// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/WikiRegistry.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        WikiRegistry registry = new WikiRegistry();

        vm.stopBroadcast();

        console.log("WikiRegistry deployed at:", address(registry));
    }
}
