// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Raffle
 * @author Aapsi Khaira
 * @dev A contract for a raffle which implements chainlink VRF v2.5
 * @notice This contract is for creating a raffle
 */
contract Raffle{

    // errors
    error Raffle_SendMoreToEnterRaffle();

    uint256 private immutable i_entryFee;

    /**
     * @dev The interval is the time after which the winner will be picked
     */
    uint256 private immutable i_interval;
    address payable[] private s_players;

    // events
    event RaffleEntered(address indexed player, uint256 amount);


    constructor(uint256 entryFees, uint256 interval) {
        i_entryFee = entryFees;
        i_interval = interval;
    }

    function enterRaffle() public payable{
        if(msg.value != i_entryFee){
            revert Raffle_SendMoreToEnterRaffle();
        }

        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender, msg.value);

    }

    function pickWinner() public {
        

    }


    /**
     * @dev Returns the entry fee
     */
    function getEntryFee() public view returns(uint256){
        return i_entryFee;
    }
}
