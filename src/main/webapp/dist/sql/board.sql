create table notice(
	num int not null primary key auto_increment,
	title varchar(80) not null,
	id varchar(20) not null,
	date datetime default current_timestamp,
	category varchar(20) not null,
	content varchar(4096) not null,
	img varchar(20),
	available tinyint(1) not null default 1
);