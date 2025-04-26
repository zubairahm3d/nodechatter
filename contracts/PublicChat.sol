// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PublicChat {
    struct Message {
        address sender;
        string content;
        uint256 timestamp;
    }

    Message[] public messages;

    event MessageSent(address indexed sender, string content, uint256 timestamp);

    function postMessage(string calldata _content) external {
        messages.push(Message({
            sender: msg.sender,
            content: _content,
            timestamp: block.timestamp
        }));

        emit MessageSent(msg.sender, _content, block.timestamp);
    }

    function getMessages() external view returns (Message[] memory) {
        return messages;
    }

    function getMessageCount() external view returns (uint256) {
        return messages.length;
    }
}
