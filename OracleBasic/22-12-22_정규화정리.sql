/*
        1. 7장 정규화 (함수종속) => 이행적 함수종속, 부분적 함수 종속, 완전 함수 종속
           정규화
             => 기본 목표 : 테이블간의 중복된 데이터를 허용하지 않는 것
                                        ------------
                                        무결성을 유지할 수 있다. DB의 저장 용량을 줄일 수 있다
             => 방지 목적 : 이상 현상
                          ---------
                            데이터베이스의 기능
                              => 1. 데이터 검색 (실제 데이터를 변경하지 않는다 => SELECT)
                                                 => 검색 속도 : INDEX
                                                 => 보안 : View, Procedure
                                                 --------------------------재사용
                              => 2. 데이터 추가 : 서로 다른 내용이 만들어져 있는 테이블이 있는 경우
                                                 NULL을 포함
                                                 영화 / 예매 => 일관성
                              => 3. 데이터 수정 : 같은 데이터를 가지고 있는 경우 => 연쇄적 수정, NULL 포함
                              => 4. 데이터 삭제 : 연쇄적 삭제
                    ------------------------------------------------------------------------
               함수 종속
               --------
               게시판(bno, name, subject, content, pwd, regdate, hit)
                     ---기본키
                     bno -> name
                     bno -> subject
                     ...
              사원 (empno, ename, job, hiredate, sal, deptno, dname, loc)
                  -------                            -------
                  empno --> ename, job, hiredate, sal -> 부분적 함수 종속
                  (empno, deptno) -> dname, loc => 완전함수종속
                  ---------------------------------------------
                  
            1. 1정규화 : 원자값 -> 각 컬럼은 한개의 데이터만 가지고 있어야 한다
                        id name tel => 010-1111-1111, 010-2222-2222
                        tel
                        tel
                        => 중복된 데이터가 많다
            2. 2정규화 : 중복된 데이터를 없애기 위해서 -> 테이블 분리
                        id name <==> id tel
                        기본키가 아닌 다른키를 이용해서 제어 -> 부분적 함수 종속
                        복합키
                        -------------------------------------------------
            3. 3정규화 : 한개의 기본키를 가지고 테이블에 제어할 수 있게 만들어주는 과정
                       ----------------------------------------------------매핑 테이블
                        => 단점 : JOIN을 많이 사용해야 된다 (웹 프로그래머)
*/