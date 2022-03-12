pragma solidity ^0.8.3;

interface ICounter {
	// [READ] Variable stored in the external contract //
	function count() external view returns (uint);
	

	// [CALL] the function in the external contract //
	function inc() external;
}


contract CallInterface {
	uint public count;

	function examples(address _counter) external {
		ICounter(_counter).inc();

		count = ICounter(_counter).count();
	}
}