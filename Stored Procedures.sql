USE elearning;


DELIMITER //
CREATE PROCEDURE get_assignment (
	IN id char(10)
)
BEGIN
	SELECT 
		assignment_question.id AS 'ID',
		assignment_question.title AS 'Assignment Title',
        assignment_question.question_file_path AS 'Assignment File Path'
    FROM assignment_question
	INNER JOIN class_detail ON assignment_question.class_detail_id = class_detail.id
    WHERE id = class_detail.student_id;
END //
DELIMITER ;

CALL get_assignment ('1720093546');


DELIMITER //
CREATE PROCEDURE get_forum (
	IN id char(10)
)
BEGIN
	SELECT
		forum_thread.id AS 'ID',
		forum_thread.title AS 'Forum Title',
        forum_thread.content AS 'Forum Content'
    FROM forum_thread
	INNER JOIN class_detail ON forum_thread.class_detail_id = class_detail.id
    WHERE id = class_detail.student_id;
END //
DELIMITER ;

CALL get_forum ('1720093546');


DELIMITER //
CREATE PROCEDURE get_todo (
	IN id char(10)
)
BEGIN
	SELECT *
    FROM student_todo
    WHERE id = student_todo.student_id;
END //
DELIMITER ;
	
CALL get_todo ('1720093546');