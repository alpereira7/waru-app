// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WaruToken is Ownable, ERC20Snapshot {

    using SafeMath for uint256;
    
    address public wtrAddress = 0x672CeDBCE027E51888133312AaCaC2FF8e3614e6;
    address public wtcAddress = 0xC4ae728aC2a0f263A44A992Fd2B97798bE4342F0;

    uint256 public constant MAX_SUPPLY = 21000000000000000000000000;
    uint256 public constant INIT_SUPPLY = 7350000000000000000000000;

    constructor() ERC20("Waru Token", "WARU") {
        _mint(msg.sender, INIT_SUPPLY); // 7.35 million premint
    }
    
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        require(amount >= 10000, "Insufficient amount.");
        uint256 fee;
        fee = amount.div(1000);
        uint256 totalFee;
        totalFee = fee.mul(2);
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, wtrAddress, fee);
        _transfer(from, wtcAddress, fee);
        _transfer(from, to, amount.sub(totalFee));
        return true;
    }

    // Admin functions
 
    function mint(address to, uint256 amount) external onlyOwner {
        require(amount.add(totalSupply()) <= MAX_SUPPLY, "Can't mint more than 21 million tokens.");
        require(amount > 0);
        _mint(to, amount);
    }
   
    function setWtrAddress(address _wtrAddress) external onlyOwner {
        require(_wtrAddress != address(0), "Invalid address.");
        wtrAddress = _wtrAddress;
    }
    
    function setWtcAddress(address _wtcAddress) external onlyOwner {
        require(_wtcAddress != address(0), "Invalid address.");
        wtcAddress = _wtcAddress;
    }
    
    function snapshot() external onlyOwner {
        _snapshot();
    }
    
    function withdraw() external payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
    }
}