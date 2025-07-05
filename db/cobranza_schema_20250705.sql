--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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
-- Name: cobranza; Type: DATABASE; Schema: -; Owner: cobranza
--

CREATE DATABASE cobranza WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es_MX.UTF-8';


ALTER DATABASE cobranza OWNER TO cobranza;

\connect cobranza

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cobranza;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO cobranza;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cobranza;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO cobranza;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cobranza;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO cobranza;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO cobranza;

--
-- Name: cbr_bitacoras; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_bitacoras (
    log_key integer NOT NULL,
    log_invoice integer NOT NULL,
    log_text text NOT NULL,
    log_datetime timestamp without time zone NOT NULL,
    log_cuser integer
);


ALTER TABLE public.cbr_bitacoras OWNER TO cobranza;

--
-- Name: TABLE cbr_bitacoras; Type: COMMENT; Schema: public; Owner: cobranza
--

COMMENT ON TABLE public.cbr_bitacoras IS 'Bitacoras';


--
-- Name: cbr_bitacoras_log_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_bitacoras_log_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_bitacoras_log_key_seq OWNER TO cobranza;

--
-- Name: cbr_bitacoras_log_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_bitacoras_log_key_seq OWNED BY public.cbr_bitacoras.log_key;


--
-- Name: cbr_edhistory; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_edhistory (
    ed_key integer NOT NULL,
    ed_newdate date,
    ed_olddate date,
    his_invoice integer NOT NULL,
    ed_user integer,
    ed_date timestamp with time zone NOT NULL
);


ALTER TABLE public.cbr_edhistory OWNER TO cobranza;

--
-- Name: cbr_edhistory_ed_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_edhistory_ed_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_edhistory_ed_key_seq OWNER TO cobranza;

--
-- Name: cbr_edhistory_ed_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_edhistory_ed_key_seq OWNED BY public.cbr_edhistory.ed_key;


--
-- Name: cbr_facturas; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_facturas (
    fac_key integer NOT NULL,
    fac_serie character varying(10) NOT NULL,
    fac_folio integer NOT NULL,
    fac_emisorrfc character varying(15) NOT NULL,
    fac_emisornombre text NOT NULL,
    fac_receptorrfc character varying(15) NOT NULL,
    fac_receptornombre text NOT NULL,
    fac_total numeric(16,6) NOT NULL,
    fac_observaciones text,
    fac_xml xml NOT NULL,
    fac_fechapago date,
    fac_fecha timestamp without time zone NOT NULL,
    fac_cdate timestamp without time zone,
    fac_subtotal numeric(16,6) NOT NULL,
    fac_iva numeric(16,6) DEFAULT 0 NOT NULL,
    fac_payments numeric(16,6) DEFAULT 0 NOT NULL,
    fac_isactive boolean DEFAULT true NOT NULL,
    fac_contact text,
    fac_lastreminder integer DEFAULT 0,
    fac_pagada smallint DEFAULT 2 NOT NULL,
    fac_expectedpaymentday date,
    fac_complemento character varying(100),
    fac_idclient integer,
    fac_iduser integer,
    fac_edupdatescount integer DEFAULT 0,
    fac_uuid character varying(40) DEFAULT NULL::character varying
);


ALTER TABLE public.cbr_facturas OWNER TO cobranza;

--
-- Name: TABLE cbr_facturas; Type: COMMENT; Schema: public; Owner: cobranza
--

COMMENT ON TABLE public.cbr_facturas IS 'Facturas';


--
-- Name: cbr_facturas_fac_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_facturas_fac_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_facturas_fac_key_seq OWNER TO cobranza;

--
-- Name: cbr_facturas_fac_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_facturas_fac_key_seq OWNED BY public.cbr_facturas.fac_key;


--
-- Name: cbr_historialpagos; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_historialpagos (
    his_key integer NOT NULL,
    his_invoice integer NOT NULL,
    his_date date NOT NULL,
    his_amount numeric(16,6) NOT NULL
);


ALTER TABLE public.cbr_historialpagos OWNER TO cobranza;

--
-- Name: TABLE cbr_historialpagos; Type: COMMENT; Schema: public; Owner: cobranza
--

COMMENT ON TABLE public.cbr_historialpagos IS 'Historial de pagos';


