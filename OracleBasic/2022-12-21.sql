/*
        1.  데이터베이스 모델링
        ----------------------
        1) 데이터베이스의 생명 주기
            요구사항 분석 => 어떤 사이트를 만들지 확인(벤치마킹)
            1. 카테고리
               ----------------------------
               카테고리 번호
               ----------------------------데이터수집
               제목
               ----------------------------
               이미지
               ----------------------------
               부가설명
               ----------------------------
               2. 맛집정보 : 상세보기 (상세보기에서 데이터 수집)
        
        2) 데이터베이스 설계
          1. 중복된 데이터
          2. NULL이 있는 컬럼
          3. 매핑 테이블
        3) 데이터베이스 첨부된 데이터를 이용해서 => 구현
        4) 유지보수
        5) 개선점, 검사
        -----------------------------------------------
         프로그램은 데이터관리
                  -------- VueJS / ReactJS -> 데이터를 관리하는 프로그램
         데이터베이스 : 데이터를 저장하는 장소
         ---------- 메모리 / 파일 / RDBMS (가장 쉽게 제어)
                    변수 / 배열 / 클래스 / 파일 (기능별 분리 => 제어하기 어렵다)
                    ----------------- 휘발성 (임시저장)
        => 316page
           요구사항 수집 및 분석 => 아키텍쳐(DBA) => 실무 (테이블 설계 / 데이터 수집)
              |
             설계
        -----------------
              |
           개념적 설계 : 엔티티(테이블) => 데이터를 추출 (화면)
              |
           논리적 설계 : 상세 => 데이터형 , => 테이블 제작 => 구체화, 키의종류
              |
           물리적 설계 : 실제 테이블 (메모리 크리 결정)
           --------------
             => HTML / CSS를 이용해서 출력
        => 화면 UI ---> HTML / CSS / JavaScript
        => 구현  --> JSP / Spring
        => 테스팅 --> 오류 체크
        => 배포 --> 발표 -> AWS
        ------------------------------NCS 기본 과정
        => 화면 캡쳐 --> 이력서
        
        ------------------------------------------------------------
        1) 프로젝트에 필요한 데이터 확인 (개념적 설계)
        2) 논리적 설계
           1. 관계형데이터베이스 (RDBMS) -> 오라클
              --------------------------------
              -> 데이터의 중복을 최소화
              예매
              --------------------------------------
              예매번호
              --------------------------------------
              아이디
              --------------------------------------
              영화명
              --------------------------------------
              예약일
              --------------------------------------
              예약시간
              --------------------------------------
              인원
              --------------------------------------
              좌석번호
              --------------------------------------
           
           ==> 구별 (구분자)
               -----------
               기본키 ------------> PRIMARY KEY
               외래키 ------------> FOREIGN KEY
        --------------------------------------------
        데이터베이스 설계시 고려사항
        1) 무결성 : 이상현상을 방지 (원하는 데이터만 제어) -> 수정, 제어
        2) 일치성 -> 데이터간의 응답의 일치성 (참조키)
        3) 보안 => 파밍, SQL문장 -> SQL을 자바에서 사용하지 않고 XML로 이용한다 (MyBatis) -> View
        4) 효율성 -> 응답시간 (인라인뷰, 인덱스)
        
         SELECT * FROM book;
        
        => 논리적 설계
           테이블에 대한 특성 => 키 부여 (제약 조건)
           ----------------
           1) 속성값은 단일값을 가지고 있다         
            => 변수 : 값을 한개만 저장
            => actor : 류준열(천경수), 유해진(인조) -> 별도 테이블을 따로 만들어야함
                       ------------------------
           2) 속성(컬럼)은 다른 이름을 가지고 있다
           3) 속성의 순서는 상관없다
           4) 테이블안에는 중복된 데이터를 첨부 할 수 없다 ( 중복이 없는 값을 포함한다) - 무결성
           5) 튜플 (ROW, RECORD)순서는 상관이 없다 (ORDER, INDEX)
        SELECT * FROM food_location; -> 데이터수집 : ASC
           입력이 있는 경우 : 게시물 글쓰기 , 댓글 => 최신 (DESC)
           
           키(KEY) -> 정보처리
           ------
           종류
             슈퍼키 : 식별 => 튜플을 구분하는 모든 키를 모아서 슈퍼키
             후보키 : 모든 테이블은 반드시 후보키를 한개 가지고 있다
             기본키 : NULL값을 포함하지 않는 키 => 중복이 없는 키 (튜플 식별자 역할)
                     회원가입 => ID ... PRIMARY KEY
             대체키 : 기본키를 잊어 버린 경우 => ID를 잊어버린 경우 => 찾는키가 필요하다
                     전화번호 / 이메일 ... UNIQUE
             외래키 : 다른 테이블의 값을 참조 -> 매팅 테이블
             
             -------------------------------------------------------
             1. 맛집 : 망고플레이트 / 식신
             2. 레시피 : 만개의레시피
                        레시피 / 쉐프
             3. 레시피 -> 레시피 스토어
             4. 서울 여행 => 맛집 (명소, 자연, , 쇼핑 숙소...)
             ---------------------------------------------
              -> 예약 (맛집)
              -> 장바구니 -> 오픈API -> 아임포트
            ------------------------------------------------>목표
              -> 추천, 코스
              -> 재료 -> 가격비교 (이마트 ...)
              
              
            게시판 (자유게시판 => 댓글형(다중))
            묻고답하기
            회원
            공지사항
            ---------> 맛집/레시피/여행 -> 댓글 (프로시저)
            자료실 -> 업로드 / 다운로드
*/

