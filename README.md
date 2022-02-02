# MEV Army Collection: On-Trait Data Contracts


**Official Documentation: **
https://michael-blau.gitbook.io/mev-army-trait-data-documentation/

# Technical Overview

All 9999 trait combinations are packed tightly and stored in ~2500 256-bit integers in the MEV Army Trait Data Contract.

The trait bit packing works as follows:
- First, the seven traits of each edition can be represented as a series of 8-bit integers (i.e., one 8-bit integer per trait).
- These seven 8-bit integers are then packed into a 64-bit integer. In other words, each full NFT can be represented as a single 64-bit integer.
- Finally, four 64-bit NFTs are packed into a 256-bit integer. This allows me to store 4 NFT trait combinations in a single storage slot in the smart contract.





