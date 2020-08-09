# *****************************************  QUIZ_EVENTS  ********************************************

create table quiz_events(
                            id int primary key AUTO_INCREMENT,
                            quiz_id int not null,
                            user_id int not null,
                            start_date date,
                            finish_date date,
                            total_score double,
                            constraint foreign key (quiz_id)
                                references quizzes(id) on update cascade on delete restrict,
                            constraint foreign key (user_id)
                                references users(id) on update cascade on delete restrict
);