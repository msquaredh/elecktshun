pragma solidity ^0.4.2;

contract Elecktshun {
    // Model candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store candidate
    // Fetch candidate
    mapping(uint => Candidate) public candidates;
    // Store candidate count
    uint public candidateCount;

    function Elecktshun() public {
        addCandidate("Mardoggy");
        addCandidate("Heebs");
    }

    function addCandidate (string _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
}