--
-- Name: cbr_historialpagos_his_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_historialpagos_his_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_historialpagos_his_key_seq OWNER TO cobranza;

--
-- Name: cbr_historialpagos_his_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_historialpagos_his_key_seq OWNED BY public.cbr_historialpagos.his_key;


--
-- Name: cbr_invoicefilelog; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_invoicefilelog (
    ifl_key integer NOT NULL,
    ifl_filepath text NOT NULL,
    ifl_date timestamp with time zone NOT NULL,
    ifl_pdate timestamp with time zone,
    ifl_status character varying(30) NOT NULL,
    ifl_invoice integer
);


ALTER TABLE public.cbr_invoicefilelog OWNER TO cobranza;

--
-- Name: cbr_invoicefilelog_ifl_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_invoicefilelog_ifl_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_invoicefilelog_ifl_key_seq OWNER TO cobranza;

--
-- Name: cbr_invoicefilelog_ifl_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_invoicefilelog_ifl_key_seq OWNED BY public.cbr_invoicefilelog.ifl_key;


--
-- Name: cbr_reminders; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_reminders (
    rem_key integer NOT NULL,
    rem_invoice integer NOT NULL,
    rem_text text NOT NULL,
    rem_datetime timestamp without time zone NOT NULL,
    rem_isactive boolean DEFAULT true NOT NULL,
    rem_cuser integer
);


ALTER TABLE public.cbr_reminders OWNER TO cobranza;

--
-- Name: TABLE cbr_reminders; Type: COMMENT; Schema: public; Owner: cobranza
--

COMMENT ON TABLE public.cbr_reminders IS 'Recordatorios';


--
-- Name: cbr_reminders_rem_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_reminders_rem_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_reminders_rem_key_seq OWNER TO cobranza;

--
-- Name: cbr_reminders_rem_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_reminders_rem_key_seq OWNED BY public.cbr_reminders.rem_key;


--
-- Name: cbr_roles; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_roles (
    role_key integer NOT NULL,
    role_name character varying(30) NOT NULL,
    role_label character varying(100),
    role_description text,
    role_weight integer DEFAULT 10
);


ALTER TABLE public.cbr_roles OWNER TO cobranza;

--
-- Name: TABLE cbr_roles; Type: COMMENT; Schema: public; Owner: cobranza
--

COMMENT ON TABLE public.cbr_roles IS 'Roles de usuarios';


--
-- Name: cbr_roles_role_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_roles_role_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_roles_role_key_seq OWNER TO cobranza;

--
-- Name: cbr_roles_role_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_roles_role_key_seq OWNED BY public.cbr_roles.role_key;


--
-- Name: cbr_users; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.cbr_users (
    user_key integer NOT NULL,
    user_login character varying(30) NOT NULL,
    user_password character varying(50) NOT NULL,
    user_rolename character varying(30) NOT NULL,
    user_fullname character varying(100),
    user_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.cbr_users OWNER TO cobranza;

--
-- Name: TABLE cbr_users; Type: COMMENT; Schema: public; Owner: cobranza
--

COMMENT ON TABLE public.cbr_users IS 'Usuarios';


--
-- Name: cbr_users_user_key_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.cbr_users_user_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cbr_users_user_key_seq OWNER TO cobranza;

--
-- Name: cbr_users_user_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.cbr_users_user_key_seq OWNED BY public.cbr_users.user_key;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    contact_firstname character varying(100),
    contact_lastname character varying(100),
    contact_type character varying(30) NOT NULL,
    contact_fullname character varying(255),
    contact_byname character varying(100) NOT NULL,
    contact_cdate date NOT NULL,
    contact_mdate date NOT NULL,
    contact_address text,
    contact_email text,
    contact_taxid text,
    contact_phone text,
    contact_comment text
);


ALTER TABLE public.contact OWNER TO cobranza;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_id_seq OWNER TO cobranza;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: contact_staging; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.contact_staging (
    id integer NOT NULL,
    rawname character varying(200),
    name character varying(200),
    db character varying(20),
    "user" character varying(30)
);


ALTER TABLE public.contact_staging OWNER TO cobranza;

--
-- Name: contact_staging_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.contact_staging_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_staging_id_seq OWNER TO cobranza;

--
-- Name: contact_staging_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.contact_staging_id_seq OWNED BY public.contact_staging.id;


