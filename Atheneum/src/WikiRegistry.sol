// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract WikiRegistry is AccessControl {
    bytes32 public constant MODERATOR_ROLE = keccak256("MODERATOR_ROLE");

    struct Article {
        uint256 id;
        string title;
        string cid; // IPFS CID or pointer to off-chain content
        address author;
        uint256 createdAt;
        bool exists;
    }

    struct Contribution {
        uint256 id;
        uint256 articleId;
        address contributor;
        string cid;
        uint8 ctype; // 0=create,1=edit,2=media,3=review
        uint256 submittedAt;
        bool approved;
        bool rewarded;
    }

    uint256 public nextArticleId = 1;
    uint256 public nextContributionId = 1;

    mapping(uint256 => Article) public articles;
    mapping(uint256 => Contribution) public contributions;

    event ArticleCreated(uint256 indexed id, string title, string cid, address author);
    event ContributionSubmitted(uint256 indexed id, uint256 indexed articleId, address indexed contributor, uint8 ctype);
    event ContributionApproved(uint256 indexed id, uint256 reward);

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MODERATOR_ROLE, msg.sender);
    }

    function createArticle(string calldata title, string calldata cid) external returns (uint256 id) {
        id = nextArticleId++;
        articles[id] = Article({ id: id, title: title, cid: cid, author: msg.sender, createdAt: block.timestamp, exists: true });
        emit ArticleCreated(id, title, cid, msg.sender);

        uint256 contribId = nextContributionId++;
        contributions[contribId] = Contribution({
            id: contribId,
            articleId: id,
            contributor: msg.sender,
            cid: cid,
            ctype: 0,
            submittedAt: block.timestamp,
            approved: false,
            rewarded: false
        });
        emit ContributionSubmitted(contribId, id, msg.sender, 0);
    }

    function submitContribution(uint256 articleId, string calldata cid, uint8 ctype) external returns (uint256 id) {
        require(articles[articleId].exists, "ARTICLE_NOT_FOUND");
        id = nextContributionId++;
        contributions[id] = Contribution({
            id: id,
            articleId: articleId,
            contributor: msg.sender,
            cid: cid,
            ctype: ctype,
            submittedAt: block.timestamp,
            approved: false,
            rewarded: false
        });
        emit ContributionSubmitted(id, articleId, msg.sender, ctype);
    }

    function approveContribution(uint256 contributionId, string calldata newCanonicalCid) external onlyRole(MODERATOR_ROLE) {
        Contribution storage c = contributions[contributionId];
        require(!c.approved, "ALREADY_APPROVED");
        c.approved = true;

        if (c.ctype != 3) { // not a review
            Article storage a = articles[c.articleId];
            require(a.exists, "ARTICLE_NOT_FOUND");
            a.cid = newCanonicalCid;
        }

        uint256 reward = 0;
        // reward logic placeholder (token integration later)
        c.rewarded = true;
        emit ContributionApproved(contributionId, reward);
    }

    function getArticle(uint256 id) external view returns (Article memory) {
        return articles[id];
    }

    function getContribution(uint256 id) external view returns (Contribution memory) {
        return contributions[id];
    }

    function totalArticles() external view returns (uint256) {
        return nextArticleId - 1;
    }

    function totalContributions() external view returns (uint256) {
        return nextContributionId - 1;
    }
}
