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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(40) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (79, 'aldo', 2, 4);
INSERT INTO public.users VALUES (95, 'user_1667605796585', 2, 8);
INSERT INTO public.users VALUES (81, 'user_1667605699308', 2, 631);
INSERT INTO public.users VALUES (107, 'user_1667606088824', 2, 541);
INSERT INTO public.users VALUES (80, 'user_1667605699309', 5, 298);
INSERT INTO public.users VALUES (94, 'user_1667605796586', 5, 303);
INSERT INTO public.users VALUES (106, 'user_1667606088825', 5, 66);
INSERT INTO public.users VALUES (83, 'user_1667605759120', 2, 683);
INSERT INTO public.users VALUES (121, 'user_1667606488607', 2, 570);
INSERT INTO public.users VALUES (97, 'user_1667605816053', 2, 356);
INSERT INTO public.users VALUES (82, 'user_1667605759121', 5, 337);
INSERT INTO public.users VALUES (96, 'user_1667605816054', 5, 93);
INSERT INTO public.users VALUES (85, 'user_1667605768537', 2, 66);
INSERT INTO public.users VALUES (120, 'user_1667606488608', 5, 166);
INSERT INTO public.users VALUES (84, 'user_1667605768538', 5, 291);
INSERT INTO public.users VALUES (109, 'user_1667606113278', 2, 388);
INSERT INTO public.users VALUES (99, 'user_1667605831422', 2, 693);
INSERT INTO public.users VALUES (87, 'user_1667605776480', 2, 60);
INSERT INTO public.users VALUES (108, 'user_1667606113279', 5, 503);
INSERT INTO public.users VALUES (86, 'user_1667605776481', 5, 232);
INSERT INTO public.users VALUES (98, 'user_1667605831423', 5, 202);
INSERT INTO public.users VALUES (89, 'user_1667605780305', 2, 303);
INSERT INTO public.users VALUES (123, 'user_1667606505056', 2, 571);
INSERT INTO public.users VALUES (88, 'user_1667605780306', 5, 109);
INSERT INTO public.users VALUES (101, 'user_1667605858133', 2, 267);
INSERT INTO public.users VALUES (111, 'user_1667606135988', 2, 547);
INSERT INTO public.users VALUES (100, 'user_1667605858134', 5, 368);
INSERT INTO public.users VALUES (91, 'user_1667605783679', 2, 547);
INSERT INTO public.users VALUES (122, 'user_1667606505057', 5, 123);
INSERT INTO public.users VALUES (110, 'user_1667606135989', 5, 188);
INSERT INTO public.users VALUES (90, 'user_1667605783680', 5, 244);
INSERT INTO public.users VALUES (103, 'user_1667605889944', 2, 75);
INSERT INTO public.users VALUES (93, 'user_1667605786837', 2, 83);
INSERT INTO public.users VALUES (102, 'user_1667605889945', 5, 92);
INSERT INTO public.users VALUES (92, 'user_1667605786838', 5, 189);
INSERT INTO public.users VALUES (113, 'user_1667606147033', 2, 926);
INSERT INTO public.users VALUES (112, 'user_1667606147034', 5, 233);
INSERT INTO public.users VALUES (105, 'user_1667605996402', 2, 210);
INSERT INTO public.users VALUES (104, 'user_1667605996403', 5, 78);
INSERT INTO public.users VALUES (115, 'user_1667606155316', 2, 402);
INSERT INTO public.users VALUES (114, 'user_1667606155317', 5, 134);
INSERT INTO public.users VALUES (117, 'user_1667606409156', 2, 301);
INSERT INTO public.users VALUES (116, 'user_1667606409157', 5, 11);
INSERT INTO public.users VALUES (119, 'user_1667606430478', 2, 604);
INSERT INTO public.users VALUES (118, 'user_1667606430479', 5, 231);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 123, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

