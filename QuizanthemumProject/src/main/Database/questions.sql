# *****************************************  QUESTIONS  ******************************************

create table questions(
                          id int primary key auto_increment,
                          type int not null,
                          is_auto_graded boolean,
                          max_score double,
                          header_statement text,
                          text_statement text,
                          picture_statement_url varchar(256),
                          comment varchar(256),
                          source varchar(256),
                          creation_date date,
                          quiz_id int,
                          constraint foreign key (quiz_id)
                              references quizzes(id) on update cascade on delete restrict,
                          is_picture_statement boolean,
                          num_statements int,
                          statement_0 varchar(64),
                          statement_1 varchar(64),
                          statement_2 varchar(64),
                          statement_3 varchar(64),
                          statement_4 varchar(64),
                          statement_5 varchar(64),
                          statement_6 varchar(64),
                          statement_7 varchar(64),
                          statement_8 varchar(64),
                          statement_9 varchar(64),
                          statement_10 varchar(64),
                          statement_11 varchar(64),
                          statement_12 varchar(64),
                          statement_13 varchar(64),
                          statement_14 varchar(64),
                          statement_15 varchar(64),
                          is_picture_answer boolean,
                          num_answers int,
                          answer_0 varchar(64),
                          answer_1 varchar(64),
                          answer_2 varchar(64),
                          answer_3 varchar(64),
                          answer_4 varchar(64),
                          answer_5 varchar(64),
                          answer_6 varchar(64),
                          answer_7 varchar(64),
                          answer_8 varchar(64),
                          answer_9 varchar(64),
                          answer_10 varchar(64),
                          answer_11 varchar(64),
                          answer_12 varchar(64),
                          answer_13 varchar(64),
                          answer_14 varchar(64),
                          answer_15 varchar(64)
)CHARSET=utf8;