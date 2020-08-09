# *********************************************  ACHIEVEMENT_EVENTS  *********************************************

create table achievement_events(
                                   id int primary key auto_increment,
                                   achievement_id int not null,
                                   constraint foreign key (achievement_id)
                                       references achievements(id) on update cascade on delete restrict,
                                   user_id int not null,
                                   constraint foreign key (user_id)
                                       references users(id) on update cascade on delete restrict,
                                   achieve_date date
);