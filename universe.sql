--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    number_of_planets integer,
    description text,
    galaxy_type character varying(50),
    catalog_number character varying(20)
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
    name character varying(30) NOT NULL,
    year_discovered integer,
    distance_from_earth numeric(10,2),
    description text,
    has_life boolean,
    planet_id integer NOT NULL,
    moon_code character varying(20)
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
    distance_from_earth numeric(10,2),
    year_discovered integer,
    description text,
    has_life boolean,
    star_id integer NOT NULL,
    planet_code character varying(20)
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_launched integer,
    country character varying(50),
    planet_id integer NOT NULL,
    satellite_code character varying(20)
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(10,2),
    year_discovered integer,
    description text,
    galaxy_id integer NOT NULL,
    star_code character varying(20)
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 'Our home galaxy.', NULL, 'MW-001');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200, 'Closest large galaxy to the Milky Way.', NULL, 'AND-002');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50, 'Third-largest galaxy in our Local Group.', NULL, 'TRI-003');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 100, 'A stunning spiral galaxy.', NULL, 'WHI-004');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50, 'A galaxy with a bright nucleus.', NULL, 'SOM-005');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 1000, 'A giant elliptical galaxy.', NULL, 'M87-006');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', -4500000, 0.38, 'Earth natural satellite', false, 1, 'MOON-001');
INSERT INTO public.moon VALUES (4, 'Phobos', 1877, 0.01, 'One of Mars’ moons', false, 2, 'PHOB-002');
INSERT INTO public.moon VALUES (5, 'Deimos', 1877, 0.01, 'The second moon of Mars', false, 2, 'DEIM-003');
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 1.07, 'Largest moon in the Solar System', false, 4, 'GAN-004');
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 1.88, 'A heavily cratered moon of Jupiter', false, 4, 'CAL-005');
INSERT INTO public.moon VALUES (8, 'Io', 1610, 0.42, 'Most volcanically active body in the Solar System', false, 4, 'IO-006');
INSERT INTO public.moon VALUES (9, 'Europa', 1610, 0.67, 'Has a subsurface ocean', false, 4, 'EUR-007');
INSERT INTO public.moon VALUES (10, 'Titan', 1655, 1.22, 'Largest moon of Saturn', false, 5, 'TIT-008');
INSERT INTO public.moon VALUES (11, 'Enceladus', 1789, 1.27, 'Saturn’s moon with geysers', false, 5, 'ENC-009');
INSERT INTO public.moon VALUES (12, 'Triton', 1846, 3.55, 'Largest moon of Neptune', false, 6, 'TRI-010');
INSERT INTO public.moon VALUES (13, 'Charon', 1978, 19.60, 'Largest moon of Pluto', false, 7, 'CHA-011');
INSERT INTO public.moon VALUES (14, 'Oberon', 1787, 5.92, 'One of Uranus’ moons', false, 8, 'OBE-012');
INSERT INTO public.moon VALUES (15, 'Miranda', 1948, 1.30, 'Has the tallest known cliff in the Solar System', false, 8, 'MIR-013');
INSERT INTO public.moon VALUES (16, 'Ariel', 1851, 1.90, 'A moon of Uranus', false, 8, 'ARI-014');
INSERT INTO public.moon VALUES (17, 'Umbriel', 1851, 2.66, 'Darkest of Uranus’ major moons', false, 8, 'UMB-015');
INSERT INTO public.moon VALUES (18, 'Titania', 1787, 4.36, 'Largest moon of Uranus', false, 8, 'TITN-016');
INSERT INTO public.moon VALUES (19, 'Dione', 1684, 1.08, 'A moon of Saturn', false, 9, 'DIO-017');
INSERT INTO public.moon VALUES (20, 'Iapetus', 1671, 3.56, 'Saturn’s moon with two-tone coloring', false, 9, 'IAP-018');
INSERT INTO public.moon VALUES (21, 'Rhea', 1672, 1.53, 'Second-largest moon of Saturn', false, 9, 'RHE-019');
INSERT INTO public.moon VALUES (22, 'Hyperion', 1848, 1.48, 'Chaotic rotation, sponge-like appearance', false, 9, 'HYP-020');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0.00, -4500000, 'Our home planet', true, 1, 'EAR-001');
INSERT INTO public.planet VALUES (2, 'Mars', 225.00, -4000, 'The Red Planet', false, 1, 'MAR-002');
INSERT INTO public.planet VALUES (4, 'Venus', 42.00, -4000, 'Earth’s sister planet', false, 1, 'VEN-003');
INSERT INTO public.planet VALUES (5, 'Jupiter', 778.00, -4000, 'The largest planet in our Solar System', false, 1, 'JUP-004');
INSERT INTO public.planet VALUES (6, 'Saturn', 1427.00, -4000, 'Famous for its rings', false, 1, 'SAT-005');
INSERT INTO public.planet VALUES (7, 'Neptune', 4497.00, 1846, 'The furthest planet in our Solar System', false, 1, 'NEP-006');
INSERT INTO public.planet VALUES (8, 'Kepler-442b', 1200.00, 2015, 'Exoplanet in a habitable zone', false, 3, 'K442B-007');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 600.00, 2011, 'Super-Earth exoplanet', false, 3, 'K22B-008');
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 20.50, 2010, 'Potentially habitable exoplanet', false, 4, 'G581G-009');
INSERT INTO public.planet VALUES (11, 'HD 209458b', 150.00, 1999, 'First exoplanet detected by transit', false, 5, 'HD209-010');
INSERT INTO public.planet VALUES (12, 'TOI-700d', 100.00, 2020, 'Earth-sized exoplanet in a habitable zone', false, 5, 'TOI-011');
INSERT INTO public.planet VALUES (13, '55 Cancri e', 40.00, 2004, 'A super-hot exoplanet', false, 6, 'CANC-012');
INSERT INTO public.planet VALUES (3, 'Proxima b', 4.20, 2016, 'Exoplanet in the habitable zone', false, 2, 'PROX-003');


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble', 1990, 'USA', 1, 'SAT-001');
INSERT INTO public.satellite VALUES (2, 'Voyager 1', 1977, 'USA', 2, 'SAT-002');
INSERT INTO public.satellite VALUES (3, 'Sputnik 1', 1957, 'USSR', 3, 'SAT-003');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, -4500000, 'Main sequence star', 1, 'SUN-001');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.12, 1915, 'Closest known exoplanet-hosting star', 1, 'PCEN-002');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 20.00, 1600, 'A red supergiant in Orion', 2, 'BET-003');
INSERT INTO public.star VALUES (4, 'Sirius', 2.10, -3000, 'The brightest star in the night sky', 3, 'SIR-004');
INSERT INTO public.star VALUES (5, 'Vega', 2.40, -12000, 'One of the most luminous stars near Earth', 4, 'VEG-005');
INSERT INTO public.star VALUES (6, 'Altair', 1.80, -5000, 'A fast-rotating star', 5, 'ALT-006');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_catalog_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_catalog_number_key UNIQUE (catalog_number);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_code_key UNIQUE (moon_code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_code_key UNIQUE (planet_code);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellite_satellite_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_satellite_code_key UNIQUE (satellite_code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_code_key UNIQUE (star_code);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: idx_moon_planet_id; Type: INDEX; Schema: public; Owner: freecodecamp
--

CREATE INDEX idx_moon_planet_id ON public.moon USING btree (planet_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

