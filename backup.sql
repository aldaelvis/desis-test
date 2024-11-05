--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Postgres.app)
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: db_prueba; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_prueba WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE db_prueba OWNER TO postgres;

\connect db_prueba

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: bodegas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bodegas (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.bodegas OWNER TO postgres;

--
-- Name: bodega_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bodega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bodega_id_seq OWNER TO postgres;

--
-- Name: bodega_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bodega_id_seq OWNED BY public.bodegas.id;


--
-- Name: monedas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monedas (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.monedas OWNER TO postgres;

--
-- Name: moneda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moneda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moneda_id_seq OWNER TO postgres;

--
-- Name: moneda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moneda_id_seq OWNED BY public.monedas.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    bodega_id integer NOT NULL,
    sucursal_id integer NOT NULL,
    moneda_id integer NOT NULL,
    precio numeric(10,2),
    materiales text,
    descripcion text
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    bodega_id integer NOT NULL
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- Name: surcursal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.surcursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.surcursal_id_seq OWNER TO postgres;

--
-- Name: surcursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.surcursal_id_seq OWNED BY public.sucursales.id;


--
-- Name: bodegas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodegas ALTER COLUMN id SET DEFAULT nextval('public.bodega_id_seq'::regclass);


--
-- Name: monedas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monedas ALTER COLUMN id SET DEFAULT nextval('public.moneda_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.surcursal_id_seq'::regclass);


--
-- Data for Name: bodegas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bodegas (id, nombre) VALUES (1, 'BODEGA 1');
INSERT INTO public.bodegas (id, nombre) VALUES (2, 'BODEGA 2');
INSERT INTO public.bodegas (id, nombre) VALUES (3, 'BODEGA 3');
INSERT INTO public.bodegas (id, nombre) VALUES (4, 'BOBEGA 4');


--
-- Data for Name: monedas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.monedas (id, nombre) VALUES (1, 'SOL');
INSERT INTO public.monedas (id, nombre) VALUES (2, 'DOLAR');
INSERT INTO public.monedas (id, nombre) VALUES (3, 'EURO');
INSERT INTO public.monedas (id, nombre) VALUES (4, 'CLP');


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (id, codigo, nombre, bodega_id, sucursal_id, moneda_id, precio, materiales, descripcion) VALUES (1, 'FF543', 'Producto 1', 1, 1, 1, 12.00, 'Vidrio, metal', 'dsdsdsdsdsds');
INSERT INTO public.productos (id, codigo, nombre, bodega_id, sucursal_id, moneda_id, precio, materiales, descripcion) VALUES (2, 'FF54311', 'sasa', 1, 1, 1, 12.00, 'plastico,metal', 'adsadsas1212
                ');
INSERT INTO public.productos (id, codigo, nombre, bodega_id, sucursal_id, moneda_id, precio, materiales, descripcion) VALUES (3, 'FF543aqaa', 'sasa', 1, 1, 2, 12121.00, 'plastico,madera', 'asddsadasd
                asdsadsad');


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sucursales (id, nombre, bodega_id) VALUES (1, 'Sucursal 1', 1);
INSERT INTO public.sucursales (id, nombre, bodega_id) VALUES (2, 'Surcusal 2', 1);
INSERT INTO public.sucursales (id, nombre, bodega_id) VALUES (3, 'Surcusal sur 1', 3);
INSERT INTO public.sucursales (id, nombre, bodega_id) VALUES (4, 'Surcursal sur 2', 2);
INSERT INTO public.sucursales (id, nombre, bodega_id) VALUES (5, 'Surcusal norte 1', 3);


--
-- Name: bodega_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bodega_id_seq', 4, true);


--
-- Name: moneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moneda_id_seq', 4, true);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 3, true);


--
-- Name: surcursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.surcursal_id_seq', 5, true);


--
-- Name: bodegas bodega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodegas
    ADD CONSTRAINT bodega_pkey PRIMARY KEY (id);


--
-- Name: monedas moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monedas
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: sucursales surcursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT surcursal_pkey PRIMARY KEY (id);


--
-- Name: sucursales fk_bodega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT fk_bodega FOREIGN KEY (bodega_id) REFERENCES public.bodegas(id);


--
-- Name: productos fk_bodega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_bodega FOREIGN KEY (bodega_id) REFERENCES public.bodegas(id);


--
-- Name: productos fk_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_moneda FOREIGN KEY (moneda_id) REFERENCES public.monedas(id);


--
-- Name: productos fk_sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- PostgreSQL database dump complete
--

