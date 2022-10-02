pragma solidity 0.8.7;

contract ComplexContract {
    // should not call many function and contracts in a single function
    function complexfunctionCall() external {
        //func1();
        //func2();
        //ContractA.func1();
        //func3();
        //ContractB.func2();
    }

    //Doing Multiple Things in single contract is not good
    // AMM functions
    function swapToken() external {}

    // DEFI functions
    function lend() external {}

    function borrow() external {}

    function liquidate() external {}

    //Having Multiple View Functions
    function f1() external view {}

    function f2() external view {}

    function f3() external view {}

    function f4() external view {}
}

//Good Practice

contract SimpleContract {
    //Simple Code
    //Do as little as possible YAGNI -- you are not gonna need it.
    //Splitting contracts - core and view (Ex Uniswap split their contract)
}

contract CoreContract {}

contract ViewContract {}
