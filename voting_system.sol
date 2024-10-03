// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Proposal {
        string name;
        uint voteCount;
    }

    address public owner; // Dirección del propietario (quien puede agregar propuestas)
    mapping(address => bool) public whitelist; // Direcciones permitidas para votar
    mapping(address => bool) public hasVoted; // Registro de quién ya votó
    Proposal[] public proposals; // Lista de propuestas
    uint public votingDeadline; // Fecha límite para votar

    // Errores generales

    //string public _1 = "User no authorize";
    //string public _2 = "User no Invited";
    //string public _3 = "The voting date has already been closed";
    //string public _4 = "Your vote already exist";
    



    modifier onlyOwner() {
        require(msg.sender == owner, "User no authorize");
        _;
    }

    modifier onlyWhitelist() {
        require(whitelist[msg.sender], "No estas en la whitelist para votar.");
        _;
    }

    modifier withinVotingPeriod() {
        require(block.timestamp <= votingDeadline, "El periodo de votacion ha terminado.");
        _;
    }

    constructor() {
        owner = msg.sender; // La persona que despliega el contrato es el propietario
        votingDeadline = block.timestamp + 3 days; // La votación dura 3 días desde el despliegue
    }

    // Método para que el propietario añada una nueva propuesta
    function addProposal(string memory proposalName) public onlyOwner {
        proposals.push(Proposal({
            name: proposalName,
            voteCount: 0
        }));
    }

    // Método para agregar direcciones a la whitelist
    function addToWhitelist(address voter) public onlyOwner {
        whitelist[voter] = true;
    }

    // Método para que las direcciones en la whitelist voten
    function vote(uint proposalIndex) public onlyWhitelist withinVotingPeriod {
        require(!hasVoted[msg.sender], "Ya has votado.");

        Proposal storage proposal = proposals[proposalIndex];
        proposal.voteCount += 1;
        hasVoted[msg.sender] = true; // Marca que esta dirección ya ha votado
    }

    // Método para obtener el número de propuestas
    function getProposalsCount() public view returns (uint) {
        return proposals.length;
    }

    // Método para obtener detalles de una propuesta específica
    function getProposal(uint index) public view returns (string memory, uint) {
        Proposal storage proposal = proposals[index];
        return (proposal.name, proposal.voteCount);
    }
}
