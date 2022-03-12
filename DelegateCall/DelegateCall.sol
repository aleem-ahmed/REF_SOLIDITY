/// Delegatecall is a low level function similar to call. When contract A 
/// executes delegatecall to contract B, B's code is executed with contract A'storage,
/// msg.sender and msg.value.

/// When a contract makes a function call using delegatecall it loads the function code
/// from another contract and executed it as if it were its own code

pragma solidity ^0.8.3;

contract ContractB {
	uint public num;
	address public sender;
	uint public value;

	function setVars(uint _num) external payable {
		num = _num;
		sender = msg.sender;
		value = msg.value;
	}
}

contract ContractA {
	uint public num;
	address public sender;
	uint public value;

	function setVars(address _contract, uint _num) external payable {
		// [DELEGATE-CALL] Method 1 of doing a delegate call //
		(bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
	}

	function setVars_alternative(address _contract, uint _num) external payable {
		// [DELEGATE-CALL] Method 2 of doing a delegate call //
		(bool success, bytes memory data) = _contract.delegatecall(
			abi.encodeWithSelector(ContractB.setVars.selector, _num)
		);
	}
}