--
-- Name: contact_user; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.contact_user (
    id integer NOT NULL,
    cu_contact_id integer NOT NULL,
    cu_id integer NOT NULL
);


ALTER TABLE public.contact_user OWNER TO cobranza;

--
-- Name: contact_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.contact_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_user_id_seq OWNER TO cobranza;

--
-- Name: contact_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.contact_user_id_seq OWNED BY public.contact_user.id;


--
-- Name: crm_user; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.crm_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254),
    role_key integer NOT NULL,
    avatar character varying(254)
);


ALTER TABLE public.crm_user OWNER TO cobranza;

--
-- Name: crm_user_groups; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.crm_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.crm_user_groups OWNER TO cobranza;

--
-- Name: crm_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.crm_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crm_user_groups_id_seq OWNER TO cobranza;

--
-- Name: crm_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.crm_user_groups_id_seq OWNED BY public.crm_user_groups.id;


--
-- Name: crm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.crm_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crm_user_id_seq OWNER TO cobranza;

--
-- Name: crm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.crm_user_id_seq OWNED BY public.crm_user.id;


--
-- Name: crm_user_user_permissions; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.crm_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.crm_user_user_permissions OWNER TO cobranza;

--
-- Name: crm_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.crm_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crm_user_user_permissions_id_seq OWNER TO cobranza;

--
-- Name: crm_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.crm_user_user_permissions_id_seq OWNED BY public.crm_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO cobranza;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO cobranza;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cobranza;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO cobranza;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cobranza;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cobranza
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO cobranza;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cobranza
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cobranza
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cobranza;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: cbr_bitacoras log_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_bitacoras ALTER COLUMN log_key SET DEFAULT nextval('public.cbr_bitacoras_log_key_seq'::regclass);


--
-- Name: cbr_edhistory ed_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_edhistory ALTER COLUMN ed_key SET DEFAULT nextval('public.cbr_edhistory_ed_key_seq'::regclass);


--
-- Name: cbr_facturas fac_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_facturas ALTER COLUMN fac_key SET DEFAULT nextval('public.cbr_facturas_fac_key_seq'::regclass);


--
-- Name: cbr_historialpagos his_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_historialpagos ALTER COLUMN his_key SET DEFAULT nextval('public.cbr_historialpagos_his_key_seq'::regclass);


--
-- Name: cbr_invoicefilelog ifl_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_invoicefilelog ALTER COLUMN ifl_key SET DEFAULT nextval('public.cbr_invoicefilelog_ifl_key_seq'::regclass);


--
-- Name: cbr_reminders rem_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_reminders ALTER COLUMN rem_key SET DEFAULT nextval('public.cbr_reminders_rem_key_seq'::regclass);


--
-- Name: cbr_roles role_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_roles ALTER COLUMN role_key SET DEFAULT nextval('public.cbr_roles_role_key_seq'::regclass);


