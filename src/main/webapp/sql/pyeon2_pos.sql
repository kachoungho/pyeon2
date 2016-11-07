
select * from p2_member;
select * from p2_item;
select * from p2_dayCalc;
select * from p2_weekCalc;
select * from p2_monthCalc;

drop table p2_member;
drop table p2_item;
drop table p2_dayCalc;
drop table p2_weekCalc;
drop table p2_monthCalc;



create table p2_monthCalc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint monthCalc_pk  primary key(item_code, area)
);


create table p2_weekCalc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint weekCalc_pk  primary key(item_code, area)
);


create table p2_dayCalc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint dayCalc_pk  primary key(item_code, area)
);


create table p2_calc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	constraint calc_pk  primary key(item_code, area)
);


create table p2_item(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	item_image varchar2(500), 
	price number(10) not null, 
	count number(10), 
	hit number(5), 
	category varchar2(20), 
	area varchar2(30) not null,
	constraint item_pk  primary key(item_code, area)
);


create table p2_member(
	id varchar2(20) not null,
	pwd varchar2(30) not null,
	name varchar2(30) not null,
	position varchar2(20) not null,
	phone varchar2(20),
	age varchar2(20), 
	address varchar2(50),
	gender varchar2(10),
	area varchar2(30) not null,
	constraint member_pk  primary key(id, area)
);
