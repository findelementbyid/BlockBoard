pragma solidity ^0.4.25;
import './ownable.sol';

contract FeeSupport is Ownable{
    
    uint postFee = 1e18; // wei
    
    // function withdraw() external onlyOwner {
    //     address _owner = owner();
    //     _owner.transfer(address(this).balance);
    // }
    
    function setPostFee(uint _fee) external onlyOwner {
        postFee = _fee;
    }    
    
}