CREATE DATABASE IF NOT EXISTS job_portal_system;

USE job_portal_system;

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role ENUM('seeker', 'employer') NOT NULL,
    description TEXT,
    qualification VARCHAR(255),
    skills VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE users 
ADD COLUMN age INT,
ADD COLUMN location VARCHAR(255),
ADD COLUMN goals TEXT;
ALTER TABLE users ADD COLUMN college VARCHAR(255);
CREATE TABLE jobs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  posted_by VARCHAR(100),  -- This is the column for the username
  posted_by_email VARCHAR(150),  -- This is the column for the email
  title VARCHAR(200),
  category VARCHAR(100),
  location VARCHAR(100),
  type VARCHAR(100),
  company VARCHAR(200),
  description TEXT,
  post_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE job_applications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  job_id INT,
  applicant VARCHAR(100),
  application_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) DEFAULT 'pending',
  FOREIGN KEY (job_id) REFERENCES jobs(id)
);
ALTER TABLE jobs
MODIFY posted_by VARCHAR(100) NOT NULL,
MODIFY title VARCHAR(200) NOT NULL,
MODIFY category VARCHAR(100) NOT NULL,
MODIFY location VARCHAR(100) NOT NULL,
MODIFY type VARCHAR(100) NOT NULL,
MODIFY company VARCHAR(200) NOT NULL,
MODIFY description TEXT NOT NULL;

-- 🟢 For posted jobs summary
ALTER TABLE users
ADD COLUMN total_posts INT DEFAULT 0,
ADD COLUMN last_posted_title VARCHAR(255),
ADD COLUMN last_post_location VARCHAR(100);

UPDATE users 
SET total_posts = 0,
    last_posted_title = '',
    last_post_location = '';

-- 🟢 For applied jobs summary
 UPDATE users
SET total_applied = 0,
   last_applied_title = "",
   last_applied_location =  "";


  SET SQL_SAFE_UPDATES = 1;
  SET FOREIGN_KEY_CHECKS = 0;  -- Disable foreign key checks
TRUNCATE TABLE jobs;          -- Now you can truncate
SET FOREIGN_KEY_CHECKS = 1;  -- Re-enable foreign key checks

ALTER TABLE jobs
ADD COLUMN posted_by_email varchar(150);

UPDATE users
SET total_posts = 1,
    last_posted_title = 'Java Developer',
    last_post_location = 'noida,up'
WHERE username = 'sarthak chauhan';

ALTER TABLE job_applications
ADD COLUMN email VARCHAR(100),
ADD COLUMN phone VARCHAR(15),
ADD COLUMN resume_path VARCHAR(255);


DESCRIBE job_applications;
ALTER TABLE job_applications CHANGE gmail email VARCHAR(255);

truncate table job_applications;
update jobs 
set 
   posted_by_email = 'Aditya123@gmail.com'
   where id = 2;

   
   