pragma solidity ^0.4.25;
import "./ownable.sol";
import "./feeSupport.sol";

contract Post is FeeSupport{

    uint256[] txHashes;
    
    function post(uint256 _replyTxHash, string memory _content) public {}
    
    function addPostTxHashes(uint256 _postTxHash) public payable {
        // currently, there is no way to check if tx exists by solidity
        // One must pay to use this function
        require(msg.value == postFee);
        txHashes.push(_postTxHash);
    }
    
    function getTxHashes() public view returns(uint256[] memory) {
        return txHashes;
    }
    
}