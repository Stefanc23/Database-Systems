USE elearning;


CREATE VIEW class_people
AS
SELECT
	class_detail.term AS 'Term',
    class.category AS 'Class',
    course.name AS 'Course',
    lecturer.name AS 'Lecturer',
    student.name AS 'Student'
FROM class_detail
INNER JOIN student ON class_detail.student_id = student.id
INNER JOIN course ON class_detail.course_id = course.id
INNER JOIN lecturer ON class_detail.lecturer_id = lecturer.id
INNER JOIN class ON class_detail.class_id = class.id
GROUP BY class_detail.term, class.category, course.name, lecturer.name;

SELECT * FROM class_people;


CREATE VIEW all_course
AS
SELECT 
	class_detail.term AS 'Term',
    class.category AS 'Class',
    course.name AS 'Course',
    forum_thread.title AS 'Forum Thread',
    assignment_question.title AS 'Assignment Question'
FROM course
INNER JOIN class_detail ON course.id = class_detail.course_id
INNER JOIN class ON class_detail.class_id = class.id
INNER JOIN forum_thread ON forum_thread.class_detail_id = class_detail.id
INNER JOIN assignment_question ON assignment_question.class_detail_id = class_detail.id
GROUP BY class_detail.term, class.category, course.name, forum_thread.title;

SELECT * FROM all_course;


CREATE VIEW all_forum
AS
SELECT 
	class_detail.term AS 'Term',
    class.category AS 'Class',
    forum_thread.title AS 'Forum Thread Title',
    forum_thread.content AS 'Forum Thread Content',
    forum_thread_reply.title AS 'Forum Thread Reply Title',
    forum_thread_reply.content AS 'Forum Thread Reply Content'
FROM forum_thread
INNER JOIN class_detail ON forum_thread.class_detail_id = class_detail.id
INNER JOIN class ON class_detail.class_id = class.id
INNER JOIN forum_thread_reply ON forum_thread.id = forum_thread_reply.forum_thread_id
GROUP BY class_detail.term,  class.category, forum_thread.title, forum_thread_reply.title;

SELECT * FROM all_forum;