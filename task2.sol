pragma solidity ^0.8.1;

contract First{

    uint age = 56;

    function doSomeWork() public view {
       
    }

    function getAge() public view returns (uint) {
        uint a = age * 2;
        doSomeWork ();
        return age;
    }
       
    }
