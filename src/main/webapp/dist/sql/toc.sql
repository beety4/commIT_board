CREATE TABLE user_table (
	id varchar(20) not null primary key,
	pw varchar(100) not null,
	name varchar(20) not null,
	email varchar(40) not null unique,
	emailhash varchar(100) not null,
	emailcheck tinyint(1) not null default 0,
	date datetime default current_timestamp,
	img varchar(20) default 'default.img'
);
