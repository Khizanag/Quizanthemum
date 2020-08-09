select * from friendships;

insert into friendships values(null, 2, 3, SYSDATE());

select * from friend_request;

insert into friend_request values(null, 2, 3, SYSDATE(), SYSDATE(), false, false);

update friend_request
set
    is_received = true,
    is_accepted = true
where true;