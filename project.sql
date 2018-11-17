-- create database dbms_project;
-- use dbms_project;
-- create table UserDetails(UID int(10) primary key,UserName varchar(20) not null,FName varchar(15) not null,LName varchar(15) not null,Email varchar(30) not null,Password varchar(30) not null, UNIQUE(Email));

-- insert into UserDetails values(1,"Abhimanyu_Bellam","Abhimanyu","Bellam","bellam@gmail.com","1234");

-- insert into UserDetails values(2,"Rohith_Gilla","Rohith","Gilla","gilla@gmail.com","1234");

-- create table Friends(FID int(10) primary key,ToUID int(10),FromUID int(10), foreign key(ToUID) references UserDetails(UID),foreign key(FromUID) references UserDetails(UID));

-- insert into Friends values(1,2,1);


-- insert into UserDetails values(3,"Abhinav_Reddy","Abhinav","Reddy","reddy@gmail.com","1234");


-- insert into Friends values(3,1,3);


-- CREATE table Messages(MID int(10),ToUID int(10),FromUID int(10), Message varchar(1000));

-- INSERT into Messages values (1,2,1,"Wassup Gilla");

-- INSERT into Messages values (2,3,1,"Wassup Abhinav");


-- delimiter #
-- create procedure send_message(in from_uid int(10), in to_uid int(10),in msg varchar(1000),out response int (1))
-- BEGIN
--     declare t INTEGER;
--     if (SELECT count(*) from Friends where Friends.ToUID=to_uid  and Friends.FromUID=from_uid or Friends.ToUID=from_uid and Friends.FromUID=to_uid) !=0 THEN
--         select MID into t from Messages order by MID desc limit 1; 
--         INSERT into Messages values (t+1,to_uid,from_uid,msg);
--     end IF;
-- END;






