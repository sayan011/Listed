//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
contract Delist {
    struct Job {
        uint8 id;
        address creator;
        string title;
        string url;
        string description;
        uint8 total_applicants;
    }
    mapping(uint256 => Job) public jobs;
    event savingsEvent(uint256 indexed _jobId);
    uint8 public numJob;
    constructor() {
        numJob = 0;
        
    }
    // function addJob(
    //     string memory title,
    //     string memory position,
    //     string memory url ,
    //     string memory description
    // ) public {
    //     Job storage job = jobs[numJob];
    //     job.creator = msg.sender;
    //     job.total_applicants = 0;
    //     jobs[numJob] = Job(
    //         numJob,
    //         job.creator,
    //         title,
    //         url,
    //         description,
    //         job.total_applicants,
            
    //     );
    //     numJob++;
    // }
    
    function getJob(uint256 jobId)
        public
        view
        returns (Job memory)
    {
        return jobs[jobId];
    }
    
    function getJobs() public view returns (Job[] memory) {
        Job[] memory id = new Job[](numJob);
        for (uint256 i = 0; i < numJob; i++) {
            Job storage job = jobs[i];
            id[i] = job;
        }
        return id;
    }
    
    function applyforJob(uint256 jobId) public {
        Job storage job = jobs[jobId];
        job.total_applicants++;
    }
}
