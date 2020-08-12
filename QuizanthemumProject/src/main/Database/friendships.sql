# ******************************************  FRIENDSHIPS  ******************************************

create table friendships(
                            id int primary key auto_increment,
                            first_friend_id int,
                            constraint foreign key (first_friend_id)
                                references users(id) on update cascade on delete restrict,
                            second_friend_id int,
                            constraint foreign key (second_friend_id)
                                references users(id) on update cascade on delete restrict,
                            make_friend_date date
);

SELECT * FROM friendships;

INSERT INTO friendships VALUES(null, 3, 6, SYSDATE());

DELETE FROM friendships WHERE true;