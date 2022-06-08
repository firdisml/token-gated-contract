// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Draw is Initializable {
    address[] internal participants;
    uint256 internal drawID;
    uint256 internal drawPrize;
    uint256 internal drawRequirement;
    mapping(uint256 => address) internal drawHistory;

    function __Draw_init() internal onlyInitializing {
        __Draw_init_unchained();
    }

    function __Draw_init_unchained() internal onlyInitializing {
        drawID = 1;
    }

    //Get Draw Winner

    function _getWinner(uint256 _drawID) internal view returns (address) {
        return drawHistory[_drawID];
    }

    //Set Draw Prize

    function _setPrize(uint256 _drawPrize) internal {
        drawPrize = _drawPrize;
    }

    //Set Draw Requirement

    function _setRequirement(uint256 _drawRequirement) internal {
        drawRequirement = _drawRequirement;
    }

    //Get Draw Prize
    function _getPrize() internal view returns (uint256) {
        return drawPrize;
    }

    //Get Draw ID

    function _getdrawID() internal view returns (uint256) {
        return drawID;
    }

    //Get Draw Requirement

    function _getRequirement() internal view returns (uint256) {
        return drawRequirement;
    }

    //Get Draw Participants

    function _getParticipants() internal view returns (address[] memory) {
        return participants;
    }

    //Enter Draw

    function _enterDraw(address _participant) internal {
        participants.push(_participant);
    }

    //Pick Draw Winner

    function _pickWinner(uint256 _randomNumber) internal returns (address) {
        uint256 index = _randomNumber % participants.length;
        drawHistory[drawID] = participants[index];
        drawID++;
        return participants[index];
    }

    //Reset Draw

    function _resetDraw() internal {
        participants = new address[](0);
        drawPrize = 0;
    }
}
