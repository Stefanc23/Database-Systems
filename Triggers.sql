USE elearning;

DELIMITER //
CREATE TRIGGER after_assignment_question_update
AFTER UPDATE
ON assignment_question FOR EACH ROW
BEGIN
	DECLARE title varchar(50);
    DECLARE id integer;
	SET title = NEW.title;
    SET id = OLD.id;
	UPDATE student_todo
    SET task_title = title
    WHERE assignment_question_id = id;
END//
DELIMITER ;

UPDATE assignment_question 
SET title = 'Recursive Function' 
WHERE id = 5;

SELECT * FROM student_todo WHERE id = 5;


DELIMITER //
CREATE TRIGGER after_forum_thread_update
AFTER UPDATE
ON forum_thread FOR EACH ROW
BEGIN
	DECLARE title varchar(50);
    DECLARE id integer;
	SET title = NEW.title;
    SET id = OLD.id;
	UPDATE student_todo
    SET task_title = title
    WHERE forum_thread_id = id;
END//
DELIMITER ;

UPDATE forum_thread 
SET title = 'Database Security' 
WHERE id = 4;

SELECT * FROM student_todo WHERE id = 4;


DELIMITER //
CREATE TRIGGER after_assignment_answer_insert
AFTER INSERT
ON assignment_answer FOR EACH ROW
BEGIN
	DECLARE id integer;
    DECLARE student_id char(10);
	SET id = NEW.assignment_question_id;
    SET student_id = OLD.student_id;
	UPDATE student_todo
    SET status = 'Done'
    WHERE student_id = student_id AND assignment_question_id = id;
END//
DELIMITER ;

INSERT INTO `assignment_answer` VALUES
('6',	'1',	'1720091347',	'Integral_rev',	'assignment/answer/1-integral_rev',	'Pending');

SELECT * FROM student_todo WHERE assignment_question_id = 1;