pragma solidity ^0.4.24;

import './Lottery.sol';

/*
// 참조: https://github.com/jbartual/b9U4RockPaperScissors
Rules:
       Rock > Scissors > Paper > Rock
Ticket number:
        0      1          2       0
*/
contract RockPapperScissors is Lottery(3) {
  event NewRockPaperScissors(address sender);
  event StartGame(address sender, bytes32 hashGameId, bytes32 secretHand);
  event Player2Hand (address sender, bytes32 hashGameId, bytes32 secretHand);
  function rockPapperScissors(uint _playDeadline, uint _revealDeadline) public {
    if (_playDeadline == 0) {
      globalPlayDeadline = PLAYDEADLINE;
    }
    else {
      globalPlayDeadline = _playDeadline;
    }
    if (_revealDeadline == 0) {
      globalRevealDeadline = REVEALDEADLINE;
    }
    else {
      globalRevealDeadline = _revealDeadline;
    }
    emit NewRockPaperScissors(msg.sender);
  }
  function newGameId(address _player2)
    onlyIfRunning
    constant
    public
    returns (bytes32 _hashGameId)
    {
    return keccak256(msg.sender, _player2);
  }
  function newSecretHand(bytes32 _hashGameID, uint _hand, uint _nonce)
    onlyIfRunning
    constant
    public
    returns (bytes32 _secretHand)
    {
      return keccak256(msg.sender, _hashGameID, _hand, _nonce);
  }
}
