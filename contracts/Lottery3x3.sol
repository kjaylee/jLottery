pragma solidity ^0.4.24;

import "./Lottery.sol";

contract Lottery3x3 is Lottery(9) {
    function buyTicket(uint _ticketNumber) external payable {
       require(_ticketNumber < maxiumTicketCount);// 0 ~ (maxiumTicketCount-1)
       require(msg.value == ticketFee);
       require(ownerTicketCount[msg.sender] < maxiumPlayerTicketCount);
       _createTicket(_ticketNumber);
    }
}
