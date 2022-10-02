// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;
import "./IERC20.sol";

//Push - send ETH or Token to some address
// Pull - allow caller to withdraw ETH or Token (they should pay gas)

// Why? Re-entrancy and accidentally send to wrong address
contract Push {
    function sendETH(address payable _to, uint256 _amount) external {
        (bool ok, ) = _to.call{value: _amount}("");
        require(ok, "transfer failed");
    }

    function sendETHMany(address[] calldata receivers, uint256 amount)
        external
    {
        uint256 len = receivers.length;
        for (j = 0; j < len; ++j) {
            (bool ok, ) = receivers[j].call{value: amount}("");
            require(ok, "transfer failed");
        }
    }

    function sendToken(
        address token,
        address to,
        uint256 amount
    ) external {
        IERC20(token).transfer(to, amount);
    }
}

contract Pull {
    mapping(address => uint256) public ethBalance;
    mapping(address => mapping(address => uint256)) public tokenBalance;

    function depositETH(address to, uint256 amount) external {
        ethBalance[to] += amount;
    }

    function depositToken(
        address token,
        address to,
        uint256 amount
    ) external {
        tokenBalance[token][to] += amount;
    }

    function withdrawETH(uint256 amount) external {
        ethBalance[msg.sender] -= amount;
        (bool ok, ) = payable(msg.sender).call{value: amount}("");
        require(ok, "tx failed");
    }

    function withdrawToken(address token,uint256 to,uint256 amount)external{
        tokenBalance[token][to]-=amount;
        IERC20(token).transfer(msg.sender,amount);
    }
}
