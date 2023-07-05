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
    million_years_age integer,
    galaxy_description text,
    diameter_mkm integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_diameter_km integer,
    moon_description text,
    distance integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_diameter_km integer,
    habitable boolean,
    planet_description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(30) NOT NULL,
    population integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    million_years_age integer,
    star_diameter numeric(10,2),
    is_alive boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 'Spiral galaxy and our home', 230000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Closest spiral galaxy', 220000);
INSERT INTO public.galaxy VALUES (3, 'Canis Major', 11000, 'Closest galaxy and irregular', NULL);
INSERT INTO public.galaxy VALUES (4, 'Elliptical galaxy M87', 13240, 'Brightest galaxy', 60000);
INSERT INTO public.galaxy VALUES (5, 'Atennea Galaxies', NULL, 'Undergoing a galactic collision', 50000);
INSERT INTO public.galaxy VALUES (6, 'NCT 34', NULL, 'A long time ago in a galaxy far far away...', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (9, 'ASMN 13', 640, '', 384000, 5);
INSERT INTO public.moon VALUES (1, 'Moon', 3478, 'Our Moon', 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 23, 'Little moon', 250000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 'Even litller', 341000, 2);
INSERT INTO public.moon VALUES (4, 'MNCNT1', 356, '', 454000, 3);
INSERT INTO public.moon VALUES (8, 'ASMN 12', 5340, 'Maybe habitable', 454000, 5);
INSERT INTO public.moon VALUES (5, 'MNCNT2', 279, 'Red moon', 324000, 3);
INSERT INTO public.moon VALUES (6, 'CNTMN2', 4679, '', 512450, 4);
INSERT INTO public.moon VALUES (7, 'CNTMN2 201', 3500, 'No more data', 321280, 4);
INSERT INTO public.moon VALUES (10, 'ASMN 43', 1660, '', 245000, 5);
INSERT INTO public.moon VALUES (11, 'ASTN XT', 51660, 'Only one image', 645000, 6);
INSERT INTO public.moon VALUES (12, 'ASTN XZ', 52360, 'Color blue', 4100100, 6);
INSERT INTO public.moon VALUES (13, 'TTN 01', 1360, 'Color Orange', 119200, 7);
INSERT INTO public.moon VALUES (14, 'TTN 345', 4360, '', 219200, 7);
INSERT INTO public.moon VALUES (15, 'DNT 333', 13460, '', 325300, 8);
INSERT INTO public.moon VALUES (16, 'DNT XS', 33460, 'It is so hot in there', 3454300, 8);
INSERT INTO public.moon VALUES (17, 'HTMN 12', 37540, 'It is very cold', 13300, 9);
INSERT INTO public.moon VALUES (18, 'DGBMN 95', 2040, '', 12430, 10);
INSERT INTO public.moon VALUES (19, 'TRMN Q5', 13000, '', 65300, 11);
INSERT INTO public.moon VALUES (20, 'SMMN LL', 65553, '', 1244400, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, true, 'Blue and Green', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6776, false, 'Red', 1);
INSERT INTO public.planet VALUES (3, 'CNT 01', 9776, false, '', 2);
INSERT INTO public.planet VALUES (4, 'CNT 02', 10800, false, 'Green everywhere', 2);
INSERT INTO public.planet VALUES (6, 'ASTPLNT 32', 7890, false, '', 6);
INSERT INTO public.planet VALUES (7, 'Tatooine', 12590, true, 'it is only desert', 4);
INSERT INTO public.planet VALUES (8, 'Dantooine', 11678, true, 'Some Hutts', 4);
INSERT INTO public.planet VALUES (9, 'Hoth', 10678, true, 'It is cold', 5);
INSERT INTO public.planet VALUES (10, 'Dagobah', 9678, true, '', 5);
INSERT INTO public.planet VALUES (11, 'TRTX 101', 10218, false, '', 7);
INSERT INTO public.planet VALUES (12, 'SMPT 98', 11111, false, '', 3);
INSERT INTO public.planet VALUES (5, 'ASTPLNT 09', 5760, false, 'It is not a moon', 6);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', 10000, 1);
INSERT INTO public.species VALUES (2, 'Tusken Raiders', 500, 7);
INSERT INTO public.species VALUES (3, 'Martians', 30000, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, 1.39, true, 1);
INSERT INTO public.star VALUES (2, 'Centauri', 5005, 1.67, true, 2);
INSERT INTO public.star VALUES (6, 'AST 34', 3890, 1.08, true, 4);
INSERT INTO public.star VALUES (4, 'TATN A', 7890, 1.42, true, 6);
INSERT INTO public.star VALUES (5, 'TATN B', 7890, 1.42, true, 6);
INSERT INTO public.star VALUES (7, 'PPM 4', 2356, 1.82, true, 3);
INSERT INTO public.star VALUES (3, 'NB 101', 9505, 1.57, true, 5);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

