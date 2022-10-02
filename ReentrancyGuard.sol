// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;

abstract contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked, "locked");
        locked = true;
        _;
        locked = false;
    }
}

contract Bank is ReentrancyGuard {
    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    //Without Reentrancy Guard
    function withdrawBad() external {
        uint256 balance = balaceOf[msg.sender];
        (bool success, ) = payable(msg.sender).call{value: balance}("");
        require(success, "transfer failed");
        balanceOf[msg.sender] = 0;
    }

    function withdrawProtected() external lock {
        uint256 balance = balaceOf[msg.sender];
        (bool success, ) = payable(msg.sender).call{value: balance}("");
        require(success, "transfer failed");
        balanceOf[msg.sender] = 0;
    }
}
