call sign_up("AbhimanyuBellam","Abhimanyu","Bellam","bellam@gmail.com","1234",@p1);

call sign_up("AbhinavReddy","Abhinav","Reddy","nimma@gmail.com","1234",@p2);

call sign_up("RohithGilla","Rohith","Gilla","gilla@gmail.com","1234",@p3);


call send_request("bellam@gmail.com","gilla@gmail.com",@p4);

call accept_request("bellam@gmail.com","gilla@gmail.com",@p5);

call send_request("gilla@gmail.com","nimma@gmail.com",@p6);

-- call decline_request("gilla@gmail.com","nimma@gmail.com",@p7)


call cancel_request("gilla@gmail.com","nimma@gmail.com",@p8);


call sign_in("bellam@gmail.com","1234",@p9);

call send_message("bellam@gmail.com","gilla@gmail.com","HI ROHITH",@p10);


call send_message("gilla@gmail.com","bellam@gmail.com","HI BELLAM",@p11);


call send_message("gilla@gmail.com","nimma@gmail.com","HI NIMMA",@p12);

call check_online("bellam@gmail.com",@p13);



select * from Messages;


call add_post("bellam@gmail.com","First tweet in the dbms",'1.png',@p14);

call add_like(1,3,@p15);



select * from Posts;