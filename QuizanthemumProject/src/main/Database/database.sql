use quizanthemum_schema;


# ************************************************** DROP TABLES  *************************************************

drop table if exists question_events;
drop table if exists questions;
drop table if exists challenges;
drop table if exists quiz_events;
drop table if exists friendships;
drop table if exists achievement_events;
drop table if exists achievements;
drop table if exists quiz_rating_events;
drop table if exists quizzes;
drop table if exists  friend_requests;
drop table if exists users;
drop table if exists categories;



-- ****************************************  USERS  ****************************************
create table users(
                      id int primary key AUTO_INCREMENT,
                      username varchar(64) unique key,
                      password varchar(64) not null,
                      first_name varchar(64) not null,
                      last_name varchar(64) not null,
                      role int not null,
                      city varchar(32),
                      country varchar(32),
                      email varchar(64) not null,
                      phone_number varchar(32),
                      birth_date date,
                      registration_date date,
                      photo_url varchar(256),
                      password_salt varchar(256)
)CHARSET=utf8;

-- adding default users into database
-- password for all users: p
insert into users values(null, 'dbera17', 'aded4da942a8cce63c63b69194d36b7d7f90eba2', 'Dima', 'Beradze', 3, 'Tbilisi', 'Georgia', 'dbera17@freeuni.edu.ge', '+995 568 698 400', SYSDATE(), SYSDATE(), 'https://scontent.ftbs5-2.fna.fbcdn.net/v/t1.0-9/84261005_1604549699714581_1382890228796283856_o.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=gDwQBQ0iRb0AX93pSHW&_nc_ht=scontent.ftbs5-2.fna&oh=571aca1c7460bd77f9701cbd3bfd0c98&oe=5F4E4D02', 'X9NCmZs0cgzI7Mu');
insert into users values(null, 'dgogi17', 'aded4da942a8cce63c63b69194d36b7d7f90eba2', 'Davit', 'Goginashvili', 3, 'Tbilisi', 'Georgia', 'dgogi17@freeuni.edu.ge', '+995 598 322 837', SYSDATE(), SYSDATE(), 'https://scontent.ftbs5-2.fna.fbcdn.net/v/t1.0-9/67403386_2182458128546365_6922830099616104448_o.jpg?_nc_cat=111&_nc_sid=85a577&_nc_ohc=YD1s742rAvgAX-jPiZY&_nc_ht=scontent.ftbs5-2.fna&oh=9e2721bf0106fd4c5d13201cafe55c8e&oe=5F4F8523', 'X9NCmZs0cgzI7Mu');
insert into users values(null, 'gkhiz17', 'aded4da942a8cce63c63b69194d36b7d7f90eba2', 'Giga', 'Khizanishvili', 3, 'Tbilisi', 'Georgia',  'gkhiz17@freeuni.edu.ge', '+995577543346', SYSDATE(), SYSDATE(), 'https://scontent.ftbs5-1.fna.fbcdn.net/v/t1.0-9/116436394_906874563144396_7578097191367097934_o.jpg?_nc_cat=100&_nc_sid=85a577&_nc_ohc=cLtNBE9eBBcAX-u07cY&_nc_ht=scontent.ftbs5-1.fna&oh=56eaed90c7fa8b913693f41ca7b7c7ad&oe=5F4DDD00', 'X9NCmZs0cgzI7Mu');
insert into users values(null, 'ishal17', 'aded4da942a8cce63c63b69194d36b7d7f90eba2', 'Irakli', 'Shalibashvili', 3, 'Tbilisi', 'Georgia', 'ishal17@freeuni.edu.ge', '+995 598 101 151', SYSDATE(), SYSDATE(), 'https://scontent.ftbs5-2.fna.fbcdn.net/v/t1.0-9/83945758_3003050643061168_6610406129736351744_o.jpg?_nc_cat=103&_nc_sid=85a577&_nc_ohc=jEwsn-QJAFkAX-Zqz2a&_nc_ht=scontent.ftbs5-2.fna&oh=b769765b8129fe79c82e8863d51a30fd&oe=5F4FC022', 'X9NCmZs0cgzI7Mu');
insert into users values(null, 'lkhiz17', 'aded4da942a8cce63c63b69194d36b7d7f90eba2', 'Luka', 'Khizanishvili', 3, 'Tbilisi', 'Georgia', 'lkhiz17@freeuni.edu.ge', '+995 593 687 830', SYSDATE(), SYSDATE(), 'https://scontent.ftbs5-1.fna.fbcdn.net/v/t1.0-9/106636827_2576079655967505_9137159715524780313_o.jpg?_nc_cat=108&_nc_sid=85a577&_nc_ohc=Rtn8bAzCYvEAX8LYvvf&_nc_ht=scontent.ftbs5-1.fna&oh=5ff2309ea7bef0bc1af88ef4169ff770&oe=5F4DEB18', 'X9NCmZs0cgzI7Mu');

