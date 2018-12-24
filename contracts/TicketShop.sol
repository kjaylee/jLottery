pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import 'openzeppelin-solidity/contracts/math/Math.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

contract TicketShop is Ownable {
    using SafeMath for uint256;
    uint ticketFee = 0.001 ether;
    /*
    maxiumPlayerTicketCount가 uint256인 이유:
    각 저장소 슬롯에는 256 비트가 있습니다.
    따라서 uint8 만 저장하는 경우 EVM은 누락 된 모든 자릿수를 0으로 채 웁니다.이 비용은 가스 비용입니다.
    또한 EVM에 의해 uint256에서 계산이 수행되므로 uint256 이외의 다른 유형도 변환해야합니다.
    */
    uint maxiumPlayerTicketCount = 3;
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
    function setMaxiumPlayerTicketCount(uint _count) external onlyOwner {
        maxiumPlayerTicketCount = _count;
    }
}
