// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";


// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../contracts/5_NFT_temp.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract NFT_ERC1155_Temp_Test is ERC1155Holder {

    NFT_ERC1155_Temp Contract;

    // function checkSenderAndValue() public payable {
    //     // account index varies 0-9, value is in wei
    //     Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");
    //     Assert.equal(msg.value, 1000, "Invalid value");
    // }

    function beforeAll() public {
        Contract = new NFT_ERC1155_Temp();
    }

    /// Custom Transaction Context: https://remix-ide.readthedocs.io/en/latest/unittesting.html#customization
    /// #sender: account-1
    /// #value: 160000000
    function canMintNewToken() public payable {
       uint256 itemId = Contract.mintToken("myNFT");
       console.log(itemId);
    }

    // function checkSuccess() public {
    //     // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
    //     Assert.ok(2 == 2, 'should be true');
    //     Assert.greaterThan(uint(2), uint(1), "2 should be greater than to 1");
    //     Assert.lesserThan(uint(2), uint(3), "2 should be lesser than to 3");
    // }

    // function checkSuccess2() public pure returns (bool) {
    //     // Use the return value (true or false) to test the contract
    //     return true;
    // }
    
    // function checkFailure() public {
    //     Assert.notEqual(uint(1), uint(1), "1 should not be equal to 1");
    // }

}
    