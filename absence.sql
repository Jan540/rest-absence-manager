--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2024-02-16 19:15:24

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
-- TOC entry 3325 (class 1262 OID 25690)
-- Name: absence; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE absence WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';


\connect absence

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 25767)
-- Name: absences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.absences (
    "Id" integer NOT NULL,
    "StudentId" integer NOT NULL,
    "From" timestamp without time zone NOT NULL,
    "To" timestamp without time zone NOT NULL,
    "Reason" character varying(50) NOT NULL,
    "IsExcused" boolean DEFAULT false NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 25766)
-- Name: absences_Id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."absences_Id_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 211
-- Name: absences_Id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."absences_Id_seq1" OWNED BY public.absences."Id";


--
-- TOC entry 210 (class 1259 OID 25701)
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    "Id" integer NOT NULL,
    "Firstname" character varying(50),
    "Lastname" character varying(50),
    "Schoolclass" character varying(50)
);


--
-- TOC entry 209 (class 1259 OID 25700)
-- Name: students_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."students_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 209
-- Name: students_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."students_Id_seq" OWNED BY public.students."Id";


--
-- TOC entry 3170 (class 2604 OID 25770)
-- Name: absences Id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.absences ALTER COLUMN "Id" SET DEFAULT nextval('public."absences_Id_seq1"'::regclass);


--
-- TOC entry 3169 (class 2604 OID 25704)
-- Name: students Id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN "Id" SET DEFAULT nextval('public."students_Id_seq"'::regclass);


