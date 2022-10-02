import "./IERC20.sol";

//Why? - User can execute malicious contract inside your contract

contract UserInput {
    //Good -  Whitelist user input if possible
    function deposit(address token, uint256 amount) external {
        IERC20(token).transferFrom(msg.sender, address(this), amount); //More Code
    }
}

contract MaliciousContract {
    event Log(string message);

    function transferFrom(
        address,
        address,
        uint256
    ) external returns (bool) {
        // Malicious Code Here...

        emit Log("Hacked!!!");
        return true;
    }
}
