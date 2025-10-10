// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract WikiRegistry is AccessControl {
    bytes32 public constant MODERATOR_ROLE = keccak256("MODERATOR_ROLE");

    struct Article {
        uint256 id;
        string title;
        string cid;
        address author;
        uint256 createdAt;
        bool exists;
    }

    struct Contribution {
        uint256 id;
        uint256 articleId;
        address contributor;
        string cid;
        uint8 ctype;
        uint256 submittedAt;
        bool approved;
        bool rewarded;
    }

    uint256 public articleCount;
    uint256 public contributionCount;

    mapping(uint256 => Article) public articles;
    mapping(uint256 => Contribution) public contributions;

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function createArticle(string memory title, string memory cid)
        external
        returns (uint256)
    {
        articleCount++;
        articles[articleCount] = Article({
            id: articleCount,
            title: title,
            cid: cid,
            author: msg.sender,
            createdAt: block.timestamp,
            exists: true
        });
        return articleCount;
    }

    function addContribution(
        uint256 articleId,
        string memory cid,
        uint8 ctype
    ) external returns (uint256) {
        require(articles[articleId].exists, "Article does not exist");

        contributionCount++;
        contributions[contributionCount] = Contribution({
            id: contributionCount,
            articleId: articleId,
            contributor: msg.sender,
            cid: cid,
            ctype: ctype,
            submittedAt: block.timestamp,
            approved: false,
            rewarded: false
        });
        return contributionCount;
    }
}