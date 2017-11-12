# Ethereum-Financial-Forensics---Ponzi-Example

<b>Synopsis:</b>

Ethereum Financial Forensics - Ponzi Example is a decentralized application (dApp)
that simulates the application of a Ponzi scheme using test Ether and smart contract exchanges. 


It involves using a (Fake Ether)/Rinkeby TestNet distribution of Ether.
Interesting features to note that at its simplest form, this smart contract could 
represent the part of the underlying idea behind fraudulent ICOs or Initial Coin Offerings, where 
malicious individuals raise cryptocurreny funding using smart contracts through investors,
in false promises of creating a new cryptocurrency with "special features." Those said malicious 
individuals would then act in a classic manner of a Ponzi scheme and take the largest fundings and leave.


<b>Tools/Languages involved:</b>
- Solidity (Smart contract oriented programming language) 
- Metamask
- Rinkeby test network
- Javascript (TBA)
- HTML/CSS (TBA)


<b>Instructions:</b>
(I apologize for the complexity, I will write and update a more succint and better detailed tutorial soon)
1) Download Metamask, a chrome extension that acts as an Ethereum Wallet, if you do not already own an account
IMPORTANT: Make sure to set your network to Rinkeby test network, we are experimenting with test Ethereum
2) Create a github account/use your own to set up a gist with your Metamask wallet address pasted in it
3) Head over to https://www.rinkeby.io/#faucet and paste your gist URL, this faucet will donate "fake" free Ether to your account for testing purposes
4) Open ETHFraudSimulator.sol with your IDE of choice and paste its contents in https://remix.ethereum.org/#version=soljson-v0.4.18+commit.9cf6e910.js, this acts as an online test compilier for Solidity smart contracts. Delete the default test code that remix always leaves in its environment, paste, and the code should auto compile. Finish by clicking the Create button to create the smart contract.
5) Set the compilier environment to Injected Web3 if you want to test with your own wallet with test Ether/Javascript VM for a choice of virtual test Ether within the compilier
5) Create the contract on the Remix IDE and you should see various accessor and mututator functions, as well as fake Ethereum address which represent fake accounts within the scheme for transferring your test Ethereum within
6) In the top right, you should see a Value bar, this would serve as the amount of Ether you would enter for each transactions (limited to to your wallet if you chose Injected Web3/Any infinite amount of your choosing if you chose Javscript VM)
====== TO BE CONTINUED ===== >
