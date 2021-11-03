CREATE DATABASE elearning;

USE elearning;

CREATE TABLE `student` (
  `id` char(10) PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` char(64) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `sat_point` integer NOT NULL,
  CONSTRAINT `chk_student_id` CHECK (`id` RLIKE '[1000000000-9999999999]'),
  CONSTRAINT `chk_student_password_hash` CHECK (LENGTH(`password_hash`) = 64),
  CONSTRAINT `chk_student_gender` CHECK (`gender` = 'Male' OR `gender` = 'Female')
);

CREATE TABLE `course` (
  `id` char(8) PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  CONSTRAINT `chk_course_id` CHECK (`id` RLIKE '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]')
);

CREATE TABLE `lecturer` (
  `id` char(5) PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` char(64) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  CONSTRAINT `chk_lecturer_id` CHECK (`id` RLIKE 'D[0-9][0-9][0-9][0-9]'),
  CONSTRAINT `chk_lecturer_password_hash` CHECK (LENGTH(`password_hash`) = 64),
  CONSTRAINT `chk_lecturer_gender` CHECK (`gender` = 'Male' OR `gender` = 'Female' )
);

CREATE TABLE `class` (
  `id` char(4) PRIMARY KEY,
  `category` varchar(50) NOT NULL
);

CREATE TABLE `class_detail` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `student_id` char(10) NOT NULL,
  `course_id` char(8) NOT NULL,
  `lecturer_id` char(5) NOT NULL,
  `class_id` char(4) NOT NULL,
  `term` integer,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `class_schedule` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `class_detail_id` integer NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` int NOT NULL,
  `mode` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  FOREIGN KEY (`class_detail_id`) REFERENCES `class_detail` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `attendance` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `class_schedule_id` integer NOT NULL,
  `student_id` char(10) NULL,
  `lecturer_id` char(5) NULL,
  FOREIGN KEY (`class_schedule_id`) REFERENCES `class_schedule` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `forum_thread` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `class_detail_id` integer NOT NULL,
  `student_id` char(10) NULL,
  `lecturer_id` char(5) NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date_created` date NOT NULL,
  `deadline` date,
  FOREIGN KEY (`class_detail_id`) REFERENCES `class_detail` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `forum_thread_reply` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `forum_thread_id` integer NOT NULL,
  `student_id` char(10) NULL,
  `lecturer_id` char(5) NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date_created` date NOT NULL,
  FOREIGN KEY (`forum_thread_id`) REFERENCES `forum_thread` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `assignment_question` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `class_detail_id` integer NOT NULL,
  `lecturer_id` char(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `question_file_path` varchar(250) NOT NULL,
  `date_created` date NOT NULL,
  `deadline` date NOT NULL,
  FOREIGN KEY (`class_detail_id`) REFERENCES `class_detail` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `assignment_answer` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `assignment_question_id` integer NOT NULL,
  `student_id` char(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `answer_file_path` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  FOREIGN KEY (`assignment_question_id`) REFERENCES `assignment_question` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `student_todo` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `student_id` char(10) NOT NULL,
  `assignment_question_id` integer NULL,
  `forum_thread_id` integer NULL,
  `task_title` varchar(50) NOT NULL,
  `task_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  FOREIGN KEY (`assignment_question_id`) REFERENCES `assignment_question` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`forum_thread_id`) REFERENCES `forum_thread` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `student_activity_log` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `class_detail_id` integer NOT NULL,
  `student_id` char(10) NOT NULL,
  `activity_title` varchar(50) NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  FOREIGN KEY (`class_detail_id`) REFERENCES `class_detail` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);
