// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address private owner; //Owner of this contract

    constructor () {
        owner = msg.sender; //Deployer becomes the owner
    }

    mapping (string => uint) public receivedVote;  //Candidate → total votes
    mapping (address => bool) public alreadyVoted; //Track if user has already voted

    event VoteTrack(address indexed voters, string candidate); //Event: track who voted for whom

    string[] private candidates; //Store all candidates list

    // Add new candidate (only owner can call this)
    function addCandidates(string memory _candidate) public {
        require(owner == msg.sender, "You are not owner");
        candidates.push(_candidate);
    }

    // Vote for a candidate
    function vote(string memory _candidate) public {
        require(alreadyVoted[msg.sender] != true, "You have already voted");

        receivedVote[_candidate] += 1;   // increase vote count
        alreadyVoted[msg.sender] = true; // mark user as voted

        emit VoteTrack(msg.sender, _candidate); // fire event
    }

    // Get all candidates
    function getAllCandidates() public view returns (string[] memory) {
        return candidates;
    }
}
