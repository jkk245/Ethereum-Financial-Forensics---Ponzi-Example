# Ethereum-Financial-Forensics---Ponzi-Example

<b>Synopsis:</b>

Ethereum Financial Forensics - Ponzi Example is a decentralized application (dApp)
that simulates the application of a Ponzi scheme using test Ether and smart contract exchanges. 

The purpose of this project is to show behind-the-scenes basic contract-to-contract Ether exchanges within a Ponzi scheme, and why we should be more careful when evaluating ICOs and investing in cryptocurrency ventures. One should question the true value of what a venture firm would offer, along with its legal and regulatory aspects, financial risk, blockchain security, and much more.

More useful articles detailed crytocurrency fraud on the rise: \n
https://finance.yahoo.com/news/rise-cryptocurrency-ponzi-schemes-160152688.html 

More info on determining the ICO value of cryptocurrency-backed ventures: \n
https://medium.com/blockchain-media/how-to-evaluate-an-initial-cryptocurrency-offering-ico-1bc238cff0ae

Addtional links on terminlogy and general understanding of Ethereum, and blockchains: \n
https://www.coindesk.com/information/what-is-a-decentralized-application-dapp/

<b>Some useful defintions:</b>
- Initial Coin Offering (ICO):
An unregulated means by which funds are raised for a new cryptocurrency venture. An Initial Coin Offering is used by startups to bypass the rigorous and regulated capital-raising process required by venture capitalists or banks. In an ICO campaign, a percentage of the cryptocurrency is sold to early backers of the project in exchange for legal tender or other cryptocurrencies, but usually for Bitcoin.

- Ponzi Scheme:
An investment swindle in which high profits are promised from fictitious sources and early investors are paid off with funds raised from later ones.

This app involves using a (Fake Ether)/Rinkeby TestNet distribution of Ether.
Interesting features to note that at its simplest form, this smart contract
represents part of the underlying idea behind fraudulent ICOs or Initial Coin Offerings, where 
malicious individuals/firms raise cryptocurreny funds using smart contracts through investors,
in false promises of creating a new cryptocurrency with "special features." Those said malicious 
individuals would then act in a classic manner of a Ponzi scheme and take the largest fundings and leave.
On another intresting note, by using smart contracts, it implies that this application does not need a database, as the 
Rinkeby blockchain records all artificial transactions, as this app is managed without a central leader.


<b>Tools/Languages involved:</b>
- Solidity (Smart contract oriented programming language) 
- Metamask
- Rinkeby test network
- Remix IDE (Online test network compilier for Solidity smart contracts)
- Javascript (TBA)
- HTML/CSS (TBA)

<b>Note:</b>
This dApp is still WIP, as it was first developed at ETHWaterloo, a Waterloo-based Ethereum dApp hackathon.
The full scale of this project is meant to be a web application, as currently only the smart contract backend code
is defined.
Features to add:
- UI (need to learn JS)
- Bugs in transferring Ether to scheme_leader
- Debate about time lag mechanism between transactions
- Testing in geth/nodejs 


<b>Instructions for demonstration of the smart contract on Remix IDE:</b>
(I apologize for the complexity, I will write and update a more succint and better detailed tutorial soon)
1) Download Metamask, a chrome extension that acts as an Ethereum Wallet, if you do not already own an account
IMPORTANT: Make sure to set your network to Rinkeby test network, we are experimenting with test Ethereum
2) Create a github account/use your own to set up a gist with your Metamask wallet address pasted in it
3) Head over to https://www.rinkeby.io/#faucet and paste your gist URL, this faucet will donate "fake" free Ether to your account for testing purposes
4) Open FraudSmartContractTest.sol with your IDE of choice (Sublime Text should work) and paste its contents in https://remix.ethereum.org/#version=soljson-v0.4.18+commit.9cf6e910.js, this acts as an online test compilier for Solidity smart contracts. Delete the default test code that remix always leaves in its environment, paste, and the code should auto compile. Finish by clicking the Create button to create the smart contract.
5) Set the compilier environment to Injected Web3 if you want to test with your own wallet with test Ether/Javascript VM for a choice of virtual test Ether within the compilier
5) Create the contract on the Remix IDE and you should see various accessor and mututator functions, as well as fake Ethereum address which represent fake accounts within the scheme for transferring your test Ethereum within
6) In the top right, you should see a Value bar, this would serve as the amount of Ether you would enter for each transactions (limited to to your wallet if you chose Injected Web3/Any infinite amount of your choosing if you chose Javscript VM)
====== TO BE CONTINUED ===== >
