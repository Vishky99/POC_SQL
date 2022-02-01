/*-------------Creating Database--------------*/
create database poctask_sql;
use poctask_sql;

/*-------------Creating Tables--------------*/
create table author(
	id int primary key,
    name varchar(200)
);

create table user(
	id int primary key,
    name varchar(100)
);

create table comment (
    id int primary key not null,
    content varchar(1000),
    postid int,
    createdts datetime,
    userid int,
    foreign key (userid)
        references `user` (id),
    foreign key (postid)
        references post (id)
);

create table post (
    id int primary key not null,
    name varchar(100),
    authorid int,
    createdts datetime,
    foreign key (authorid)
        references author (id)
);

/*-------------Inserting Data--------------*/

/*--Into User--*/
desc user;
insert into user values(1,'Vishal');
insert into user values(2,'Kumar');
insert into user values(3,'Third');

select * from user;

/*--Into Author--*/
DESC author;
INSERT INTO author VALUES(1,'James Bond');
INSERT INTO author VALUES(2,'Neeraj Yadav');

SELECT * FROM author;

/*--Into Post--*/
desc post;
insert into post values(1,'My Missions',1,'2021-09-04 13:05:18');
insert into post values(2,'India We are come back',2,'2021-09-04 13:08:18');
insert into post values(3,'Italy Tour',1,'2021-09-04 13:10:18');
insert into post values(4,'India Tour',1,'2021-09-04 13:12:34');
insert into post values(5,'Team Looks',2,'2021-09-04 13:18:15');
insert into post values(6,'England MI6',1,'2021-09-04 13:31:25');

select * from post;

/*--Into comment--*/
desc comment;

insert into comment values(1,'You Are Right',1,'2021-09-04 14:08:47',1);
insert into comment values(2,'Yadav is furios',2,'2021-09-04 14:08:51',2);
insert into comment values(3,'Great compitition',1,'2021-09-04 14:09:25',3);
insert into comment values(4,'We are going to win',1,'2021-09-04 14:11:28',1);

insert into comment values(5,'You Are Right',1,'2021-09-04 14:08:25',1);
insert into comment values(6,'Yadav is furios',2,'2021-09-04 14:011:51',2);
insert into comment values(7,'Great compitition',1,'2021-09-04 14:07:25',3);
insert into comment values(8,'We are going to win',1,'2021-09-04 14:18:28',1);

insert into comment values(9,'You Are Right',1,'2021-09-04 14:08:31',1);
insert into comment values(10,'Yadav is furios',2,'2021-09-04 14:08:17',2);
insert into comment values(13,'Great compitition',1,'2021-09-04 14:09:55',3);
insert into comment values(44,'We are going to win',1,'2021-09-04 14:11:42',1);

insert into comment values(21,'You Are Right',1,'2021-09-04 14:08:47',1);
insert into comment values(22,'Yadav is furios',2,'2021-09-04 14:48:51',2);
insert into comment values(23,'Great compitition',1,'2021-09-04 14:59:25',3);
insert into comment values(24,'We are going to win',1,'2021-09-04 14:11:58',1);

insert into comment values(31,'You Are Right',1,'2021-09-04 14:48:27',1);
insert into comment values(32,'Yadav is furios',2,'2021-09-04 14:08:51',2);
insert into comment values(33,'Great compitition',1,'2021-09-04 15:09:25',3);
insert into comment values(34,'We are going to win',1,'2021-09-04 14:31:58',1);

insert into comment values(41,'You Are Right',1,'2021-09-04 14:58:46',1);
insert into comment values(42,'Yadav is furios',2,'2021-09-04 14:08:51',2);
insert into comment values(43,'Great compitition',1,'2021-09-04 14:04:25',3);
insert into comment values(44,'We are going to win',1,'2021-09-04 14:01:28',1);

insert into comment values(51,'You Are Right',1,'2021-09-04 14:38:47',1);
insert into comment values(52,'Yadav is furios',2,'2021-09-04 14:15:51',2);
insert into comment values(53,'Great compitition',1,'2021-09-04 14:35:25',3);
insert into comment values(54,'We are going to win',1,'2021-09-04 16:11:28',1);

insert into comment values(61,'You Are Right',1,'2021-09-04 14:08:47',1);
insert into comment values(62,'Yadav is furios',2,'2021-09-04 14:08:38',2);
insert into comment values(63,'Great compitition',1,'2021-09-04 14:09:25',3);
insert into comment values(64,'We are going to win',1,'2021-09-04 14:33:28',1);

select * from comment;
select id,createdts from comment;


/*-------------Query--------------*/

select a.name,p.name as post,c.content, c.createdts,c.id as cid
from author a
inner join post p on a.id = p.authorid
inner join comment c on c.postid=p.authorid 
where a.name = 'James Bond' order by c.createdts desc limit 10;