INSERT INTO users VALUES(null, 'p', 'aded4da942a8cce63c63b69194d36b7d7f90eba2', 'p', 'p', 2, 'p', 'p', 'p@p', null, SYSDATE(), SYSDATE(), null, 'X9NCmZs0cgzI7Mu');


--  *******************************************  CATEGORIES  ******************************************
CREATE TABLE categories(
                           id int primary key auto_increment,
                           name varchar(64)
)CHARSET=utf8;

INSERT INTO categories VALUES (null, 'Biology');
INSERT INTO categories VALUES (null, 'Georgraphy');
INSERT INTO categories VALUES (null, 'History');
INSERT INTO categories VALUES (null, 'Literature');
INSERT INTO categories VALUES (null, 'Mathematics');
INSERT INTO categories VALUES (null, 'Sports');
INSERT INTO categories VALUES (null, 'Physics');
INSERT INTO categories VALUES (null, 'Films');
INSERT INTO categories VALUES (null, 'Chemistry');
INSERT INTO categories VALUES (null, 'Art');


# ************************************  QUIZZES  ***********************************

create table quizzes(
                        ID int primary key AUTO_INCREMENT,
                        NAME varchar(64),
                        CATEGORY_ID int,
                        constraint foreign key (CATEGORY_ID)
                            references categories(ID) on update cascade on delete restrict ,
                        DESCRIPTION text,
                        ICON_URL varchar(256),
                        MUST_SHUFFLE_QUESTIONS boolean not null ,
                        COMMENT varchar(256),
                        AUTHOR_ID int,
                        constraint foreign key (AUTHOR_ID)
                            references users(id) on update cascade on delete restrict,
                        CREATION_DATE date,
                        MAX_SCORE double
)CHARSET=utf8;



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

drop table friend_request;



# *******************************************  CHALLENGES  ******************************************

create table challenges(
                           id int primary key auto_increment,
                           quiz_id int not null,
                            constraint  foreign key (quiz_id)
                                references quizzes(id) on update cascade on delete restrict,
                           challenger_user_id int not null,
                           constraint foreign key (challenger_user_id)
                               references users(id) on update cascade on delete restrict,
                           challenged_user_id int not null,
                           constraint foreign key (challenged_user_id)
                               references users(id) on update cascade on delete restrict,
                           challenger_quiz_event_id int,
                           challenged_quiz_event_id int,
                           is_finished boolean,
                           winner_id int,
                           challenging_date date,
                           accepting_date date
);


# *******************************************  COUNTRIES  ******************************************

-- !!! while creating database, after creating countries table you should run CountriesLoader.java
-- file from main/java/Tools, which inserts all counties

create table countries(
                          id int primary key auto_increment,
                          name varchar(100) not null unique
);


# ***********************************************  ACHIEVEMENTS  ***********************************************

create table achievements(
                             id int primary key auto_increment,
                             title varchar(64),
                             description varchar(64),
                             icon_url varchar(256)
)CHARSET=utf8;



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
SELECT * FROM countries;
SELECT * FROM friend_request;

# insert into challenges values(null, 1, 3, 4, null, null, false, -1, SYSDATE(), SYSDATE());