--
-- Name: cbr_users user_key; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_users ALTER COLUMN user_key SET DEFAULT nextval('public.cbr_users_user_key_seq'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: contact_staging id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact_staging ALTER COLUMN id SET DEFAULT nextval('public.contact_staging_id_seq'::regclass);


--
-- Name: contact_user id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact_user ALTER COLUMN id SET DEFAULT nextval('public.contact_user_id_seq'::regclass);


--
-- Name: crm_user id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user ALTER COLUMN id SET DEFAULT nextval('public.crm_user_id_seq'::regclass);


--
-- Name: crm_user_groups id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_groups ALTER COLUMN id SET DEFAULT nextval('public.crm_user_groups_id_seq'::regclass);


--
-- Name: crm_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.crm_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: cbr_edhistory cbr_edhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_edhistory
    ADD CONSTRAINT cbr_edhistory_pkey PRIMARY KEY (ed_key);


--
-- Name: cbr_invoicefilelog cbr_invoicefilelog_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_invoicefilelog
    ADD CONSTRAINT cbr_invoicefilelog_pkey PRIMARY KEY (ifl_key);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: contact_staging contact_staging_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact_staging
    ADD CONSTRAINT contact_staging_pkey PRIMARY KEY (id);


--
-- Name: contact_user contact_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact_user
    ADD CONSTRAINT contact_user_pkey PRIMARY KEY (id);


--
-- Name: crm_user_groups crm_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_groups
    ADD CONSTRAINT crm_user_groups_pkey PRIMARY KEY (id);


--
-- Name: crm_user_groups crm_user_groups_user_id_group_id_56d4cc88_uniq; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_groups
    ADD CONSTRAINT crm_user_groups_user_id_group_id_56d4cc88_uniq UNIQUE (user_id, group_id);


--
-- Name: crm_user crm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user
    ADD CONSTRAINT crm_user_pkey PRIMARY KEY (id);


--
-- Name: crm_user_user_permissions crm_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_user_permissions
    ADD CONSTRAINT crm_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: crm_user_user_permissions crm_user_user_permissions_user_id_permission_id_72b1e4e1_uniq; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_user_permissions
    ADD CONSTRAINT crm_user_user_permissions_user_id_permission_id_72b1e4e1_uniq UNIQUE (user_id, permission_id);


--
-- Name: crm_user crm_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user
    ADD CONSTRAINT crm_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: cbr_facturas fac_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_facturas
    ADD CONSTRAINT fac_key PRIMARY KEY (fac_key);


--
-- Name: cbr_facturas fac_seriefolioemisor; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_facturas
    ADD CONSTRAINT fac_seriefolioemisor UNIQUE (fac_serie, fac_folio, fac_emisorrfc);


--
-- Name: cbr_historialpagos his_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_historialpagos
    ADD CONSTRAINT his_key PRIMARY KEY (his_key);


--
-- Name: cbr_bitacoras log_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_bitacoras
    ADD CONSTRAINT log_key PRIMARY KEY (log_key);


--
-- Name: cbr_reminders rem_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_reminders
    ADD CONSTRAINT rem_key PRIMARY KEY (rem_key);


--
-- Name: cbr_roles role_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_roles
    ADD CONSTRAINT role_key PRIMARY KEY (role_key);


--
-- Name: cbr_roles role_name; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_roles
    ADD CONSTRAINT role_name UNIQUE (role_name);


--
-- Name: cbr_users user_key; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_users
    ADD CONSTRAINT user_key PRIMARY KEY (user_key);


--
-- Name: cbr_users user_login; Type: CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_users
    ADD CONSTRAINT user_login UNIQUE (user_login);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: cbr_edhistory_ed_user_7053e99b; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX cbr_edhistory_ed_user_7053e99b ON public.cbr_edhistory USING btree (ed_user);


--
-- Name: cbr_edhistory_his_invoice_b9528bed; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX cbr_edhistory_his_invoice_b9528bed ON public.cbr_edhistory USING btree (his_invoice);


--
-- Name: cbr_facturas_fac_idclient_idx; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX cbr_facturas_fac_idclient_idx ON public.cbr_facturas USING btree (fac_idclient);


--
-- Name: cbr_invoicefilelog_ifl_invoice_e65f66ab; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX cbr_invoicefilelog_ifl_invoice_e65f66ab ON public.cbr_invoicefilelog USING btree (ifl_invoice);


--
-- Name: contact_user_cu_contact_id_bfe8287d; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX contact_user_cu_contact_id_bfe8287d ON public.contact_user USING btree (cu_contact_id);


--
-- Name: contact_user_cu_id_714b8a84; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX contact_user_cu_id_714b8a84 ON public.contact_user USING btree (cu_id);


--
-- Name: crm_user_groups_group_id_93d3047c; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX crm_user_groups_group_id_93d3047c ON public.crm_user_groups USING btree (group_id);


--
-- Name: crm_user_groups_user_id_5847c7a0; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX crm_user_groups_user_id_5847c7a0 ON public.crm_user_groups USING btree (user_id);


--
-- Name: crm_user_role_key_7fc0c152; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX crm_user_role_key_7fc0c152 ON public.crm_user USING btree (role_key);


--
-- Name: crm_user_user_permissions_permission_id_0f701f96; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX crm_user_user_permissions_permission_id_0f701f96 ON public.crm_user_user_permissions USING btree (permission_id);


--
-- Name: crm_user_user_permissions_user_id_047208b5; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX crm_user_user_permissions_user_id_047208b5 ON public.crm_user_user_permissions USING btree (user_id);


--
-- Name: crm_user_username_1ca997f7_like; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX crm_user_username_1ca997f7_like ON public.crm_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: idx_fac_cdate; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX idx_fac_cdate ON public.cbr_facturas USING btree (fac_cdate);


--
-- Name: idx_fac_fecha; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX idx_fac_fecha ON public.cbr_facturas USING btree (fac_fecha);


--
-- Name: idx_fac_fechapago; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX idx_fac_fechapago ON public.cbr_facturas USING btree (fac_fechapago);


--
-- Name: uuid_search; Type: INDEX; Schema: public; Owner: cobranza
--

CREATE INDEX uuid_search ON public.cbr_facturas USING btree (fac_uuid);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_crm_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_crm_user_id FOREIGN KEY (user_id) REFERENCES public.crm_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cbr_edhistory cbr_edhistory_ed_user_7053e99b_fk_crm_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_edhistory
    ADD CONSTRAINT cbr_edhistory_ed_user_7053e99b_fk_crm_user_id FOREIGN KEY (ed_user) REFERENCES public.crm_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cbr_edhistory cbr_edhistory_his_invoice_b9528bed_fk_cbr_facturas_fac_key; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_edhistory
    ADD CONSTRAINT cbr_edhistory_his_invoice_b9528bed_fk_cbr_facturas_fac_key FOREIGN KEY (his_invoice) REFERENCES public.cbr_facturas(fac_key) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cbr_invoicefilelog cbr_invoicefilelog_ifl_invoice_e65f66ab_fk_cbr_facturas_fac_key; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_invoicefilelog
    ADD CONSTRAINT cbr_invoicefilelog_ifl_invoice_e65f66ab_fk_cbr_facturas_fac_key FOREIGN KEY (ifl_invoice) REFERENCES public.cbr_facturas(fac_key) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_user contact_user_cu_contact_id_bfe8287d_fk_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact_user
    ADD CONSTRAINT contact_user_cu_contact_id_bfe8287d_fk_contact_id FOREIGN KEY (cu_contact_id) REFERENCES public.contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_user contact_user_cu_id_714b8a84_fk_crm_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.contact_user
    ADD CONSTRAINT contact_user_cu_id_714b8a84_fk_crm_user_id FOREIGN KEY (cu_id) REFERENCES public.crm_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_user_groups crm_user_groups_group_id_93d3047c_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_groups
    ADD CONSTRAINT crm_user_groups_group_id_93d3047c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_user_groups crm_user_groups_user_id_5847c7a0_fk_crm_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_groups
    ADD CONSTRAINT crm_user_groups_user_id_5847c7a0_fk_crm_user_id FOREIGN KEY (user_id) REFERENCES public.crm_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_user crm_user_role_key_7fc0c152_fk_cbr_roles_role_key; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user
    ADD CONSTRAINT crm_user_role_key_7fc0c152_fk_cbr_roles_role_key FOREIGN KEY (role_key) REFERENCES public.cbr_roles(role_key) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_user_user_permissions crm_user_user_permis_permission_id_0f701f96_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_user_permissions
    ADD CONSTRAINT crm_user_user_permis_permission_id_0f701f96_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_user_user_permissions crm_user_user_permissions_user_id_047208b5_fk_crm_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.crm_user_user_permissions
    ADD CONSTRAINT crm_user_user_permissions_user_id_047208b5_fk_crm_user_id FOREIGN KEY (user_id) REFERENCES public.crm_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_crm_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_crm_user_id FOREIGN KEY (user_id) REFERENCES public.crm_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cbr_historialpagos invoice; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_historialpagos
    ADD CONSTRAINT invoice FOREIGN KEY (his_invoice) REFERENCES public.cbr_facturas(fac_key) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cbr_bitacoras log_invoice; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_bitacoras
    ADD CONSTRAINT log_invoice FOREIGN KEY (log_invoice) REFERENCES public.cbr_facturas(fac_key);


--
-- Name: cbr_reminders rem_invoice; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_reminders
    ADD CONSTRAINT rem_invoice FOREIGN KEY (rem_invoice) REFERENCES public.cbr_facturas(fac_key);


--
-- Name: cbr_users user_rolename; Type: FK CONSTRAINT; Schema: public; Owner: cobranza
--

ALTER TABLE ONLY public.cbr_users
    ADD CONSTRAINT user_rolename FOREIGN KEY (user_rolename) REFERENCES public.cbr_roles(role_name) MATCH FULL;


--
-- PostgreSQL database dump complete
--

