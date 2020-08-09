# ********************************************  QUESTION_EVENTS  ****************************************

create table question_events(
                                id int primary key auto_increment,
                                quiz_event_id int not null,
                                constraint foreign key (quiz_event_id)
                                    references quiz_events(id) on update cascade on delete restrict,
                                start_date date,
                                end_date date,
                                is_already_graded boolean,
                                user_score double,
                                question_id int not null,
                                constraint foreign key (question_id)
                                    references questions(id) on update cascade on delete restrict,
                                user_answer_0 text,
                                user_answer_1 varchar(64),
                                user_answer_2 varchar(64),
                                user_answer_3 varchar(64),
                                user_answer_4 varchar(64),
                                user_answer_5 varchar(64),
                                user_answer_6 varchar(64),
                                user_answer_7 varchar(64),
                                user_answer_8 varchar(64),
                                user_answer_9 varchar(64),
                                user_answer_10 varchar(64),
                                user_answer_11 varchar(64),
                                user_answer_12 varchar(64),
                                user_answer_13 varchar(64),
                                user_answer_14 varchar(64),
                                user_answer_15 varchar(64)
)CHARSET=utf8;