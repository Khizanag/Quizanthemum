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

-- default quizzes
insert into quizzes values (null, 'Geography quiz', 2, 'Check how you know capital cities', null, false, 'This quiz is easy one',
                            '1', sysdate(), 4);

insert into quizzes values (null, 'NBA quiz', 6, 'check how you recognize NBA players',
                            'https://theundefeated.com/wp-content/uploads/2017/06/nbalogo.jpg?w=1400',
                            false, 'this quiz is easy one',
                            '1', sysdate(), 2);

insert into quizzes values (null, 'Football quiz', 6, 'check how you football history',
                            'https://previews.123rf.com/images/wannen19/wannen191809/wannen19180900002/108328455-football-logo-designs.jpg',
                            false, 'this quiz is easy one',
                            '1', sysdate(), 4);