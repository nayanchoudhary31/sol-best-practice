// SPDX-License-Identifier: MIT

// BAD pragma solidity ^0.8.4;
// BAD pramga solidity >=0.7.0 <0.9.0;

// GOOD
pragma solidity 0.8.7;
contract LockCompiler{}

//Why?
// 1.Can't Remember which version used to deployed;
// 2. Difficulty veriying contract on etherscan
//Suggestion
// Use recent version but no latest