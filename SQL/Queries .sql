
SELECT 
    c.department,
    AVG(a.marks1) AS avg_score
FROM assessments a
JOIN courses c
    ON a.course_id = c.course_id
GROUP BY c.department
ORDER BY avg_score ASC;

-- S2b: Underperforming courses

SELECT 
    c.course,
    AVG(a.marks1) AS avg_score
FROM assessments a
JOIN courses c
    ON a.course_id = c.course_id
GROUP BY c.course
HAVING AVG(a.marks1) < 60
ORDER BY avg_score ASC;

-- S2c: Top two batches by average score

SELECT 
    session AS batch,
    AVG(marks1) AS avg_score
FROM assessments
GROUP BY session
ORDER BY avg_score DESC, batch ASC
LIMIT 2;

-- S3: Diagnostic check for unmatched course_id

SELECT 
    a.course_id,
    c.course
FROM courses c
LEFT JOIN assessments a
    ON c.course_id = a.course_id
WHERE a.course_id IS NULL;