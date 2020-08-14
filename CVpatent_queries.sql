/*generates table of all assignees in China with publication counts in computer vision */

SELECT COUNT(*) as count, assignee_unique
FROM (SELECT * FROM `gcp-cset-projects.1790_patents.1790_ai_patents_all_quantitative_information`
CROSS JOIN UNNEST(Assignees) as assignee_unique
WHERE SUBSTR(First_priority_number, 0, 2)  = 'CN'
AND Computer_Vision)
GROUP BY assignee_unique
ORDER BY count DESC

/* generates table of all assignees in US with publication counts in computer vision */

SELECT COUNT(*) as count, assignee_unique
FROM (SELECT * FROM `gcp-cset-projects.1790_patents.1790_ai_patents_all_quantitative_information`
CROSS JOIN UNNEST(Assignees) as assignee_unique
WHERE SUBSTR(First_priority_number, 0, 2)  = 'US'
AND Computer_Vision)
GROUP BY assignee_unique
ORDER BY count DESC

/* generates table of raw count of computer vision publications by year segmented by company */

SELECT SUBSTR(First_priority_number, 0, 2) as Country, assignee_unique, publication_date
FROM (SELECT * FROM `gcp-cset-projects.1790_patents.1790_ai_patents_all_quantitative_information`
CROSS JOIN UNNEST(Assignees) as assignee_unique
WHERE SUBSTR(First_priority_number, 0, 2)  = 'CN' AND Computer_Vision
OR SUBSTR(First_priority_number, 0, 2)  = 'US' AND Computer_Vision)

/* generates table of all assignees in CN with publication counts in speech and language processing */
SELECT SUBSTR(First_priority_number, 0, 2) as Country, assignee_unique, publication_date
FROM (SELECT * FROM `gcp-cset-projects.1790_patents.1790_ai_patents_all_quantitative_information`
CROSS JOIN UNNEST(Assignees) as assignee_unique
WHERE SUBSTR(First_priority_number, 0, 2)  = 'CN' AND Speech_Processing
OR SUBSTR(First_priority_number, 0, 2)  = 'CN' AND Language_Processing)

/* generates table of all assignees in US with publication counts in speech and language processing */
SELECT SUBSTR(First_priority_number, 0, 2) as Country, assignee_unique, publication_date
FROM (SELECT * FROM `gcp-cset-projects.1790_patents.1790_ai_patents_all_quantitative_information`
CROSS JOIN UNNEST(Assignees) as assignee_unique
WHERE SUBSTR(First_priority_number, 0, 2)  = 'US' AND Speech_Processing
OR SUBSTR(First_priority_number, 0, 2)  = 'US' AND Language_Processing)"
