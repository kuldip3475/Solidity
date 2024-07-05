// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract lottery {
    address public owner;
    address payable[] public players;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only");
        _;
    }

    function participate() public payable {
        require(msg.value == 1 ether, "Invalid amount");
        players.push(payable(msg.sender));
    }

    function random() internal view returns(uint){
      return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));
    }

    function settleLottery() public onlyOwner returns (address) {
        uint r = random();
        uint index = r%players.length;
        address payable winner = players[index];
        winner.transfer(address(this).balance);
        return winner;
    }
}