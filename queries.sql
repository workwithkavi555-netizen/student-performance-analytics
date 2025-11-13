-- 1. Calculate average score of each student
SELECT 
    student_id,
    student_name,
    (maths + science + english + social + hindi) / 5 AS average_score
FROM student_scores;

-- 2. Find top-performing student (highest total marks)
SELECT 
    student_id,
    student_name,
    (maths + science + english + social + hindi) AS total_marks
FROM student_scores
ORDER BY total_marks DESC
LIMIT 1;

-- 3. Subject-wise maximum marks
SELECT 
    'Maths' AS subject, MAX(maths) AS max_score FROM student_scores
UNION
SELECT 
    'Science', MAX(science) FROM student_scores
UNION
SELECT 
    'English', MAX(english) FROM student_scores
UNION
SELECT 
    'Social', MAX(social) FROM student_scores
UNION
SELECT 
    'Hindi', MAX(hindi) FROM student_scores;

-- 4. Gender-wise average performance
SELECT 
    gender,
    AVG((maths + science + english + social + hindi) / 5) AS avg_score
FROM student_scores
GROUP BY gender;

-- 5. Section toppers (highest marks in each section)
SELECT 
    section,
    student_id,
    student_name,
    (maths + science + english + social + hindi) AS total_marks
FROM student_scores s
WHERE (s.section, total_marks) IN (
    SELECT 
        section,
        MAX(maths + science + english + social + hindi)
    FROM student_scores
    GROUP BY section
);

-- 6. Ranking students by average marks
SELECT 
    student_id,
    student_name,
    (maths + science + english + social + hindi) / 5 AS avg_score,
    RANK() OVER (ORDER BY (maths + science + english + social + hindi) / 5 DESC) AS rank
FROM student_scores;
