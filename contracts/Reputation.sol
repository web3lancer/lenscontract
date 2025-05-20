// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Reputation {
    mapping(address => uint256) public totalScore;
    mapping(address => uint256) public numReviews;
    mapping(address => mapping(address => bool)) public reviewed;

    event ReviewSubmitted(address indexed reviewer, address indexed reviewee, uint8 score, string comment);

    function submitReview(address reviewee, uint8 score, string calldata comment) external {
        require(score <= 5, "Score must be 0-5");
        require(!reviewed[msg.sender][reviewee], "Already reviewed");
        reviewed[msg.sender][reviewee] = true;
        totalScore[reviewee] += score;
        numReviews[reviewee] += 1;
        emit ReviewSubmitted(msg.sender, reviewee, score, comment);
    }

    function getReputation(address user) external view returns (uint256 avgScore, uint256 reviews) {
        reviews = numReviews[user];
        avgScore = reviews == 0 ? 0 : totalScore[user] / reviews;
    }
}
