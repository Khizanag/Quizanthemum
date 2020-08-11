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

select * from quizzes;


-- default quizzes(category_id and author_id must be written manually!!!)
insert into quizzes values (null, 'Geography quiz', 14, 'Check how you know capital cities', null, false, 'This quiz is easy one',
                            '1', sysdate(), 4);

insert into quizzes values (null, 'NBA quiz', 18, 'check how you recognize NBA players',
                            'https://theundefeated.com/wp-content/uploads/2017/06/nbalogo.jpg?w=1400',
                            false, 'this quiz is easy one',
                            '1', sysdate(), 2);

insert into quizzes values (null, 'Football quiz', 18, 'check how you football history',
                            'https://previews.123rf.com/images/wannen19/wannen191809/wannen19180900002/108328455-football-logo-designs.jpg',
                            false, 'this quiz is easy one',
                            '1', sysdate(), 4);

insert into quizzes values (null, 'Barcelona quiz', 18, 'check how you know FC Bacelona history',
                            'https://images-na.ssl-images-amazon.com/images/I/61tyTfiqc7L._SL1500_.jpg',
                            false, 'quiz for Barca fans', '1', sysdate(), 4);

insert into quizzes values(null, 'Musical quiz', 24, 'check how good you are at music hits',
                           'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/06/music-logo-design.jpg',
                           false, 'quiz for music fans', '1', sysdate(), 4);

insert into quizzes values(null, 'Mythology quiz', 25, 'check how you remember mythology',
                           '',
                           false, 'quiz for mythology lovers', '1', sysdate(), 4);

insert into quizzes values (null, 'NBA quiz', 18, 'check how you know NBA teams',
                            'https://theundefeated.com/wp-content/uploads/2017/06/nbalogo.jpg?w=1400',
                            false, 'quiz fow NBA geeks',
                            '1', sysdate(), 2);

insert into quizzes values (null, 'math quiz', 13, 'check your logic', null,
                            false, 'quiz for math lovers',
                            '1', sysdate(), 4);



