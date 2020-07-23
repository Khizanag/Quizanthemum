create table quizzes(
                        ID integer(16) primary key,
                        NAME varchar(64),
                        DESCRIPTION text,
                        ICON_URL varchar(256),
                        MUST_SHUFFLE_QUESTIONS boolean not null ,
                        COMMENT varchar(256),
                        AUTHOR_ID integer(16),
                        constraint foreign key (AUTHOR_ID)
                            references users(id) on update cascade on delete restrict,
                        CREATION_DATE date,
                        MAX_SCORE integer(8)
);

set @quiz_id_seq := 0;

create procedure add_quiz(
    NAME varchar(64),
    DESCRIPTION text,
    ICON_URL varchar(256),
    MUST_SHUFFLE_QUESTIONS boolean,
    COMMENT varchar(256),
    AUTHOR_ID integer(16),
    MAX_SCORE integer(8)
)
begin
    insert into quizzes values((select @quiz_id_seq := @quiz_id_seq + 1), NAME, DESCRIPTION, ICON_URL,
                               MUST_SHUFFLE_QUESTIONS, COMMENT, AUTHOR_ID, sysdate(), MAX_SCORE);
end;

call add_quiz('istoria', 'daweret argumentirebuli ese', null,
              true, 'daasabutet argimentirebulad', 3,  100);