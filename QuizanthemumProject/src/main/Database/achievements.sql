# ***********************************************  ACHIEVEMENTS  ***********************************************

create table achievements(
                             id int primary key auto_increment,
                             title varchar(64),
                             description varchar(64),
                             icon_url varchar(256)
)CHARSET=utf8;