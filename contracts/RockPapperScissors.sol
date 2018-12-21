pragma solidity ^0.4.24;

import "./Lottery.sol";
/*
Rules:
    Rock > Scissors > Paper > Rock
    0      1          2       0
*/
contract RockPapperScissors is Lottery(3) {
    uint8 maxiumPlayerCount = 2;
    function buyTicket(uint _ticketNumber) external payable {
       require(ticketBox.length < maxiumPlayerCount);
       require(_ticketNumber < maxiumTicketCount);// 0 ~ (maxiumTicketCount-1)
       require(msg.value == ticketFee);
       require(ownerTicketCount[msg.sender] < maxiumPlayerTicketCount);
       _createTicket(_ticketNumber);
    }
}
