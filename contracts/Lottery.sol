pragma solidity ^0.4.24;

import './TicketShop.sol';
import 'openzeppelin-solidity/contracts/lifecycle/Pausable.sol';

contract Lottery is TicketShop, Pausable {
  uint constant PLAYDEADLINE = 86400/15; //24 hours
  uint constant REVEALDEADLINE = 86400/15; //24 hours
  uint public globalPlayDeadline;
  uint public globalRevealDeadline;
  uint32 maxiumTicketCount;
  struct Player {
    uint deadline;
    address playerAddress;
    bytes32 secret;
    uint amount;
  }
  struct Game {
    Player[] pool;
    address winner;
  }
  mapping (bytes32 => Game) games;
  constructor (uint32 _maxiumTicketCount) internal {
      maxiumTicketCount = _maxiumTicketCount;
  }
}
