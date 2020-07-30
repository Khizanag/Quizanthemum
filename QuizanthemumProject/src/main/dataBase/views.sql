-- most quizzes made
use quizanthemum;
create view top_10_by_most_quizzes_played as
select distinct(qe.user_id),
               (select count(*)
                from quiz_events qev
                where qe.user_id = qev.user_id
               ) as quizzes_played
from quiz_events qe
where (select count(*)
       from quiz_events qev
       where (select count(*)
              from quiz_events quev
              where qe.user_id = quev.user_id) >= (select count(*)
                                                   from quiz_events quev
                                                   where qev.user_id = quev.user_id)) <= 10
order by 2 desc;
