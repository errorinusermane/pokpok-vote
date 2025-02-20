// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 📌 블록체인 기반 투표 스마트 컨트랙트
   이 컨트랙트는 후보 등록, 투표 기능을 제공하며,
   실시간으로 후보 목록과 투표수를 확인할 수 있습니다! 🚀 */

contract Voting {
    // 🏛 후보자 구조체: 이름과 득표 수 저장
    struct Candidate {
        string name;
        uint voteCount;
    }

    address public owner; // 👑 컨트랙트 배포자 (관리자)
    mapping(address => bool) public hasVoted; // ✅ 투표 여부 확인
    Candidate[] public candidates; // 📜 후보자 목록

    event CandidateRegistered(string name); // 📢 후보 등록 이벤트
    event Voted(address voter, uint candidateIndex); // 📢 투표 이벤트

    constructor() {
        owner = msg.sender; // 👑 배포자가 관리자로 설정됨
    }

    // 📝 후보 등록 함수 (관리자만 가능)
    function registerCandidate(string memory _name) public {
        require(msg.sender == owner, "Only owner can register candidates"); // 🔐 관리자 검증
        candidates.push(Candidate(_name, 0)); // ✅ 후보자 추가
        emit CandidateRegistered(_name); // 📢 후보 등록 이벤트 발생
    }

    // 🗳 투표 함수
    function vote(uint _candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted!"); // ❌ 중복 투표 방지
        require(_candidateIndex < candidates.length, "Invalid candidate index"); // 🔍 후보 검증

        hasVoted[msg.sender] = true; // ✅ 투표 완료 표시
        candidates[_candidateIndex].voteCount++; // 📊 해당 후보자 득표 증가
        emit Voted(msg.sender, _candidateIndex); // 📢 투표 이벤트 발생
    }

    // 📜 후보자 목록 가져오기
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }
}
