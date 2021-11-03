USE elearning;

INSERT INTO `student` VALUES
('1720091347', 'Georgius Yordan', 'georgius.yordan@gmail.com', SHA2('geor333yor', 256), 'Male', '082236520156', '98'),
('1720093546', 'Lisa Amelia', 'lisa.amelia@gmail.com', SHA2('lisa9898', 256), 'Female', '082200109304', '110'),
('1700934189', 'Banu Setadjo', 'banu.setadjo@gmail.com', SHA2('banuSeta15', 256), 'Male', '082199032239', '67'),
('1701049301', 'Michael Watson', 'michael.watson@gmail.com', SHA2('micson69', 256), 'Male', '080239182367', '81'),
('1750118781', 'Daniel Pratama', 'daniel.pratama@gmail.com', SHA2('danprama27', 256), 'Male', '081230092741', '170');

INSERT INTO `course` VALUES
('MATH6120', 'Calculus'),
('COMP6369', 'Human Computer Interaction'),
('CHAR6030', 'Character Building - Pancasila'),
('ISYS6028', 'Database System'),
('COMP6363', 'Algorithm and Programming');

INSERT INTO `lecturer` VALUES
('D6041', 'Nino Tsubaki', 'nino.tsubaki@gmail.com', SHA2('n1n0TSUBAKI', 256), 'Female', '082234511356'),
('D7032', 'Kizuna Wiryana', 'kizuna.wiryana@gmail.com', SHA2('steai3960', 256), 'Female', '082332192783'),
('D8190', 'Vano Setya', 'vano.setya@gmail.com', SHA2('van001setya', 256), 'Male', '082736271912'),
('D9055', 'Ethan Matson', 'ethan.matson@gmail.com', SHA2('et101son', 256),	'Male', '082731182183'),
('D9233', 'Melissa April', 'melissa.april@gmail.com', SHA2('melissApr1l', 256), 'Female', '082235406473');

INSERT INTO `class` VALUES
('CL01', 'Lecture'),
('CL02', 'Combined Lecture'),
('CL03', 'Laboratory'),
('CL04', 'Combined Laboratory'),
('CL05', 'Accelerated');

INSERT INTO `class_detail` VALUES
('1', '1720091347', 'MATH6120', 'D6041', 'CL01', '2'),
('2', '1720093546',	'COMP6369', 'D7032', 'CL02', '2'),
('3', '1700934189',	'CHAR6030', 'D8190', 'CL03', '3'),
('4', '1701049301',	'ISYS6028', 'D9055', 'CL04', '5'),
('5', '1750118781',	'COMP6363', 'D9233', 'CL05', '5');
 
INSERT INTO `class_schedule` VALUES
('1', '1', '2021-01-10', '09:00', '120', 'Vidcon', 'Zoom' ),
('2', '2', '2021-01-16', '10:00', '120', 'Vidcon', 'Zoom' ),
('3', '3', '2021-02-09', '14:00', '90',	'GSLC',	'Forum'),
('4', '4', '2021-02-11', '11:00', '90',	'GSLC',	'Forum'),
('5', '5', '2021-02-23', '10:00', '120', 'Vidcon', 'Zoom' );

INSERT INTO `attendance` VALUES
('1', '1', '1720091347', NULL),
('2', '2', NULL, 'D7032'),
('3', '3', NULL, 'D8190'),
('4', '4', '1701049301', NULL),
('5', '5', NULL, 'D9233');

