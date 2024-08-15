// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface LuckyRound {
    function requestCalculation(uint256 round) external;
    function getCurrentRound() external view returns (uint256);
    function distribute(uint256 round, uint256 offset, uint256 limit) external;
    function getBetsCount(uint round) external view returns (uint256);
}

contract LuckyRoundExecutor {
    function execute(address luro) external {
        LuckyRound(luro).requestCalculation(
            LuckyRound(luro).getCurrentRound() - 1
        );
    }
    function distribute(address luro) external {
        uint256 round = LuckyRound(luro).getCurrentRound() - 1;
        LuckyRound(luro).distribute(
            round,
            0,
            LuckyRound(luro).getBetsCount(round)
        );
    }
}
