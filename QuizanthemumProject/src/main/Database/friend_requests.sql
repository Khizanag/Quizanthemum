-- ****************************************** FRIEND_REQUESTS ******************************************

create table friend_request(
                               id int primary key auto_increment,
                               sender_id int not null,
                               constraint foreign key (sender_id)
                                   references users(id) on update cascade on delete restrict,
                               receiver_id int not null,
                               constraint foreign key (receiver_id)
                                   references users(id) on update cascade on delete restrict,
                               sending_date DATE not null,
                               receiving_date DATE not null,
                               is_received boolean not null,
                               is_accepted boolean not null
);