INSERT INTO `forum_thread` VALUES
('1', '1', NULL, 'D6041', 'Applications of Integral', 'Pada forum kali ini, tolong pelajari materi mengenai integral dari ppt yang diberikan. Terima kasih', '2021-01-11', '2021-01-18'),
('2', '2', NULL, 'D7032', 'Social Interaction', 'Pada sesi kali ini, tolong kerjakan soal dalam ppt slide 10 - 12.', '2021-01-25', '2021-02-01'),
('3', '3', NULL, 'D8190', 'Tolerance and Cooperation', 'Dear all, pada forum ini tolong rangkum materi pada hal 67 - 78 dari buku CB. Terima kasih', '2021-01-31', '2021-02-07'),
('4', '4', NULL, 'D9055', 'Database Environment', 'Pada sesi forum kali ini tolong jelaskan mengenai database systems, terminology, environment, and new concept of database. Dikumpulkan dalam bentuk word.', '2021-02-09', '2021-02-16'),
('5', '5', '1750118781', NULL, 'Introduction to C Programming', 'Dear all pada forum kali ini tolong kerjakan excersice berikut di word : State whether each of the following statements is TRUE or FALSE. If it is FALSE, explain why. 1. Every C program begins execution at main function 2. Comments cause the computer to print the text enclosed between /* and */ on the screen when the program is executed
3. All variables must be defined before used 4. All variables must be given a type when they’re defined 5. C considers number and Number to be identical', '2021-02-16', '2021-02-23');

INSERT INTO `forum_thread_reply` VALUES
('1', '1', NULL, 'D6041', 'Applications of Integral', 'Baik, terima kasih banyak bu', '2021-01-11'),
('2', '2', '1720093546', NULL, 'Social Interaction', 'Terima kasih banyak atas materinya bu', '2021-01-25'),
('3', '3', '1700934189', NULL, 'Tolerance and Cooperation', 'Baik, terima kasih banyak pak', '2021-01-31'),
('4', '4', '1701049301', NULL, 'Database Environment', 'Siap pak, terima kasih banyak', '2021-02-09'),
('5', '5', '1750118781', NULL, 'Introduction to C Programming', 'Berikut file jawaban saya terdapat dalam file yang terlampir', '2021-02-16');

INSERT INTO `assignment_question` VALUES
('1', '1', 'D6041',	'Applications of Integral',	'assignment/question/1-applications-of-integral', '2021-01-07',	'2021-01-14'),
('2', '2', 'D7032',	'Social Interaction', 'assignment/question/2-social-interaction', '2021-01-09',	'2021-01-16'),
('3', '3', 'D8190',	'Tolerance and Cooperation', 'assignment/question/3-tolerance-and-cooperation',	'2021-01-14', '2021-01-21'),
('4', '4', 'D9055',	'Database Environment',	'assignment/question/4-database-environment', '2021-01-29',	'2021-02-05'),
('5', '5', 'D9233',	'Introduction to C Programming', 'assignment/question/5-introduction-to-c-programming',	'2021-02-03', '2021-02-10');

INSERT INTO `assignment_answer` VALUES
('1',	'1',	'1720091347',	'Integral_Georgius',	'assignment/answer/1-applications-of-integral',	'Pending'),
('2',	'2',	'1720093546',	'SocialInteraction_LisaAmelia',	'assignment/answer/2-social-interaction',	'Graded'),
('3',	'3',	'1700934189',	'BanuSetadjo_Pancasila',	'assignment/answer/3-tolerance-and-cooperation',	'Graded'),
('4',	'4',	'1701049301',	'Michael_DatabaseEnvironment',	'assignment/answer/4-database-environment',	'Pending'),
('5',	'5',	'1750118781',	'DanielPratama-Programming',	'assignment/answer/5-introduction-to-c-programming',	'Graded');

INSERT INTO `student_todo` VALUES
('1', '1720091347', '1', NULL, 'Applications of Integral', 'Assignment', 'Ongoing'),
('2', '1720093546', '2', NULL, 'Social Interaction', 'Assignment', 'Ongoing'),
('3', '1700934189', NULL, '3', 'Tolerance and Cooperation Among the Religious', 'Forum', 'Done'),
('4', '1701049301', NULL, '4', 'Database Environment', 'Forum', 'Late'),
('5', '1750118781', '5', NULL, 'Introduction to C Programming', 'Assignment', 'Done');

INSERT INTO `student_activity_log` VALUES
('1', '1', '1720091347', 'Applications of Integral', 'Assignment', 'Ongoing'),
('2', '2', '1720093546', 'Social Interaction', 'Assignment', 'Ongoing'),
('3', '3', '1700934189', 'Tolerance and Cooperation Among the Religious', 'Forum', 'Done'),
('4', '4', '1701049301', 'Database Environment', 'Forum', 'Late'),
('5', '5', '1750118781', 'Introduction to C Programming', 'Assignment', 'Done');
