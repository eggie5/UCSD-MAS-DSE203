
CREATE TABLE alternatives (
    id integer NOT NULL PRIMARY KEY,
    name character varying(35)
);

CREATE TABLE attack_types (
    id integer NOT NULL PRIMARY KEY,
    name character varying(35)
);

CREATE TABLE claim_modes (
    id integer NOT NULL PRIMARY KEY,
    name character varying(35)
);

CREATE TABLE countries (
    id integer NOT NULL PRIMARY KEY,
    name character varying(35)
);

CREATE TABLE damage (
    id integer NOT NULL PRIMARY KEY,
    name character varying(50)
);

CREATE TABLE dbsources (
    id integer NOT NULL PRIMARY KEY,
    name character varying(40)
);

CREATE TABLE gtd (
    id bigint NOT NULL PRIMARY KEY,
    year integer,
    month integer,
    day integer,
    date date,
    approxdate character varying(100),
    extended boolean,
    resolution date,
    country integer,
    region integer,
    provstate character varying(100),
    city character varying(100),
    vicinity boolean,
    location text,
    lat real,
    lon real,
    summary text,
    crit1 boolean,
    crit2 boolean,
    crit3 boolean,
    doubtterr boolean,
    alternative integer,
    multiple boolean,
    conflict boolean,
    success boolean,
    suicide boolean,
    attacktype1 integer,
    attacktype2 integer,
    attacktype3 integer,
    targtype1 integer,
    corp1 character varying(200),
    target1 character varying(250),
    natlty1 integer,
    targtype2 integer,
    corp2 character varying(200),
    target2 character varying(200),
    natlty2 integer,
    targtype3 integer,
    corp3 character varying(200),
    target3 character varying(150),
    natlty3 integer,
    gname character varying(150),
    gsubname character varying(100),
    gname2 character varying(100),
    gsubname2 character varying(100),
    gname3 character varying(100),
    gsubname3 character varying(100),
    motive text,
    guncertain1 boolean,
    guncertain2 boolean,
    guncertain3 boolean,
    nperps integer,
    nperpcap integer,
    claimed boolean,
    claimmode integer,
    claimconf boolean,
    claim2 boolean,
    claimmode2 integer,
    claimconf2 boolean,
    claim3 boolean,
    claimmode3 integer,
    claimconf3 boolean,
    compclaim boolean,
    weaptype1 integer,
    weapsubtype1 integer,
    weaptype2 integer,
    weapsubtype2 integer,
    weaptype3 integer,
    weapsubtype3 integer,
    weaptype4 integer,
    weapsubtype4 integer,
    weapdetail character varying(800),
    nkill real,
    nkillus real,
    nkillter real,
    nwound real,
    nwoundus real,
    nwoundter real,
    property boolean,
    propextent integer,
    propvalue real,
    propcomment character varying(1000),
    ishostkid boolean,
    nhostkid real,
    nhostkidus real,
    nhours real,
    ndays integer,
    divert character varying(100),
    kidhijcountry character varying(100),
    ransom boolean,
    ransomamt real,
    ransomamtus real,
    ransompaid real,
    ransompaidus real,
    ransomnote text,
    hostkidoutcome integer,
    nreleased real,
    addnotes text,
    scite1 character varying(500),
    scite2 character varying(500),
    scite3 character varying(500),
    dbsource integer
);

CREATE TABLE hostage_outcomes (
    id integer NOT NULL PRIMARY KEY,
    name character varying(50)
);

CREATE TABLE regions (
    id integer NOT NULL PRIMARY KEY,
    name character varying(45)
);

CREATE TABLE target_types (
    id integer NOT NULL PRIMARY KEY,
    name character varying(35)

);

CREATE TABLE weapon_subtypes (
    id integer NOT NULL PRIMARY KEY,
    name character varying(50)
);

CREATE TABLE weapon_types (
    id integer NOT NULL PRIMARY KEY,
    name character varying(50)
);

CREATE TABLE years (
    name integer NOT NULL PRIMARY KEY
);


