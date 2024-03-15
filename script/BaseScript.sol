// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";

abstract contract BaseScript is Script {
    string path;

    function setUp() public virtual {
        string memory scriptConfig = vm.envString("SCRIPT_CONFIG");
        console.log("[BaseScript] SCRIPT_CONFIG: ", scriptConfig);

        string memory root = vm.projectRoot();
        path = string.concat(root, "/script/config/", scriptConfig, ".json");
        console.log("[BaseScript] Reading config from: ", path);
    }

    // reference: https://github.com/foundry-rs/foundry/blob/master/testdata/cheats/Json.t.sol
    function getAddressFromConfig(string memory key) public view returns (address) {
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json, string.concat(".", key));
        address decodedData = abi.decode(data, (address));
        require(decodedData != address(0), "Address ZERO");

        return decodedData;
    }
}
