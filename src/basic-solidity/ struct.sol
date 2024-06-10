// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0
pragma solidity ^0.8.24;

contract ToDos{
    struct ToDo{
        string txt;
        bool complited;
    }
    ToDo[]todo;

    function create( string calldata _txt) public{
        todo.push(ToDo(_txt,false));

        todo.push(ToDo({txt:_txt,complited:true}));

        ToDo memory todos;
        todos.txt=_txt;
        todo.push(todos);

    }
    function get(uint256 index) public view returns(string memory _txt, bool _complited){
        ToDo storage todos = todo[index];
        return(todos.txt,todos.complited);
    }
    function updateText(uint256 index,string calldata _txt) public{
        ToDo storage todos= todo[index];
        todos.txt = _txt;
    }
    function toggleCompleted(uint256 index)public{
        ToDo storage todos = todo[index];
        todos.complited = !todos.complited;
    }
}