/*
        개념적 설계 => 필요한 데이터 추출
        논리적 설계 => 키종류설정 , 1:1, 1:N ....
          ->  정규화
        물리적 설계 => 테이블 완성
                         |
                     데이터 수집 (SELECTOR) -> 태그명, 클래스명, 아이디명, 가상
                                                    ----------------구분자(태그)
                     <div></div> 태그
                     <div id="a">aaa</div>
                     <div id="b">bbb</div> ==> 값
                     <div id="c">ccc</div>
                     
                     div#b
                       -- id
                     div.c
                       -- class
                       
                       
                       1(게시판) : N(댓글) -> 한개의 게시물에 여러개의 댓글을 달 수 있다.
                1. 게시판
                   게시물 번호
                   작성자
                   -- 이메일
                   -- 홈페이지
                   제목
                   내용
                   작성일
                   조회수
                   비밀번호 : 사용자확인
              
                2. 댓글
                   댓글번호
                   게시물참조번호  -------------> 게시판에서 참조
                   아이디 ---------------------> 회원에서 참조
                   작성자 
                   내용
                   작성일
                   -- 좋아요..
                   *** 다중 댓글
                   ----------------------
                   그룹번호
                   그룹 출력순서
                   간격
                   댓글의 갯수
                   참조 댓글
                   ----------------------
                   
                   
                   예)                   gno, gstep, gtab, root, depth
        --------------------------------------------------------
              AAAAAAAAAAAAAAAAAAAAAAAAA   1     1     0     0      2
                 => BBBBBBBBBBBBBBBBBBBB  1     2     1     1      0
                 => CCCCCCCCCCCCCCCCCCCc  1     3     1     1      1
                    => DDDDDDDDDDDDDDDDD  1     4     2     3      0 
              KKKKKKKKKKKKKKKKKKKKKKKKKK  2     1     0     0      1  
                 => NMMMMMMMMMMMMM        2     2     1     4      0      
                            
               3. 묻고 답하기
                 -----------
                   => 질문  (사용자)    ==> 마이페이지
                   => 답변하기 (관리자)  --> 관리자 페이지
                   
              게시물번호
              이름
              제목
              내용
              비밀번호
              조횟수
              작성일
              답변여부확인 -> y/n
              답변 체크
              => 임의로 필요한 내용 추출
              
                4. 회원
                   아이디 -> 중복체크 ==>1
                   비밀번호
                   이름
                   성별
                   생년월일
                   이메일  --- 대체키
                   -----------------
                   우편번호
                   주소 1 - 일반주소
                   주소 2 - 상세주소
                   -----------------
                   전화번호 -- 대체키
                   소개
                   관리자/사용자구분
                   
                5. 공지사항
                   공지번호
                   작성자 -> 회원(관리자)
                   제목
                   내용
                   공지종류
                   작성일 ==> 날짜/시간
                   조횟수
                   비밀번호
                   
                6. 자료실
                   자료실 번호
                   작성자
                   제목
                   내용
                   작성일
                   조회수
                   비밀번호 : 사용자확인
                   파일명
                   파일크기
             -------------------- 필수 사항 -----------------------
             ---> 화면 UI => 데이터 수집후 출력
             -> 예약테이블
             -> 장바구니
             -> 구매테이블
             -> 카테고리
             ---------------------------------------------------
             맛집
             레시피
             쉐프
             스토어
             서울여행 -> 명소 / 자연 / 호텔 / 쇼핑몰 / 게스트하우스 / 이벤트 / 축제 -> 벤치마킹
             ------------------------------------------------------------------------
             맛집 : 카테고리 , 맛집정보
             레시피 : 레시피, 쉐프
             스토어
             -------------------------------
             스프링 : 펀드, 직거래, ERP
             -------------------------- 관리자 ...
             
             맛집
               => 카테고리
                  카테번호 (구분자)
                  제목
                  부제목
                  이미지
                  ------------------------->
               => 맛집정보
                  맛집번호
                  카테고리번호
                  맛집명
                  이미지 ======> 고려 5개
                  평점
                  주소
                  전화번호
                  음식종류
                  시간
                  주차
                  메뉴  -------> 고려 (5~10)
                  HIT
                  -----------------------------trigger
                  Jjim
                  Like
                  -----------------------------\
                  
             레시피
               = 레시피
                  = 레시피번호
                  = 레시피이미지
                  = 쉐프이미지
                  = 쉐프명
                  = 레시피명
                  = 레시피설명
                  = 정보 1 => 1인분
                  = 정보 2 => 15분
                  = 정보 3 => 아무나
                  = 재료 -------------------- 고려
                  = 소스재료 ----------------- 고려
                  = 조리순서 ----------------- 고려
                    => 조리순서 / 이미지
                  = 쉐프소개
                  = HIT
                  = Jjim
                  = Like
                  = 제작 영상 => 고려( youtube )
                  =================================댓글
               = 쉐프
                 = 쉐프번호
                 = 쉐프명
                 = mem_cont1 - 작품수
                 = mem_cont2 - 스크랩
                 = mem_cont3 - 조회수
                 = mem_cont7 - 팔로우
            ---------------------------------------------------
               = 스토어
                 => 전체상품
                    - 상품번호
                    - 이미지
                    - 상품명
                    - 상품소개
                    - 가격
                    - 할인
                    - 첫구매 금액
                    - 평점
            --------------------------------------------------
              => 댓글 / 찜하기 / 좋아요 / 장바구니 / 구매내역
              -----------------------------------------------
            서울여행 : 코스 -> 네이버 카페 / 네이버 블로그 => 추출
             ==> Open API => MapReduce
             ---------------------------- 고민(스프링)
             명소 / 자연 / 호텔 / 쇼핑몰 / 게스트하우스
                = 명소(자연, 호텔, 쇼핑, 게스트)번호
                = 명칭
                = 이미지
                = 주소
                = 소개
             축제 / 행사
                = 번호
                = 행사명
                = 행사이미지
                = 행사소개
                = 행사기간
                = 이용시간
                = 이용금액
                = 주소
                = 교통정보
                
                
                기본키 : ROW에 대한 구분 (클래스 => 메모리 주소 => 객체명, 인덱스 구분)
                        PRIMARY KEY => 1개 설정 (복합 설정도 가능)
                        PRIMARY KEY(id, name)
                        aaa 홍길동
                        aaa 박문수
                        ----------------------- 1 정규화의 문제
                대체키 : 기본키 잊어 버린 경우에 찾기용 : UNIQUE
                        여러개를 사용할 수 있다, NULL 값을 허용
                외래키(참조키) : 다른 테이블의 컬럼값을 참조 : FOREIGN KEY -> 여러개 사용이 가능
                
                관계 : 1:1, 1:N
*/





