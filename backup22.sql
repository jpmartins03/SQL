--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

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
-- Name: notas_fiscais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_fiscais (
    id_nf integer NOT NULL,
    id_item integer NOT NULL,
    cod_prod text,
    valor_unit numeric,
    quantidade integer,
    desconto numeric
);


ALTER TABLE public.notas_fiscais OWNER TO postgres;

--
-- Name: itens_com_desconto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.itens_com_desconto AS
 SELECT id_nf,
    id_item,
    cod_prod,
    valor_unit,
    (valor_unit - (valor_unit * (desconto / (100)::numeric))) AS valor_vendido
   FROM public.notas_fiscais
  WHERE (desconto IS NOT NULL);


ALTER VIEW public.itens_com_desconto OWNER TO postgres;

--
-- Name: itens_sem_desconto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.itens_sem_desconto AS
 SELECT id_nf,
    id_item,
    cod_prod,
    valor_unit
   FROM public.notas_fiscais
  WHERE (desconto IS NULL);


ALTER VIEW public.itens_sem_desconto OWNER TO postgres;

--
-- Name: itens_vendidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.itens_vendidos AS
 SELECT id_nf,
    id_item,
    cod_prod,
    valor_unit,
    ((quantidade)::numeric * valor_unit) AS valor_total,
    desconto,
    (valor_unit - (valor_unit * (desconto / (100)::numeric))) AS valor_vendido
   FROM public.notas_fiscais;


ALTER VIEW public.itens_vendidos OWNER TO postgres;

--
-- Name: mais_de_dez; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.mais_de_dez AS
 SELECT id_nf,
    cod_prod,
    sum(quantidade) AS quantidade
   FROM public.notas_fiscais
  GROUP BY id_nf, cod_prod
 HAVING (sum(quantidade) > 10);


ALTER VIEW public.mais_de_dez OWNER TO postgres;

--
-- Name: mais_vendido; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.mais_vendido AS
 SELECT cod_prod,
    sum(quantidade) AS quantidade
   FROM public.notas_fiscais
  GROUP BY cod_prod
  ORDER BY (sum(quantidade)) DESC
 LIMIT 1;


ALTER VIEW public.mais_vendido OWNER TO postgres;

--
-- Name: media_descontos_por_produto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.media_descontos_por_produto AS
 SELECT cod_prod,
    avg(desconto) AS media
   FROM public.notas_fiscais
  GROUP BY cod_prod;


ALTER VIEW public.media_descontos_por_produto OWNER TO postgres;

--
-- Name: total_nf; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.total_nf AS
 SELECT id_nf,
    sum(((quantidade)::numeric * valor_unit)) AS valor_total
   FROM public.notas_fiscais
  GROUP BY id_nf
  ORDER BY (sum(((quantidade)::numeric * valor_unit))) DESC;


ALTER VIEW public.total_nf OWNER TO postgres;

--
-- Name: valor_total_nfs_maior_que_500; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.valor_total_nfs_maior_que_500 AS
 SELECT id_nf,
    sum(((quantidade)::numeric * valor_unit)) AS valor_tot
   FROM public.notas_fiscais
  GROUP BY id_nf
 HAVING (sum(((quantidade)::numeric * valor_unit)) > (500)::numeric)
  ORDER BY (sum(((quantidade)::numeric * valor_unit))) DESC;


ALTER VIEW public.valor_total_nfs_maior_que_500 OWNER TO postgres;

--
-- Name: valor_vendido_nfs; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.valor_vendido_nfs AS
 SELECT id_nf,
    sum(((valor_unit - (valor_unit * (desconto / (100)::numeric))) * (quantidade)::numeric)) AS valor_vendido
   FROM public.notas_fiscais
  GROUP BY id_nf
  ORDER BY (sum(((valor_unit - (valor_unit * (desconto / (100)::numeric))) * (quantidade)::numeric))) DESC;


ALTER VIEW public.valor_vendido_nfs OWNER TO postgres;

--
-- Data for Name: notas_fiscais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_fiscais (id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) FROM stdin;
1	1	1	25.00	10	5
4	1	5	30.00	10	15
4	2	4	10.00	12	5
4	3	1	25.00	13	5
4	4	2	13.50	15	5
6	1	1	25.00	22	15
6	2	3	15.00	25	20
7	1	1	25.00	10	3
7	2	2	13.5	10	4
7	3	3	15.00	10	4
7	4	5	30.00	10	1
1	2	2	13.00	3	0
1	3	3	15.00	2	0
1	4	4	10.00	1	0
1	5	5	30.00	1	0
2	1	3	15.00	4	0
2	2	4	10.00	5	0
2	3	5	30.00	7	0
3	1	1	25.00	5	0
3	2	4	10.00	4	0
3	3	5	30.00	5	0
3	4	2	13.50	7	0
5	1	3	15.00	3	0
5	2	5	30.00	6	0
\.


--
-- Name: notas_fiscais CHAVE_PRODUTO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_fiscais
    ADD CONSTRAINT "CHAVE_PRODUTO" PRIMARY KEY (id_nf, id_item);


--
-- PostgreSQL database dump complete
--

