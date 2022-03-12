pragma solidity ^0.8.3;

contract TestDelegateCall {
	uint public num;
	address public sender;
	uint public value;

	function setVars(uint _num) external payable {
		num = _num;
		sender = msg.sender;
		value = msg.value;
	}
}

contract DelegateCall {
	uint public num;
	address public sender;
	uint public value;

	function setVars(address _test, uint _num) external payable {
		// [DELEGATE-CALL] Method 1 of doing a delegate call //
		_test.delegatecall(
			abi.encodeWithSignature("setVars(256)", _num)
		);

		// [DELEGATE-CALL] Method 2 of doing a delegate call //
		_test.delegatecall(
			abi.encodeWithSelect(TestDelegateCall.setVars.selector, _num);
		);
	}
}