--
-- TOC entry 3319 (class 0 OID 25767)
-- Dependencies: 212
-- Data for Name: absences; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.absences VALUES (1, 1, '2022-03-03 15:32:00', '2022-03-03 19:40:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (2, 1, '2022-02-26 16:17:00', '2022-02-26 19:29:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (3, 1, '2022-02-25 14:30:00', '2022-02-25 15:04:00', 'School activity', false);
INSERT INTO public.absences VALUES (4, 1, '2022-03-02 13:56:00', '2022-03-02 17:50:00', 'Delay', false);
INSERT INTO public.absences VALUES (5, 1, '2022-02-24 15:00:00', '2022-02-24 15:17:00', 'School activity', false);
INSERT INTO public.absences VALUES (6, 1, '2022-02-25 09:08:00', '2022-02-25 13:00:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (7, 1, '2022-02-25 08:56:00', '2022-02-25 10:13:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (8, 1, '2022-02-28 14:50:00', '2022-02-28 15:22:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (9, 2, '2022-02-25 11:01:00', '2022-02-25 13:53:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (10, 2, '2022-03-02 10:59:00', '2022-03-02 11:02:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (11, 2, '2022-02-27 12:42:00', '2022-02-27 16:40:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (12, 2, '2022-02-28 09:48:00', '2022-02-28 11:03:00', 'Delay', false);
INSERT INTO public.absences VALUES (13, 2, '2022-02-25 16:20:00', '2022-02-25 19:43:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (14, 2, '2022-02-27 15:18:00', '2022-02-27 15:37:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (15, 2, '2022-02-26 10:20:00', '2022-02-26 10:45:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (16, 2, '2022-03-02 13:03:00', '2022-03-02 16:46:00', 'School activity', false);
INSERT INTO public.absences VALUES (17, 3, '2022-02-27 15:45:00', '2022-02-27 20:20:00', 'Delay', false);
INSERT INTO public.absences VALUES (18, 3, '2022-03-03 12:07:00', '2022-03-03 14:47:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (19, 3, '2022-02-25 13:53:00', '2022-02-25 18:28:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (20, 3, '2022-03-03 12:11:00', '2022-03-03 17:09:00', 'School activity', false);
INSERT INTO public.absences VALUES (21, 3, '2022-02-26 12:42:00', '2022-02-26 13:51:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (22, 3, '2022-02-28 09:11:00', '2022-02-28 11:17:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (23, 3, '2022-02-28 14:14:00', '2022-02-28 18:17:00', 'School activity', false);
INSERT INTO public.absences VALUES (24, 3, '2022-02-25 08:35:00', '2022-02-25 09:50:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (25, 4, '2022-02-26 11:04:00', '2022-02-26 15:42:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (26, 4, '2022-02-27 14:50:00', '2022-02-27 15:00:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (27, 4, '2022-02-26 15:20:00', '2022-02-26 17:29:00', 'Delay', false);
INSERT INTO public.absences VALUES (28, 4, '2022-02-25 09:27:00', '2022-02-25 10:49:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (29, 4, '2022-02-24 09:24:00', '2022-02-24 10:25:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (30, 4, '2022-03-03 10:13:00', '2022-03-03 14:45:00', 'School activity', false);
INSERT INTO public.absences VALUES (31, 4, '2022-02-27 13:34:00', '2022-02-27 18:33:00', 'Delay', false);
INSERT INTO public.absences VALUES (32, 4, '2022-02-26 11:33:00', '2022-02-26 11:44:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (33, 5, '2022-02-28 10:55:00', '2022-02-28 11:31:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (34, 5, '2022-02-28 11:00:00', '2022-02-28 12:51:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (35, 5, '2022-02-25 09:44:00', '2022-02-25 14:43:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (36, 5, '2022-02-24 15:17:00', '2022-02-24 17:17:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (37, 5, '2022-02-24 15:13:00', '2022-02-24 15:48:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (38, 5, '2022-03-01 15:55:00', '2022-03-01 16:50:00', 'School activity', false);
INSERT INTO public.absences VALUES (39, 5, '2022-02-24 16:41:00', '2022-02-24 17:08:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (40, 5, '2022-02-25 10:44:00', '2022-02-25 10:49:00', 'School activity', false);
INSERT INTO public.absences VALUES (41, 6, '2022-02-27 14:23:00', '2022-02-27 17:39:00', 'Delay', false);
INSERT INTO public.absences VALUES (42, 6, '2022-02-24 16:15:00', '2022-02-24 17:30:00', 'School activity', false);
INSERT INTO public.absences VALUES (43, 6, '2022-02-25 10:47:00', '2022-02-25 15:42:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (44, 6, '2022-02-27 14:18:00', '2022-02-27 18:20:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (45, 6, '2022-03-02 14:24:00', '2022-03-02 15:10:00', 'School activity', false);
INSERT INTO public.absences VALUES (46, 6, '2022-02-25 15:45:00', '2022-02-25 18:16:00', 'School activity', false);
INSERT INTO public.absences VALUES (47, 6, '2022-02-27 13:34:00', '2022-02-27 15:49:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (48, 6, '2022-02-28 13:41:00', '2022-02-28 18:03:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (49, 7, '2022-03-01 15:22:00', '2022-03-01 18:51:00', 'Delay', false);
INSERT INTO public.absences VALUES (50, 7, '2022-02-28 13:42:00', '2022-02-28 15:11:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (51, 7, '2022-02-24 15:09:00', '2022-02-24 17:39:00', 'Delay', false);
INSERT INTO public.absences VALUES (52, 7, '2022-03-03 11:46:00', '2022-03-03 16:10:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (53, 7, '2022-02-28 08:25:00', '2022-02-28 09:55:00', 'Delay', false);
INSERT INTO public.absences VALUES (54, 7, '2022-03-01 10:20:00', '2022-03-01 12:06:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (55, 7, '2022-03-01 09:20:00', '2022-03-01 10:21:00', 'Religious holiday', false);
INSERT INTO public.absences VALUES (56, 7, '2022-03-03 10:09:00', '2022-03-03 10:48:00', 'Delay', false);
INSERT INTO public.absences VALUES (57, 8, '2022-02-25 16:06:00', '2022-02-25 18:02:00', 'Medical Reason', false);
INSERT INTO public.absences VALUES (58, 8, '2022-02-28 11:23:00', '2022-02-28 11:40:00', 'Delay', false);
INSERT INTO public.absences VALUES (59, 8, '2022-02-24 09:06:00', '2022-02-24 10:08:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (60, 8, '2022-03-02 14:01:00', '2022-03-02 14:14:00', 'Delay', false);
INSERT INTO public.absences VALUES (61, 8, '2022-03-03 13:19:00', '2022-03-03 18:10:00', 'Doctor appointment', false);
INSERT INTO public.absences VALUES (62, 8, '2022-03-03 11:22:00', '2022-03-03 15:53:00', 'Family reasons', false);
INSERT INTO public.absences VALUES (63, 8, '2022-03-01 08:21:00', '2022-03-01 10:11:00', 'Delay', false);
INSERT INTO public.absences VALUES (64, 8, '2022-02-27 10:49:00', '2022-02-27 15:11:00', 'Religious holiday', false);


--
-- TOC entry 3317 (class 0 OID 25701)
-- Dependencies: 210
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students VALUES (1, 'Maria', 'Musterfrau', '3BHIT');
INSERT INTO public.students VALUES (2, 'Elisa', 'Elsenwang', '3BHIT');
INSERT INTO public.students VALUES (3, 'Paul', 'Prekorsky', '3BHIT');
INSERT INTO public.students VALUES (4, 'Hugo', 'Hummel', '4AHITN');
INSERT INTO public.students VALUES (5, 'Sylvia', 'Sejmour', '4AHITN');
INSERT INTO public.students VALUES (6, 'Oliver', 'Ochsenknecht', '5AHITN');
INSERT INTO public.students VALUES (7, 'Anna', 'Ametsberger', '5AHITN');
INSERT INTO public.students VALUES (8, 'Martin', 'Mustermann', '5AHITN');


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 211
-- Name: absences_Id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."absences_Id_seq1"', 64, true);


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 209
-- Name: students_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."students_Id_seq"', 8, true);


--
-- TOC entry 3175 (class 2606 OID 25772)
-- Name: absences absences_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.absences
    ADD CONSTRAINT absences_pk PRIMARY KEY ("Id");


--
-- TOC entry 3173 (class 2606 OID 25706)
-- Name: students students_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pk PRIMARY KEY ("Id");


--
-- TOC entry 3176 (class 2606 OID 25773)
-- Name: absences absences_students_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.absences
    ADD CONSTRAINT absences_students_fk FOREIGN KEY ("StudentId") REFERENCES public.students("Id");


-- Completed on 2024-02-16 19:15:25

--
-- PostgreSQL database dump complete
--

