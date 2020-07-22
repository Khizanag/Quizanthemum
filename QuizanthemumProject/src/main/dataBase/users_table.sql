create table users(
                      id integer(16) primary key,
                      username varchar(64) unique key,
                      password varchar(64) not null,
                      first_name varchar(64) not null,
                      last_name varchar(64) not null,
                      city varchar(32),
                      country varchar(32),
                      phone_number varchar(32),
                      email varchar(64) not null,
                      birth_date date,
                      registration_date date
);

-- adding users

set @user_id_seq := 0;

create procedure add_user(username varchar(64),
                          password varchar(64),
                          first_name varchar(64),
                          last_name varchar(64),
                          city varchar(32),
                          country varchar(32),
                          phone_number varchar(32),
                          email varchar(64),
                          birth_date date)
begin
    insert into users values ((select @user_id_seq := @user_id_seq + 1),
                              username, password, first_name, last_name,
                              city, country, phone_number, email, birth_date, sysdate()
                             );
end;

call add_user('lukaStan', 'stan123', 'luka',
              'khizanishvili', 'giganti', 'GDR', '123456789', 'lkhiz17',
              str_to_date('18,4,1999', '%d,%m,%Y'));

call add_user('shaliba', 'astraqciebi123',
              'irakli', 'shalibashvili', 'tbilisi', 'GEO', '101151',
              'ishal17', str_to_date('31,5,1999', '%d,%m,%Y'));

call add_user('gigla', 'barca123', 'giga',
              'khizanishvili', 'giganti', 'GDR', '123123123', 'lkhiz17',
              str_to_date('24,8,1999', '%d,%m,%Y'));