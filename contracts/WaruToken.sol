// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WaruToken is Ownable, ERC20Snapshot {

    using SafeMath for uint256;

    address public wtrAddress = 0x9Fdcf9E4C3b9c8606803FAdA2734FABda2D24Dc8;
    address public wtcAddress = 0x9Fdcf9E4C3b9c8606803FAdA2734FABda2D24Dc8;
    
    function setWtrAddress(address _wtrAddress) public onlyOwner {
        wtrAddress = _wtrAddress;
    }
    
    function setWtcAddress(address _wtcAddress) public onlyOwner {
        wtcAddress = _wtcAddress;
    }

    constructor() ERC20("Waru Token", "WARU") {
        _mint(msg.sender, 8400000000000000000000000); // 8.4 million premint
    }
    
    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract.");
        _;
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        require(amount.mod(1000) == 0, "You can only send a multiple of 1000 wei.");
        require(balanceOf(msg.sender) >= amount);
        uint256 fee;
        fee = amount.div(1000);
        _transfer(msg.sender, wtrAddress, fee);
        _transfer(msg.sender, wtcAddress, fee);
        uint256 totalFee;
        totalFee = fee.mul(2);
        _transfer(msg.sender, to, amount.sub(totalFee));
        return true;
    }

    // Only Owner
    function transferNoFees(address to, uint256 amount) public onlyOwner callerIsUser {
        require(balanceOf(msg.sender) >= amount);
        _transfer(msg.sender, to, amount);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(amount.add(totalSupply()) <= 21000000000000000000000000, "Can't mint more than 21 million tokens");
        require(amount > 0);
        _mint(to, amount);
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
