// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WaruToken is Ownable, ERC20Snapshot {

    using SafeMath for uint256;
    
    address public wtrAddress = 0x672CeDBCE027E51888133312AaCaC2FF8e3614e6;
    address public wtcAddress = 0xC4ae728aC2a0f263A44A992Fd2B97798bE4342F0;

    uint256 public MAX_SUPPLY = 21000000000000000000000000;
    uint256 public INIT_SUPPLY = 7350000000000000000000000;

    event TransferDone(address indexed from, address indexed to, uint value);

    constructor() ERC20("Waru Token", "WARU") {
        _mint(msg.sender, INIT_SUPPLY); // 7.35 million premint
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance.");
        _transfer(msg.sender, to, amount);
        emit TransferDone(msg.sender, to, amount);
        return true;
    }
    
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        require(amount >= 10000, "Insufficient amount.");
        require(balanceOf(from) >= amount, "Insufficient balance.");
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

    function mint(address to, uint256 amount) public onlyOwner {
        require(amount.add(totalSupply()) <= MAX_SUPPLY, "Can't mint more than 21 million tokens");
        require(amount > 0);
        _mint(to, amount);
    }

    // Admin functions
    
    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract.");
        _;
    }
    
    function setWtrAddress(address _wtrAddress) public onlyOwner callerIsUser {
        wtrAddress = _wtrAddress;
    }
    
    function setWtcAddress(address _wtcAddress) public onlyOwner callerIsUser {
        wtcAddress = _wtcAddress;
    }
    
    function snapshot() public onlyOwner callerIsUser {
        _snapshot();
    }
    
    function withdraw() public payable onlyOwner callerIsUser {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
    }
}
