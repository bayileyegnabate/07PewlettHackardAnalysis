# Pewlett Hackard Employee Database Analysis

## Overview of the analysis 

* Explain the purpose of this analysis.
* Pewlett Hackard (PH) is a large company with several thousand employees. Some of these employees are ready to retire in the next few years. Hence, the primary goal of this analysis is identify who is going to retire and how many positions PH needs to fill. 
* PH has been using spreed sheets to store their data. The first step of the analysis will be building an employee database using PostgreSQL.
* which has been using spreed sheets to store and manage data. The main purpose of the analsis is to find out who is going to retire in the next few years; and how many positions need the company need to fill. Help PH by listing all employees eligible for retirement package. The data is contained in six csv files. PH has been using spreed sheets to store their data. They want to migrate to sql. Help build an employee database using sql by using data engineering, modeling and analysis.  

## Results: 

* Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed. 

  ## retirng mentor count

 <table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>dept_name</th>
      <th>retiring_count</th>
      <th>mentor_count</th>
      <th>rmc_ratio</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Marketing</td>
      <td>2782</td>
      <td>126</td>
      <td>22</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Finance</td>
      <td>2374</td>
      <td>74</td>
      <td>32</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Human Resources</td>
      <td>2446</td>
      <td>107</td>
      <td>22</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Production</td>
      <td>10224</td>
      <td>356</td>
      <td>28</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Development</td>
      <td>11627</td>
      <td>435</td>
      <td>26</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Quality Management</td>
      <td>2816</td>
      <td>97</td>
      <td>29</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Sales</td>
      <td>7301</td>
      <td>272</td>
      <td>26</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Research</td>
      <td>2956</td>
      <td>113</td>
      <td>26</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Customer Service</td>
      <td>3258</td>
      <td>128</td>
      <td>25</td>
    </tr>
  </tbody>
</table>

## Summary:

* Provide high-level responses to the following  questions, then provide two additional queries or tables that may  provide more insight into the upcoming "silver tsunami."

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- There are over 41380 employees ready to retire in near future, but only 1549 of them are elgible for the mentorship program. 
- Are there enough qualified, retirement-ready employees in the  departments to mentor the next generation of Pewlett Hackard employees? 
- There seems to be a huge gap between the number of upcoming retirement and the number of employees who qualify to the mentorship program. From retiring_mentor table shown above it is evident that there are no enough mentors in any of the PH departments. In every department, there are more than 20 employees ready to retire for evey qualifing mekntor. The rmc-ratio column show the approximate retiring-to-mentor ratio. In Finance department, for instance there will be more than 32 retirements for every mentor. 