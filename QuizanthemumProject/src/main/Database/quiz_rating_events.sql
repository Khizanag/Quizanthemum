# *********************************************  QUIZ_RATING_EVENTS  *********************************************

create table quiz_rating_events(
                                   id int primary key auto_increment,
                                   user_id int not null,
                                   constraint foreign key (user_id)
                                       references users(id) on update cascade on delete restrict,
                                   quiz_id int not null,
                                   constraint foreign key (quiz_id)
                                       references quizzes(id) on update cascade on delete restrict,
                                   num_stars int not null
);