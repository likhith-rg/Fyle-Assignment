-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherAssignmentCounts AS (
    SELECT teacher_id
    FROM assignments
    WHERE state = 'GRADED'
    GROUP BY teacher_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
SELECT COUNT(a.grade)
FROM assignments a
JOIN TeacherAssignmentCounts tac ON a.teacher_id = tac.teacher_id
WHERE a.grade = 'A' AND a.state = 'GRADED';
