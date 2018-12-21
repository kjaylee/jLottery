pragma solidity ^0.4.24;

import "./TicketShop.sol";

contract Lottery is TicketShop {
    uint32 maxiumTicketCount;
    constructor (uint32 _maxiumTicketCount) internal {
        maxiumTicketCount = _maxiumTicketCount;
    }
}
