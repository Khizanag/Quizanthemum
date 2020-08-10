# ***********************************************  ACHIEVEMENTS  ***********************************************

create table achievements(
                             id int primary key auto_increment,
                             title varchar(64),
                             description varchar(64),
                             icon_url varchar(256)
)CHARSET=utf8;

insert into achievements values (null, 'Quiz Master - Bronze', 'You have taken 5 quizzes', 'https://cdn0.iconfinder.com/data/icons/sport-balls/512/bronze_medal.png');
insert into achievements values (null, 'Quiz Master - Silver', 'You have taken 15 quizzes', 'https://cdn0.iconfinder.com/data/icons/sport-balls/512/silver_medal.png');
insert into achievements values (null, 'Quiz Master - Gold', 'You have taken 30 quizzes', 'https://cdn0.iconfinder.com/data/icons/sport-balls/512/gold_medal.png');
insert into achievements values (null, 'Knowledge Spreader - Bronze', 'You have created 5 quizzes', 'https://img.favpng.com/25/8/9/trophy-cup-award-silver-clip-art-png-favpng-nQLmfnGfZiQX5M7bpBhb4AWLK.jpg');
insert into achievements values (null, 'Knowledge Spreader - Silver', 'You have created 15 quizzes', 'https://img.pngio.com/download-silver-cup-trophy-clipart-png-photo-toppng-silver-trophy-png-840_859.png');
insert into achievements values (null, 'Knowledge Spreader - Gold', 'You have created 30 quizzes', 'https://f0.pngfuel.com/png/895/695/gold-trophy-clip-art-png-clip-art.png');
