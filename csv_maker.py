import sqlite3
import pandas as pd

# Country            Match              Player_Attributes  Team_Attributes  
# League             Player             Team 
con = sqlite3.connect("football_database.sqlite")
df = pd.read_sql_query("SELECT * from Match", con)
df.to_csv('Match_Full.csv',index=False)
con.close()