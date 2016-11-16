create table orderReq(
	bno number,
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint orderReq_pk  primary key(item_code, area)
);

create table orderReq_temp(
	bno number,
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint orderReq_temp_pk  primary key(item_code, area)
);

create sequence orderReq_num
   increment by 1
   start with 1
   nocache;
   
   create sequence orderReq_temp_num
   increment by 1
   start with 1
   nocache;

select * from orderReq;
select * from orderReq_temp;

drop table orderReq;
drop table orderReq_temp;

