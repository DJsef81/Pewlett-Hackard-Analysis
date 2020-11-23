# Pewlett-Hackard-Analysis

# OVERVIEW OF THE ANALYSIS

Pewlett-Hackard hired us to help out one of their employees, Bobby, with reorganizing and analyzing their outdated employee databases to get an idea of  how many of PH’s current employees are going to be eligible for retirement in the very near future. 
 
After our initial analysis was completed, Bobby’s managers tasked us with two more assignments which would require us to further mine our previously created analyses and tables. 

	Determine the number of retiring employees per job title
	Identify employees who are eligible to participate in a mentorship program

# PURPOSE 

The purpose of this analysis is so PH is able to prepare themselves to fill those positions when the “silver tsunami” employees retire and to ensure that there is a seamless transition when the time comes, as those employees who are retiring have critical knowledge of how to their jobs that PH and PH’s new hires will need to ensure their success going forward. 

With our analysis, PH will know the number of retiring employees by their current job title, and the number of potential mentors also by job title. 

# RESOURCES 

## Data Source:
* departments.csv
* dept_emp.csv
* titles.csv

## Software:
* Python 3.6.1
* Pandas
* pgAdmin4
* postgresSQL

# RESULTS
(There is a bulleted list with four major points from the two analysis deliverables)
We created

![](Retiring_titles.png)

[Click here to view our complete mentorship eligibility analysis](data/mentorship_eligibility.csv)

We created another query in pgAdmin 4 to get a potential mentor count by job title. 
![](potential_mentors_count.png)


# SUMMARY

(The summary addresses the two questions and contains two additional queries or tables that may provide more insight)
* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
