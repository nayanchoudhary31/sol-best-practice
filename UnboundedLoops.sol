// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;

contract UnboundedLoops {
    // Unbounded Loops - No Upper Limit to number of loops

    //why? - There is limit of gas can be used in a block
    // Unbounded loops can consume more gas than the block gas limit
    address[] public accounts;
    mapping(address => uint256) public balance;

    function bad() external {
        //Increment Balance each account
        for (uint256 k = 0; k < accounts.length; k++) {
            balance[accounts[k]] += 1;
        }
    }

    function good(uint256 start, uint256 end) external {
        for (uint256 j = start; j < end; j++) {
            balance[accounts[j]] += 1;
        }
    }
}
