create database dbms_project3;
use dbms_project3;
create table UserDetails(UID int(10) primary key auto_increment,UserName varchar(20) not null,FName varchar(15) not null,LName varchar(15) not null,Email varchar(30) not null,Pass varchar(30) not null, UNIQUE(Email),online_status varchar(20));

-- insert into UserDetails values(1,"Abhimanyu_Bellam","Abhimanyu","Bellam","bellam@gmail.com","1234","offline");

-- insert into UserDetails values(2,"Rohith_Gilla","Rohith","Gilla","gilla@gmail.com","1234","offline");

create table Friends(FID int(10) primary key auto_increment,ToUID int(10),FromUID int(10), foreign key(ToUID) references UserDetails(UID),foreign key(FromUID) references UserDetails(UID));

-- insert into Friends values(1,2,1);


-- insert into UserDetails values(3,"Abhinav_Reddy","Abhinav","Reddy","reddy@gmail.com","1234","offline");


-- insert into Friends values(3,1,3);


CREATE table Messages(MID int(10),ToUID int(10),FromUID int(10), Message varchar(1000),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

-- INSERT into Messages values (1,2,1,"Wassup Gilla");

-- INSERT into Messages values (2,3,1,"Wassup Abhinav");


delimiter #


create procedure sign_up(in UserName varchar(20) ,in FName varchar(15) ,LName varchar(15) ,email varchar(30),pass_word varchar(30),out response varchar(30))
BEGIN
    if (select count(*) from UserDetails where UserDetails.Email=email)!=0 THEN
        set response:="Email already exists";
        select response as 'response';
    
    else 
        insert into UserDetails(UserName,FName,LName,Email,Pass,online_status)
        values(UserName,FName,LName,email,pass_word,"0");
            set response:="UR SIGNED UP!";
            select response as 'response';
    end if;
    end;
#


create procedure send_message(in from_email varchar(30), in to_email varchar(30),in msg varchar(1000),out response int (1))
BEGIN
    declare t INTEGER;
    declare sender VARCHAR(30);
    declare receiver VARCHAR(30);
    select UID into sender from UserDetails where Email=sender;
    select UID into receiver from UserDetails where Email=receiver;


    if (SELECT count(*) from Friends where Friends.ToUID= receiver and Friends.FromUID=sender or Friends.Email=sender and Friends.FromUID=receiver) !=0 THEN
        select MID into t from Messages order by MID desc limit 1; 
        INSERT into Messages values (t+1,to_uid,from_uid,msg);
    end IF;
END;

#


create procedure sign_in(in EmailID varchar(30), in PassW varchar(30), out response varchar(30) )
BEGIN
    if (select count(*) from UserDetails where UserDetails.Email=EmailID and UserDetails.Pass=PassW) !=0 THEN
        update UserDetails set online_status="1" where UserDetails.Email=emailID;
        set response:="Succesful";
        select response as 'response';
    else 
        set response:="Invalid Email Id/Password";
        select response as 'response';

        end IF;
    end;
#


create procedure create_friendship(sender varchar(30), receiver varchar(30),out response varchar(30))
BEGIN
    declare sender VARCHAR(30);
    declare receiver VARCHAR(30);
    select UID into sender from UserDetails where Email=sender;
    select UID into receiver from UserDetails where Email=receiver;

    if (SELECT count(*) from Friends where Friends.ToUID= receiver and Friends.FromUID=sender or Friends.Email=sender and Friends.FromUID=receiver) !=0 THEN
        set response:="You are already friends";
        select response as 'response';

    else 
        insert into Friends(ToUID,FromUID) values(sender,receiver);
        set response:="You are Friends now!";
        select response as 'response';
    end if;
    end;
#

delimiter ;

-- create table Album(AID int(10) primary key auto_increment,UID int(10),Aname varchar(30), Album(UID) references UserDetails(UID));

-- insert into Album values(1,1,"profile_photos");