
/*
FraudSmartContractTest.sol serves as a backend Solidity smart
contract underlying the basis of ETHFraudSimualtor.

Network: Rinkeby

The finacial fraud scheme demonstrated in this is a
classic ponzi scheme involving (Fake Ether)/Rinkeby TestNet distribution of Ether.
Interesting features to note that at its simplest form, this smrt contract could 
repersent the underlying idea behind fraudlent ICOs or Initial Coin Offerings, where 
malicious individuals raise cryptocurreny funding using smart contracts through investors,
in false promises of creating a new cryptocurrency with "special features." Those said malicious 
individuals would then act in a classic manner of a Ponzi scheme and take the largest fundings and leave.

*More detailed report to be made and added seperately soon*


Key features to add:
-Timestamp auth
-Perhaps a UI in the future
-Serve for data analytics
-Compiled & run on Remix IDE, perhaps use on Geth for private networks
-Smart contracts will follow predetermined instructions, cannot just run
-Immediately cut costs and increase efficiency for those wiring money internationally

Disable time mechanism for testing
*/


pragma solidity ^0.4.10;


contract ETHPonzi{
	uint public totalDeposits;
	uint private fee;
	uint public roi_rate;
	uint after_fee_income;
	uint minTimeDiff;

	address public scheme_leader;

	bool trans_attempt;


	//Hash tables
	mapping (address => uint) public balances;
	mapping (address => uint) public current_net_income;
	mapping (address => uint) public cumulativeIncome;
	mapping (address => uint) public depositsTS;  //timestamp collection
	mapping (uint => address) public _address;


	//Modifier for contract owner profit withdrawal
	modifier onlyOwner(){
		if (msg.sender != scheme_leader){
			revert();
		}
		_;
	}


	//Events
	event UpdateStatus(string _msg, uint _amount, address _address);
	event UserStatus(string _msg, address user, uint amount);

	//Constructor
	function ETHPonzi(){
		scheme_leader = msg.sender;
		totalDeposits = 0;
		roi_rate = 5;  //Float type not supported by solidity
		minTimeDiff = 0; //1 hour of delay time
	}

	//Getter functions
	function getBalance() constant returns (uint balance){
		return balances[msg.sender];
	}


	function getCumulativeIncome() constant returns (uint balance){
		return cumulativeIncome[msg.sender];
	}
  

	function deposit() payable{
		totalDeposits += 1;
		_address[totalDeposits] = msg.sender; //set new depositor as the current address call
		balances[msg.sender] += msg.value;  //Add number of wei sent with message to depositor address
		feeProcess();
	}

	//----------------------------------------------------------------------------------------------------


	//General withdraw function
	function withdraw() {
		if (((block.timestamp - depositsTS[msg.sender])/3600/24) >= minTimeDiff){

			if (this.balance >= (balances[msg.sender] + cumulativeIncome[msg.sender])){
				
				msg.sender.transfer(balances[msg.sender] + cumulativeIncome[msg.sender]); //Withdraw full balance and send to caller address
		
				balances[msg.sender] = 0;  
				current_net_income[msg.sender] = 0; //<------------??
				depositsTS[msg.sender] = block.timestamp;
			}
		}
	}


	//Msg.sender is always the address of the current caller of the function
	//If difference is greater than 1 day
	//Pays owner using other investor funds
	function feeProcess(){
		if (((block.timestamp - depositsTS[msg.sender])/3600/24) >= minTimeDiff){
			
			if (balances[msg.sender] > 0){

				//Net income is 0 in first calc, next is current balance with after-tax profit
				fee = (((balances[msg.sender] + current_net_income[msg.sender]) * roi_rate) / 100); //Conversion is done in wei
				after_fee_income = (balances[msg.sender] + current_net_income[msg.sender]) - fee;


				if (this.balance > 0){
					scheme_leader.transfer(fee);  //Send funds to contract owner
				}
				
				current_net_income[msg.sender] += after_fee_income;
				cumulativeIncome[msg.sender] += after_fee_income;
				depositsTS[msg.sender] = block.timestamp;
				//UpdateStatus("Fee has been sent from address:", fee, msg.sender);
					/*console.log("Balances now: \n" + 
						"Sender:" +
						"Leader:" + )*/
			}
			
			
		}
	}


	//purely for scheme leader, all profits withdrawn
	//take the money and run
	//this is a pointer to current contract address
	function withdrawNetIncome() onlyOwner{
		if (((block.timestamp - depositsTS[msg.sender])/3600/24) >= minTimeDiff){

			if (this.balance > current_net_income[msg.sender]){  //Meaning it's not just the original deposit
				msg.sender.transfer(current_net_income[msg.sender]);
				current_net_income[msg.sender] = 0;
				UserStatus("All funds have been withdrawn", msg.sender, current_net_income[msg.sender]);
				feeProcess();
			}
		}
	}

	
	//function withdraw profit
	//function recalculate money pool, incorporate TVOM?
	//When will scheme collapse?
	//Self destruct == caught 
		//selfdestruct(address recipient), send funds to address recipient
	//Next project ideas - research taxation/government systems?
	//

}