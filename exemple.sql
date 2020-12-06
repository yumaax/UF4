--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: equip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equip (
    codie integer NOT NULL,
    nom character varying(50),
    poblacio character varying(25),
    numsocis integer
);


ALTER TABLE public.equip OWNER TO postgres;

--
-- Name: equip_codie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equip_codie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equip_codie_seq OWNER TO postgres;

--
-- Name: equip_codie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equip_codie_seq OWNED BY public.equip.codie;


--
-- Name: jugadors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jugadors (
    codij integer NOT NULL,
    nom character varying(20),
    cognoms character varying(30),
    data date,
    demarcacio character varying(15),
    equip integer NOT NULL
);


ALTER TABLE public.jugadors OWNER TO postgres;

--
-- Name: jugadors_codij_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jugadors_codij_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jugadors_codij_seq OWNER TO postgres;

--
-- Name: jugadors_codij_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jugadors_codij_seq OWNED BY public.jugadors.codij;


--
-- Name: prova; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prova (
    nom character varying(20),
    edat integer
);


ALTER TABLE public.prova OWNER TO postgres;

--
-- Name: equip codie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equip ALTER COLUMN codie SET DEFAULT nextval('public.equip_codie_seq'::regclass);


--
-- Name: jugadors codij; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadors ALTER COLUMN codij SET DEFAULT nextval('public.jugadors_codij_seq'::regclass);


--
-- Data for Name: equip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equip (codie, nom, poblacio, numsocis) FROM stdin;
1	Sabadell	Sabadell	0
2	Sant Quirze	Sant Quirze	0
3	Barca	Barca	0
\.


--
-- Data for Name: jugadors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jugadors (codij, nom, cognoms, data, demarcacio, equip) FROM stdin;
1	carles	blanco	2000-11-13	defensa	3
2	carles	blanco	2000-11-13	defensa	3
3	carles	blanco	2000-11-13	defensa	2
4	carles	blanco	2000-11-13	defensa	2
5	carles	blanco	2000-11-13	defensa	1
6	carles	blanco	2000-11-13	defensa	1
\.


--
-- Data for Name: prova; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prova (nom, edat) FROM stdin;
\.


--
-- Name: equip_codie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equip_codie_seq', 1, false);


--
-- Name: jugadors_codij_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jugadors_codij_seq', 1, false);


--
-- Name: equip equip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equip
    ADD CONSTRAINT equip_pkey PRIMARY KEY (codie);


--
-- Name: jugadors jugadors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadors
    ADD CONSTRAINT jugadors_pkey PRIMARY KEY (codij);


--
-- Name: jugadors jugadors_equip_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jugadors
    ADD CONSTRAINT jugadors_equip_fkey FOREIGN KEY (equip) REFERENCES public.equip(codie);


--
-- PostgreSQL database dump complete
--

