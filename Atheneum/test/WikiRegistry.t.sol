// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/WikiRegistry.sol";

contract WikiRegistryTest is Test {
    WikiRegistry registry;

    function setUp() public {
        registry = new WikiRegistry();
    }

    function testCreateArticle() public {
        uint256 articleId = registry.createArticle("Intro to Dust", "cid://intro");

        (
            uint256 id,
            string memory title,
            string memory cid,
            address author,
            uint256 createdAt,
            bool exists
        ) = registry.articles(articleId);

        assertEq(id, articleId);
        assertEq(title, "Intro to Dust");
        assertEq(cid, "cid://intro");
        assertEq(author, address(this));
        assertTrue(exists);
    }

    function testAddContribution() public {
        uint256 articleId = registry.createArticle("Test Article", "cid://test");
        uint256 contribId = registry.addContribution(articleId, "cid://update", 1);

        (
            uint256 id,
            uint256 aId,
            address contributor,
            string memory cCid,
            uint8 ctype,
            uint256 submittedAt,
            bool approved,
            bool rewarded
        ) = registry.contributions(contribId);

        assertEq(id, contribId);
        assertEq(aId, articleId);
        assertEq(contributor, address(this));
        assertEq(cCid, "cid://update");
        assertEq(ctype, 1);
        assertFalse(approved);
        assertFalse(rewarded);
    }
}