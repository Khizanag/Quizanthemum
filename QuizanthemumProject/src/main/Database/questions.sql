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

-- default questions

--
insert into questions values (null, 3, true, 1, 'choose one', 'London is capital city of ...', null, '', '', sysdate(), 7, false, 4, 'UK', 'Georgia',
                              'USA', 'Russia', null, null, null, null, null, null, null, null, null, null, null, null, false, 1, 'UK', null, null, null, null, null, null, null,
                              null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'tbilisi is capital city of ...', null, '', '', sysdate(), 7, false, 4, 'UK', 'Georgia',
                              'USA', 'Russia', null, null, null, null, null, null, null, null, null, null, null, null, false, 1, 'Georgia', null, null, null, null, null, null, null,
                              null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'Moscow is capital city of ...', null, '', '', sysdate(), 7, false, 4, 'UK', 'Georgia',
                              'USA', 'Russia', null, null, null, null, null, null, null, null, null, null, null, null, false, 1, 'Russia', null, null, null, null, null, null, null,
                              null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'Washington D.C. is capital city of ...', null, '', '', sysdate(), 7, false, 4, 'UK', 'Georgia',
                              'USA', 'Russia', null, null, null, null, null, null, null, null, null, null, null, null, false, 1, 'USA', null, null, null, null, null, null, null,
                              null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'which NBA player is this',
                              'https://static01.nyt.com/images/2020/06/10/us/politics/10lebron-voters/merlin_164934105_7183e555-c1e0-4248-aba9-fc36ba5f9dc7-superJumbo.jpg?quality=90&auto=webp',
                              '', '', sysdate(), 8, true, 2, 'LeBron James', 'Kevin Durant', 'Russell WestBrook', 'Stephen Curry', null, null, null,
                              null, null, null, null, null, null, null, null, null, false, 1, 'LeBron James', null, null, null, null, null, null, null, null, null, null, null, null, null,
                              null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'which NBA player is this',
                              'https://davihundotcom.files.wordpress.com/2016/07/durant-a-warroir.jpg',
                              '', '', sysdate(), 8, true, 2, 'LeBron James', 'Kevin Durant', 'Russell WestBrook', 'Stephen Curry', null, null, null,
                              null, null, null, null, null, null, null, null, null, false, 1, 'Kevin Durant', null, null, null, null, null, null, null, null, null, null, null, null, null,
                              null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'Who won FIFA world cup in 2018?', null, '', '', sysdate(), 9, false, 4, 'England',
                              'France', 'Germany', 'Brazil', null, null, null, null, null, null, null, null, null, null, null, null, false, 1, 'France', null, null, null, null,
                              null, null, null, null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'Which player is this?',
                              'https://i.pinimg.com/originals/db/6e/48/db6e485386653b3b1ea3b6fbf5dfcf33.jpg',
                              '', '', sysdate(), 9, true, 4, 'Leonel Messi', 'Ronaldinho', 'David Backham', 'Andres Iniesta', null, null, null, null, null,
                              null, null, null, null, null, null, null, false, 1, 'Ronaldinho', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'Who scored the only goal in FIFA World Cup 2010 Final game:', null, '', '',
                              sysdate(), 9, false, 4, 'Leonel Messi', 'Ronaldinho', 'David Backham', 'Andres Iniesta',null, null, null, null, null, null, null,
                              null, null, null, null, null, false, 1, 'Andres Iniesta',null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

insert into questions values (null, 3, true, 1, 'choose one', 'Which Premier League team is this?',
                              'https://s.hs-data.com/bilder/teamfotos/640x360/544.jpg',
                              '', '', sysdate(), 9, true, 4, 'Chelsea', 'Everton', 'Liverpool', 'Manchester United', null, null, null,
                              null, null, null, null, null, null, null, null, null, false, 1, 'Chelsea', null, null, null, null, null, null, null, null, null, null, null, null, null,
                              null, null);
