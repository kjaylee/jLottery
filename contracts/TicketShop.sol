pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import 'openzeppelin-solidity/contracts/math/Math.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

contract TicketShop is Ownable {
    using SafeMath for uint256;
    uint ticketFee = 0.001 ether;
    uint8 maxiumPlayerTicketCount = 3;
    event NewTicket(uint ticketId, uint ticketNumber);
    struct Ticket {
        uint ticketNumber;
    }
    Ticket[] public ticketBox;
    mapping (uint => address) public ticketToOwner;
    mapping (address => uint) ownerTicketCount;
    mapping (uint => uint) numberTicketCount;
    function _createTicket(uint _ticketNumber) internal {
        uint id = ticketBox.push(Ticket(_ticketNumber)).sub(1);
        ticketToOwner[id] = msg.sender;
        ownerTicketCount[msg.sender] = ownerTicketCount[msg.sender].add(1);
        numberTicketCount[_ticketNumber] = numberTicketCount[_ticketNumber].add(1);
        emit NewTicket(id, _ticketNumber);
    }
    function setTicketFee(uint _fee) external onlyOwner {
        ticketFee = _fee;
    }
    function setMaxiumPlayerTicketCount(uint8 _count) external onlyOwner {
        maxiumPlayerTicketCount = _count;
    }
}
