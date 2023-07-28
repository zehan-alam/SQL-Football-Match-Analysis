# European Football League Data Analysis using PostgreSQL

In this exciting project, I explored the [European Soccer Database](https://www.kaggle.com/datasets/hugomathien/soccer) available on Kaggle, originally in SQLite format. I transformed the data into a PostgreSQL database and conducted an in-depth Exploratory Data Analysis (EDA) to uncover intriguing insights about the world of football.

**Project Steps:**

1. **Data Download:** I downloaded the European Soccer Database in SQLite format from Kaggle using [this link](https://www.kaggle.com/datasets/hugomathien/soccer).

2. **CSV Creation:** Utilizing the `csv_maker.py` script, I extracted data from 7 tables in the SQLite file and uploaded CSV files for 5 of them. So,*`you have to use this file to create "match.csv" and "player_attributes.csv" file for the next process.`*

3. **PostgreSQL Database Creation:** I created a PostgreSQL database using my username and other relevant details. No table creation was required at this stage, but I ensured that all datasets were available in the Datasets folder. By running the `table_creation.sql` file, I efficiently created and exported the necessary tables into my PostgreSQL database.

4. **Explanatory Data Analysis:** The fascinating `football_project_database.sql` file contains answers to several intriguing questions:

   - What are the top 30 teams with the highest average overall rating?
   - Which team has the highest goal-scoring rate (goals scored per match)?
   - Who is the best player from 2008 to 2016?
   - Analyzing the performance of Real Madrid (Team ID: 8633) over the years.
   - Determining the team with the most wins.
   - Identifying the best teams in the German, English, French, Spanish, and Italian leagues.

Feel free to run this code on different files each time to obtain insightful results.

For a detailed exploration of the European Football League data analysis and to witness the thrilling SQL queries, check the respective scripts and SQL files in the repository. Experience the excitement of football data come alive through the power of PostgreSQL!
