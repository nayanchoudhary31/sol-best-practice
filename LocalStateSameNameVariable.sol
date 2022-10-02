// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;

contract LocalStateSameVariable {
    uint256 public totalSupply;

    function foo() external {
        //BAD
        uint256 totalSupply = 234;
        // More Code
        //I want to update the state variable
        // but local variable updated
        totalSupply = 5678;
    }

    function GoodFoo() external {
        uint256 _totalSupply = 123;
        //More Code Here
        totalSupply = 456;
    }

    // Bonus pure function don't include state variable so
    // we can have same name in it

    function GoodFooPure() external pure returns (uint256) {
        uint256 totalSupply = 123;
        return totalSupply;
    }
}
