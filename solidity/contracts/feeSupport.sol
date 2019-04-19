pragma solidity ^0.5.0;
import './ownable.sol';

/**
 * @title FeeSupport
 * @author Duncan
 * @dev The FeeSupport contract is used to support post contract, making it capable set postFee and collect fee from the contract.
 */
contract FeeSupport is Ownable{
    
    uint postFee = 1e15; // wei
    uint addTxHashFee = 1e16; // wei
    /**
     * @dev withdraw money from the contract to owner
     */
    function withdraw() external onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
    
    /**
     * @dev setter of postFee
     */    
    function setPostFee(uint _fee) external onlyOwner {
        postFee = _fee;
    }   
    
    /**
     * @return fee needed to post an article
     */      
    function getPostFee() public returns (uint) {
        return postFee;
    }
    
    /**
     * @return return the current balance the contract has
     */       
    function balance() public view onlyOwner returns (uint)  {
        return address(this).balance;
    }
    
    /**
     * @dev the modifier is used on any function requiring postFee 
     */     
    modifier chargePostFee() {
        require(msg.value >= postFee);
        _;
    }
    
    modifier chargeAddTxHashFee() {
        require(msg.value >= addTxHashFee);
        _;
    }
    
}