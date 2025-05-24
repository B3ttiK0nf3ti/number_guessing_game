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
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1748073469067', 2, 612);
INSERT INTO public.users VALUES ('user_1748074035146', 2, 717);
INSERT INTO public.users VALUES ('user_1748073469068', 5, 27);
INSERT INTO public.users VALUES ('user_1748074035147', 5, 56);
INSERT INTO public.users VALUES ('user_1748073492766', 2, 176);
INSERT INTO public.users VALUES ('user_1748074593384', 2, 446);
INSERT INTO public.users VALUES ('user_1748075080907', 2, 14);
INSERT INTO public.users VALUES ('user_1748073492767', 5, 56);
INSERT INTO public.users VALUES ('user_1748074593385', 5, 94);
INSERT INTO public.users VALUES ('user_1748074201239', 2, 5);
INSERT INTO public.users VALUES ('user_1748075080908', 5, 118);
INSERT INTO public.users VALUES ('user_1748074201240', 5, 67);
INSERT INTO public.users VALUES ('user_1748073657095', 2, 768);
INSERT INTO public.users VALUES ('user_1748073657096', 5, 535);
INSERT INTO public.users VALUES ('user_1748074656743', 2, 127);
INSERT INTO public.users VALUES ('user_1748073760977', 2, 458);
INSERT INTO public.users VALUES ('user_1748074285482', 2, 427);
INSERT INTO public.users VALUES ('user_1748073760978', 5, 197);
INSERT INTO public.users VALUES ('user_1748074656744', 5, 94);
INSERT INTO public.users VALUES ('user_1748074285483', 5, 355);
INSERT INTO public.users VALUES ('user_1748073905663', 2, 140);
INSERT INTO public.users VALUES ('user_1748073905664', 5, 147);
INSERT INTO public.users VALUES ('user_1748074314962', 2, 461);
INSERT INTO public.users VALUES ('user_1748074699965', 2, 206);
INSERT INTO public.users VALUES ('user_1748074314963', 5, 116);
INSERT INTO public.users VALUES ('user_1748074699966', 5, 237);
INSERT INTO public.users VALUES ('betti', 2, 6);
INSERT INTO public.users VALUES ('user_1748074478530', 2, 67);
INSERT INTO public.users VALUES ('user_1748074478531', 5, 130);
INSERT INTO public.users VALUES ('user_1748074958175', 2, 505);
INSERT INTO public.users VALUES ('user_1748074958176', 5, 420);
INSERT INTO public.users VALUES ('user_1748074996855', 0, NULL);
INSERT INTO public.users VALUES ('user_1748074996854', 0, NULL);
INSERT INTO public.users VALUES ('user_1748075029880', 2, 242);
INSERT INTO public.users VALUES ('user_1748075029881', 5, 172);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

