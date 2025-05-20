// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ILensHub {
    function getProfile(uint256 profileId) external view returns (address);
}

contract UserProfile {
    ILensHub public lensHub;
    mapping(address => uint256) public userToLensProfile;
    mapping(address => string) public metadataURI;

    event ProfileLinked(address indexed user, uint256 lensProfileId, string metadataURI);

    constructor(address _lensHub) {
        lensHub = ILensHub(_lensHub);
    }

    function linkLensProfile(uint256 lensProfileId, string calldata _metadataURI) external {
        require(lensHub.getProfile(lensProfileId) == msg.sender, "Not profile owner");
        userToLensProfile[msg.sender] = lensProfileId;
        metadataURI[msg.sender] = _metadataURI;
        emit ProfileLinked(msg.sender, lensProfileId, _metadataURI);
    }

    function getUserProfile(address user) external view returns (uint256, string memory) {
        return (userToLensProfile[user], metadataURI[user]);
    }
}
