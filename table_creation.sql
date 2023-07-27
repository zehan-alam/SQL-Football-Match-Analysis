CREATE TABLE Country (
  id INTEGER PRIMARY KEY,
  name TEXT
);
COPY match(
    id,
    name
)
FROM '/Datsets/Country.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE League (
    id SERIAL PRIMARY KEY,
    country_id INTEGER,
    name TEXT
);
COPY match(
    id,
    country_id,
    name
)
FROM '/Datsets/League.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE match (
    id INTEGER PRIMARY KEY,
    country_id INTEGER,
    league_id INTEGER,
    season TEXT,
    stage INTEGER,
    date TIMESTAMP,
    match_api_id INTEGER,
    home_team_api_id INTEGER,
    away_team_api_id INTEGER,
    home_team_goal INTEGER,
    away_team_goal INTEGER,
    home_player_X1 INTEGER,
    home_player_X2 INTEGER,
    home_player_X3 INTEGER,
    home_player_X4 INTEGER,
    home_player_X5 INTEGER,
    home_player_X6 INTEGER,
    home_player_X7 INTEGER,
    home_player_X8 INTEGER,
    home_player_X9 INTEGER,
    home_player_X10 INTEGER,
    home_player_X11 INTEGER,
    away_player_X1 INTEGER,
    away_player_X2 INTEGER,
    away_player_X3 INTEGER,
    away_player_X4 INTEGER,
    away_player_X5 INTEGER,
    away_player_X6 INTEGER,
    away_player_X7 INTEGER,
    away_player_X8 INTEGER,
    away_player_X9 INTEGER,
    away_player_X10 INTEGER,
    away_player_X11 INTEGER,
    home_player_Y1 INTEGER,
    home_player_Y2 INTEGER,
    home_player_Y3 INTEGER,
    home_player_Y4 INTEGER,
    home_player_Y5 INTEGER,
    home_player_Y6 INTEGER,
    home_player_Y7 INTEGER,
    home_player_Y8 INTEGER,
    home_player_Y9 INTEGER,
    home_player_Y10 INTEGER,
    home_player_Y11 INTEGER,
    away_player_Y1 INTEGER,
    away_player_Y2 INTEGER,
    away_player_Y3 INTEGER,
    away_player_Y4 INTEGER,
    away_player_Y5 INTEGER,
    away_player_Y6 INTEGER,
    away_player_Y7 INTEGER,
    away_player_Y8 INTEGER,
    away_player_Y9 INTEGER,
    away_player_Y10 INTEGER,
    away_player_Y11 INTEGER,
    home_player_1 INTEGER,
    home_player_2 INTEGER,
    home_player_3 INTEGER,
    home_player_4 INTEGER,
    home_player_5 INTEGER,
    home_player_6 INTEGER,
    home_player_7 INTEGER,
    home_player_8 INTEGER,
    home_player_9 INTEGER,
    home_player_10 INTEGER,
    home_player_11 INTEGER,
    away_player_1 INTEGER,
    away_player_2 INTEGER,
    away_player_3 INTEGER,
    away_player_4 INTEGER,
    away_player_5 INTEGER,
    away_player_6 INTEGER,
    away_player_7 INTEGER,
    away_player_8 INTEGER,
    away_player_9 INTEGER,
    away_player_10 INTEGER,
    away_player_11 INTEGER,
    goal TEXT,
    shoton TEXT,
    shotoff TEXT,
    foulcommit TEXT,
    card TEXT,
    cross_ TEXT,
    corner TEXT,
    possession TEXT
);
SET datestyle TO 'ISO, DMY';
COPY match(
    id,
    country_id,
    league_id,
    season,
    stage,
    date,
    match_api_id,
    home_team_api_id,
    away_team_api_id,
    home_team_goal,
    away_team_goal,
	home_player_X1 ,
    home_player_X2 ,
    home_player_X3 ,
    home_player_X4 ,
    home_player_X5 ,
    home_player_X6 ,
    home_player_X7 ,
    home_player_X8 ,
    home_player_X9 ,
    home_player_X10 ,
    home_player_X11 ,
    away_player_X1 ,
    away_player_X2 ,
    away_player_X3 ,
    away_player_X4 ,
    away_player_X5 ,
    away_player_X6 ,
    away_player_X7 ,
    away_player_X8 ,
    away_player_X9 ,
    away_player_X10 ,
    away_player_X11 ,
    home_player_Y1 ,
    home_player_Y2 ,
    home_player_Y3 ,
    home_player_Y4 ,
    home_player_Y5 ,
    home_player_Y6 ,
    home_player_Y7 ,
    home_player_Y8 ,
    home_player_Y9 ,
    home_player_Y10 ,
    home_player_Y11 ,
    away_player_Y1 ,
    away_player_Y2 ,
    away_player_Y3 ,
    away_player_Y4 ,
    away_player_Y5 ,
    away_player_Y6 ,
    away_player_Y7 ,
    away_player_Y8 ,
    away_player_Y9 ,
    away_player_Y10 ,
    away_player_Y11 ,
    home_player_1 ,
    home_player_2 ,
    home_player_3 ,
    home_player_4 ,
    home_player_5 ,
    home_player_6 ,
    home_player_7 ,
    home_player_8 ,
    home_player_9 ,
    home_player_10 ,
    home_player_11 ,
    away_player_1 ,
    away_player_2 ,
    away_player_3 ,
    away_player_4 ,
    away_player_5 ,
    away_player_6 ,
    away_player_7 ,
    away_player_8 ,
    away_player_9 ,
    away_player_10 ,
    away_player_11 ,
    goal ,
    shoton ,
    shotoff ,
    foulcommit ,
    card ,
    cross_ ,
    corner ,
    possession
)
FROM '/Datsets/Match.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE player_attributes (
    id INTEGER PRIMARY KEY,
    player_fifa_api_id INTEGER,
    player_api_id INTEGER,
    date TIMESTAMP,
    overall_rating INTEGER,
    potential INTEGER,
    preferred_foot TEXT,
    attacking_work_rate TEXT,
    defensive_work_rate TEXT,
    crossing INTEGER,
    finishing INTEGER,
    heading_accuracy INTEGER,
    short_passing INTEGER,
    volleys INTEGER,
    dribbling INTEGER,
    curve INTEGER,
    free_kick_accuracy INTEGER,
    long_passing INTEGER,
    ball_control INTEGER,
    acceleration INTEGER,
    sprint_speed INTEGER,
    agility INTEGER,
    reactions INTEGER,
    balance INTEGER,
    shot_power INTEGER,
    jumping INTEGER,
    stamina INTEGER,
    strength INTEGER,
    long_shots INTEGER,
    aggression INTEGER,
    interceptions INTEGER,
    positioning INTEGER,
    vision INTEGER,
    penalties INTEGER,
    marking INTEGER,
    standing_tackle INTEGER,
    sliding_tackle INTEGER,
    gk_diving INTEGER,
    gk_handling INTEGER,
    gk_kicking INTEGER,
    gk_positioning INTEGER,
    gk_reflexes INTEGER
);
COPY player_attributes(
    id ,
    player_fifa_api_id ,
    player_api_id ,
    date ,
    overall_rating ,
    potential ,
    preferred_foot ,
    attacking_work_rate ,
    defensive_work_rate ,
    crossing ,
    finishing ,
    heading_accuracy ,
    short_passing ,
    volleys ,
    dribbling ,
    curve ,
    free_kick_accuracy ,
    long_passing ,
    ball_control ,
    acceleration ,
    sprint_speed ,
    agility ,
    reactions ,
    balance ,
    shot_power ,
    jumping ,
    stamina ,
    strength ,
    long_shots ,
    aggression ,
    interceptions ,
    positioning ,
    vision ,
    penalties ,
    marking ,
    standing_tackle ,
    sliding_tackle ,
    gk_diving ,
    gk_handling ,
    gk_kicking,
    gk_positioning,
    gk_reflexes
)
FROM '/Datsets/Player_Attributes.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE player(
    id SERIAL PRIMARY KEY,
    player_api_id INTEGER,
    player_name TEXT,
    player_fifa_api_id INTEGER,
    birthday TIMESTAMP,
    height FLOAT,
    weight INTEGER
);
COPY player(
    id
    player_api_id,
    player_name,
    player_fifa_api_id,
    birthday ,
    height ,
    weight
)
FROM '/Datsets/Player.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE team_attributes (
    id SERIAL PRIMARY KEY,
    team_fifa_api_id INTEGER,
    team_api_id INTEGER,
    date TIMESTAMP,
    buildUpPlaySpeed INTEGER,
    buildUpPlaySpeedClass TEXT,
    buildUpPlayDribbling INTEGER,
    buildUpPlayDribblingClass TEXT,
    buildUpPlayPassing INTEGER,
    buildUpPlayPassingClass TEXT,
    buildUpPlayPositioningClass TEXT,
    chanceCreationPassing INTEGER,
    chanceCreationPassingClass TEXT,
    chanceCreationCrossing INTEGER,
    chanceCreationCrossingClass TEXT,
    chanceCreationShooting INTEGER,
    chanceCreationShootingClass TEXT,
    chanceCreationPositioningClass TEXT,
    defencePressure INTEGER,
    defencePressureClass TEXT,
    defenceAggression INTEGER,
    defenceAggressionClass TEXT,
    defenceTeamWidth INTEGER,
    defenceTeamWidthClass TEXT,
    defenceDefenderLineClass TEXT
);
COPY team_attributes(
    id ,
    team_fifa_api_id ,
    team_api_id ,
    date ,
    buildUpPlaySpeed ,
    buildUpPlaySpeedClass ,
    buildUpPlayDribbling ,
    buildUpPlayDribblingClass ,
    buildUpPlayPassing ,
    buildUpPlayPassingClass ,
    buildUpPlayPositioningClass ,
    chanceCreationPassing ,
    chanceCreationPassingClass ,
    chanceCreationCrossing ,
    chanceCreationCrossingClass ,
    chanceCreationShooting ,
    chanceCreationShootingClass ,
    chanceCreationPositioningClass ,
    defencePressure ,
    defencePressureClass ,
    defenceAggression ,
    defenceAggressionClass ,
    defenceTeamWidth ,
    defenceTeamWidthClass ,
    defenceDefenderLineClass 
)
FROM '/Datsets/Team_Attributes.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    team_api_id INTEGER,
    team_fifa_api_id INTEGER,
    team_long_name TEXT,
    team_short_name TEXT
);
COPY team (
    id ,
    team_api_id ,
    team_fifa_api_id ,
    team_long_name ,
    team_short_name 
)
FROM '/Datsets/Team.csv'
DELIMITER ','
CSV HEADER;