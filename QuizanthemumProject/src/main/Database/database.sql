use quizanthemum_schema;


# ****************************************  USERS  ****************************************
create table users(
                      id smallint primary key AUTO_INCREMENT,
                      username varchar(64) unique key,
                      password varchar(64) not null,
                      first_name varchar(64) not null,
                      last_name varchar(64) not null,
                      role smallint not null,
                      city varchar(32),
                      country varchar(32),
                      email varchar(64) not null,
                      phone_number varchar(32),
                      birth_date date,
                      registration_date date,
                      photo_url varchar(256),
                      password_salt varchar(256)
)CHARSET=utf8;

# *******************************************  CATEGORIES  ******************************************
CREATE TABLE categories(
                           id int primary key auto_increment,
                           name varchar(64)
)CHARSET=utf8;


# ************************************  QUIZZES  ***********************************

create table quizzes(
                        ID smallint primary key AUTO_INCREMENT,
                        NAME varchar(64),
                        CATEGORY_ID int,
                        constraint foreign key (CATEGORY_ID)
                            references categories(ID) on update cascade on delete restrict ,
                        DESCRIPTION text,
                        ICON_URL varchar(256),
                        MUST_SHUFFLE_QUESTIONS boolean not null ,
                        COMMENT varchar(256),
                        AUTHOR_ID smallint,
                        constraint foreign key (AUTHOR_ID)
                            references users(id) on update cascade on delete restrict,
                        CREATION_DATE date,
                        MAX_SCORE double
)CHARSET=utf8;



# *****************************************  QUIZ_EVENTS  ********************************************

create table quiz_events(
                            id smallint primary key AUTO_INCREMENT,
                            quiz_id smallint not null,
                            user_id smallint not null,
                            start_date date,
                            finish_date date,
                            total_score double,
                            constraint foreign key (quiz_id)
                                references quizzes(id) on update cascade on delete restrict,
                            constraint foreign key (user_id)
                                references users(id) on update cascade on delete restrict
);



# *****************************************  QUESTIONS  ******************************************

create table questions(
                          id smallint primary key auto_increment,
                          type smallint not null,
                          is_auto_graded boolean,
                          max_score double,
                          header_statement text,
                          text_statement text,
                          picture_statement_url varchar(256),
                          comment varchar(256),
                          source varchar(256),
                          creation_date date,
                          quiz_id smallint,
                          constraint foreign key (quiz_id)
                              references quizzes(id) on update cascade on delete restrict,
                          is_picture_statement boolean,
                          num_statements smallint,
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
                          num_answers smallint,
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



# ********************************************  QUESTION_EVENTS  ****************************************

create table question_events(
                                id smallint primary key auto_increment,
                                quiz_event_id smallint not null,
                                constraint foreign key (quiz_event_id)
                                    references quiz_events(id) on update cascade on delete restrict,
                                start_date date,
                                end_date date,
                                is_already_graded boolean,
                                user_score double,
                                question_id smallint not null,
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



# ******************************************  FRIENDSHIPS  ******************************************

create table friendships(
                            id smallint primary key auto_increment,
                            first_friend_id smallint,
                            constraint foreign key (first_friend_id)
                                references users(id) on update cascade on delete restrict,
                            second_friend_id smallint,
                            constraint foreign key (second_friend_id)
                                references users(id) on update cascade on delete restrict,
                            make_friend_date date
);



# *******************************************  CHALLENGES  ******************************************

create table challenges(
                           id smallint primary key auto_increment,
                           challenger_user_id smallint not null,
                           constraint foreign key (challenger_user_id)
                               references users(id) on update cascade on delete restrict,
                           challenged_user_id smallint not null,
                           constraint foreign key (challenged_user_id)
                               references users(id) on update cascade on delete restrict,
                           challenger_quiz_event_id smallint,
                           challenged_quiz_event_id smallint,
                           is_finished boolean,
                           winner_id smallint,
                           challenging_date date,
                           accepting_date date
);



# ***********************************************  ACHIEVEMENTS  ***********************************************

create table achievements(
                             id smallint primary key auto_increment,
                             title varchar(64),
                             description varchar(64),
                             icon_url varchar(256)
)CHARSET=utf8;



# *********************************************  ACHIEVEMENT_EVENTS  *********************************************

create table achievement_events(
                                   id smallint primary key auto_increment,
                                   achievement_id smallint not null,
                                   constraint foreign key (achievement_id)
                                       references achievements(id) on update cascade on delete restrict,
                                   user_id smallint not null,
                                   constraint foreign key (user_id)
                                       references users(id) on update cascade on delete restrict,
                                   achieve_date date
);

# *********************************************  QUIZ_RATING_EVENTS  *********************************************

create table quiz_rating_events(
                                   id smallint primary key auto_increment,
                                   user_id smallint not null,
                                   constraint foreign key (user_id)
                                       references users(id) on update cascade on delete restrict,
                                   quiz_id smallint not null,
                                   constraint foreign key (quiz_id)
                                       references quizzes(id) on update cascade on delete restrict,
                                   num_stars smallint not null
);


# ************************************************** DROP TABLES  *************************************************

drop table if exists question_events;
drop table if exists questions;
drop table if exists quiz_events;
drop table if exists friendships;
drop table if exists challenges;
drop table if exists achievement_events;
drop table if exists achievements;
drop table if exists quiz_rating_events;
drop table if exists quizzes;
drop table if exists users;
drop table if exists categories;
# ***************************************************  FOR TESTING  **************************************************

SELECT * FROM achievement_events;
SELECT * FROM achievements;
SELECT * FROM categories;
SELECT * FROM challenges;
SELECT * FROM friendships;
SELECT * FROM question_events;
SELECT * FROM questions;
SELECT * FROM quiz_events;
SELECT * FROM quizzes;
SELECT * FROM users;
SELECT * FROM quiz_rating_events;


# *********************************************** ADD ALL CATEGORIES   ***********************************************

INSERT INTO categories VALUES (null, 'ბიოლოგია');
INSERT INTO categories VALUES (null, 'გეოგრაფია');
INSERT INTO categories VALUES (null, 'ისტორია');
INSERT INTO categories VALUES (null, 'ლიტერატურა');
INSERT INTO categories VALUES (null, 'მათემატიკა');
INSERT INTO categories VALUES (null, 'სპორტი');
INSERT INTO categories VALUES (null, 'ფიზიკა');
INSERT INTO categories VALUES (null, 'ფილმები');
INSERT INTO categories VALUES (null, 'ქიმია');
INSERT INTO categories VALUES (null, 'ხელოვნება');
