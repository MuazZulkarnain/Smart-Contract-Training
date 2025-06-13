// Start

// - minimal
// - decentralized voting

// -> owner to add candidate
// -> user can only vote once
// -> anyone query candidate details and vote counts


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Distributed_Voting {
    address public owner;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    mapping(address => bool) public hasVoted;

    struct Candidate {
        string name;
        string details;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates; // candidate ID => Candidate
    uint256[] public candidateIds;
    uint256 public nextCandidateId;

    function addCandidate(string memory name, string memory details) public onlyOwner {
        candidates[nextCandidateId] = Candidate(name, details, 0);
        candidateIds.push(nextCandidateId);
        nextCandidateId += 1;
    }

    function voteCandidate(uint256 candidateId) public {
        require(!hasVoted[msg.sender], "You can vote only once");
        require(bytes(candidates[candidateId].name).length > 0, "Candidate doesn't exist");

        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount += 1;
    }

    function getCandidate(uint256 candidateId) public view returns (string memory name, string memory details, uint256 voteCount) {
        Candidate storage c = candidates[candidateId];
        return (c.name, c.details, c.voteCount);
    }
}