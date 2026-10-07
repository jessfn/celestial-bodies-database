--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(40) NOT NULL,
    galaxy_types character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    stars_in_billions integer,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer,
    diameter_km integer,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    number_of_moons integer,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mission_type character varying(30) NOT NULL,
    launch_year integer,
    description text,
    is_active boolean
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature_k integer,
    distance_from_earth numeric(12,2),
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 400, 0.00, 'Our home galaxy', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 1000, 2537000.00, 'Nearest large galaxy', false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 40, 2730000.00, 'Third largest in the Local Group', false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 100, 23000000.00, 'Interacting spiral galaxy', false, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 9000, 100, 29000000.00, 'Has a bright nucleus', false, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 500, 100, 500000000.00, 'Result of a galactic collision', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 4500, 3474, 0.38, 'Earth natural satellite', false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 4500, 22, 78.30, 'Inner moon of Mars', false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 4500, 12, 78.30, 'Outer moon of Mars', false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 4500, 3643, 628.70, 'Volcanic moon', false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4500, 3122, 628.70, 'Icy moon with an ocean', false, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4500, 5268, 628.70, 'Largest moon', false, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4500, 4821, 628.70, 'Heavily cratered moon', false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 4500, 5150, 1275.00, 'Has a thick atmosphere', false, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 4500, 504, 1275.00, 'Geysers of ice', false, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 4500, 396, 1275.00, 'Death Star moon', false, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 4500, 1527, 1275.00, 'Second largest of Saturn', false, true);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 4500, 1123, 1275.00, 'Icy moon', false, true);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 4500, 1062, 1275.00, 'Icy moon', false, true);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 4500, 1578, 2724.00, 'Largest moon of Uranus', false, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 4500, 1523, 2724.00, 'Outer large moon of Uranus', false, true);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 4500, 471, 2724.00, 'Moon with varied terrain', false, true);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 4500, 1158, 2724.00, 'Bright moon of Uranus', false, true);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 4500, 2707, 4351.00, 'Retrograde orbit', false, true);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 4500, 340, 4351.00, 'Eccentric orbit', false, false);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 4500, 420, 4351.00, 'Irregular shape', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4500, 0, 91.70, 'Closest planet to the Sun', false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 4500, 0, 41.40, 'Hottest planet', false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 4500, 1, 0.00, 'Our home planet', true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4500, 2, 78.30, 'The red planet', false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 4500, 95, 628.70, 'Largest planet', false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 4500, 146, 1275.00, 'Has famous rings', false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 4500, 28, 2724.00, 'Tilted ice giant', false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 4500, 16, 4351.00, 'Farthest planet', false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Terrestrial', 4850, 0, 4.24, 'Exoplanet in the habitable zone', false, true);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 'Super-Earth', 4850, 0, 4.24, 'Candidate super-Earth', false, true);
INSERT INTO public.planet VALUES (11, 'Sirius b1', 3, 'Gas giant', 242, 0, 8.60, 'Hypothetical planet', false, true);
INSERT INTO public.planet VALUES (12, 'Vega b', 6, 'Gas giant', 455, 0, 25.00, 'Hypothetical planet', false, true);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Flyby', 1977, 'Farthest human-made object', true);
INSERT INTO public.spacecraft VALUES (2, 'Hubble', 'Telescope', 1990, 'Space telescope', true);
INSERT INTO public.spacecraft VALUES (3, 'Apollo 11', 'Crewed landing', 1969, 'First crewed Moon landing', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5772, 0.00, 'Our star', true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 3042, 4.24, 'Closest star to the Sun', false, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, 9940, 8.60, 'Brightest star in the night sky', false, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8, 3500, 548.00, 'Red supergiant', false, true);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 8, 12100, 860.00, 'Blue supergiant', false, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, 9602, 25.00, 'Bright star in Lyra', false, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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

