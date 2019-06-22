# 1.查询同时存在1课程和2课程的情况
select * from student s where s.id in (select sc.studentId from student_course sc,student_course sc1 where sc.studentId = sc1.studentId and sc.courseId = 1 and sc1.courseId = 2);
# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.id,s.name,avg(sc.score) avg from student s inner join student_course sc on s.id = sc.studentId group by sc.studentId having avg >= 60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in (select studentId from student_course);
# 5.查询所有有成绩的SQL
select * from student s, student_course sc where s.id = sc.studentId group by sc.studentId;
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student s where s.id in (select sc.studentId from student_course sc,student_course sc1 where sc.studentId = sc1.studentId and sc.courseId = 1 and sc1.courseId = 2);
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student s,student_course sc where s.id = sc.studentId and sc.courseId = 1 and sc.score < 60 order by sc.score desc;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select sc.courseId,avg(sc.score) avg from student_course sc group by sc.courseId order by avg desc,sc.courseId asc;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name,sc.score from student s,student_course sc where s.id = sc.studentId and sc.courseId = (select c.id from course c where c.name = '数学') and sc.score < 60;