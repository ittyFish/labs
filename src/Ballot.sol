// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Ballot {


//details voter
//struc is like an oop object in other languages
    struct Voter {
        uint weight; 
        bool voted; 
        address delegate;
        uint vote;
    }

    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    address public chairperson;   //כתובת יושב ראש 

    mapping(address => Voter) public voters;   //create like a Dictionary voters <address,value>  in c# 

    Proposal [] public proposals;   //an array of proposals (struct Proposal)


    constructor(bytes32[] memory proposalNams ) {
       chairperson = msg.sender;  //put the caller address into the chairperson 
       voters[chairperson].weight = 1; //put 1 as a value to the chairperson's weight

       for (uint i=0; i < proposalNams.length; i++) //put all the proposals (from bytes32[] memory proposalNams ) 
       {                                          //to the array
       proposals.push(Proposal({
        name : proposalNams[i],
        voteCount : 0
       }));


       }
    }

    function giveRightToVote(address voter) public {
        require(  //check if the caller is the chairperson
        msg.sender == chairperson ,
        "Only chairperson can give right to vote."
        );
        require(//check if the voter not already voted
            !voters[voter].voted,
            "The voter already voted"
        );

        require(voters[voter].weight == 0);//Checks if he still doesn't have the right to vote

        voters[voter].weight = 1;  //gives the right to vote

    }


    function delegate(address to) public {

        Voter storage sender = voters[msg.sender]; //put the current voter to sender
        //what is "storage" exactly?
        require(!sender.voted, " You already voted."); //check if you already voted
        require(to != msg.sender, " Self-delegation is disallowed.");  //check if you dont vote for yourself

    
        while (voters[to].delegate != address(0)) 
        {
            to = voters[to].delegate;   //changed "to" to his delegate
            require(to != msg.sender , " found loop in delegation");
        }
        sender.voted = true; //sender voted!
        sender.delegate = to;  //update the delegate
        Voter storage delegate_ = voters[to];

        if (delegate_.voted){
            proposals[delegate_.vote].voteCount += sender.weight; 
        } else {
           delegate_.weight +=  sender.weight;
        }
    }


    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(sender.weight !=0 , " Has no right to vote"); //check if the sender have a right to vote
        require(!sender.voted , " Already voted. "); //check if not already voted.  
        sender.voted = true;  //sender vote
        sender.vote = proposal;  

        proposals[proposal].voteCount += sender.weight; //add the value
        
    }

    function winningProposal() public view  //view - canot changes
       returns (uint winningProposal_)
       {
        uint winningVoteCount = 0; 
        for(uint p = 0 ; p < proposals.length ; p++){ //over all the proposals
            winningVoteCount = proposals[p].voteCount; //put winner score
            winningProposal_ = p;  //put the winner
        }
       } 

    function winnerName() public view  //show the winnerName
       returns (bytes32 winnerName_)    
       {
        winnerName_ = proposals[winningProposal()].name;
       } 
}
