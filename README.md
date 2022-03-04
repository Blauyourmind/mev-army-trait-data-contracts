# MEV Army Collection: On-Chain Trait Data Contracts

MEV Army NFT Contract (Mainnet):
[0x99cd66b3D67Cd65FbAfbD2fD49915002d4a2E0F2](https://etherscan.io/address/0x99cd66b3D67Cd65FbAfbD2fD49915002d4a2E0F2#code)

MEV Army Trait Data Contract (Mainnet):
[0xDa10ec807c17A489Ebd1DD9Bd5AAC118C2a43169](https://etherscan.io/address/0xda10ec807c17a489ebd1dd9bd5aac118c2a43169#readContract)

MEV Army Trait Data Contract (Rinkeby):
[0x7c2Dd85e0529D02b7CCF0Bd17F22693FCf5AE135](https://rinkeby.etherscan.io/address/0x7c2Dd85e0529D02b7CCF0Bd17F22693FCf5AE135#readContract)

Official Documentation:
[here](https://michael-blau.gitbook.io/mev-army-trait-data-documentation/)

# Technical Overview

All 9999 MEV Army trait combinations are packed tightly and stored in ~2500 256-bit integers in the MEV Army Trait Data Contract.

The trait bit packing works as follows:
- First, the seven traits of each edition can be represented as a series of 8-bit integers (i.e., one 8-bit integer per trait).
- These seven 8-bit integers are then packed into a 64-bit integer. In other words, each full NFT can be represented as a single 64-bit integer.
- Finally, four 64-bit integers (representing four NFTs) are packed into a 256-bit integer. This allows me to store four NFT trait combinations in a single storage slot in the smart contract.

## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions or loss of transmitted information. THE SMART CONTRACTS CONTAINED HEREIN ARE FURNISHED AS IS, WHERE IS, WITH ALL FAULTS AND WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING ANY WARRANTY OF MERCHANTABILITY, NON- INFRINGEMENT OR FITNESS FOR ANY PARTICULAR PURPOSE. Further, use of any of these smart contracts may be restricted or prohibited under applicable law, including securities laws, and it is therefore strongly advised for you to contact a reputable attorney in any jurisdiction where these smart contracts may be accessible for any questions or concerns with respect thereto. Further, no information provided in this repo should be construed as investment advice or legal advice for any particular facts or circumstances, and is not meant to replace competent counsel. x0r labs is not liable for any use of the foregoing, and users should proceed with caution and use at their own risk._