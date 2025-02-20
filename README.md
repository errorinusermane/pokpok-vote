# pokpok-vote

/pokpokvote
│── /contracts/                 # Solidity 스마트 컨트랙트 저장 폴더
│   ├── Voting.sol              # 투표 스마트 컨트랙트
│── /compiled/                  # 컴파일된 스마트 컨트랙트 저장
│   ├── compiled_code.json       # Solidity 컴파일 결과 (자동 생성됨)
│── /templates/                  # HTML 템플릿 폴더 (Flask 프론트엔드)
│   ├── index.html               # 웹 UI (후보 등록, 투표, 결과 확인)
│── /static/                     # CSS, JS 등의 정적 파일 폴더
│   ├── style.css                # (선택 사항) CSS 파일
│── server.py                    # Flask 백엔드 (Python + Web3.py)
│── compile.py                   # Solidity 코드 컴파일 (Python)
│── requirements.txt              # 필요한 Python 패키지 목록
│── README.md                     # 프로젝트 설명 파일
