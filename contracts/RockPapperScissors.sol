pragma solidity ^0.4.24;

import './Lottery.sol';

/*
// 참조: https://github.com/jbartual/b9U4RockPaperScissors
Rules:
    Rock > Scissors > Paper > Rock
    0      1          2       0
*/
contract RockPapperScissors is Lottery(3) {
    enum Hand {NONE, Rock, Scissors, Paper}

}
