// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title MEV Army On-Chain Trait Data
/// @author x0r
/// @notice Use this contract to access MEV Army trait data

contract MEVArmyTraitData is Ownable {

    address public MEV_ARMY_NFT_CONTRACT;
    
    string [] public binary = ["1", "0"];
    string [] public legion = ["generalized frontrunner","backrunner","time bandit","sandwicher","liquidator","searcher"];
    string [] public light = ["double band light","triple light","triangle light","basic light","x0r spinning light","one band light","x0r static light","eth light"];
    string [] public mouth = ["v mouth","lego mouth","smile mouth","box mouth","toothless mouth","electric mouth","stitched mouth","jagged mouth","o mouth","fang mouth","skull mouth","muzzle mouth"];
    string [] public helmet = ["three prong helmet","one prong helmet","elite one prong","basic helmet","elite three prong helmet"];
    string [] public eyes = ["eth eyes","eth pupil eyes","angry eyes","spider pupil eyes","moon eyes","wink eyes","scoop eyes","closed eyes","spider eyes","cry eyes","circle eyes","snake eyes","glass eyes","x eyes","fly eyes","glass rim eyes"];
    string [] public faces = ["hourglass face", "mushroom face", "lego face", "octa face", "diamond face", "skull face", "hollow face", "cube face", "arrow face"];

    mapping(uint256 => uint256) public EDITION_SLOTS;
    

    /** 
    * @dev Get the raw trait indices for a given tokenId
    * @param tokenId of a MEV Army NFT 
    * @return An array of integers that are indices for the trait arrays stored in this contract
    *   example: [ binary index, legion index, light index, mouth index, helmet index, eyes index, faces index ]
    **/
    function getTraitsIndices(uint256 tokenId) external view returns (uint256 [] memory){
       return _getTraitsIndices(tokenId);
    }



    /** 
    * @dev Get the decoded traits for a given tokenId
    * @param tokenId of a MEV Army NFT 
    * @return An array of strings containing each trait
    **/
    function getTraitsDecoded(uint256 tokenId) external view returns (string [7] memory){
        uint256 [] memory unpackedEdition = _getTraitsIndices(tokenId);

        return [
            binary[unpackedEdition[0]],
            legion[unpackedEdition[1]],
            light[unpackedEdition[2]],
            mouth[unpackedEdition[3]],
            helmet[unpackedEdition[4]],
            eyes[unpackedEdition[5]],
            faces[unpackedEdition[6]] 
        ];
    }



    /** 
    * @dev Get the raw trait indices for a given tokenId
    * @param tokenId of a MEV Army NFT 
    * @return An array of integers that are indices for the trait arrays stored in this contract
    *   example: [ binary index, legion index, light index, mouth index, helmet index, eyes index, faces index ]
    **/
    function _getTraitsIndices(uint256 tokenId) internal view returns (uint256 [] memory){
        require(tokenId > 0 && tokenId < 10000, "nonexistent tokenId");

        // calculate the slot for a given token id
        uint256 slotForTokenId = (tokenId - 1) / 4;

        // calculate the index within a slot for a given token id
        uint256 slotIndex = ((tokenId - 1) % 4);

        // get the slot from storage and unpack it
        uint256 slot = EDITION_SLOTS[slotForTokenId];
        uint256 [] memory unpackedSlot = unPackSlot(slot);

        // get the edition from the slot and unpack it
        return unPackEdition(unpackedSlot[slotIndex]);
    }



    /**
    * @dev Unpack a slot. Each slot contains 4 packed trait arrays for 4 MEV Army editions.
    *   Each packed trait array is represented as a 64-bit unsigned integer. 
    **/
    function unPackSlot(uint256 _slot) internal pure returns (uint256 [] memory){
        uint256 [] memory result = new uint256 [](4);
        uint256 slot = _slot;

        for(uint256 i = 0; i < result.length; i++){
            result[i] = slot & uint256(type(uint64).max);
            slot = slot >> 64;
        }

        return result;
    }



    /**
    * @dev Unpack an edition. Each edition contains 7 traits packed into an unsigned integer.
    *   Each packed trait is an 8-bit unsigned integer.
    **/
    function unPackEdition(uint256 _edition) internal pure returns (uint256 [] memory){
        uint256[] memory result = new uint256[](7);
        uint256 edition = _edition;

        for(uint256 i = 0; i < result.length; i++){
            result[i] = (edition & uint256(type(uint8).max)) - 1;
            edition = edition >> 8;
        }

        return result;
    }





    ////// SETUP FUNCTIONS //////

    function storeEditionSlots(uint256 startIndex, uint256 [] calldata editionSlots) external onlyOwner{

        for(uint256 i = 0; i < editionSlots.length; i++){
         EDITION_SLOTS[startIndex] = editionSlots[i];
            startIndex++;
        }

    }


    function setEditionSlot(uint256 index, uint256 editionSlot) external onlyOwner {
        EDITION_SLOTS[index] = editionSlot;
    }

    function setMEVArmyContract(address contractAddress) external onlyOwner {
        MEV_ARMY_NFT_CONTRACT = contractAddress;
    }


    function setTraitStrings(
        string [] memory _faces,
        string [] memory _eyes,
        string [] memory _helmet,
        string [] memory _mouth,
        string [] memory _light,
        string [] memory _legion,
        string [] memory _binary
        ) external onlyOwner {
            if (_faces.length > 0){ faces = _faces; }
            if (_eyes.length > 0){ eyes = _eyes; }
            if (_helmet.length > 0){ helmet = _helmet; }
            if (_mouth.length > 0){ mouth = _mouth; }
            if (_light.length > 0){ light = _light; }
            if (_legion.length > 0){ legion = _legion; }
            if (_binary.length > 0){ binary = _binary; }
        }

}

