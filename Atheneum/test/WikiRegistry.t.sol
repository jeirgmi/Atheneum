// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/WikiRegistry.sol";

contract WikiRegistryTest is Test {
    WikiRegistry registry;
    address alice = address(0xABCD);

    function setUp() public {
        registry = new WikiRegistry();
    }

    function testCreateArticleAndSubmitContribution() public {
        vm.prank(alice);
        uint256 articleId = registry.createArticle("Intro to Dust", "cid://intro");

        (uint256 id, string memory title, string memory cid, address author, uint256 createdAt, bool exists) = registry.articles(articleId);
        assertEq(title, "Intro to Dust");
        assertEq(author, alice);

        vm.prank(alice);
        uint256 contribId = registry.submitContribution(articleId, "cid://edit1", 1);

        (uint256 cidId, uint256 aId, address contributor, string memory cCid, uint8 ctype, uint256 submittedAt, bool approved, bool rewarded) = registry.contributions(contribId);
        assertEq(aId, articleId);
        assertEq(contributor, alice);
        assertEq(cCid, "cid://edit1");
    }
}
