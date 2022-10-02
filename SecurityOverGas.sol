// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;

contract SecurityOverGas {
    // Function sum number save gas
    //Gas 24242
    function bad(uint256[] calldata nums)
        external
        pure
        returns (uint256 total)
    {
        uint256 len = nums.length;
        for (uint256 j = 0; j < len; ) {
            total += nums[j];
            unchecked {
                ++j;
            }
        }
    }
    // have good code readability + security > gas cost
    //Gas 24879
    function good(uint256[] calldata nums)
        external
        pure
        returns (uint256 total)
    {
        uint256 len = nums.length;
        for (uint256 j = 0; j < len; ++j) {
            total += nums[j];
        }
    }
}
