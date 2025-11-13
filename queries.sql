CREATE TABLE Students(
    Student_ID INT,
    Name TEXT,
    Math_Score INT,
    Science_Score INT,
    English_Score INT
);

SELECT Name, Math_Score, Science_Score, English_Score
FROM Students
WHERE Math_Score > 80;
