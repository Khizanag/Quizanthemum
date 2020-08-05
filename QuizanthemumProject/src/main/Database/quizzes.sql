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