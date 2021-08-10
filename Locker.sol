pragma solidity ^0.5.1;

contract Locker {
    address payable public beneficiery;
    
    uint256 public releaseTime;
    
    constructor(
        address payable _beneficiery,
        uint256 _releaseTime) public payable
        {
            require (_releaseTime > block.timestamp);
            beneficiery = _beneficiery;
            releaseTime = _releaseTime;
        }
        
        function release() public {
            require(block.timestamp >= releaseTime);
            address(beneficiery).transfer(address(this).balance);
        }
} 
