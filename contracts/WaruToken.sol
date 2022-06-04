// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WaruToken is Ownable, ERC20Snapshot {

    using SafeMath for uint256;

    mapping(address => bool) public authorized;
    
    address public wtrAddress = 0x672CeDBCE027E51888133312AaCaC2FF8e3614e6;
    address public wtcAddress = 0xC4ae728aC2a0f263A44A992Fd2B97798bE4342F0;

    event TransferDone(address indexed from, address indexed to, uint value);
    
    function setWtrAddress(address _wtrAddress) public onlyOwner {
        wtrAddress = _wtrAddress;
    }
    
    function setWtcAddress(address _wtcAddress) public onlyOwner {
        wtcAddress = _wtcAddress;
    }

    constructor() ERC20("Waru Token", "WARU") {
        authorized[msg.sender] = true;
        _mint(msg.sender, 7350000000000000000000000); // 7.35 million premint
    }
    
    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract.");
        _;
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        require(amount >= 10000, "Insiffucient amount.");
        require(balanceOf(msg.sender) >= amount);
        uint256 fee;
        fee = amount.div(1000);
        _transfer(msg.sender, wtrAddress, fee);
        _transfer(msg.sender, wtcAddress, fee);
        uint256 totalFee;
        totalFee = fee.mul(2);
        _transfer(msg.sender, to, amount.sub(totalFee));
        emit TransferDone(msg.sender, to, amount);
        return true;
    }

    function mint(address to, uint256 amount) public {
        require(authorized[msg.sender], "Unauthorized mint!");
        require(amount.add(totalSupply()) <= 21000000000000000000000000, "Can't mint more than 21 million tokens");
        require(amount > 0);
        _mint(to, amount);
    }

    function addAuthorized(address _authorized) public onlyOwner {
        authorized[_authorized] = true;
    }
    
    function removeAuthorized(address _unauthorized) public onlyOwner {
        authorized[_unauthorized] = false;
    }

    // Only Owner
    function transferNoFees(address to, uint256 amount) public onlyOwner callerIsUser {
        require(balanceOf(msg.sender) >= amount);
        _transfer(msg.sender, to, amount);
    }

    function snapshot() public onlyOwner callerIsUser{
        _snapshot();
    }
    
    function withdraw() public payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success);
    }
}
