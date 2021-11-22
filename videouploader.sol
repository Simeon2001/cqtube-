pragma solidity  ^0.5.0;

contract Cqtube {
    uint public videocount = 0;
    string public name = "Cqtube";
    mapping(uint => Video) public videos;

    struct Video {
        uint id; // video count
        string hash; // IPFS VIDEO hash
        string title; // title of the video
        address author; // user wallet address
    }

    // create an event 
    
    event Videouploaded(
        uint id,
        string hash,
        string title,
        address author
    );

    constructor() public {

    }

    function uploadvideo(string memory _videoHash, string memory _title) public {
        // making sure the video hash exists
        require(bytes(_videoHash).length > 0);
        // making sure video title exists
        require(bytes(_title).length > 0);
        // making sure uploader address exists
        require(msg.sender!=address(0));

        // increment video id
        videocount ++;

        // add video to the contract
        videos[videocount] = Video(videocount, _videoHash, _title, msg.sender);
        // trigger an event
        emit Videouploaded(videocount, _videoHash, _title, msg.sender);

    }
}