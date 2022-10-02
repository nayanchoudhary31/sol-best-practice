// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;

// Why? Decrease the chance of Re-entrancy Attack

// Checks -  Check Inputs
// Effects - Update State Variables
// Interaction - Call another accounts / contracts

contract CheckEffectInteraction {
    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    function withdrawBad(uint256 amount) external {
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "transfer failed");
        balanceOf[msg.sender] -= amount;
    }

    function goodWithdraw(uint256 amount) external {
        // Check First
        require(amount > 0,'zero amount');
        // Effects 
        balanceOf[msg.sender]-=amount;
        // Interaction  
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "transfer failed");
    }
}
