// This contract servces as an example contract that I want to create an interface for
// I do not want to copy and past this code to my smart contract so I will create an
// Interface for it.
pragma solidity ^0.8.3;

contract Counter {
	uint public count;

	function inc() external {
		count += 1;
	}

	function dec() external {
		count -= 1;
	}
}