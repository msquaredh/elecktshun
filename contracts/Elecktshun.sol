pragma solidity ^0.4.2;

contract Elecktshun {
    // Model candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
        bool isValid;
    }
    // Voter map
    mapping (address => bool) public voters;
    // Candidate i/o
    mapping(uint => Candidate) public candidates;
    // Store candidate count
    uint public candidateCount;
    // voted event
       event votedEvent (
           uint indexed _candidateId
       );

    constructor() public {
        addCandidate("Mardoggy");
        addCandidate("Heebs");
    }

    function addCandidate (string _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0, true);
    }

    function vote(uint _candidateID) public {
        // Address hasn't voted already
        require(!voters[msg.sender]);

        // We are voiting for a valid candidate
        require(candidates[_candidateID].isValid);

        // Mark as voted
        voters[msg.sender] = true;

        // Apply vote to candidatea
        candidates[_candidateID].voteCount++;

        // Fire voted event to the client
         votedEvent(_candidateID);
    }
}
