// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 90% of x
// BAD
// x * (90/100)
// GOOD
// (90*x)/100;

//Avoid Rounding Errors

contract MultiplyBeforeDeploy {
    function bad(
        uint256 x,
        uint256 y,
        uint256 z
    ) external pure returns (uint256) {
        // x *(90/100) will always return 0
        return x * (y / z);
    }
}

//Another Example

contract Pool {
    uint256 totalSupply;
    mapping(address => uint256) public balanceOf;

    uint256 private constant MULTIPLIER = 10e18;

    constructor() {
        totalSupply = 100 * MULTIPLIER;
        balanceOf[msg.sender] = 20 * MULTIPLIER;
    }

    function calculateRatio(address account) external view returns (uint256) {
        if (totalSupply > 0) {
            // BAD Multiple First Then Divide 
            // Always return Zero
            // return balanceOf[msg.sender] / totalSupply;
            return (balanceOf[account] * MULTIPLIER) / totalSupply;
        }
        return 0;
    }
}
