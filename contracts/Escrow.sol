// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Escrow {
    enum Status { NOT_STARTED, FUNDED, RELEASED, REFUNDED }
    struct Milestone {
        uint256 amount;
        Status status;
    }
    mapping(address => mapping(address => Milestone[])) public escrows;

    event Funded(address indexed client, address indexed freelancer, uint256 milestoneId, uint256 amount);
    event Released(address indexed client, address indexed freelancer, uint256 milestoneId);
    event Refunded(address indexed client, address indexed freelancer, uint256 milestoneId);

    function fund(address freelancer, uint256 milestoneId) external payable {
        require(msg.value > 0, "No funds sent");
        Milestone storage m = escrows[msg.sender][freelancer][milestoneId];
        require(m.status == Status.NOT_STARTED, "Already funded");
        m.amount = msg.value;
        m.status = Status.FUNDED;
        emit Funded(msg.sender, freelancer, milestoneId, msg.value);
    }

    function release(address freelancer, uint256 milestoneId) external {
        Milestone storage m = escrows[msg.sender][freelancer][milestoneId];
        require(m.status == Status.FUNDED, "Not funded");
        m.status = Status.RELEASED;
        payable(freelancer).transfer(m.amount);
        emit Released(msg.sender, freelancer, milestoneId);
    }

    function refund(address freelancer, uint256 milestoneId) external {
        Milestone storage m = escrows[msg.sender][freelancer][milestoneId];
        require(m.status == Status.FUNDED, "Not funded");
        m.status = Status.REFUNDED;
        payable(msg.sender).transfer(m.amount);
        emit Refunded(msg.sender, freelancer, milestoneId);
    }

    function getMilestone(address client, address freelancer, uint256 milestoneId) external view returns (Milestone memory) {
        return escrows[client][freelancer][milestoneId];
    }
}
