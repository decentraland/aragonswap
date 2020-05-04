pragma solidity ^0.6.6;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol';

contract Escrow {
    address decentralandController = 0xcafE1A77e84698c83CA8931F54A755176eF75f2C;
    address aragonController = 0xE874d3E0b9B1f82F8F99B12971ddcE2b6d61e674;
    
    uint256 expectedMANA = 3849707.422 * 1e18;
    uint256 expectedANT = 141885.027 * 1e18;
    
    address targetMANAVesting;
    address targetANTVesting;
    
    IERC20 MANA = IERC20(0x00);
    IERC20 ANT = IERC20(0x00);
    
    function recoverTokens() public {
        if (msg.sender == decentralandController) {
            MANA.transferFrom(address(this), decentralandController, MANA.balanceOf(address(this)));
        }
        if (msg.sender == aragonController) {
            ANT.transferFrom(address(this), aragonController, ANT.balanceOf(address(this)));
        }

        selfdestruct(address(uint256(decentralandController)));
    }
    
    function swap() public {
        require(MANA.balanceOf(address(this)) > expectedMANA, 'MANA has not been deposited');
        require(ANT.balanceOf(address(this)) > expectedANT, 'ANT has not been deposited');
        
        MANA.transferFrom(address(this), targetMANAVesting, MANA.balanceOf(address(this)));
        ANT.transferFrom(address(this), targetANTVesting, ANT.balanceOf(address(this)));
    }
}
