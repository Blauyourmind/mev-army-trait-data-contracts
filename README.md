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





