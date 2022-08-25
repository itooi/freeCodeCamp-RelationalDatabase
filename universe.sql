--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    designation character varying(300),
    constellation character varying(300) NOT NULL,
    age_in_billion_years numeric(4,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: join_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.join_universe (
    join_universe_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(300)
);


ALTER TABLE public.join_universe OWNER TO freecodecamp;

--
-- Name: join_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.join_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.join_universe_id_seq OWNER TO freecodecamp;

--
-- Name: join_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.join_universe_id_seq OWNED BY public.join_universe.join_universe_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_sphere boolean NOT NULL,
    planet_id integer NOT NULL,
    is_cold boolean DEFAULT true
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    polar_radius_in_km numeric NOT NULL,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    distance_in_light_year integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: join_universe join_universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_universe ALTER COLUMN join_universe_id SET DEFAULT nextval('public.join_universe_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'M31,NGC 224,UGC 454, PGC 2557', 'Andromeda', 10.01);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxy', 'NGC 4038 & 4039, PGC 37967 & 37969', 'Corvus', 0.20);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'NGC 4622, PGV 42701', 'Centaurus', NULL);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'M64, NGC 4826, PGC 44182', 'Coma Berencies', 13.28);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'M82, NGC 3034, UGC 5322, PGC 28655', 'Ursa Major', 13.31);
INSERT INTO public.galaxy VALUES (6, 'Circinus', 'ESO 97-G13', 'Circinus', 0.80);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', NULL, 'Sagittaurius', 13.36);


--
-- Data for Name: join_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.join_universe VALUES (1, 1, 1, 1, 1, NULL);
INSERT INTO public.join_universe VALUES (2, 2, 2, 2, 2, NULL);
INSERT INTO public.join_universe VALUES (4, 3, 3, 3, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', true, 8, true);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 8, true);
INSERT INTO public.moon VALUES (3, 'IO', true, 9, true);
INSERT INTO public.moon VALUES (4, 'Europa', true, 9, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 9, true);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 9, true);
INSERT INTO public.moon VALUES (8, 'Triton', true, 5, true);
INSERT INTO public.moon VALUES (7, 'Titan', true, 5, true);
INSERT INTO public.moon VALUES (9, 'Charon', true, 13, true);
INSERT INTO public.moon VALUES (10, 'Rhea', false, 10, true);
INSERT INTO public.moon VALUES (11, 'lapetus', true, 10, true);
INSERT INTO public.moon VALUES (12, 'Miranda', true, 11, true);
INSERT INTO public.moon VALUES (13, 'Enceldaus', true, 11, true);
INSERT INTO public.moon VALUES (14, 'Titania', true, 11, true);
INSERT INTO public.moon VALUES (15, 'a', true, 9, true);
INSERT INTO public.moon VALUES (16, 'b', true, 9, true);
INSERT INTO public.moon VALUES (17, 'bc', true, 9, true);
INSERT INTO public.moon VALUES (18, 'bcd', true, 9, true);
INSERT INTO public.moon VALUES (19, 'abcd', true, 9, true);
INSERT INTO public.moon VALUES (20, 'abcdx', true, 9, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PA-99-N2', 6.34, false, 1);
INSERT INTO public.planet VALUES (3, 'The Twin Quasar', 6, false, 5);
INSERT INTO public.planet VALUES (6, 'Venus', 6051.8, false, 7);
INSERT INTO public.planet VALUES (5, 'Mercury', 2438.3, false, 7);
INSERT INTO public.planet VALUES (7, 'Earth', 6356.0, true, 7);
INSERT INTO public.planet VALUES (8, 'Mars', 3376.2, false, 7);
INSERT INTO public.planet VALUES (9, 'Jupiter', 66854.0, false, 7);
INSERT INTO public.planet VALUES (10, 'Saturn', 54364.0, false, 7);
INSERT INTO public.planet VALUES (11, 'Uranus', 249736356.8, false, 7);
INSERT INTO public.planet VALUES (12, 'Neptune', 24341, false, 7);
INSERT INTO public.planet VALUES (14, 'abcd', 24341, false, 4);
INSERT INTO public.planet VALUES (13, 'pluto', 24341, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 'Brightest star', 1, 97);
INSERT INTO public.star VALUES (2, 'Mirach', NULL, 1, 199);
INSERT INTO public.star VALUES (3, 'Alpha Circini', NULL, 6, 54);
INSERT INTO public.star VALUES (4, 'Beta Circini', NULL, 6, 97);
INSERT INTO public.star VALUES (5, 'Gienah', NULL, 2, 165);
INSERT INTO public.star VALUES (6, 'Kraz', NULL, 2, 140);
INSERT INTO public.star VALUES (7, 'The Sun', NULL, 7, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: join_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.join_universe_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: join_universe join_universe_join_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_universe
    ADD CONSTRAINT join_universe_join_universe_id_key UNIQUE (join_universe_id);


--
-- Name: join_universe join_universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_universe
    ADD CONSTRAINT join_universe_name_key UNIQUE (name);


--
-- Name: join_universe join_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.join_universe
    ADD CONSTRAINT join_universe_pkey PRIMARY KEY (join_universe_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

