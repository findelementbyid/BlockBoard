pragma solidity ^0.5.0;
import "./ownable.sol";
import "./feeSupport.sol";

/**
 * @title Post
 * @author Duncan
 * @dev The Post contract provides simple operations to leave message and fetch txhash on ethereum via transaction data.
 *      Users simply sends message to "post" method, and get the txhash.
 *      Then they send the txhash to "addPostTxHashes" method, making the txhash easily accessible via the contract.
 *      Readers can get all the post txhashes and then get the message by asking full nodes with txhashes.
 */
contract Post is FeeSupport{
    
    uint256[] postTxHashes;
    
    /**
     * @dev The purpose of the function is to make _replyTxHash and _content recorded in transaction data on chain.
     *      An payable empty function is sufficient to do so.
     */
    function post(uint256 _replyTxHash, string memory _content) public payable chargePostFee{}
    
    /**
     * @dev After post method called, one can choose if they want the txhash recorded by 
     *      Currently, there is no way to check if txhash exists on chain by solidity
     *      To prevent abusement, One must pay to use this function
     */
    function addPostTxHashes(uint256 _postTxHash) public payable chargeAddTxHashFee {
        postTxHashes.push(_postTxHash);
    }
    
    /**
     * @return All the txhashes will be returned and readers can use them to query full nodes to get messages.
     */    
    function getPostTxHashes() public view returns(uint256[] memory) {
        return postTxHashes;
    }
    
}