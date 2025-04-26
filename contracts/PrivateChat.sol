// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PrivateChat {
    struct PrivateMessage {
        address sender;
        address recipient;
        string content;
        uint256 timestamp;
    }

    PrivateMessage[] private messages;

    event PrivateMessageSent(address indexed sender, address indexed recipient, string content, uint256 timestamp);

    function sendMessage(address _to, string calldata _content) external {
        require(_to != address(0), "Invalid recipient address");
        require(_to != msg.sender, "Cannot send to yourself");

        messages.push(PrivateMessage({
            sender: msg.sender,
            recipient: _to,
            content: _content,
            timestamp: block.timestamp
        }));

        emit PrivateMessageSent(msg.sender, _to, _content, block.timestamp);
    }

    function getMyMessages() external view returns (PrivateMessage[] memory) {
        uint256 count = 0;
        uint256 j = 0;

        // Count how many messages involve msg.sender
        for (uint256 i = 0; i < messages.length; i++) {
            if (messages[i].sender == msg.sender || messages[i].recipient == msg.sender) {
                count++;
            }
        }

        PrivateMessage[] memory myMessages = new PrivateMessage[](count);

        for (uint256 i = 0; i < messages.length; i++) {
            if (messages[i].sender == msg.sender || messages[i].recipient == msg.sender) {
                myMessages[j] = messages[i];
                j++;
            }
        }

        return myMessages;
    }
}
