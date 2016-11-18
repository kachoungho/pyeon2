
select * from orderReq;
select * from orderReq_temp;
select * from orderReqState where area = '판교';

drop table orderReq;
drop table orderReq_temp;
drop table orderReqState;

select * from ordeerSpend;


create table orderReqState(
	bno number,
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time varchar2(40),
	state varchar2(30),
	constraint orderReqState_pk  primary key(item_code, area, state)
);


create table orderReq(
	bno number,
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	state varchar2(30),
	constraint orderReq_pk  primary key(item_code, area)
);

alter table orderReq_temp add(state varchar2(30));
alter table orderReq add(state varchar2(30));
alter table orderReq_temp drop(state);

create table orderReq_temp(
	bno number,
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	state varchar2(30),
	constraint orderReq_temp_pk  primary key(item_code, area)
);

create table orderSpend(
	bno number(7),
	spend varchar2(10),
	pay number(10),
	spend_date date,
	area varchar2(20)
)



create sequence orderSpend_num
   increment by 1
   start with 1
   nocache;

create sequence orderReq_num
   increment by 1
   start with 1
   nocache;
   
create sequence orderReq_temp_num
   increment by 1
   start with 1
   nocache;
   
create sequence orderReqState_num
   increment by 1
   start with 1
   nocache;

drop sequence orderReqState_num
