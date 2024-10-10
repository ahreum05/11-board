-- 회원 테이블 생성
create table member (
    name varchar2(30) not null,
    id varchar2(30) primary key,  -- unique, not null
    pwd varchar2(30) not null,
    gender varchar2(3),
    email1 varchar2(30),
    email2 varchar2(30),
    tel1 varchar2(10),
    tel2 varchar2(10),
    tel3 varchar2(10),
    addr varchar2(100),
    logtime date
);
-- 테이블 삭제
drop table member purge;
-- 테이블 목록 확인
select * from tab;

-- 데이터 추가
insert into member values ('홍길동','hong','1234', 'm',
'hong', 'naver.com', '010', '1234', '5678', '경기도 수원시',
sysdate);
-- 데이터 검색
select * from member;
select * from member where id='hong';
-- 로그인
select * from member where id='hong' and pwd='1234';
-- 데이터 수정
update member set tel2='5555' where id='hong';
-- 데이터 삭제
delete member where id='hong';
-- db 저장
commit;