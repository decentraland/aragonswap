pragma solidity ^0.6.6;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/drafts/TokenVesting.sol';

contract TwoYearVesting is TokenVesting {

    uint256 YEAR_TO_DAYS = 365;
    uint256 DAY_TO_HOURS = 24;
    uint256 HOUR_TO_MINUTES = 60;
    uint256 MINUTE_TO_SECONDS = 60;
    
    uint256 TWO_YEARS_VESTING = 2 * YEAR_TO_DAYS * DAY_TO_HOURS * HOUR_TO_MINUTES * MINUTE_TO_SECONDS;
    uint256 NO_CLIFF = 0;
    uint256 MAY_15_2020 = 1589500800;
    bool NOT_REVOCABLE = false;
    
    constructor(address beneficiary) 
    TokenVesting(beneficiary, MAY_15_2020, NO_CLIFF, TWO_YEARS_VESTING, NOT_REVOCABLE)
    public
    {
    }
}


