select distinct s.student_id, s.student_name
from Student s, Exam e
where s.student_id = e.student_id
and s.student_id not in
    (select e1.student_id from Exam e1 inner join
        (select exam_id, max(score) as max_s, min(score) as min_s 
        from Exam
        group by exam_id) as e2
    on e1.exam_id = e2.exam_id
    where e1.score = max_s or e1.score = min_s)
order by s.student_id
