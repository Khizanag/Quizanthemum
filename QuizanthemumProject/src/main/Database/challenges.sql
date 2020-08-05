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