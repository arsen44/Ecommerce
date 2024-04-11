--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE cakenuage;




--
-- Drop roles
--

DROP ROLE cakenuage;


--
-- Roles
--

CREATE ROLE cakenuage;
ALTER ROLE cakenuage WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5740be0251909dc91151449aad99edae2';






--
-- Databases
--

--
-- Database "template1" dump
--

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: cakenuage
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO cakenuage;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: cakenuage
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: cakenuage
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: cakenuage
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "cakenuage" dump
--

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
-- Name: cakenuage; Type: DATABASE; Schema: -; Owner: cakenuage
--

CREATE DATABASE cakenuage WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE cakenuage OWNER TO cakenuage;

\connect cakenuage

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO cakenuage;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO cakenuage;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO cakenuage;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO cakenuage;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cakenuage;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cakenuage;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cakenuage;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cakenuage;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cakenuage;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cakenuage;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO cakenuage;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO cakenuage;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO cakenuage;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO cakenuage;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO cakenuage;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO cakenuage;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO cakenuage;

--
-- Name: core_address; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_address (
    id bigint NOT NULL,
    street_address character varying(100) NOT NULL,
    apartment_address character varying(100) NOT NULL,
    apartment_floor character varying(10) NOT NULL,
    apartment_entrance character varying(10) NOT NULL,
    apartment_intercom character varying(10) NOT NULL,
    phone character varying(15) NOT NULL,
    "default" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_address OWNER TO cakenuage;

--
-- Name: core_address_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_address_id_seq OWNER TO cakenuage;

--
-- Name: core_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_address_id_seq OWNED BY public.core_address.id;


--
-- Name: core_carousel; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_carousel (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    mediacarousel character varying(100) NOT NULL
);


ALTER TABLE public.core_carousel OWNER TO cakenuage;

--
-- Name: core_carousel_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_carousel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_carousel_id_seq OWNER TO cakenuage;

--
-- Name: core_carousel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_carousel_id_seq OWNED BY public.core_carousel.id;


--
-- Name: core_category; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    mediacontent character varying(100) NOT NULL,
    seo_description text
);


ALTER TABLE public.core_category OWNER TO cakenuage;

--
-- Name: core_category_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_category_id_seq OWNER TO cakenuage;

--
-- Name: core_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_category_id_seq OWNED BY public.core_category.id;


--
-- Name: core_coupon; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_coupon (
    id bigint NOT NULL,
    code character varying(15) NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public.core_coupon OWNER TO cakenuage;

--
-- Name: core_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_coupon_id_seq OWNER TO cakenuage;

--
-- Name: core_coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_coupon_id_seq OWNED BY public.core_coupon.id;


--
-- Name: core_item; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_item (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    price double precision NOT NULL,
    "dateOfreadiness" integer,
    discount_price double precision,
    label character varying(10),
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    media character varying(100),
    media_type character varying(10),
    height integer,
    width integer,
    available boolean NOT NULL,
    category_id bigint NOT NULL,
    CONSTRAINT "core_item_dateOfreadiness_check" CHECK (("dateOfreadiness" >= 0))
);


ALTER TABLE public.core_item OWNER TO cakenuage;

--
-- Name: core_item_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_item_id_seq OWNER TO cakenuage;

--
-- Name: core_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_item_id_seq OWNED BY public.core_item.id;


--
-- Name: core_item_tags; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_item_tags (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.core_item_tags OWNER TO cakenuage;

--
-- Name: core_item_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_item_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_item_tags_id_seq OWNER TO cakenuage;

--
-- Name: core_item_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_item_tags_id_seq OWNED BY public.core_item_tags.id;


--
-- Name: core_itemvariation; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_itemvariation (
    id bigint NOT NULL,
    value character varying(50) NOT NULL,
    attachment character varying(100) NOT NULL,
    description text NOT NULL,
    variation_id bigint NOT NULL
);


ALTER TABLE public.core_itemvariation OWNER TO cakenuage;

--
-- Name: core_itemvariation_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_itemvariation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_itemvariation_id_seq OWNER TO cakenuage;

--
-- Name: core_itemvariation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_itemvariation_id_seq OWNED BY public.core_itemvariation.id;


--
-- Name: core_mediacontent; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_mediacontent (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    media_content character varying(100),
    media_content_type character varying(20) NOT NULL,
    height integer,
    width integer,
    item_id bigint NOT NULL
);


ALTER TABLE public.core_mediacontent OWNER TO cakenuage;

--
-- Name: core_mediacontent_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_mediacontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_mediacontent_id_seq OWNER TO cakenuage;

--
-- Name: core_mediacontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_mediacontent_id_seq OWNED BY public.core_mediacontent.id;


--
-- Name: core_order; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_order (
    id bigint NOT NULL,
    ref_code character varying(20),
    start_date timestamp with time zone NOT NULL,
    ordered_date timestamp with time zone NOT NULL,
    ordered boolean NOT NULL,
    being_delivered boolean NOT NULL,
    received boolean NOT NULL,
    refund_requested boolean NOT NULL,
    refund_granted boolean NOT NULL,
    delivery_date character varying(100) NOT NULL,
    delivery character varying(100) NOT NULL,
    coupon_id bigint,
    payment_id bigint,
    shipping_address_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public.core_order OWNER TO cakenuage;

--
-- Name: core_order_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_order_id_seq OWNER TO cakenuage;

--
-- Name: core_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_order_id_seq OWNED BY public.core_order.id;


--
-- Name: core_order_items; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    orderitem_id bigint NOT NULL
);


ALTER TABLE public.core_order_items OWNER TO cakenuage;

--
-- Name: core_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_order_items_id_seq OWNER TO cakenuage;

--
-- Name: core_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_order_items_id_seq OWNED BY public.core_order_items.id;


--
-- Name: core_orderitem; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_orderitem (
    id bigint NOT NULL,
    ordered boolean NOT NULL,
    quantity integer NOT NULL,
    item_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_orderitem OWNER TO cakenuage;

--
-- Name: core_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_orderitem_id_seq OWNER TO cakenuage;

--
-- Name: core_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_orderitem_id_seq OWNED BY public.core_orderitem.id;


--
-- Name: core_orderitem_item_variations; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_orderitem_item_variations (
    id bigint NOT NULL,
    orderitem_id bigint NOT NULL,
    itemvariation_id bigint NOT NULL
);


ALTER TABLE public.core_orderitem_item_variations OWNER TO cakenuage;

--
-- Name: core_orderitem_item_variations_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_orderitem_item_variations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_orderitem_item_variations_id_seq OWNER TO cakenuage;

--
-- Name: core_orderitem_item_variations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_orderitem_item_variations_id_seq OWNED BY public.core_orderitem_item_variations.id;


--
-- Name: core_paying; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_paying (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.core_paying OWNER TO cakenuage;

--
-- Name: core_paying_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_paying_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_paying_id_seq OWNER TO cakenuage;

--
-- Name: core_paying_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_paying_id_seq OWNED BY public.core_paying.id;


--
-- Name: core_refund; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_refund (
    id bigint NOT NULL,
    reason text NOT NULL,
    accepted boolean NOT NULL,
    email character varying(254) NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.core_refund OWNER TO cakenuage;

--
-- Name: core_refund_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_refund_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_refund_id_seq OWNER TO cakenuage;

--
-- Name: core_refund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_refund_id_seq OWNED BY public.core_refund.id;


--
-- Name: core_tag; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_tag (
    id bigint NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.core_tag OWNER TO cakenuage;

--
-- Name: core_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tag_id_seq OWNER TO cakenuage;

--
-- Name: core_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_tag_id_seq OWNED BY public.core_tag.id;


--
-- Name: core_userprofile; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_userprofile (
    id bigint NOT NULL,
    stripe_customer_id character varying(50),
    one_click_purchasing boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_userprofile OWNER TO cakenuage;

--
-- Name: core_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_userprofile_id_seq OWNER TO cakenuage;

--
-- Name: core_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_userprofile_id_seq OWNED BY public.core_userprofile.id;


--
-- Name: core_variation; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.core_variation (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    item_id bigint NOT NULL
);


ALTER TABLE public.core_variation OWNER TO cakenuage;

--
-- Name: core_variation_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.core_variation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_variation_id_seq OWNER TO cakenuage;

--
-- Name: core_variation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.core_variation_id_seq OWNED BY public.core_variation.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cakenuage
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


ALTER TABLE public.django_admin_log OWNER TO cakenuage;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cakenuage;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cakenuage;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cakenuage;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cakenuage;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cakenuage;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cakenuage;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO cakenuage;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO cakenuage;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO cakenuage;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO cakenuage;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO cakenuage;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO cakenuage;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO cakenuage;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO cakenuage;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: cakenuage
--

CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id bigint NOT NULL,
    app_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO cakenuage;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: cakenuage
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO cakenuage;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cakenuage
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_address id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_address ALTER COLUMN id SET DEFAULT nextval('public.core_address_id_seq'::regclass);


--
-- Name: core_carousel id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_carousel ALTER COLUMN id SET DEFAULT nextval('public.core_carousel_id_seq'::regclass);


--
-- Name: core_category id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_category ALTER COLUMN id SET DEFAULT nextval('public.core_category_id_seq'::regclass);


--
-- Name: core_coupon id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_coupon ALTER COLUMN id SET DEFAULT nextval('public.core_coupon_id_seq'::regclass);


--
-- Name: core_item id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item ALTER COLUMN id SET DEFAULT nextval('public.core_item_id_seq'::regclass);


--
-- Name: core_item_tags id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item_tags ALTER COLUMN id SET DEFAULT nextval('public.core_item_tags_id_seq'::regclass);


--
-- Name: core_itemvariation id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_itemvariation ALTER COLUMN id SET DEFAULT nextval('public.core_itemvariation_id_seq'::regclass);


--
-- Name: core_mediacontent id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_mediacontent ALTER COLUMN id SET DEFAULT nextval('public.core_mediacontent_id_seq'::regclass);


--
-- Name: core_order id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order ALTER COLUMN id SET DEFAULT nextval('public.core_order_id_seq'::regclass);


--
-- Name: core_order_items id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order_items ALTER COLUMN id SET DEFAULT nextval('public.core_order_items_id_seq'::regclass);


--
-- Name: core_orderitem id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem ALTER COLUMN id SET DEFAULT nextval('public.core_orderitem_id_seq'::regclass);


--
-- Name: core_orderitem_item_variations id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem_item_variations ALTER COLUMN id SET DEFAULT nextval('public.core_orderitem_item_variations_id_seq'::regclass);


--
-- Name: core_paying id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_paying ALTER COLUMN id SET DEFAULT nextval('public.core_paying_id_seq'::regclass);


--
-- Name: core_refund id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_refund ALTER COLUMN id SET DEFAULT nextval('public.core_refund_id_seq'::regclass);


--
-- Name: core_tag id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_tag ALTER COLUMN id SET DEFAULT nextval('public.core_tag_id_seq'::regclass);


--
-- Name: core_userprofile id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_userprofile ALTER COLUMN id SET DEFAULT nextval('public.core_userprofile_id_seq'::regclass);


--
-- Name: core_variation id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_variation ALTER COLUMN id SET DEFAULT nextval('public.core_variation_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
28	sh_oksana7@mail.ru	t	f	29
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application	10	add_socialapp
38	Can change social application	10	change_socialapp
39	Can delete social application	10	delete_socialapp
40	Can view social application	10	view_socialapp
41	Can add social application token	11	add_socialtoken
42	Can change social application token	11	change_socialtoken
43	Can delete social application token	11	delete_socialtoken
44	Can view social application token	11	view_socialtoken
45	Can add site	12	add_site
46	Can change site	12	change_site
47	Can delete site	12	delete_site
48	Can view site	12	view_site
49	Can add Token	13	add_token
50	Can change Token	13	change_token
51	Can delete Token	13	delete_token
52	Can view Token	13	view_token
53	Can add token	14	add_tokenproxy
54	Can change token	14	change_tokenproxy
55	Can delete token	14	delete_tokenproxy
56	Can view token	14	view_tokenproxy
57	Can add address	15	add_address
58	Can change address	15	change_address
59	Can delete address	15	delete_address
60	Can view address	15	view_address
61	Can add carousel	16	add_carousel
62	Can change carousel	16	change_carousel
63	Can delete carousel	16	delete_carousel
64	Can view carousel	16	view_carousel
65	Can add category	17	add_category
66	Can change category	17	change_category
67	Can delete category	17	delete_category
68	Can view category	17	view_category
69	Can add coupon	18	add_coupon
70	Can change coupon	18	change_coupon
71	Can delete coupon	18	delete_coupon
72	Can view coupon	18	view_coupon
73	Can add item	19	add_item
74	Can change item	19	change_item
75	Can delete item	19	delete_item
76	Can view item	19	view_item
77	Can add item variation	20	add_itemvariation
78	Can change item variation	20	change_itemvariation
79	Can delete item variation	20	delete_itemvariation
80	Can view item variation	20	view_itemvariation
81	Can add order	21	add_order
82	Can change order	21	change_order
83	Can delete order	21	delete_order
84	Can view order	21	view_order
85	Can add Tag	22	add_tag
86	Can change Tag	22	change_tag
87	Can delete Tag	22	delete_tag
88	Can view Tag	22	view_tag
89	Can add variation	23	add_variation
90	Can change variation	23	change_variation
91	Can delete variation	23	delete_variation
92	Can view variation	23	view_variation
93	Can add user profile	24	add_userprofile
94	Can change user profile	24	change_userprofile
95	Can delete user profile	24	delete_userprofile
96	Can view user profile	24	view_userprofile
97	Can add refund	25	add_refund
98	Can change refund	25	change_refund
99	Can delete refund	25	delete_refund
100	Can view refund	25	view_refund
101	Can add paying	26	add_paying
102	Can change paying	26	change_paying
103	Can delete paying	26	delete_paying
104	Can view paying	26	view_paying
105	Can add order item	27	add_orderitem
106	Can change order item	27	change_orderitem
107	Can delete order item	27	delete_orderitem
108	Can view order item	27	view_orderitem
109	Can add media content	28	add_mediacontent
110	Can change media content	28	change_mediacontent
111	Can delete media content	28	delete_mediacontent
112	Can view media content	28	view_mediacontent
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
9	pbkdf2_sha256$260000$TFY9IkcmyJ8shiS9cbykuF$rF10I43NLHML2qcA/gIXYFNzxIg9h3wis5TCxad/wSM=	2022-05-08 09:22:50.444913+00	f	Анна			novikovaan2006@yandex.ru	f	t	2022-05-06 10:58:35.176519+00
4	pbkdf2_sha256$260000$WnLcy07XVdD9yFiXFkSGCh$gFGebk/+EBaLJpAUGCgYqk2Qn8f4HeLV0pceN5Uc9dc=	2022-05-04 11:36:40.369925+00	f	EP2205			lpk777@mail.ru	f	t	2022-05-04 11:36:40.148403+00
5	pbkdf2_sha256$260000$WSc4WjEti9AMsFCrfxitR2$L0j2qB20oB4AyUpW98jeu/buuPWLXs6hBtqvfkjzCKk=	2022-05-04 16:07:51.215856+00	f	lpk777			app21vox@yandex.ru	f	t	2022-05-04 16:07:50.991845+00
6	pbkdf2_sha256$260000$0B4WswG99uZvbbptAFMwVY$au7DnlWPVQ1uCuwZAufXk4iqe4YPFBykEtwxsWY90qY=	2022-05-05 10:38:59.730764+00	f	Katika			katika040802@mail.ru	f	t	2022-05-05 10:38:59.508806+00
7	pbkdf2_sha256$260000$3NolPqnCdElQvpzASUK9lb$DklPoWg0nFS+/WNTCcpKjPrqyAaqIybWPGGkgmLEuxI=	2022-05-05 19:36:56.051171+00	f	Мария			m.shkirina@yandex.ru	f	t	2022-05-05 19:36:55.829889+00
8	pbkdf2_sha256$260000$lhIMqD8crc3b4K5cJ0Xp9K$Y/NyWB6Iy33YJ+PFJ6mEd0sUF+CAQSVyRZjzpdcIj9A=	2022-05-06 10:20:46.595021+00	f	Анастасия			nastyadanshina1110@gmail.com	f	t	2022-05-06 10:20:46.375347+00
11	pbkdf2_sha256$260000$az1rotBptA6mr5iIHpxAJm$5d8AYYFwgY+Xc2mevaeQAlhiIgPOFsJZUua3F10PeyI=	2022-05-14 14:45:29.808176+00	f	Гузаль			guzal_angel@mail.ru	f	t	2022-05-14 14:45:29.587987+00
10	pbkdf2_sha256$260000$NOs64D72Lp5Xp1gQg05AVg$gnYkMPZO6ouutfxx1P97ziE+CDaAUFx/R1baPrjDe4Q=	2022-05-06 20:23:39.412008+00	f	Нелли			nellia_nelli@mail.ru	f	t	2022-05-06 15:22:59.69452+00
2	pbkdf2_sha256$260000$hzUrIJkNPwy3W3Zys6h9It$ZmjtiSF2Pw08tkqZZLv4GmknPcx5MSio+C3uVnCFdN8=	2022-05-07 10:26:06.404157+00	f	Юлия			homyakovajulia@yandex.ru	f	t	2022-05-03 12:54:05.579502+00
12	pbkdf2_sha256$260000$ViIQuHw788CEYgfB5M65WN$VbgjYnuPbvOh4bvrLKje9K1f+yebFTmmcxr37GMLJDM=	2022-05-17 14:30:47.018393+00	f	Данила			danilazwerew@mail.ru	f	t	2022-05-17 14:30:46.795396+00
16	pbkdf2_sha256$260000$gOaLufUlrXIG5cDz3IVSMB$4PpWQFjsh/4h3ilx4ZrVDpjKHejFfAHmlHSEJ3srjQw=	2022-05-22 10:07:27.591477+00	f	test			test@mail.com	f	t	2022-05-22 10:06:30.66356+00
13	pbkdf2_sha256$260000$aZJbtRytrzipMP3NFFtnPf$k5YxmdBXv7aWiiWUi0zVbFHEe7+SytZX5uBqsclIDwU=	2022-05-20 15:00:00.627493+00	f	Sandania			alexshadowcoast@mail.ru	f	t	2022-05-20 15:00:00.403562+00
14	pbkdf2_sha256$260000$N8wCmXnArYemPyVZIOMRpP$6nVW0b8jUOp/Tvp6KQ5NV844QB51/x2xO2EJi/X95lE=	2022-05-20 15:00:48.399364+00	f	Влад			sd.vlad.97@mail.ru	f	t	2022-05-20 15:00:48.178063+00
15	pbkdf2_sha256$260000$RZl1LmT6HFQGVyljIduEbB$SHse3k9pA3hyDefG/gpZlpPQJrVunPwsrmt9AsZDKrw=	2022-05-21 10:56:49.393793+00	f	Надежда			sos17@rambler.ru	f	t	2022-05-21 10:56:49.171236+00
17	pbkdf2_sha256$260000$8qhVaXbQCMQffsGScp46db$oS30xIWCU3nh71eNdbxeUs/9llPbkZBc5bZ7nfN0Dps=	2022-05-24 15:32:10.90847+00	f	semenlarisa@mail.ru			semenlarisa@mail.ru	f	t	2022-05-24 15:32:10.678832+00
18	pbkdf2_sha256$260000$oRV5sNY3GoNmfMTqjk2BIN$32bdZVaM7Adgv3ILZaung7AnPEtAnTMLkh6LCeIQXuk=	2022-05-26 09:50:49.659415+00	f	Дмитрий			Dima-89_25@mail.ru	f	t	2022-05-26 09:50:49.435529+00
19	pbkdf2_sha256$260000$R8zpK05GrYRL1yGLgpOwSt$3FiT9wOstjOnEAooFU+KZ8xNQK0emdZq3cqTL7CMIJg=	2022-05-30 12:14:26.175647+00	f	Айка			Aisalkynaitymbetova@gmail.com	f	t	2022-05-30 05:44:35.812339+00
20	pbkdf2_sha256$260000$f2fCMbsZlAws6ChW99BKWI$0BJo+9SgLKIt5cqxx9onNznsTkpCulll17+L9UsRSjs=	2022-06-01 04:03:57.306662+00	f	Светлана			svetlyachok1977@bk.ru	f	t	2022-06-01 04:03:57.080395+00
21	pbkdf2_sha256$260000$Tz3Wn3Dnln8zbIsKsmkxjl$6dH+/DZTr1JkO3OANLA9QH8shxWFKyIi35MNCTPSRB0=	2022-06-14 07:54:01.869311+00	f	Miberius			pomazalex@mail.ru	f	t	2022-06-14 07:54:01.641629+00
22	pbkdf2_sha256$260000$qwRkMgwp9ixz7g2tKX4OZW$KvH0/b59QKo7fR62QnKYZF1TkryGiHp1+zgUGkjaXQ4=	2022-06-15 15:21:49.25665+00	f	Елизавета			flint-11@mail.ru	f	t	2022-06-15 15:21:49.030922+00
24	pbkdf2_sha256$260000$DcxsTYNs9onAAwIS50TcxT$UPyjwEEkmkSfSFDbkRd4YAq4mIkl40eTBeBJ2gUMQHQ=	2022-07-07 12:37:07.924017+00	f	Валерия			twilight20030696@gmail.com	f	t	2022-07-07 12:37:07.695609+00
23	pbkdf2_sha256$260000$2yG2mSIzcDll6oG9owzM1F$kYpFYolveWDbflT0qeqprDbmGteIST8Cb9Lo6JqR0/Q=	2022-06-29 11:50:45.76457+00	f	Татьяна			painter.tanya@yandex.ru	f	t	2022-06-28 21:17:16.346278+00
26	pbkdf2_sha256$260000$oqkeJ4HemWYhhI83Hv2Hzf$mSLUaopjDd6Q1RYv3b4Ey+fEZv8LxTT5qnDCi7WhP1o=	2022-07-15 08:33:29.712528+00	f	Morfey			998198@gmail.com	f	t	2022-07-15 08:33:29.479571+00
27	pbkdf2_sha256$260000$D8Mc2Y5LH0X13Tqs5QF09S$Rk06phR3QNbP1g0lIa2AWTNuT2+84jhfRpIuO5u7U0I=	2022-07-23 10:47:04.434876+00	f	Елена			OganisianElena2505@yandex.ru	f	t	2022-07-23 10:47:04.205715+00
28	pbkdf2_sha256$260000$COm1HDgKo3kkPIa89QkdRj$jA/RbUxPI4/FQCapXEJuYpTVX/ovq6ZH9hf5aUhXQrg=	2022-08-06 19:34:31.812665+00	f	test2			test@mail.ru	f	t	2022-07-29 13:16:54.343228+00
29	pbkdf2_sha256$260000$gzzatI90b49bTwjcp7uAjs$v3gi4wl+OPpkspegE48UBmPUzOzXIGaRu8VSZwxAyUc=	2022-08-23 18:05:43.430291+00	f	Оксана			sh_oksana7@mail.ru	f	t	2022-08-23 18:05:43.196546+00
1	pbkdf2_sha256$260000$WFKpgm7Fw3VrqMif8gw5f3$qCNscc6xHsSwNo0P2ugqY7KCpINlQevEsZNjqfaQXtk=	2022-10-31 15:52:54.646781+00	t	cakenuage				t	t	2022-04-30 16:02:19.391158+00
3	pbkdf2_sha256$260000$iDgeXDslBfTYJUt52mcdJV$9/jybxzjl1yijvp1lb4PuRicZgXjJoY9kK79RrJ4s+A=	2022-10-24 20:11:46.908742+00	f	Тест			Admin@mail.ru	f	t	2022-05-03 19:10:45.87821+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
59362a96557a750c3812440c98108c280107ab69	2022-04-30 16:04:42.980854+00	1
918e8f43e2f422ddbcd448ebb0f0c7e074dc3af1	2022-05-03 12:54:05.798443+00	2
96d5951eae7f27ad458ec9f1f150ad2530d3fbd5	2022-05-03 19:10:46.092454+00	3
b858c149f3d27f30ff7b8acd55ff35dc1a4ca365	2022-05-04 11:36:40.363824+00	4
074184f2772b40d04d96932fbf473f7044ff5e17	2022-05-04 16:07:51.209963+00	5
d015448a7e7a25ccf3d584af41fdd6de6f389bb5	2022-05-05 10:38:59.725122+00	6
ebf2bfac657092c28d85a839bcb4ad93558eacc6	2022-05-05 19:36:56.045528+00	7
dfb0c64706c004484fb366c35fbcaa37d23ae6eb	2022-05-06 10:20:46.590034+00	8
bb1c7034e7576ec856c1b110ceeee5e301ad7009	2022-05-06 10:58:35.392434+00	9
69577c7c44ca79036aa454ba6d47e0170311fea4	2022-05-06 15:22:59.91161+00	10
f1b2944979234659c7ba2876be6df5099be1e970	2022-05-14 14:45:29.802553+00	11
a0cef383e7ba00d9e4c29a1ed19d7993486e7c8a	2022-05-17 14:30:47.01185+00	12
b091af2ed4229bfb51846f6a87da680cebc121c8	2022-05-20 15:00:00.621435+00	13
e3d99bc218ca03feaf4346a1b3dbe888b60fb5ef	2022-05-20 15:00:48.393741+00	14
2a884c45fbde46690866f46bdff5607eed5cb5c0	2022-05-21 10:56:49.388368+00	15
d8af3377447c29625653a48921e29dcd46b5fbb5	2022-05-22 10:06:30.880834+00	16
29762dea6d96e618f34d1d9dd4880b7a276c7a01	2022-05-24 15:32:10.898962+00	17
0410a9a803693938e582ae0ea55084a29202ad58	2022-05-26 09:50:49.653625+00	18
7870b5568b7d53d6da142727cd0ddcb61fd9485f	2022-05-30 05:44:36.028765+00	19
463d5a913c84a0b8d7134091f28cfedc7f2a4700	2022-06-01 04:03:57.300702+00	20
b3c8fad0ca6ee4a72c8806d2a50731e82d84cc05	2022-06-14 07:54:01.862802+00	21
0634480fefffd3a2ad23b1f84f21be771cf52afc	2022-06-15 15:21:49.250752+00	22
4dbf4fa71ad818476772b82671a94a53165f1938	2022-06-28 21:17:16.566575+00	23
3caeb3d2489cc16da35500c316c426382c292858	2022-07-07 12:37:07.917128+00	24
766da5ed01ad351d5aadb217b34119ed4e12c418	2022-07-15 08:33:29.705646+00	26
3ce1712909dfb0efb8e6367fa8fd535e32e27df6	2022-07-23 10:47:04.427937+00	27
f48f7f08fcf4529731cc35a80d258f2aedda097f	2022-07-29 13:16:54.569703+00	28
c26f514b46046e1669e66c4c6e627614dac4e236	2022-08-23 18:05:43.417196+00	29
\.


--
-- Data for Name: core_address; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_address (id, street_address, apartment_address, apartment_floor, apartment_entrance, apartment_intercom, phone, "default", user_id) FROM stdin;
9	Фестивальная 11	251	9	7	223#5568	89919221025	t	19
5	Москва , ул дыбенко 22	23	8	1	122!12	7 926 167 12 93	t	1
10	Матроса Железняка 23к2	7	3	1	7В	(965) 411-57-85	t	21
\.


--
-- Data for Name: core_carousel; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_carousel (id, name, slug, mediacarousel) FROM stdin;
7	galaktika	galaktika	Astronaut.png
6	tophit	tophit	mishka.png
9	frozen	frozen	fronzen_carusel.png
11	christmas	new_year	christmas_carusel.png
12	unicorn	unicorn	unicorn.png
\.


--
-- Data for Name: core_category; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_category (id, name, slug, mediacontent, seo_description) FROM stdin;
1	готовые торты	gotovye-torty	gotovye-torty.png	\N
3	свадебные	svadebnye-torty	svadebnye-torty.png	\N
4	все для праздника	vse-dlya-prazdnika	vse-dlya-prazdnika.png	\N
5	Бенто торты	bento-torty	bento-torty.png	\N
6	galaxy	galaxy	galaxy_new.png	\N
2	Детские торты	detskie-torty	detskie-torty.png	Детские торты на заказ. Недорогие Детские торты  по фиксированной цене от 1999 руб. купить детский торт дешево. Промокоды акции и скидки в интернет магазине Cake Nuage.
7	Торты для мужчин	logo_torty-dlya-muzhchin	logo_torty-dlya-muzhchin.png	/
8	Ягодные торты	yagodnye-torty	yagodnye-torty.png	.
\.


--
-- Data for Name: core_coupon; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_coupon (id, code, amount) FROM stdin;
1	CAKE22	500
\.


--
-- Data for Name: core_item; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_item (id, title, price, "dateOfreadiness", discount_price, label, slug, description, media, media_type, height, width, available, category_id) FROM stdin;
130	Торт свадебный с бабочками	1999	2	\N	P	tort-svadebnyj-s-babochkami	цена за 1кг. (с учетом декора)	tort-svadebnyj-s-babochkami.jpg	image	1215	778	t	3
131	Торт Тирамису 0,8 кг.	650	0	\N	P	tort-tiramisu-08-kg	Воздушный бисквит , очень гармонично сочетается с горьковатым какао и сливок со вкусом тирамису .	tiramisu.jpg	image	1024	768	t	1
132	Торт Фортнайт	1999	2	\N	P	tort-fortnajt	цена за 1кг. (с учетом декора)	tort-fortnite.jpg	image	1603	1440	t	2
134	Торт Космос	1999	2	\N	P	tort-kosmos	цена за 1кг. (с учетом декора)	cosmos.mp4	video	1920	1080	t	2
133	Торт с мишкой	1999	2	\N	P	tort-s-mishkoj	цена за 1кг. (с учетом декора)	tort-s-mishkoj.jpg	image	1140	824	t	2
136	Торт Человек Паук с пряником	1999	2	\N	P	tort-chelovek-pauk-s-pryanikom	цена за 1кг. (с учетом декора)	celovek-payk.png	image	647	544	t	2
137	Торт Феррари (Ferrari)	1999	2	\N	P	tort-ferrari-ferrari	цена за 1кг. (с учетом декора)	tort-ferrari.jpg	image	1534	1440	t	2
138	Торт с короной №2	1999	2	\N	P	tort-s-koronoj-2	цена за 1кг. (с учетом декора)	tort-s-koronoj.jpg	image	1800	1440	t	2
139	Торт Чиаки Нанами	1999	2	\N	S	tort-chiaki-nanami	цена за 1кг. (с учетом декора)	tort-chiaki-nanami.jpg	image	1838	1440	t	2
135	Торт Галактика	1999	2	\N	P	tort-galaktika	цена за 1кг. (с учетом декора)	tort-galaktik.jpg	image	815	564	t	6
140	Торт Галактика с розовым оттенком	1999	2	\N	P	tort-galaktika-s-rozovym-ottenkom	цена за 1кг. (с учетом декора)	tort-galaktika-s-rozovym-ottenkom.jpg	image	827	564	t	6
141	Торт мраморный с цветами	1999	3	\N	P	tort-mramornyj-s-cvetami	цена за 1кг. (с учетом декора)	tort-mramornyj-s-cvetami.jpg	image	1265	766	t	3
142	Детский торт Единорог с Шариками	1999	2	\N	P	detskij-tort-edinorog-s-sharikami	цена за 1кг. (с учетом декора)	tort-edinorog-s-sharikami.jpg	image	1025	850	t	2
143	Детский торт для новорожденного без мастики	1999	2	\N	P	detskij-tort-dlya-novorozhdennogo-bez-mastiki	цена за 1кг. (с учетом декора)	detskij-tort-dlya-novorozhdennogo-bez-mastiki.jpg	image	1544	1142	t	2
144	Торты Супергерои «КОМИКСЫ»	1999	2	\N	P	torty-supergeroi-komiksy	цена за 1кг. (с учетом декора)	torty-supergeroi-komiksy.jpg	image	1531	1241	t	2
146	Торт с бабочками без мастики	1999	\N	\N	P	tort-s-babochkami-bez-mastiki	цена за 1кг. (с учетом декора)	tort-s-babochkami.jpg	image	1063	864	t	2
147	Торт с бабочками без мастики	1999	\N	\N	\N	tort-s-babochkami-bez-mastiki_1	цена за 1кг. (с учетом декора)	tort-rozovyj-s-babochkami.jpg	image	1000	594	t	2
148	Торт с гранатовой жеодой	1999	2	\N	P	tort-s-granatovoj-zheodoj	цена за 1кг. (с учетом декора)	tort-s-granatovoj-zheodoj.jpg	image	1800	1440	t	2
149	Ягодный торт 2 ярусный	1999	2	\N	P	yagodnyj-tort-2-yarusnyj	цена за 1кг. (с учетом декора)	yagodnyj-tort-2-yrusa.jpg	image	1406	1152	t	3
150	Детский торт без мастики с русалочкой	1999	2	\N	P	detskij-tort-bez-mastiki-s-rusalochkoj	цена за 1кг. (с учетом декора)	detskij-tort-bez-mastiki-s-rusalochkoj.jpg	image	1613	1135	t	2
151	Торт океан	1990	2	\N	P	tort-okean	цена за 1кг. (с учетом декора)	tort-okean.jpg	image	1799	1440	t	2
152	Детский торт Poopsie	1999	2	\N	P	detskij-tort-poopsie	цена за 1кг. (с учетом декора)	detskij-tort-poopsie.jpg	image	1756	1440	t	2
155	Детский торт Молния маквин	1999	2	\N	P	detskij-tort-molniya-makvin	цена за 1кг. (с учетом декора)	detskij-tort-molniya-makvin.jpg	image	1800	1440	t	2
156	Детский торт Наруто	1999	2	\N	S	detskij-tort-naruto	цена за 1кг. (с учетом декора)	detskij-tort-naruto.jpg	image	1800	1440	t	2
157	Детские торты на 1 годик	1999	2	\N	P	detskie-torty-na-1-godik	цена за 1кг. (с учетом декора)	detskie-torty-na-1-godik.jpg	image	1612	1440	t	2
153	Детский торт паровозик томас	1999	2	\N	P	detskij-tort-parovozik-tomas	цена за 1кг. (с учетом декора)	s-parovozikom.png	image	1583	1000	t	2
159	Торт с  разноцветной посыпкой	1800	2	\N	P	tort-s-raznocvetnoj-posypkoj	цена за 1кг. (с учетом декора)	tort-s-raznocvetnoj-posypkoj.jpg	image	1440	1594	t	2
145	Детский торт Холодное сердце	1999	2	\N	P	detskij-tort-holodnoe-serdce	цена за 1кг. (с учетом декора)	detskij-tort-holodnoe-serdce.jpg	image	1260	1008	t	2
129	Торт с кошками	1999	2	\N	P	tort-s-koshkami	цена за 1кг. (с учетом декора)	tort-s-koshechkami.jpg	image	1455	1289	t	2
158	Детский торт Эльза	2000	2	\N	P	detskij-tort-elza	цена за 1кг. (с учетом декора)	frozen.mp4	video	1920	1080	t	2
160	Холодное сердце снежинки	1800	2	\N	P	holodnoe-serdce-snezhinki	цена за 1кг. (с учетом декора)	holodnoe-serdce-snezhinki.jpg	image	827	564	t	2
161	Торт Мишка и звезды	1999	2	\N	P	tort-mishka-i-zvezdy	цена за 1кг. (с учетом декора)	tort-mishka-i-zvezdy.jpg	image	888	564	t	2
128	Торт Единорог 0.9	1000	2	\N	S	tort-edinorog-09	.	unicorn.jpg	image	1072	750	t	2
162	Голубой с мишкой и облаками	1999	2	\N	P	goluboj-s-mishkoj-i-oblakami	цена за 1кг. (с учетом декора)	goluboj-s-mishkoj-i-oblakami.jpg	image	904	563	t	2
163	Торт Космос и Астронавт	1999	2	\N	P	tort-kosmos-i-astronavt	цена за 1кг. (с учетом декора)	tort-kosmos-i-astronavt.jpg	image	809	564	t	2
164	Детские торт Принцесса	1999	2	\N	P	letskie-tort-princessa	цена за 1кг. (с учетом декора)	detskij-tort-princessa.jpg	image	2064	1291	t	2
165	Детский торт с леденцами и короной	1999	2	\N	P	detskij-tort-s-ledencami-i-koronoj	цена за 1кг. (с учетом декора)	tort-ledencami-i-koronoj.jpg	image	1800	1440	t	2
166	Торт с мишкой Тедди для мальчика	1999	2	\N	P	tort-s-mishkoj-teddi-dlya-malchika	цена за 1кг. (с учетом декора)	tort-s-mishkoj-teddi.jpg	image	1200	960	t	2
167	Торт с мишкой Тедди с разноцветными шарами	1999	3	\N	P	tort-s-mishkoj-teddi-s-raznocvetnymi-sharami	цена за 1кг. (с учетом декора)	tort-s-mishkoj-teddi-sharami.jpg	image	1310	1128	t	2
127	Торт Черный Лес 0.9кг.	650	0	\N	P	tort-chernyj-les-09kg	Классический торт из шоколадного бисквита, пропитанный сиропом, прослоен вишнёвой начинкой со взбитыми сливками. Торт украшен сливками, шоколадной посыпкой.	tort-chernyj-les-09kg.png	image	362	544	t	1
168	Торт с мишкой Тедди с шарами	1999	2	\N	P	tort-s-mishkoj-teddi-s-sharami	цена за 1кг. (с учетом декора)	tort-s-mishkoj-teddi-s-sharami.jpg	image	1352	1126	t	2
169	Торт  Кукла Lola с леденцами	1999	2	\N	P	tort-kukla-lola-s-ledencami	цена за 1кг. (с учетом декора)	tort-kukla-lola-s-ledencami.jpg	image	1067	867	t	2
172	Торт на юбилей маме без мастики	1890	2	\N	P	tort-na-yubilej-mame-bez-mastiki	цена за 1кг. (с учетом декора)	tort-s-podtekami-i-cvetami.jpg	image	1579	1158	t	3
180	Торт Эстерхази	2000	2	\N	P	tort-esterhazi	Состоит из пяти коржей, выпеченных из взбитой белковой массы с добавлением миндаля, сливочного масла и миндальной муки и соединённых между собой сливочным кремом .	tort-esterhazi.jpg	image	1400	932	t	1
183	Торт на 18 лет для девушки	1999	2	\N	P	tort-na-18-let-dlya-devushki	цена за 1кг. (с учетом декора)	tort-na-18-let-dlya-devushki.jpg	image	1221	1080	t	2
184	Торт машина Бентли	1999	2	\N	P	tort-mashina-bentli	цена за 1кг. (с учетом декора)	tort-mashina-bentli.jpg	image	1500	1088	t	2
174	Торт шиммер и шайн	1999	2	\N	S	tort-shimmer-i-shajn	цена за 1кг. (с учетом декора)	tort-shimmer-i-shajn.jpg	image	1579	1184	t	2
177	Торт с косметикой	1999	2	\N	P	tort-s-kosmetikoj	цена за 1кг. (с учетом декора)	tort-s-kosmetikoj.jpg	image	1237	1080	t	2
178	Торт морской парус	1999	2	\N	P	tort-morskoj-parus	цена за 1кг. (с учетом декора)	tort-morskoj-parus.jpg	image	1398	1152	t	2
154	Торт Елена - принцесса Авалора	1999	2	1500	P	tort-elena-princessa-avalora	цена за 1кг. (с учетом декора)	tort-elena-princessa-avalora.jpg	image	1613	1440	t	2
176	Cвадебный торт с розами	2500	4	\N	P	cvadebnyj-tort-s-rozami	цена за 1кг. (с учетом декора)	cvadebnyj-tort-s-rozami.jpg	image	1417	869	t	3
179	Торт на крестины с ангелом	1999	2	\N	P	tort-na-krestiny-s-angelom	цена за 1кг. (с учетом декора)	tort-na-krestiny-s-angelom.jpg	image	1362	1152	t	2
181	Торт машина гелендваген	1999	2	\N	P	tort-mashina-gelendvagen	цена за 1кг. (с учетом декора)	tort-mashina-gelendvagen.jpg	image	1400	1013	t	2
182	Торт Шанель	1999	2	\N	S	tort-shanel	цена за 1кг. (с учетом декора)	tort-shanel.jpg	image	1613	1210	t	2
185	Чизкейк Tворожно -Малиновый	2000	2	\N	P	chizkejk-tvorozhno-malinovyj	У торта потрясающий малиновый аромат. Вкус кисловато-сладкий. Творожная масса нежная и гладкая. Ягодки, встречающиеся в массе, освежают вкус.	chizkejk-tvorozhno-malinovyj-08-kg.png	image	657	438	t	1
186	Торт Красный Бархат	2000	2	\N	P	tort-krasnyj-barhat	Торт Красный бархат Cake Nuage - это удивительное сочетание сочных и бархатистых коржей с нежным и гладким сливочным кремом.	tort-krasnyj-barhat.jpg	image	1920	1080	t	1
187	Детский торт Фиксики	1999	2	\N	P	detskij-tort-fiksiki	цена за 1кг. (с учетом декора	detskij-tort-fiksiki.jpg	image	1580	1336	t	2
188	Торт на годик девочке с короной	1999	2	\N	P	tort-na-godik-devochke-s-koronoj	цена за 1кг. (с учетом декора)	tort-na-godik-devochke-s-koronoj.jpg	image	1252	1000	t	2
171	Детский торт единорог с леденцами	1999	2	\N	P	detskij-tort-edinorog-s-ledencami	цена за 1кг. (с учетом декора)	detskij-tort-edinorog-s-ledencami.jpg	image	632	525	t	2
170	Детские торт единорог с шариками	1999	2	\N	P	tort-edinorog-s-sharikami	цена за 1кг. (с учетом декора)	tort-edinorog-s-sharikami.jpg	image	1025	800	t	2
173	Торт для девочки Эльза	1990	2	\N	P	tort-dlya-devochki-elza	цена за 1кг. (с учетом декора)	tort-dlya-devochki-elza.jpg	image	632	555	t	2
189	Торт с короной в золотом цвете	1999	2	\N	P	tort-s-koronoj-v-zolotom-cvete	цена за 1кг. (с учетом декора)	tort-s-koronoj-black.jpg	image	1300	1122	t	2
203	Торт с Единорог без мастики	1999	2	1500	P	tort-s-edinorog-bez-mastiki	цена за 1кг. (с учетом декора)	tort-s-edinorog-bez-mastiki.jpg	image	1303	1042	t	2
193	Детский торты на день рождения 1 годик	1999	2	\N	P	detskij-torty-na-den-rozhdeniya-1-godik	цена за 1кг. (с учетом декора)	detskij-torty-na-den-rozhdeniya-1-godik.jpg	image	1614	1440	t	2
194	Торт для мужчины с потеками	1999	2	\N	S	tort-dlya-muzhchiny-s-potekami	цена за 1кг. (с учетом декора)	tort-dlya-muzhchiny-s-potekami.jpg	image	1640	1440	t	7
195	Торт для мужчины с деньгами	1999	2	\N	P	tort-dlya-muzhchiny-s-dengami	цена за 1кг. (с учетом декора)	tort-dlya-muzhchiny-s-dengami.jpg	image	1600	1377	t	7
196	Ягодный торт Фруктовое счастье	2200	2	\N	P	yagodnyj-tort-fruktovoe-schaste	цена за 1кг. (с учетом декора)	yagodnyj-tort-fruktovoe-schaste.jpg	image	1440	1440	t	8
192	Елка из имбирных пряников	3000	4	\N	P	elka-iz-imbirnyh-pryanikov	/	elka-iz-imbirnyh-pryanikov.jpg	image	1200	583	t	1
191	Пряничный домик Зима, 800 г	6000	4	\N	P	pryanichnyj-domik-zima-800-g	/	pryanichnyj-domik-zima-800-g.jpg	image	1600	1220	t	1
175	Новогодний торт Новогодняя Елка	1999	2	\N	S	novogodnij-tort-novogodnyaya-elka	цена за 1кг. (с учетом декора)	novogodnij-tort-novogodnyaya-elka.jpg	image	1496	950	t	4
190	Торт рафаэлло с малиной	1000	2	\N	P	tort-rafaello-s-malinoj	Вес - 800 гр.	tort-rafaello-s-malinoj.png	image	1350	1080	t	1
198	Новогодний торт елкой с подтеками	1699	2	\N	P	novogodnij-tort-elkoj-s-podtekami	цена за 1кг. (с учетом декора)	novogodnij-tort-elkoj-s-podtekami.jpg	image	705	564	t	4
199	Капкейки в виде елки	99	2	\N	P	kapkejki-v-vide-elki	Цена 99 руб. за 1 шт.	kapkejki-v-vide-elki.jpg	image	846	564	t	4
201	Торт Единорог 2 яруса	1999	2	\N	P	tort-edinorog-2-yarusa	цена за 1кг. (с учетом декора)	tort-edinorog-2-yarusa.jpg	image	901	564	t	2
200	Новогодний торт с елкой(фиолетового цвета)	1999	2	\N	P	novogodnij-tort-s-elkojfioletovogo-cveta	цена за 1кг. (с учетом декора)	novogodnij-tort-s-elkojfioletovogo-cveta.jpg	image	1040	1040	t	4
202	Торт Единорог с косичкой	1999	2	\N	P	tort-edinorog-s-kosichkoj	цена за 1кг. (с учетом декора)	tort-edinorog-s-kosichkoj.jpg	image	1265	1173	t	2
\.


--
-- Data for Name: core_item_tags; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_item_tags (id, item_id, tag_id) FROM stdin;
1	133	1
2	134	2
3	135	2
4	140	2
5	143	1
7	158	5
8	145	5
9	160	5
10	161	1
11	162	1
13	163	2
14	164	5
15	166	1
16	167	1
17	168	1
19	173	5
25	192	7
26	191	7
28	175	7
29	190	7
30	198	7
31	199	7
32	200	7
33	171	8
34	170	8
35	128	8
36	201	8
37	202	8
38	203	8
\.


--
-- Data for Name: core_itemvariation; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_itemvariation (id, value, attachment, description, variation_id) FROM stdin;
\.


--
-- Data for Name: core_mediacontent; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_mediacontent (id, name, media_content, media_content_type, height, width, item_id) FROM stdin;
\.


--
-- Data for Name: core_order; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_order (id, ref_code, start_date, ordered_date, ordered, being_delivered, received, refund_requested, refund_granted, delivery_date, delivery, coupon_id, payment_id, shipping_address_id, user_id) FROM stdin;
\.


--
-- Data for Name: core_order_items; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_order_items (id, order_id, orderitem_id) FROM stdin;
\.


--
-- Data for Name: core_orderitem; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_orderitem (id, ordered, quantity, item_id, user_id) FROM stdin;
133	t	1	173	1
134	t	3	203	1
135	f	1	202	1
\.


--
-- Data for Name: core_orderitem_item_variations; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_orderitem_item_variations (id, orderitem_id, itemvariation_id) FROM stdin;
\.


--
-- Data for Name: core_paying; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_paying (id, amount, "timestamp", user_id) FROM stdin;
1	1350	2022-05-31 17:36:10.041371+00	19
2	1799	2022-06-14 09:07:16.071146+00	21
\.


--
-- Data for Name: core_refund; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_refund (id, reason, accepted, email, order_id) FROM stdin;
\.


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_tag (id, title) FROM stdin;
1	tophit
2	galaktika
5	frozen
7	new_year
8	unicorn
\.


--
-- Data for Name: core_userprofile; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_userprofile (id, stripe_customer_id, one_click_purchasing, user_id) FROM stdin;
1	\N	f	1
2	\N	f	2
3	\N	f	3
4	\N	f	4
5	\N	f	5
6	\N	f	6
7	\N	f	7
8	\N	f	8
9	\N	f	9
10	\N	f	10
11	\N	f	11
12	\N	f	12
13	\N	f	13
14	\N	f	14
15	\N	f	15
16	\N	f	16
17	\N	f	17
18	\N	f	18
19	\N	f	19
20	\N	f	20
21	\N	f	21
22	\N	f	22
23	\N	f	23
24	\N	f	24
26	\N	f	26
27	\N	f	27
28	\N	f	28
29	\N	f	29
\.


--
-- Data for Name: core_variation; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.core_variation (id, name, item_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-04-30 16:15:28.710157+00	26	as	1	[{"added": {}}]	17	1
2	2022-04-30 16:20:47.001816+00	41	Торт фисташковый 1,1 кг	1	[{"added": {}}]	17	1
3	2022-04-30 16:25:17.392672+00	26	Торт Йогуртовый 0,8 кг	2	[{"changed": {"fields": ["Title", "Price", "DateOfreadiness", "Slug", "Description", "Height", "Width"]}}]	17	1
4	2022-04-30 16:25:28.636077+00	41	Торт Фисташковый 1,1 кг	2	[{"changed": {"fields": ["Title"]}}]	17	1
5	2022-04-30 16:26:56.342634+00	26	Торт Йогуртовый 0.8 кг	2	[{"changed": {"fields": ["Title"]}}]	17	1
6	2022-04-30 16:28:44.907+00	43	тест	1	[{"added": {}}]	17	1
7	2022-04-30 16:28:52.509466+00	43	тест	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
8	2022-04-30 16:28:57.626845+00	43	тест	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
9	2022-04-30 16:31:36.939269+00	41	Торт Фисташковый 1,1 кг	2	[]	17	1
10	2022-04-30 16:31:42.3149+00	41	Торт Фисташковый 1,1 кг	2	[]	17	1
11	2022-04-30 16:31:45.556636+00	26	Торт Йогуртовый 0.8 кг	2	[]	17	1
12	2022-04-30 16:36:04.07416+00	43	Торт "Сникерс" 0,9 кг.	2	[{"changed": {"fields": ["Title", "Price", "DateOfreadiness", "Slug", "Media", "Media type", "Height", "Width"]}}]	17	1
13	2022-04-30 16:36:17.923077+00	41	Торт Фисташковый 1,1 кг	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
14	2022-04-30 16:39:27.449332+00	47	Торт "Красный Бархат" 1 кг.	1	[{"added": {}}]	17	1
15	2022-04-30 16:45:29.377295+00	47	Торт Красный Бархат 1 кг.	2	[{"changed": {"fields": ["Title", "Description"]}}]	17	1
16	2022-04-30 16:46:07.444483+00	43	Торт "Сникерс" 0,9 кг.	2	[{"changed": {"fields": ["Description"]}}]	17	1
17	2022-04-30 16:48:08.686857+00	26	Торт Йогуртовый 0.8 кг	2	[{"changed": {"fields": ["Media"]}}]	17	1
18	2022-04-30 16:52:47.812054+00	48	Торт Черный Лес 0.9кг.	1	[{"added": {}}]	17	1
19	2022-04-30 17:20:43.453273+00	48	Торт Черный Лес 0.9кг.	2	[{"changed": {"fields": ["Description"]}}]	17	1
20	2022-05-01 06:03:54.84623+00	49	Торт на юбилей	1	[{"added": {}}]	17	1
21	2022-05-01 06:06:15.381688+00	50	Торт с кошками	1	[{"added": {}}]	17	1
22	2022-05-01 06:07:49.710433+00	51	Торт Феррари	1	[{"added": {}}]	17	1
23	2022-05-01 06:09:19.524237+00	52	Торт с короной	1	[{"added": {}}]	17	1
24	2022-05-01 06:10:52.279297+00	53	Торт с короной №2	1	[{"added": {}}]	17	1
25	2022-05-01 06:14:09.744433+00	54	Торт с гранатовой жеодой	1	[{"added": {}}]	17	1
26	2022-05-01 06:16:37.442943+00	55	Торт для новорожденного	1	[{"added": {}}]	17	1
27	2022-05-01 06:18:19.156175+00	56	Торт Елена - принцесса Авалора	1	[{"added": {}}]	17	1
28	2022-05-01 06:20:45.879695+00	57	Торт мраморный с цветами	1	[{"added": {}}]	17	1
29	2022-05-01 06:22:26.268321+00	58	Торт Чиаки Нанами	1	[{"added": {}}]	17	1
30	2022-05-01 06:24:26.080644+00	59	Торт Рафаэлло малиновая	1	[{"added": {}}]	17	1
31	2022-05-01 06:24:38.715919+00	59	Торт Рафаэлло малиновая	2	[{"changed": {"fields": ["Description"]}}]	17	1
32	2022-05-01 06:27:53.172753+00	60	Торт шоколадный велюр	1	[{"added": {}}]	17	1
33	2022-05-01 06:29:05.784477+00	61	Торт с бабочками без мастики	1	[{"added": {}}]	17	1
34	2022-05-01 06:36:38.359774+00	61	Торт с бабочками без мастики	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
35	2022-05-01 07:49:19.844839+00	62	Торт Космос 700 гр.	1	[{"added": {}}]	17	1
36	2022-05-01 07:53:29.382664+00	63	Чизкейк Tворожно -Малиновый 0,8 кг.	1	[{"added": {}}]	17	1
37	2022-05-01 07:54:34.532602+00	64	Торт Человек Паук с пряником	1	[{"added": {}}]	17	1
38	2022-05-01 07:57:25.422714+00	65	Торт Тирамису 0,8 кг.	1	[{"added": {}}]	17	1
39	2022-05-01 07:58:58.148099+00	66	Торт Шиммер и Шайн	1	[{"added": {}}]	17	1
40	2022-05-01 08:08:57.154863+00	67	Торт Единорог 0.9 кг Cake Nuage	1	[{"added": {}}]	17	1
41	2022-05-01 08:09:40.744457+00	67	Торт Единорог 0.9 кг Cake Nuage	2	[{"changed": {"fields": ["Media"]}}]	17	1
42	2022-05-01 08:15:53.61592+00	1	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
43	2022-05-01 08:16:59.393791+00	2	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
44	2022-05-01 08:18:06.888102+00	3	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
45	2022-05-01 08:19:10.626615+00	4	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
46	2022-05-01 13:39:49.135269+00	68	Торт свадебный с бабочками	1	[{"added": {}}]	17	1
47	2022-05-01 13:42:04.231008+00	69	Торт с мишкой	1	[{"added": {}}]	17	1
48	2022-05-01 13:47:25.223624+00	70	Торт с леденцами	1	[{"added": {}}]	17	1
49	2022-05-01 13:50:22.151618+00	71	Торт Эстерхази 0,9 кг.	1	[{"added": {}}]	17	1
50	2022-05-01 14:02:45.071389+00	3	cakenuage	3		19	1
51	2022-05-01 14:02:45.073899+00	2	cakenuage	3		19	1
52	2022-05-01 14:02:45.075499+00	1	cakenuage	3		19	1
53	2022-05-01 14:02:52.54581+00	2	1 of Торт Красный Бархат 1 кг.	3		24	1
54	2022-05-01 14:02:52.548068+00	1	1 of Торт "Сникерс" 0,9 кг.	3		24	1
55	2022-05-01 14:03:05.090909+00	47	Торт Красный Бархат 1 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
56	2022-05-01 14:46:58.248976+00	47	Торт Красный Бархат 1 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
57	2022-05-01 16:35:32.779768+00	71	Торт Эстерхази 0,9 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
58	2022-05-01 16:52:55.72801+00	41	Торт Фисташковый 1,1 кг	2	[{"changed": {"fields": ["Price", "Discount price", "Description"]}}]	17	1
59	2022-05-02 07:40:30.650164+00	72	Торт ягодный с подтеками	1	[{"added": {}}]	17	1
60	2022-05-02 07:54:31.837912+00	73	Торт с бабочками без мастики	1	[{"added": {}}]	17	1
61	2022-05-02 07:59:45.684857+00	5	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}]	20	1
62	2022-05-02 08:00:39.648256+00	6	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
63	2022-05-02 08:00:50.588028+00	5	Начинки	2	[{"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
64	2022-05-02 08:01:36.206096+00	7	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
65	2022-05-02 08:02:19.615105+00	8	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
66	2022-05-02 08:03:09.534084+00	9	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
67	2022-05-02 08:05:45.820255+00	10	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
68	2022-05-02 08:07:07.335341+00	61	Торт с бабочками без мастики	2	[{"changed": {"fields": ["Price"]}}]	17	1
69	2022-05-02 13:27:28.241727+00	74	Торт Фортнайт	1	[{"added": {}}]	17	1
70	2022-05-02 13:28:22.551755+00	11	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
71	2022-05-02 13:34:29.516546+00	75	Детский торт Единорог с Шариками	1	[{"added": {}}]	17	1
72	2022-05-02 13:35:34.969527+00	12	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
73	2022-05-02 14:01:46.805278+00	76	Детский торт для новорожденного без мастики	1	[{"added": {}}]	17	1
74	2022-05-02 14:02:40.692787+00	13	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
188	2022-05-22 10:00:03.008478+00	28	cakenuage	3		19	1
75	2022-05-02 14:18:58.299441+00	14	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
76	2022-05-02 14:46:08.720622+00	77	Торт БМВ	1	[{"added": {}}]	17	1
77	2022-05-02 14:47:10.118608+00	15	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
78	2022-05-02 17:06:51.286433+00	4	cakenuage	3		19	1
79	2022-05-03 18:08:06.108133+00	78	Тарталетка малиновая 120г.(9шт) Cake Nuage	1	[{"added": {}}]	17	1
80	2022-05-03 18:09:53.159754+00	43	Торт "Сникерс" 0,9 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
81	2022-05-03 18:15:24.378602+00	43	Торт "Сникерс" 0,9 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
82	2022-05-03 18:17:07.775358+00	26	Торт Йогуртовый 0.8 кг	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
83	2022-05-04 07:31:39.499253+00	16	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
84	2022-05-04 07:33:16.658396+00	17	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}]	20	1
85	2022-05-04 07:34:51.623978+00	18	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
86	2022-05-04 07:35:53.303834+00	19	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
87	2022-05-04 10:25:50.093443+00	79	Торт Шоколадно-Вишневый 0.8кг	1	[{"added": {}}]	17	1
88	2022-05-04 10:26:21.046387+00	79	Торт Шоколадно-Вишневый 0.8кг	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
89	2022-05-04 10:26:29.101389+00	78	Тарталетка малиновая 120г.(9шт) Cake Nuage	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
90	2022-05-04 10:31:41.275942+00	80	Торт Хелло Китти	1	[{"added": {}}]	17	1
91	2022-05-04 10:33:37.377676+00	20	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
92	2022-05-04 10:48:28.764826+00	81	Торт на юбилей	1	[{"added": {}}]	17	1
93	2022-05-04 16:14:28.132296+00	10	cakenuage	3		19	1
94	2022-05-05 06:52:30.618993+00	14	1 of Торт Фисташковый 1,1 кг	3		24	1
95	2022-05-05 06:52:46.460039+00	11	1 of Торт Красный Бархат 1 кг.	3		24	1
96	2022-05-05 06:52:51.430166+00	10	2 of Торт Йогуртовый 0.8 кг	3		24	1
97	2022-05-05 06:53:05.403338+00	7	1 of Торт Красный Бархат 1 кг.	3		24	1
98	2022-05-05 11:29:32.661127+00	15	2 of Торт с короной №2	3		24	1
99	2022-05-05 11:34:35.205483+00	80	Торт Хелло Китти	2	[{"changed": {"fields": ["Height", "Width"]}}]	17	1
100	2022-05-05 15:22:29.655327+00	8	EP2205	3		19	1
101	2022-05-05 15:22:47.373808+00	9	EP2205	2	[{"changed": {"fields": ["Received"]}}]	19	1
102	2022-05-05 15:23:04.81165+00	7	Тест	3		19	1
103	2022-05-05 15:23:04.814643+00	6	cakenuage	3		19	1
104	2022-05-05 17:18:37.356783+00	82	Ягодный торт	1	[{"added": {}}]	17	1
105	2022-05-05 17:19:57.21825+00	21	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
106	2022-05-05 19:00:34.635099+00	83	Торт с мишкой Тедди	1	[{"added": {}}]	17	1
155	2022-05-16 06:27:44.724637+00	68	Торт свадебный с бабочками	2	[{"changed": {"fields": ["Description"]}}]	17	1
192	2022-05-22 10:01:29.317373+00	4	Тест	3		15	1
107	2022-05-05 19:01:30.041362+00	22	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
108	2022-05-06 08:48:14.828369+00	84	Торт на юбилей маме без мастики	1	[{"added": {}}]	17	1
109	2022-05-06 08:49:28.697782+00	23	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
110	2022-05-06 13:04:31.450615+00	14	cakenuage	3		19	1
111	2022-05-06 13:54:31.684303+00	16	cakenuage	3		19	1
112	2022-05-06 15:00:22.95812+00	17	cakenuage	3		19	1
113	2022-05-06 15:30:23.351316+00	18	Тест	3		19	1
114	2022-05-06 15:30:33.377947+00	27	1 of Торт Красный Бархат 1 кг.	3		24	1
115	2022-05-06 15:30:47.172849+00	26	1 of Торт Фисташковый 1,1 кг	3		24	1
116	2022-05-06 15:31:04.585814+00	24	1 of Торт Красный Бархат 1 кг.	3		24	1
117	2022-05-06 15:31:47.784173+00	21	1 of Торт Фисташковый 1,1 кг	3		24	1
118	2022-05-06 17:47:29.370746+00	5	Юлия	2	[{"changed": {"fields": ["Received"]}}]	19	1
119	2022-05-07 16:47:10.907279+00	85	Единорог с косичкой	1	[{"added": {}}]	17	1
120	2022-05-07 16:48:26.171791+00	85	Единорог с косичкой	2	[{"changed": {"fields": ["Height", "Width"]}}]	17	1
121	2022-05-07 16:48:57.790752+00	85	Единорог с косичкой	2	[]	17	1
122	2022-05-07 17:04:11.84552+00	85	Единорог с косичкой	2	[]	17	1
123	2022-05-07 17:15:33.838894+00	24	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
124	2022-05-08 14:58:46.852686+00	19	Анна	2	[{"changed": {"fields": ["Received"]}}]	19	1
125	2022-05-08 15:15:34.612521+00	72	Торт ягодный с подтеками	2	[{"changed": {"fields": ["Price"]}}]	17	1
126	2022-05-08 15:42:58.39029+00	86	Торт с подтеками	1	[{"added": {}}]	17	1
127	2022-05-08 15:43:58.533833+00	25	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
128	2022-05-08 16:37:37.19248+00	15	Анна	3		19	1
129	2022-05-08 16:37:37.194792+00	13	Анастасия	3		19	1
130	2022-05-08 16:37:55.409466+00	23	1 of Торт ягодный с подтеками	3		24	1
131	2022-05-08 16:38:00.491355+00	22	1 of Чизкейк Tворожно -Малиновый 0,8 кг.	3		24	1
132	2022-05-08 16:38:07.264788+00	20	1 of Торт Рафаэлло малиновая	3		24	1
133	2022-05-08 19:23:08.949095+00	20	Тест	3		19	1
134	2022-05-09 05:50:46.945806+00	21	Тест	3		19	1
135	2022-05-10 07:09:30.37798+00	47	Торт Красный Бархат 1 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
136	2022-05-10 07:09:44.890154+00	26	Торт Йогуртовый 0.8 кг	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
137	2022-05-10 07:10:00.495855+00	41	Торт Фисташковый 1,1 кг	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
138	2022-05-10 07:10:22.368734+00	71	Торт Эстерхази 0,9 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
139	2022-05-11 10:22:55.261606+00	86	Торт с подтеками	2	[{"changed": {"fields": ["Description"]}}]	17	1
140	2022-05-16 06:25:32.572738+00	55	Торт для новорожденного	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
141	2022-05-16 06:26:03.799486+00	85	Единорог с косичкой	2	[{"changed": {"fields": ["Description"]}}]	17	1
142	2022-05-16 06:26:11.022391+00	84	Торт на юбилей маме без мастики	2	[{"changed": {"fields": ["Description"]}}]	17	1
143	2022-05-16 06:26:17.861086+00	83	Торт с мишкой Тедди	2	[{"changed": {"fields": ["Description"]}}]	17	1
144	2022-05-16 06:26:25.16509+00	82	Ягодный торт	2	[{"changed": {"fields": ["Description"]}}]	17	1
145	2022-05-16 06:26:35.109643+00	77	Торт БМВ	2	[{"changed": {"fields": ["Description"]}}]	17	1
146	2022-05-16 06:26:43.154598+00	76	Детский торт для новорожденного без мастики	2	[{"changed": {"fields": ["Description"]}}]	17	1
147	2022-05-16 06:26:50.759638+00	75	Детский торт Единорог с Шариками	2	[{"changed": {"fields": ["Description"]}}]	17	1
148	2022-05-16 06:26:58.737472+00	74	Торт Фортнайт	2	[{"changed": {"fields": ["Description"]}}]	17	1
149	2022-05-16 06:27:05.828546+00	70	Торт с леденцами	2	[{"changed": {"fields": ["Description"]}}]	17	1
150	2022-05-16 06:27:11.975581+00	81	Торт на юбилей	2	[{"changed": {"fields": ["Description"]}}]	17	1
151	2022-05-16 06:27:18.970539+00	80	Торт Хелло Китти	2	[{"changed": {"fields": ["Description"]}}]	17	1
152	2022-05-16 06:27:26.299106+00	69	Торт с мишкой	2	[{"changed": {"fields": ["Description"]}}]	17	1
153	2022-05-16 06:27:32.65133+00	73	Торт с бабочками без мастики	2	[{"changed": {"fields": ["Description"]}}]	17	1
154	2022-05-16 06:27:38.665649+00	72	Торт ягодный с подтеками	2	[{"changed": {"fields": ["Description"]}}]	17	1
156	2022-05-16 06:27:51.49627+00	66	Торт Шиммер и Шайн	2	[{"changed": {"fields": ["Description"]}}]	17	1
157	2022-05-16 06:27:58.176851+00	64	Торт Человек Паук с пряником	2	[{"changed": {"fields": ["Description"]}}]	17	1
158	2022-05-16 06:28:07.739413+00	61	Торт с бабочками без мастики	2	[{"changed": {"fields": ["Description"]}}]	17	1
159	2022-05-16 06:28:15.686739+00	50	Торт с кошками	2	[{"changed": {"fields": ["Description"]}}]	17	1
160	2022-05-16 06:28:28.07785+00	51	Торт Феррари	2	[{"changed": {"fields": ["Description"]}}]	17	1
161	2022-05-16 06:28:38.584607+00	26	Торт Йогуртовый 0.8 кг	2	[{"changed": {"fields": ["Description"]}}]	17	1
162	2022-05-16 06:28:44.742098+00	49	Торт на юбилей	2	[{"changed": {"fields": ["Description"]}}]	17	1
163	2022-05-16 06:28:50.615209+00	54	Торт с гранатовой жеодой	2	[{"changed": {"fields": ["Description"]}}]	17	1
164	2022-05-16 06:28:56.420064+00	53	Торт с короной №2	2	[{"changed": {"fields": ["Description"]}}]	17	1
165	2022-05-16 06:29:04.789695+00	52	Торт с короной	2	[{"changed": {"fields": ["Description"]}}]	17	1
166	2022-05-16 06:29:10.621318+00	60	Торт шоколадный велюр	2	[{"changed": {"fields": ["Description"]}}]	17	1
167	2022-05-16 06:29:31.213538+00	58	Торт Чиаки Нанами	2	[{"changed": {"fields": ["Description"]}}]	17	1
168	2022-05-16 06:29:37.860329+00	57	Торт мраморный с цветами	2	[{"changed": {"fields": ["Description"]}}]	17	1
169	2022-05-16 06:29:43.498188+00	56	Торт Елена - принцесса Авалора	2	[{"changed": {"fields": ["Description"]}}]	17	1
170	2022-05-16 06:29:48.848364+00	55	Торт для новорожденного	2	[{"changed": {"fields": ["Description"]}}]	17	1
171	2022-05-17 08:45:15.847225+00	24	cakenuage	3		19	1
172	2022-05-17 08:45:15.85018+00	23	cakenuage	3		19	1
173	2022-05-17 08:45:44.990315+00	37	4 of Торт для новорожденного	3		24	1
174	2022-05-17 08:45:50.100564+00	36	1 of Торт Рафаэлло малиновая	3		24	1
175	2022-05-17 14:36:34.909383+00	25	cakenuage	3		19	1
176	2022-05-17 14:40:10.284092+00	59	Торт Рафаэлло малиновая	2	[{"changed": {"fields": ["Category"]}}]	17	1
177	2022-05-18 09:40:41.438172+00	26	cakenuage	3		19	1
178	2022-05-20 07:57:13.431568+00	87	Торт с подтеками и цветами	1	[{"added": {}}]	17	1
179	2022-05-20 07:59:13.04214+00	26	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
180	2022-05-20 08:08:19.435328+00	85	Единорог с косичкой	2	[{"changed": {"fields": ["Price"]}}]	17	1
181	2022-05-20 09:02:31.006104+00	88	Торт Карамельный 0.8кг	1	[{"added": {}}]	17	1
182	2022-05-20 09:13:42.884994+00	89	Детский торт паровозик томас	1	[{"added": {}}]	17	1
183	2022-05-20 09:13:53.750605+00	89	Детский торт паровозик томас	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
184	2022-05-20 09:13:59.962159+00	88	Торт Карамельный 0.8кг	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
185	2022-05-20 09:16:00.799414+00	27	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
186	2022-05-20 15:01:03.95645+00	63	Чизкейк Tворожно -Малиновый 0,8 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
187	2022-05-21 15:56:59.971055+00	90	Пирожное Черный Лес 350 гр.	1	[{"added": {}}]	17	1
189	2022-05-22 10:00:09.80437+00	41	1 of Чизкейк Tворожно -Малиновый 0,8 кг.	3		24	1
190	2022-05-22 10:01:02.066651+00	29	cakenuage	3		19	1
191	2022-05-22 10:01:15.497594+00	42	1 of Чизкейк Tворожно -Малиновый 0,8 кг.	3		24	1
193	2022-05-22 11:27:01.462737+00	91	Детский торт Poopsie	1	[{"added": {}}]	17	1
194	2022-05-22 11:28:13.490813+00	28	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
195	2022-05-22 11:39:59.572784+00	88	Торт Карамельный 0.8кг	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
196	2022-05-22 11:56:17.251353+00	91	Детский торт Poopsie	2	[{"changed": {"fields": ["Height", "Width"]}}]	17	1
197	2022-05-22 13:49:36.424304+00	30	cakenuage	3		19	1
198	2022-05-22 14:39:47.333002+00	92	Торты Супергерои «КОМИКСЫ»	1	[{"added": {}}]	17	1
199	2022-05-22 14:40:48.982252+00	29	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
200	2022-05-22 15:09:15.058736+00	93	Торт океан	1	[{"added": {}}]	17	1
202	2022-05-22 16:06:57.846862+00	31	cakenuage	3		19	1
203	2022-05-22 16:07:06.1878+00	46	1 of Торты Супергерои «КОМИКСЫ»	3		24	1
204	2022-05-22 16:07:10.579029+00	45	1 of Пирожное Черный Лес 350 гр.	3		24	1
205	2022-05-22 16:07:15.429887+00	44	1 of Чизкейк Tворожно -Малиновый 0,8 кг.	3		24	1
206	2022-05-22 16:07:19.65444+00	43	1 of Детский торт паровозик томас	3		24	1
201	2022-05-22 15:22:12.574048+00	30	Начинки	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}, {"added": {"name": "item variation", "object": "\\u041a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 \\u0411\\u0430\\u0440\\u0445\\u0430\\u0442"}}, {"added": {"name": "item variation", "object": "\\u0421\\u043d\\u0438\\u043a\\u0435\\u0440\\u0441"}}, {"added": {"name": "item variation", "object": "\\u0419\\u043e\\u0433\\u0443\\u0440\\u0442\\u043e\\u0432\\u0430\\u044f-\\u0427\\u0435\\u0440\\u043d\\u0438\\u0447\\u043d\\u0430\\u044f"}}, {"added": {"name": "item variation", "object": "\\u041c\\u0435\\u0434\\u043e\\u0432\\u0438\\u043a"}}]	20	1
207	2022-05-23 16:10:52.054221+00	32	cakenuage	3		19	1
208	2022-05-24 12:45:10.991791+00	93	Торт океан	2	[]	17	1
209	2022-05-24 12:45:41.199662+00	92	Торты Супергерои «КОМИКСЫ»	2	[{"changed": {"fields": ["Category"]}}]	17	1
210	2022-05-24 12:46:28.658378+00	92	Торты Супергерои «КОМИКСЫ»	2	[{"changed": {"fields": ["Category"]}}]	17	1
211	2022-05-24 12:52:04.343116+00	92	Торты Супергерои «КОМИКСЫ»	2	[]	17	1
212	2022-05-25 10:45:48.871134+00	1	cakenuage.com	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	12	1
213	2022-05-25 18:35:32.123919+00	94	Торт Киевский 0,8 кг.	1	[{"added": {}}]	17	1
214	2022-05-25 18:35:54.438098+00	94	Торт Киевский 0,8 кг.	2	[{"changed": {"fields": ["Media"]}}]	17	1
215	2022-05-26 10:59:57.371631+00	34	cakenuage	3		19	1
216	2022-05-26 14:01:17.745435+00	95	Детский торт без мастики с русалочкой	1	[{"added": {}}]	17	1
217	2022-05-26 14:01:59.238399+00	63	Чизкейк Tворожно -Малиновый 0,8 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
218	2022-05-26 14:02:11.817175+00	47	Торт Красный Бархат 1 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
219	2022-05-26 14:03:04.122442+00	55	Торт для новорожденного	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
220	2022-05-26 14:03:18.752273+00	61	Торт с бабочками без мастики	2	[{"changed": {"fields": ["Price"]}}]	17	1
221	2022-05-26 14:03:33.028309+00	73	Торт с бабочками без мастики	2	[{"changed": {"fields": ["Price"]}}]	17	1
222	2022-05-26 14:03:57.623064+00	59	Торт Рафаэлло малиновая 0.8кг	2	[{"changed": {"fields": ["Title", "Price"]}}]	17	1
223	2022-05-27 07:43:37.670462+00	96	Детский торт Принцесса	1	[{"added": {}}]	17	1
224	2022-05-28 12:11:12.088465+00	36	Дмитрий	2	[{"changed": {"fields": ["Received"]}}]	19	1
225	2022-05-28 15:35:48.517561+00	35	Дмитрий	3		19	1
226	2022-05-28 19:34:14.086272+00	97	Миньон торт	1	[{"added": {}}]	17	1
227	2022-05-29 07:23:54.279868+00	98	Ягодный торт	1	[{"added": {}}]	17	1
228	2022-05-29 07:24:02.734717+00	98	Ягодный торт	2	[{"changed": {"fields": ["Media"]}}]	17	1
229	2022-05-29 07:25:00.849556+00	98	Ягодный торт	2	[{"changed": {"fields": ["Media"]}}]	17	1
230	2022-05-29 09:37:24.342579+00	37	cakenuage	3		19	1
231	2022-05-29 17:09:16.962438+00	87	Торт с подтеками и цветами	2	[{"changed": {"fields": ["Price"]}}]	17	1
232	2022-05-29 17:09:28.299416+00	84	Торт на юбилей маме без мастики	2	[{"changed": {"fields": ["Price"]}}]	17	1
233	2022-05-29 17:09:46.343564+00	83	Торт с мишкой Тедди	2	[{"changed": {"fields": ["Price"]}}]	17	1
234	2022-05-29 17:10:11.829419+00	86	Торт с подтеками	2	[{"changed": {"fields": ["Price"]}}]	17	1
235	2022-05-29 17:10:30.448471+00	49	Торт на юбилей	2	[{"changed": {"fields": ["Price"]}}]	17	1
236	2022-05-29 17:12:29.802904+00	82	Ягодный торт	2	[{"changed": {"fields": ["Price", "DateOfreadiness"]}}]	17	1
237	2022-05-30 14:58:15.773639+00	38	Айка	2	[{"changed": {"fields": ["Received"]}}]	19	1
238	2022-05-31 09:42:47.523186+00	82	Ягодный торт	2	[{"changed": {"fields": ["Media"]}}]	17	1
239	2022-05-31 17:36:10.044271+00	1	Айка	1	[{"added": {}}]	23	1
240	2022-05-31 17:36:29.590382+00	38	Айка	2	[{"changed": {"fields": ["Payment"]}}]	19	1
241	2022-05-31 19:45:35.593777+00	39	cakenuage	3		19	1
242	2022-06-01 11:20:26.467145+00	47	Торт Красный Бархат 1 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
243	2022-06-02 20:52:14.819278+00	99	Black cake	1	[{"added": {}}]	17	1
244	2022-06-04 08:45:09.872699+00	99	Black cake	2	[{"changed": {"fields": ["Media", "Height", "Width"]}}]	17	1
245	2022-06-04 12:57:04.613135+00	99	Black cake	2	[{"changed": {"fields": ["Media"]}}]	17	1
246	2022-06-04 13:45:42.172111+00	99	Black cake	2	[{"changed": {"fields": ["Media"]}}]	17	1
247	2022-06-04 13:47:04.022528+00	99	Black cake	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
248	2022-06-05 20:45:48.076707+00	100	Cвадебный торт геометрия	1	[{"added": {}}]	17	1
249	2022-06-08 08:49:49.704359+00	78	Тарталетка малиновая 120г.(9шт) Cake Nuage	2	[{"changed": {"fields": ["Price"]}}]	17	1
250	2022-06-08 08:50:06.514968+00	97	Миньон торт	2	[{"changed": {"fields": ["Price"]}}]	17	1
251	2022-06-08 08:50:20.198889+00	96	Детский торт Принцесса	2	[{"changed": {"fields": ["Price"]}}]	17	1
252	2022-06-08 08:50:32.710448+00	95	Детский торт без мастики с русалочкой	2	[{"changed": {"fields": ["Price"]}}]	17	1
253	2022-06-08 08:50:40.445988+00	93	Торт океан	2	[{"changed": {"fields": ["Price"]}}]	17	1
254	2022-06-08 08:50:47.422346+00	92	Торты Супергерои «КОМИКСЫ»	2	[{"changed": {"fields": ["Price"]}}]	17	1
255	2022-06-08 08:50:56.007956+00	85	Единорог с косичкой	2	[{"changed": {"fields": ["Price"]}}]	17	1
256	2022-06-08 08:51:03.829685+00	91	Детский торт Poopsie	2	[{"changed": {"fields": ["Price"]}}]	17	1
257	2022-06-08 08:51:11.786777+00	89	Детский торт паровозик томас	2	[{"changed": {"fields": ["Price"]}}]	17	1
258	2022-06-08 08:51:18.635289+00	75	Детский торт Единорог с Шариками	2	[{"changed": {"fields": ["Price"]}}]	17	1
259	2022-06-08 08:51:32.490325+00	56	Торт Елена - принцесса Авалора	2	[{"changed": {"fields": ["Price"]}}]	17	1
260	2022-06-08 08:52:21.949313+00	71	Торт Эстерхази 0,9 кг.	2	[{"changed": {"fields": ["Discount price"]}}]	17	1
261	2022-06-08 14:44:42.729652+00	100	Cвадебный торт геометрия	2	[{"changed": {"fields": ["Media", "Height", "Width"]}}]	17	1
262	2022-06-11 10:52:19.587833+00	101	Торт для барбершопа	1	[{"added": {}}]	17	1
263	2022-06-11 18:52:07.883253+00	41	cakenuage	3		19	1
264	2022-06-11 18:52:28.693704+00	64	2 of Торт Эстерхази 0,9 кг.	3		24	1
265	2022-06-12 07:32:58.679247+00	102	Детский торт Холодное сердце	1	[{"added": {}}]	17	1
266	2022-06-12 07:34:16.740923+00	102	Детский торт Холодное сердце	2	[{"changed": {"fields": ["Media"]}}]	17	1
267	2022-06-12 07:37:40.621691+00	103	Детский торт Молния маквин	1	[{"added": {}}]	17	1
268	2022-06-12 07:41:41.024864+00	104	Детский торт Наруто	1	[{"added": {}}]	17	1
269	2022-06-12 14:55:00.91764+00	105	Cвадебный торт Каменный квадрат	1	[{"added": {}}]	17	1
270	2022-06-14 08:49:09.704857+00	67	1 of Детский торт Единорог с Шариками	3		24	1
271	2022-06-14 08:49:15.138263+00	66	1 of Cвадебный торт Каменный квадрат	3		24	1
272	2022-06-14 08:49:42.824385+00	44	cakenuage	3		19	1
273	2022-06-14 08:49:42.82695+00	43	cakenuage	3		19	1
274	2022-06-14 09:07:16.073341+00	2	Miberius	1	[{"added": {}}]	23	1
275	2022-06-15 15:19:06.591108+00	106	Детские торты на 1 годик	1	[{"added": {}}]	17	1
276	2022-06-15 15:26:42.489217+00	107	Торт ягодный	1	[{"added": {}}]	17	1
277	2022-06-15 15:28:48.073221+00	107	Торт ягодный	2	[{"changed": {"fields": ["Height", "Width"]}}]	17	1
278	2022-06-15 15:34:04.284162+00	107	Торт ягодный	2	[{"changed": {"fields": ["Height", "Width"]}}]	17	1
279	2022-06-15 16:41:31.548405+00	107	Торт ягодный	2	[{"changed": {"fields": ["Media"]}}]	17	1
280	2022-06-16 12:42:21.02331+00	108	Пряники имбирные "МАЛЫШ"	1	[{"added": {}}]	17	1
281	2022-06-16 13:03:49.278113+00	108	Пряники имбирные "МАЛЫШ"	2	[{"changed": {"fields": ["Media"]}}]	17	1
282	2022-06-16 13:12:19.81747+00	109	Имбирный пряник Девочка	1	[{"added": {}}]	17	1
283	2022-06-16 13:12:49.577721+00	108	Пряники имбирные Малыш	2	[{"changed": {"fields": ["Title"]}}]	17	1
284	2022-06-16 13:16:54.65266+00	109	Имбирный пряник Девочка	2	[{"changed": {"fields": ["Price"]}}]	17	1
285	2022-06-16 13:17:19.4234+00	108	Пряники имбирные Малыш	2	[{"changed": {"fields": ["Price"]}}]	17	1
286	2022-06-16 13:28:27.03389+00	110	Имбирный пряник Лол	1	[{"added": {}}]	17	1
287	2022-06-16 13:28:33.949419+00	109	Имбирный пряник Девочка	2	[{"changed": {"fields": ["Category"]}}]	17	1
288	2022-06-16 13:28:42.435799+00	108	Пряники имбирные Малыш	2	[{"changed": {"fields": ["Category"]}}]	17	1
289	2022-06-16 14:30:01.206023+00	42	Miberius	2	[{"changed": {"fields": ["Received"]}}]	19	1
290	2022-06-16 14:35:59.135571+00	108	Имбирный пряник Малыш	2	[{"changed": {"fields": ["Title"]}}]	17	1
291	2022-06-18 10:31:46.884242+00	111	Бенто торт Love	1	[{"added": {}}]	17	1
292	2022-06-18 14:35:28.838578+00	111	Бенто торт Love	2	[{"changed": {"fields": ["Media"]}}]	17	1
293	2022-06-18 14:35:59.830453+00	111	Бенто торт Love	2	[{"changed": {"fields": ["Height", "Width"]}}]	17	1
294	2022-06-19 09:04:57.769346+00	112	Бенто из коллекции Love	1	[{"added": {}}]	17	1
295	2022-06-28 09:34:04.16695+00	113	Мастика ванильная белая (Top Decor) 600г	1	[{"added": {}}]	17	1
296	2022-06-28 11:06:32.578262+00	114	Красители пищевые гелевые Топ Декор	1	[{"added": {}}]	17	1
297	2022-06-28 11:11:02.219923+00	114	Красители пищевые гелевые Топ Декор 100 г	2	[{"changed": {"fields": ["Title"]}}]	17	1
298	2022-06-28 11:12:49.220728+00	31	Цвет	1	[{"added": {}}, {"added": {"name": "item variation", "object": "\\u041a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439 7629"}}]	20	1
299	2022-06-28 13:14:14.873534+00	114	Красители пищевые гелевые Топ Декор 100 г	2	[{"changed": {"fields": ["Media"]}}]	17	1
300	2022-06-29 06:10:24.326765+00	114	Красители пищевые гелевые Топ Декор 100 г	2	[{"changed": {"fields": ["Media"]}}]	17	1
301	2022-06-30 13:18:12.972118+00	115	Детский торт Холодное сердце	1	[{"added": {}}]	17	1
302	2022-06-30 13:47:15.66565+00	45	cakenuage	3		19	1
303	2022-07-01 07:32:44.22847+00	116	Десерт профитроли с заварным кремом	1	[{"added": {}}]	17	1
304	2022-07-02 12:12:11.943201+00	81	Торт на юбилей	2	[{"changed": {"fields": ["Price"]}}]	17	1
305	2022-07-02 12:12:33.157358+00	87	Торт с подтеками и цветами	2	[{"changed": {"fields": ["Price"]}}]	17	1
306	2022-07-02 12:12:58.115048+00	86	Торт с подтеками	2	[{"changed": {"fields": ["Price"]}}]	17	1
307	2022-07-02 12:13:22.053346+00	82	Ягодный торт	2	[{"changed": {"fields": ["Price"]}}]	17	1
308	2022-07-02 12:13:42.275469+00	84	Торт на юбилей маме без мастики	2	[{"changed": {"fields": ["Price"]}}]	17	1
309	2022-07-02 12:13:58.003418+00	49	Торт на юбилей	2	[{"changed": {"fields": ["Price"]}}]	17	1
310	2022-07-07 18:50:36.284195+00	107	Торт ягодный	2	[{"added": {"name": "media content", "object": "MediaContent object (1)"}}]	17	1
311	2022-07-08 13:11:54.858315+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	1	[{"added": {}}, {"added": {"name": "media content", "object": "MediaContent object (2)"}}, {"added": {"name": "media content", "object": "MediaContent object (3)"}}]	17	1
312	2022-07-08 13:13:04.555153+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"fields": ["Media"]}}]	17	1
313	2022-07-08 13:14:45.045319+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"name": "media content", "object": "MediaContent object (3)", "fields": ["Media content"]}}]	17	1
314	2022-07-08 13:15:30.379268+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"name": "media content", "object": "MediaContent object (3)", "fields": ["Media content"]}}]	17	1
315	2022-07-08 13:18:13.505963+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"fields": ["Media"]}}]	17	1
316	2022-07-08 13:21:36.244064+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"fields": ["Media"]}}, {"changed": {"name": "media content", "object": "MediaContent object (2)", "fields": ["Media content"]}}, {"changed": {"name": "media content", "object": "MediaContent object (3)", "fields": ["Media content"]}}]	17	1
317	2022-07-08 13:33:53.958001+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"fields": ["Height"]}}]	17	1
318	2022-07-08 13:34:29.455103+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	2	[{"changed": {"fields": ["Height"]}}]	17	1
319	2022-07-10 14:04:08.940435+00	117	Набор кондитерских кисточек для декорирования Доляна «Радуга», 5 шт, 19×6 см	3		17	1
320	2022-07-10 14:18:06.073804+00	116	Десерт профитроли с заварным кремом	2	[{"changed": {"fields": ["Media", "Height", "Width"]}}]	17	1
321	2022-07-10 16:13:45.238044+00	118	Свечи для торта "Серпантин" 6 шт, коктейльные, разноцветные	1	[{"added": {}}, {"added": {"name": "media content", "object": "MediaContent object (4)"}}]	17	1
322	2022-07-11 10:47:13.272743+00	118	Свечи для торта "Серпантин" 6 шт, коктейльные, разноцветные	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
323	2022-07-11 10:47:21.001796+00	116	Десерт профитроли с заварным кремом	2	[]	17	1
324	2022-07-11 10:50:26.696589+00	113	Мастика ванильная белая (Top Decor) 600г	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
325	2022-07-11 10:51:22.251049+00	113	Мастика ванильная белая (Top Decor) 600г	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	17	1
326	2022-07-11 16:04:52.504296+00	119	Свечи в торт Ройс -6 шт.	1	[{"added": {}}, {"added": {"name": "media content", "object": "MediaContent object (5)"}}]	17	1
327	2022-07-11 16:34:59.398938+00	119	Свечи на торт Ройс -6 шт.	2	[{"changed": {"fields": ["Title"]}}]	17	1
328	2022-07-11 17:03:24.462335+00	120	Воздушные шарики "Черное золото"	1	[{"added": {}}]	17	1
329	2022-07-14 17:28:02.752174+00	48	cakenuage	3		19	1
330	2022-07-14 17:28:02.754671+00	47	cakenuage	3		19	1
331	2022-07-28 14:45:47.47791+00	24	ars@mai.ru	3		7	1
332	2022-07-28 15:27:44.363535+00	70	Торт с леденцами	2	[{"changed": {"fields": ["Price"]}}]	17	1
333	2022-07-28 15:28:00.203522+00	112	Бенто из коллекции Love	2	[{"changed": {"fields": ["Price"]}}]	17	1
334	2022-07-28 15:28:13.943404+00	111	Бенто торт Love	2	[{"changed": {"fields": ["Price"]}}]	17	1
335	2022-07-28 15:28:38.438477+00	87	Торт с подтеками и цветами	2	[{"changed": {"fields": ["Price"]}}]	17	1
336	2022-07-28 15:28:49.085969+00	83	Торт с мишкой Тедди	2	[{"changed": {"fields": ["Price"]}}]	17	1
337	2022-07-28 15:29:00.380805+00	72	Торт ягодный с подтеками	2	[{"changed": {"fields": ["Price"]}}]	17	1
338	2022-07-28 16:29:21.030066+00	121	Торт с цветами без мастики	1	[{"added": {}}]	17	1
339	2022-07-29 13:18:47.493522+00	30	Начинки	2	[{"added": {"name": "item variation", "object": "\\u041f\\u0440\\u0430\\u0433\\u0430"}}]	20	1
340	2022-07-29 14:30:27.189925+00	122	Торт с волнами нежно розовый	1	[{"added": {}}]	17	1
341	2022-07-31 16:17:58.608749+00	123	Бенто торт Волны	1	[{"added": {}}]	17	1
342	2022-07-31 16:58:37.052971+00	121	Торт с цветами без мастики	2	[{"changed": {"fields": ["Description"]}}]	17	1
343	2022-07-31 16:58:57.94164+00	122	Торт с волнами нежно розовый	2	[{"changed": {"fields": ["Description"]}}]	17	1
344	2022-07-31 16:59:41.082422+00	124	Торт Космос и звезды	1	[{"added": {}}]	17	1
345	2022-07-31 17:02:34.350155+00	113	Мастика ванильная белая (Top Decor) 600г	3		17	1
346	2022-07-31 17:08:27.402594+00	125	Торт Галактик	1	[{"added": {}}]	17	1
347	2022-08-01 07:15:59.485326+00	126	Торт маме без мастики нежно розовый	1	[{"added": {}}]	17	1
348	2022-08-01 11:33:54.229066+00	50	test2	3		19	1
349	2022-08-01 11:33:54.231649+00	49	cakenuage	3		19	1
350	2022-08-01 11:34:32.472173+00	114	Красители пищевые гелевые Топ Декор 100 г	3		17	1
351	2022-08-06 15:56:48.45123+00	1	candybar	1	[{"added": {}}]	16	1
352	2022-08-06 15:57:32.589674+00	1	post1	2	[{"changed": {"fields": ["Name"]}}]	16	1
353	2022-08-06 15:57:51.709599+00	2	post2	1	[{"added": {}}]	16	1
354	2022-08-06 15:58:59.548055+00	3	post3	1	[{"added": {}}]	16	1
355	2022-08-06 15:59:42.733432+00	4	post4	1	[{"added": {}}]	16	1
356	2022-08-06 16:00:29.7061+00	5	post5	1	[{"added": {}}]	16	1
357	2022-08-06 16:14:48.947516+00	1	готовые торты	1	[{"added": {}}]	17	1
358	2022-08-06 16:25:50.302012+00	2	детские	1	[{"added": {}}]	17	1
359	2022-08-06 16:28:11.198659+00	3	свадебные	1	[{"added": {}}]	17	1
360	2022-08-06 16:33:18.637241+00	4	все для праздника	1	[{"added": {}}]	17	1
361	2022-08-06 16:37:48.315385+00	127	Торт Черный Лес 0.9кг.	1	[{"added": {}}]	19	1
362	2022-08-06 16:39:33.937474+00	128	Торт Единорог 0.9	1	[{"added": {}}]	19	1
363	2022-08-06 16:41:22.760208+00	128	Торт Единорог 0.9	2	[{"changed": {"fields": ["Category"]}}]	19	1
364	2022-08-06 16:43:11.977295+00	129	Торт с кошками	1	[{"added": {}}]	19	1
365	2022-08-06 16:45:18.893903+00	130	Торт свадебный с бабочками	1	[{"added": {}}]	19	1
366	2022-08-06 16:47:00.382046+00	131	Торт Тирамису 0,8 кг.	1	[{"added": {}}]	19	1
367	2022-08-06 16:49:06.426352+00	132	Торт Фортнайт	1	[{"added": {}}]	19	1
368	2022-08-06 16:51:06.745197+00	133	Торт с мишкой	1	[{"added": {}}]	19	1
369	2022-08-07 12:56:58.540119+00	5	Бенто торты	1	[{"added": {}}]	17	1
370	2022-08-07 16:01:49.499936+00	1	tophit	1	[{"added": {}}]	22	1
371	2022-08-07 16:05:02.642858+00	6	tophit	1	[{"added": {}}]	16	1
372	2022-08-07 16:05:37.65972+00	133	Торт с мишкой	2	[{"changed": {"fields": ["Tags"]}}]	19	1
373	2022-08-07 16:33:38.167683+00	2	galaxy	1	[{"added": {}}]	22	1
374	2022-08-07 16:34:21.892282+00	7	galaxy	1	[{"added": {}}]	16	1
375	2022-08-07 16:38:07.763745+00	134	Торт Космос	1	[{"added": {}}]	19	1
376	2022-08-07 16:38:20.218103+00	134	Торт Космос	2	[]	19	1
377	2022-08-07 16:39:47.594357+00	52	test2	3		21	1
378	2022-08-07 16:39:47.597153+00	51	cakenuage	3		21	1
379	2022-08-07 16:40:22.67556+00	134	Торт Космос	2	[]	19	1
380	2022-08-07 16:42:48.549662+00	6	galaxy	1	[{"added": {}}]	17	1
381	2022-08-07 16:45:03.446212+00	135	Торт Галактика	1	[{"added": {}}]	19	1
382	2022-08-07 16:51:57.488507+00	6	galaxy	2	[{"changed": {"fields": ["Mediacontent"]}}]	17	1
383	2022-08-07 16:52:48.325784+00	6	galaxy	2	[{"changed": {"fields": ["Mediacontent"]}}]	17	1
384	2022-08-07 16:53:18.115296+00	6	galaxy	2	[{"changed": {"fields": ["Mediacontent"]}}]	17	1
385	2022-08-07 16:54:50.234656+00	133	Торт с мишкой	2	[{"changed": {"fields": ["Height"]}}]	19	1
386	2022-08-08 07:27:00.345314+00	136	Торт Человек Паук с пряником	1	[{"added": {}}]	19	1
387	2022-08-08 08:15:12.466381+00	137	Торт Феррари (Ferrari)	1	[{"added": {}}]	19	1
388	2022-08-08 08:17:23.866079+00	138	Торт с короной №2	1	[{"added": {}}]	19	1
389	2022-08-08 08:21:36.090716+00	139	Торт Чиаки Нанами	1	[{"added": {}}]	19	1
390	2022-08-08 08:53:37.954006+00	135	Торт Галактика	2	[]	19	1
391	2022-08-08 15:39:53.094126+00	140	Торт Галактика с розовым оттенком	1	[{"added": {}}]	19	1
392	2022-08-08 15:52:18.812828+00	141	Торт мраморный с цветами	1	[{"added": {}}]	19	1
393	2022-08-08 16:10:07.31453+00	142	Детский торт Единорог с Шариками	1	[{"added": {}}]	19	1
394	2022-08-08 16:11:16.77207+00	143	Детский торт для новорожденного без мастики	1	[{"added": {}}]	19	1
395	2022-08-08 16:13:34.855069+00	144	Торты Супергерои «КОМИКСЫ»	1	[{"added": {}}]	19	1
396	2022-08-08 16:23:16.994957+00	145	Детский торт Холодное сердце	1	[{"added": {}}]	19	1
397	2022-08-08 16:32:23.43176+00	2	галактика	2	[{"changed": {"fields": ["Title"]}}]	22	1
398	2022-08-08 16:33:31.684529+00	2	galaktika	2	[{"changed": {"fields": ["Title"]}}]	22	1
399	2022-08-08 16:33:40.360324+00	7	galaktika	2	[{"changed": {"fields": ["Name", "Slug"]}}]	16	1
400	2022-08-08 16:44:50.219375+00	3	pery	1	[{"added": {}}]	22	1
401	2022-08-08 16:45:13.32634+00	8	pery	1	[{"added": {}}]	16	1
402	2022-08-09 07:18:04.287855+00	146	Торт с бабочками без мастики	1	[{"added": {}}]	19	1
403	2022-08-09 07:20:46.765016+00	147	Торт с бабочками без мастики	1	[{"added": {}}]	19	1
404	2022-08-09 07:22:56.306288+00	148	Торт с гранатовой жеодой	1	[{"added": {}}]	19	1
405	2022-08-09 07:25:35.436166+00	149	Ягодный торт 2 ярусный	1	[{"added": {}}]	19	1
406	2022-08-09 07:27:02.645506+00	150	Детский торт без мастики с русалочкой	1	[{"added": {}}]	19	1
407	2022-08-09 07:28:09.949733+00	151	Торт океан	1	[{"added": {}}]	19	1
408	2022-08-09 07:36:53.639296+00	152	Детский торт Poopsie	1	[{"added": {}}]	19	1
409	2022-08-09 07:38:22.288959+00	153	Детский торт паровозик томас	1	[{"added": {}}]	19	1
410	2022-08-09 07:39:55.561495+00	154	Торт Елена - принцесса Авалора	1	[{"added": {}}]	19	1
411	2022-08-09 07:42:51.090727+00	155	Детский торт Молния маквин	1	[{"added": {}}]	19	1
412	2022-08-09 07:44:38.577439+00	156	Детский торт Наруто	1	[{"added": {}}]	19	1
413	2022-08-09 07:45:59.596616+00	157	Детские торты на 1 годик	1	[{"added": {}}]	19	1
414	2022-08-09 08:40:31.893468+00	153	Детский торт паровозик томас	2	[{"changed": {"fields": ["Category"]}}]	19	1
415	2022-08-09 08:43:42.184406+00	54	cakenuage	3		21	1
416	2022-08-09 08:43:42.187293+00	53	cakenuage	3		21	1
417	2022-09-23 15:02:43.227684+00	4	elza	1	[{"added": {}}]	22	1
418	2022-09-23 15:02:50.777906+00	158	Детский торт Эльза	1	[{"added": {}}]	19	1
419	2022-09-24 06:30:15.527172+00	128	Торт Единорог 0.9	2	[{"changed": {"fields": ["DateOfreadiness"]}}]	19	1
420	2022-09-25 14:30:36.400272+00	159	Торт с  разноцветной посыпкой	1	[{"added": {}}]	19	1
421	2022-09-25 16:51:03.422889+00	9	frozen	1	[{"added": {}}]	16	1
422	2022-09-25 16:53:26.885813+00	9	frozen	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
423	2022-09-25 16:59:07.556496+00	5	frozen	1	[{"added": {}}]	22	1
424	2022-09-25 16:59:12.842287+00	158	Детский торт Эльза	2	[{"changed": {"fields": ["Tags"]}}]	19	1
425	2022-09-25 17:00:18.953947+00	145	Детский торт Холодное сердце	2	[{"changed": {"fields": ["Tags"]}}]	19	1
426	2022-09-25 19:18:14.707868+00	9	frozen	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
427	2022-09-25 19:27:45.666555+00	160	Холодное сердце снежинки	1	[{"added": {}}]	19	1
428	2022-09-25 20:48:14.609408+00	160	Холодное сердце снежинки	2	[{"changed": {"fields": ["Height", "Width"]}}]	19	1
429	2022-09-26 04:57:37.393229+00	57	Тест	3		21	1
430	2022-09-26 04:57:37.396025+00	56	cakenuage	3		21	1
431	2022-09-26 04:57:37.39767+00	55	cakenuage	3		21	1
432	2022-09-26 10:58:08.291933+00	6	tophit	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
433	2022-09-26 10:59:07.932638+00	7	galaktika	2	[]	16	1
434	2022-09-26 10:59:19.307449+00	8	pery	2	[]	16	1
435	2022-09-26 11:32:03.860032+00	161	Торт Мишка и звезды	1	[{"added": {}}]	19	1
436	2022-09-26 13:27:32.831039+00	162	Голубой с мишкой и облаками	1	[{"added": {}}]	19	1
437	2022-09-26 13:53:10.359527+00	7	galaktika	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
438	2022-09-26 16:16:33.267298+00	163	Торт Космос и Астронавт	1	[{"added": {}}]	19	1
439	2022-09-26 16:17:34.829117+00	163	Торт Космос и Астронавт	2	[{"changed": {"fields": ["Tags"]}}]	19	1
440	2022-09-27 10:51:05.072972+00	164	Lетские торт Принцесса	1	[{"added": {}}]	19	1
441	2022-09-27 10:51:22.471061+00	164	Детские торт Принцесса	2	[{"changed": {"fields": ["Title"]}}]	19	1
442	2022-09-27 10:52:00.459709+00	164	Детские торт Принцесса	2	[{"changed": {"fields": ["Height", "Width"]}}]	19	1
443	2022-09-27 10:54:59.602406+00	165	Детский торт с леденцами и короной	1	[{"added": {}}]	19	1
444	2022-09-27 10:57:17.904476+00	166	Торт с мишкой Тедди для мальчика	1	[{"added": {}}]	19	1
445	2022-09-27 11:22:11.255864+00	167	торт с мишкой Тедди с разноцветными шарами	1	[{"added": {}}]	19	1
446	2022-09-27 18:03:11.008371+00	127	Торт Черный Лес 0.9кг.	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
447	2022-09-27 18:08:44.571907+00	167	Торт с мишкой Тедди с разноцветными шарами	2	[{"changed": {"fields": ["Title"]}}]	19	1
448	2022-09-27 18:13:02.846767+00	127	Торт Черный Лес 0.9кг.	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
449	2022-09-27 18:16:33.670943+00	127	Торт Черный Лес 0.9кг.	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
450	2022-09-28 18:28:16.149003+00	168	Торт с мишкой Тедди с шарами	1	[{"added": {}}]	19	1
451	2022-09-29 13:42:59.86714+00	129	Торт с кошками	2	[{"changed": {"fields": ["Price"]}}]	19	1
452	2022-09-29 13:43:34.989351+00	129	Торт с кошками	2	[{"changed": {"fields": ["Price"]}}]	19	1
453	2022-09-29 18:10:41.622676+00	169	Торт  Кукла Lola с леденцами	1	[{"added": {}}]	19	1
454	2022-10-02 18:43:37.767423+00	2	детские	2	[{"changed": {"fields": ["Seo description"]}}]	17	1
455	2022-10-02 18:44:49.655183+00	2	Детские торты	2	[{"changed": {"fields": ["Name", "Seo description"]}}]	17	1
456	2022-10-02 18:44:59.51879+00	169	Торт  Кукла Lola с леденцами	2	[]	19	1
457	2022-10-03 16:43:09.054531+00	170	Детские торт единорог с шариками	1	[{"added": {}}]	19	1
458	2022-10-04 20:48:30.599336+00	171	Детский торт единорог с леденцами	1	[{"added": {}}]	19	1
459	2022-10-06 12:21:42.850302+00	172	Торт на юбилей маме без мастики	1	[{"added": {}}]	19	1
460	2022-10-06 12:52:16.999562+00	173	Торт для девочки Эльза	1	[{"added": {}}]	19	1
461	2022-10-06 13:17:37.698418+00	173	Торт для девочки Эльза	2	[{"changed": {"fields": ["Media"]}}]	19	1
462	2022-10-08 13:55:57.849922+00	173	Торт для девочки Эльза	2	[{"changed": {"fields": ["Media", "Tags"]}}]	19	1
463	2022-10-08 13:56:52.346875+00	173	Торт для девочки Эльза	2	[{"changed": {"fields": ["Tags"]}}]	19	1
464	2022-10-08 14:09:52.542566+00	173	Торт для девочки Эльза	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
465	2022-10-08 14:23:00.098054+00	1	CAKE22	1	[{"added": {}}]	18	1
466	2022-10-08 16:19:06.608315+00	174	Торт шиммер и шайн	1	[{"added": {}}]	19	1
467	2022-10-10 11:33:16.9367+00	175	Новогодний торт Новогодняя Елка	1	[{"added": {}}]	19	1
468	2022-10-10 12:04:28.745009+00	176	Cвадебный торт с розами	1	[{"added": {}}]	19	1
469	2022-10-11 18:46:20.527635+00	177	Торт с косметикой	1	[{"added": {}}]	19	1
470	2022-10-11 20:00:29.811003+00	178	Торт морской парус	1	[{"added": {}}]	19	1
471	2022-10-12 16:02:45.637263+00	154	Торт Елена - принцесса Авалора	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
472	2022-10-12 16:04:42.873104+00	176	Cвадебный торт с розами	2	[]	19	1
473	2022-10-13 12:59:39.113073+00	179	Торт на крестины с ангелом	1	[{"added": {}}]	19	1
474	2022-10-13 16:54:28.375843+00	179	Торт на крестины с ангелом	2	[{"changed": {"fields": ["Height", "Width"]}}]	19	1
475	2022-10-13 16:55:00.538269+00	1	cakenuage.com	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	12	1
476	2022-10-13 16:59:05.338572+00	59	cakenuage	3		21	1
477	2022-10-13 16:59:05.34104+00	58	cakenuage	3		21	1
478	2022-10-15 18:32:37.991111+00	180	Торт Эстерхази	1	[{"added": {}}]	19	1
479	2022-10-15 19:39:23.490579+00	181	Торт машина гелендваген	1	[{"added": {}}]	19	1
480	2022-10-18 08:44:56.954725+00	182	Торт Шанель	1	[{"added": {}}]	19	1
481	2022-10-18 08:48:55.661214+00	180	Торт Эстерхази	2	[{"changed": {"fields": ["Description"]}}]	19	1
482	2022-10-18 09:39:26.6267+00	183	Торт на 18 лет для девушки	1	[{"added": {}}]	19	1
483	2022-10-18 10:16:38.232636+00	184	Торт машина Бентли	1	[{"added": {}}]	19	1
484	2022-10-19 10:15:18.718921+00	131	2 of Торт для девочки Эльза	3		27	1
485	2022-10-19 10:15:18.721498+00	130	1 of Торт с мишкой Тедди с разноцветными шарами	3		27	1
486	2022-10-19 10:15:18.723344+00	129	2 of Детский торт единорог с леденцами	3		27	1
487	2022-10-19 10:15:18.724993+00	127	1 of Торт Галактика	3		27	1
488	2022-10-19 10:15:18.726623+00	124	2 of Торт с короной №2	3		27	1
489	2022-10-19 10:15:18.72852+00	123	1 of Торт Человек Паук с пряником	3		27	1
490	2022-10-19 10:15:18.730279+00	121	4 of Торт Елена - принцесса Авалора	3		27	1
491	2022-10-19 10:15:18.731842+00	119	3 of Торт с кошками	3		27	1
492	2022-10-19 10:15:18.733403+00	109	5 of Торт свадебный с бабочками	3		27	1
493	2022-10-19 10:15:18.735537+00	107	2 of Торт с мишкой	3		27	1
494	2022-10-19 10:15:18.737237+00	105	1 of Торт Единорог 0.9	3		27	1
495	2022-10-19 10:15:18.738979+00	104	1 of Торт Черный Лес 0.9кг.	3		27	1
496	2022-10-20 12:57:23.953264+00	185	Чизкейк Tворожно -Малиновый	1	[{"added": {}}]	19	1
497	2022-10-21 07:53:49.604504+00	185	Чизкейк Tворожно -Малиновый	2	[{"changed": {"fields": ["Price", "Description"]}}]	19	1
498	2022-10-22 13:15:34.323374+00	186	Торт Красный Бархат	1	[{"added": {}}]	19	1
499	2022-10-22 13:16:30.781446+00	186	Торт Красный Бархат	2	[{"changed": {"fields": ["Description"]}}]	19	1
500	2022-10-22 15:33:41.545443+00	187	Детский торт Фиксики	1	[{"added": {}}]	19	1
501	2022-10-23 11:12:39.812602+00	60	cakenuage	3		21	1
502	2022-10-23 12:44:42.558883+00	188	Торт на годик девочке с короной	1	[{"added": {}}]	19	1
503	2022-10-23 16:06:24.485469+00	189	Торт с короной в золотом цвете	1	[{"added": {}}]	19	1
504	2022-10-25 17:41:51.92416+00	190	Торт рафаэлло с малиной	1	[{"added": {}}]	19	1
505	2022-10-26 14:01:44.990914+00	190	Торт рафаэлло с малиной	2	[{"changed": {"fields": ["Media", "Media type"]}}]	19	1
506	2022-10-26 14:08:17.283016+00	190	Торт рафаэлло с малиной	2	[{"changed": {"fields": ["Description"]}}]	19	1
507	2022-10-26 15:59:51.209079+00	191	Пряничный домик Зима, 800 г	1	[{"added": {}}]	19	1
508	2022-10-26 16:15:02.056645+00	192	Елка из имбирных пряников	1	[{"added": {}}]	19	1
509	2022-10-26 16:34:14.95058+00	62	cakenuage	3		21	1
510	2022-10-26 16:34:14.952965+00	61	Тест	3		21	1
511	2022-10-26 16:34:37.539249+00	28	sh_oksana7@mail.ru	2	[{"changed": {"fields": ["Verified", "Primary"]}}]	7	1
512	2022-10-26 16:36:08.720456+00	25	arsen	3		4	1
513	2022-10-27 15:41:18.93316+00	193	Детский торты на день рождения 1 годик	1	[{"added": {}}]	19	1
514	2022-10-27 16:13:04.13485+00	7	Торты для мужчин	1	[{"added": {}}]	17	1
515	2022-10-27 16:13:27.181975+00	194	Торт для мужчины с потеками	1	[{"added": {}}]	19	1
516	2022-10-27 16:19:11.873392+00	7	Торты для мужчин	2	[{"changed": {"fields": ["Mediacontent"]}}]	17	1
517	2022-10-27 16:41:29.125936+00	195	Торт для мужчины с деньгами	1	[{"added": {}}]	19	1
518	2022-10-28 17:40:43.156234+00	8	Ягодные торты	1	[{"added": {}}]	17	1
519	2022-10-28 17:43:17.476333+00	196	Ягодный торт Фруктовое счастье	1	[{"added": {}}]	19	1
520	2022-10-29 14:19:32.486842+00	7	galaktika	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
521	2022-10-29 14:21:18.158988+00	9	frozen	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
522	2022-10-29 14:21:30.956708+00	8	pery	3		16	1
523	2022-10-29 14:47:37.783095+00	6	tophit	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
524	2022-10-29 14:54:09.521596+00	9	frozen	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
525	2022-10-29 14:59:32.336211+00	9	frozen	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
526	2022-10-29 15:40:25.262359+00	10	Christmas	1	[{"added": {}}]	16	1
527	2022-10-29 15:45:59.894937+00	10	Christmas	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
528	2022-10-29 15:47:31.401892+00	10	Christmas	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
529	2022-10-29 15:49:00.983019+00	6	christmas	1	[{"added": {}}]	22	1
530	2022-10-29 15:49:04.791101+00	192	Елка из имбирных пряников	2	[{"changed": {"fields": ["Tags"]}}]	19	1
531	2022-10-29 15:49:32.676206+00	4	elza	3		22	1
532	2022-10-29 15:49:32.67881+00	3	pery	3		22	1
533	2022-10-29 15:49:43.278026+00	191	Пряничный домик Зима, 800 г	2	[{"changed": {"fields": ["Tags"]}}]	19	1
534	2022-10-29 15:53:25.404632+00	10	christmas	2	[{"changed": {"fields": ["Name"]}}]	16	1
535	2022-10-29 15:54:24.397732+00	192	Елка из имбирных пряников	2	[]	19	1
536	2022-10-29 15:58:40.95653+00	10	christmas	2	[{"changed": {"fields": ["Mediacarousel"]}}]	16	1
537	2022-10-29 15:59:40.347653+00	175	Новогодний торт Новогодняя Елка	2	[{"changed": {"fields": ["Tags"]}}]	19	1
538	2022-10-29 16:09:57.214689+00	192	Елка из имбирных пряников	2	[{"changed": {"fields": ["Tags"]}}]	19	1
539	2022-10-29 16:10:28.101849+00	191	Пряничный домик Зима, 800 г	2	[]	19	1
540	2022-10-29 16:10:36.674877+00	192	Елка из имбирных пряников	2	[{"changed": {"fields": ["Tags"]}}]	19	1
541	2022-10-29 16:13:32.589305+00	192	Елка из имбирных пряников	2	[]	19	1
542	2022-10-29 16:31:52.195887+00	6	christmas	3		22	1
543	2022-10-29 16:32:01.042316+00	10	christmas	3		16	1
544	2022-10-29 16:32:23.414513+00	7	christmas	1	[{"added": {}}]	22	1
545	2022-10-29 16:32:35.598237+00	192	Елка из имбирных пряников	2	[{"changed": {"fields": ["Tags"]}}]	19	1
546	2022-10-29 16:32:47.483988+00	11	christmas	1	[{"added": {}}]	16	1
547	2022-10-29 16:56:23.995306+00	191	Пряничный домик Зима, 800 г	2	[{"changed": {"fields": ["Tags"]}}]	19	1
548	2022-10-29 17:00:16.20072+00	197	test	1	[{"added": {}}]	19	1
549	2022-10-29 17:02:22.784903+00	7	new_year	2	[{"changed": {"fields": ["Title"]}}]	22	1
550	2022-10-29 17:02:43.349157+00	197	test	2	[]	19	1
551	2022-10-29 17:03:33.110633+00	11	christmas	2	[{"changed": {"fields": ["Slug"]}}]	16	1
552	2022-10-29 17:04:17.003725+00	192	Елка из имбирных пряников	2	[]	19	1
553	2022-10-29 17:04:28.758297+00	191	Пряничный домик Зима, 800 г	2	[]	19	1
554	2022-10-29 17:05:27.305949+00	175	Новогодний торт Новогодняя Елка	2	[{"changed": {"fields": ["Tags"]}}]	19	1
555	2022-10-29 17:05:34.300723+00	197	test	3		19	1
556	2022-10-29 17:06:33.494908+00	190	Торт рафаэлло с малиной	2	[{"changed": {"fields": ["Tags"]}}]	19	1
557	2022-10-29 17:32:16.015927+00	8	Ягодные торты	2	[{"changed": {"fields": ["Mediacontent"]}}]	17	1
558	2022-10-29 17:53:18.683531+00	198	Новогодний торт елкой с подтеками	1	[{"added": {}}]	19	1
559	2022-10-29 17:58:14.027174+00	199	Капкейки в виде елки	1	[{"added": {}}]	19	1
560	2022-10-30 08:58:39.464592+00	200	новогодний торт с елкой(фиолетового цвета)	1	[{"added": {}}]	19	1
561	2022-10-30 14:42:58.870603+00	8	unicorn	1	[{"added": {}}]	22	1
562	2022-10-30 14:43:39.074818+00	171	Детский торт единорог с леденцами	2	[{"changed": {"fields": ["Tags"]}}]	19	1
563	2022-10-30 14:44:23.026248+00	12	unicorn	1	[{"added": {}}]	16	1
564	2022-10-30 14:44:59.25371+00	170	Детские торт единорог с шариками	2	[{"changed": {"fields": ["Tags"]}}]	19	1
565	2022-10-30 14:46:55.693196+00	128	Торт Единорог 0.9	2	[{"changed": {"fields": ["Tags"]}}]	19	1
566	2022-10-30 15:26:08.428069+00	201	торт Единорог 2 яруса	1	[{"added": {}}]	19	1
567	2022-10-30 15:26:23.536086+00	201	Торт Единорог 2 яруса	2	[{"changed": {"fields": ["Title"]}}]	19	1
568	2022-10-30 15:26:32.314213+00	200	Новогодний торт с елкой(фиолетового цвета)	2	[{"changed": {"fields": ["Title"]}}]	19	1
569	2022-10-30 17:07:54.909652+00	202	Торт Единорог с косичкой	1	[{"added": {}}]	19	1
570	2022-10-30 17:18:04.83387+00	203	Торт с Единорог без мастики	1	[{"added": {}}]	19	1
571	2022-10-31 17:54:05.729191+00	64	cakenuage	3		21	1
572	2022-10-31 17:54:05.731777+00	63	cakenuage	3		21	1
573	2022-11-02 11:47:26.530115+00	203	Торт с Единорог без мастики	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
574	2022-11-02 11:47:55.321317+00	173	Торт для девочки Эльза	2	[{"changed": {"fields": ["Discount price"]}}]	19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	sites	site
13	authtoken	token
14	authtoken	tokenproxy
15	core	address
16	core	carousel
17	core	category
18	core	coupon
19	core	item
20	core	itemvariation
21	core	order
22	core	tag
23	core	variation
24	core	userprofile
25	core	refund
26	core	paying
27	core	orderitem
28	core	mediacontent
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-07 15:56:04.819951+00
2	auth	0001_initial	2022-08-07 15:56:04.935296+00
3	account	0001_initial	2022-08-07 15:56:04.989251+00
4	account	0002_email_max_length	2022-08-07 15:56:05.002943+00
5	account	0003_auto_20220807_1855	2022-08-07 15:56:05.078528+00
6	admin	0001_initial	2022-08-07 15:56:05.113825+00
7	admin	0002_logentry_remove_auto_add	2022-08-07 15:56:05.12606+00
8	admin	0003_logentry_add_action_flag_choices	2022-08-07 15:56:05.139782+00
9	contenttypes	0002_remove_content_type_name	2022-08-07 15:56:05.161735+00
10	auth	0002_alter_permission_name_max_length	2022-08-07 15:56:05.174006+00
11	auth	0003_alter_user_email_max_length	2022-08-07 15:56:05.185626+00
12	auth	0004_alter_user_username_opts	2022-08-07 15:56:05.196442+00
13	auth	0005_alter_user_last_login_null	2022-08-07 15:56:05.207275+00
14	auth	0006_require_contenttypes_0002	2022-08-07 15:56:05.210078+00
15	auth	0007_alter_validators_add_error_messages	2022-08-07 15:56:05.222584+00
16	auth	0008_alter_user_username_max_length	2022-08-07 15:56:05.237997+00
17	auth	0009_alter_user_last_name_max_length	2022-08-07 15:56:05.249105+00
18	auth	0010_alter_group_name_max_length	2022-08-07 15:56:05.26183+00
19	auth	0011_update_proxy_permissions	2022-08-07 15:56:05.273109+00
20	auth	0012_alter_user_first_name_max_length	2022-08-07 15:56:05.284736+00
21	authtoken	0001_initial	2022-08-07 15:56:05.309746+00
22	authtoken	0002_auto_20160226_1747	2022-08-07 15:56:05.374679+00
23	authtoken	0003_tokenproxy	2022-08-07 15:56:05.378841+00
24	core	0001_initial	2022-08-07 15:56:05.850284+00
25	sessions	0001_initial	2022-08-07 15:56:05.87046+00
26	sites	0001_initial	2022-08-07 15:56:05.879221+00
27	sites	0002_alter_domain_unique	2022-08-07 15:56:05.890727+00
28	socialaccount	0001_initial	2022-08-07 15:56:06.039176+00
29	socialaccount	0002_token_max_lengths	2022-08-07 15:56:06.078364+00
30	socialaccount	0003_extra_data_default_dict	2022-08-07 15:56:06.09976+00
31	socialaccount	0004_auto_20220807_1855	2022-08-07 15:56:06.277911+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
igsi72dfipkaiex61duaej83i3k6rrf0	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nkpaM:LoPJcFhbcQaZl1aFdFiRtK6lKZZTzqoD092Woom_V7Q	2022-05-14 16:04:42.98786+00
mnqlipez3tji6yljlig9f1vesgbm4fxv	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nkqmI:tBW_TZCUu1-ZcJnwjj1JCYSHAz475dffs0trbkTBDS8	2022-05-14 17:21:06.441905+00
ds7t6lredo0nvtd28mhi068a48akqhf4	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nl9ln:1PVN6XVX1Js_EWG7hZTdJZUpbl5y4u-wnUEm2loHagI	2022-05-15 13:37:51.718375+00
4e9ow4f1xv6wk1438w7xo05bzlpcuxoy	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nlVax:wY4IJK3TrY1_3jGs1tocQgktApjZs8jZo_HaQRVUMKg	2022-05-16 12:56:07.639397+00
9wrqhbo3nk48e0wejlov2yqaksuudw4x	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nluRl:rVfRhEX41270Zb94NdtCDYV1lYQwVaWZQ-E7NRux4l4	2022-05-17 15:28:17.594091+00
qhh1p1mtifcrc6z6zxt6z8yptmurk281	.eJxVjEEOgyAQRe_CuiEiRcRl9z0DGWbGSkshUemm6d2riRu3_733vwIQS82r__Acx8jk-Q0xiSHXlC7CQ10nXxeefSQxCC1OWwB8cd4BPSE_isSS1zkGuSvyoIu8F-J0O9zTwQTLtNVOu4DUo0WnukazGi0iglXKtJoscGtC3xqDxlEg58hwQ3Rl3Rm2Gxe_P0aBQ9s:1nlxv4:sbf3EpHvi-OGSI0VXE0ijZPKw3re9GoHvW06riDrCZA	2022-05-17 19:10:46.101647+00
ldg122fx1ay6x54n4ahfoaso25kot94p	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1nly0W:rcQEGZ5pyN6M2_OWmZda4s7zbl-s74_fKQadoPEsvxY	2022-05-17 19:16:24.190711+00
5aak7jlbibbzqt2thur0j2ymt76lf1tl	.eJxVjEEOgyAQRe_CuiHYUUCX3fcMZByGSkshUemm6d2riRu3_733vwKJSs2r-_AcQ2Tv-I0xiSHXlC7CYV0nVxeeXfRiEK04bSPSi_MO_BPzo0gqeZ3jKHdFHnSR9-I53Q73dDDhMm01QLCq64zRymryQY3YUm8BNDE2TQcULGnd26vuzQYNK90YZRgBfQsgfn8a8kKC:1nmDJA:R1p7UnxgKNf-5H5FzIuAQOzCw3tdWBxASG2XJM17UXE	2022-05-18 11:36:40.374415+00
sb932qt3w3g4i0hxhq5vqapvo2p2yh96	.eJxVjEEOwiAURO_C2pBCK3y6dO8ZCHw-FkVI2uLGeHfbpJsuZ96b-TKHWFtZ7YfmFBMFS2-XMhtLy_nCrGvrZNtCs02BjezKTp13-KKyg_B05VE51rLOyfNd4Qdd-L0GyrfDPR1Mbpm2tRSDVhBBAWgw5EyUWiEgiR4jdRKF1xAGEEPnZfA9btH0IIU3SntB7PcHIPhCzA:1nmHXb:ldOUl9avnUglA5MsjO5FjS4ZenFStd28S1jEpsCVq6Y	2022-05-18 16:07:51.221625+00
l2b2zh4ahqjyef8blrwuuflwkr1ibt7j	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1nmWiZ:-sycIzg0N5ckRnueyBolVc9WZArKoGdrO7xOQYlpmGU	2022-05-19 08:20:11.732891+00
uuysp6u3qmta9la4uk05cjb9wfbb80ir	.eJxVjMEOwiAQBf-FsyHQQlt69O43kF1YLIqQ0OLF-O_apJde38y8DwPnSsubfVONIZK39IKY2JxbShdmoW2LbStVGz2b2cBOG4J7Ut6Bf0C-F-5K3mpEviv8oCu_FU_peringwXW5V8bLRDNGJz0QgKM4E1AHDqlhUFFU1BGay2Fkk71gB0oIjm6PigIoCfDvj9Fi0OT:1nmYst:hrvUyAdRrBopQR1J4RS2lywTY9YUXT1sylZz3UCFSA8	2022-05-19 10:38:59.735116+00
r371xfj3b1u8is4syk6kxhtngd9k0h8c	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nmfAE:ZdlkDOtWIFP_Frf8o-WY4NO4gOfm-xUtHkdKL_wXruQ	2022-05-19 17:21:18.968791+00
yv3ba8gx17uaz8txc11dc081jfq95aas	.eJxVjEEOwiAURO_C2hCg7ae4dO8ZCPA_FkVI2uLGeHfbpJtmdvPezJe5EGorq_3QnGIitPR2KbNraTlfmHVtnWxbaLYJ2ZVpduq8Cy8qO8CnK4_KQy3rnDzfFX7Qhd8rUr4d7ulgcsu0rQkAZT_QIEQUQkZQARWQjt54gmB0tyWqUY4KDXjoAvSdICNQQ5RKst8fKs9CiQ:1nmhHU:AnKZbgEK9Gv5b97y4j-m_Mz7movjrdIze6uv0cmuLBc	2022-05-19 19:36:56.05541+00
ooy58mhx5ek3x6m1x1r1bv0dj7y6oz79	.eJxVjMsOwiAQRf-FtSGW8nTp3m8gAzNYFCFpixvjv2uTbrq955z7YRBj63X1b5pzyoSeXpALu9Reyol56Ovk-0Kzz8guzLLDFiA-qW4AH1DvjcdW1zkHvil8pwu_NaRy3d3DwQTL9K_HlKwMTimnAiaTKIITGiCcSWlhcDDBwQACjdYY5aAjjKOQOlltEaRi3x9XQUOt:1nmv4o:djxWMQiuS2lrQzxeWUSIWaBytY9VTtyyIgVvPAkMYkQ	2022-05-20 10:20:46.598454+00
4995l4sq87wb2flidvmmh0whmbwqao34	.eJxVjEEOwiAQRe8ya0MgpYV26d4zkBkYLIqQtMWN8e7apJtu_3vvfwC9r61s7s1LiomD4xemDFNpOV_AYdtm11ZeXAowwQinjdA_uewgPLDcq_C1bEsisSvioKu41cD5eringxnX-V8b0tFqSXboiO2ARrJRVnmJGHmUJnZe9gqZQq-ox6gtYVRMzOgHqzV8f00LRFM:1nmvfP:HUhP7dFp5UYt3O2r972-bMx8vHWDUW6f3AsBtnBhido	2022-05-20 10:58:35.402732+00
auwv41phqpl4nibmdn063wj8uqutaaws	.eJxVjDsOwyAQBe9CHSGQ-axTps8Z0C4swUkEkrGrKHdPLLmw2zcz7yMCrksJa-c5TElcxSgux40wvrhuID2xPpqMrS7zRHJT5E67vLfE79vung4K9vKvPZkMRhG4gRgcesVeg44KMfOofB6ishqZktVkMRsgzJqJGaMDY8T3B_ihOO0:1nmw4O:kqyvygA_29ZjP9em63JvKGL5NB719_GSez9R42irtI8	2022-05-20 11:24:24.064015+00
qcalvycv8zvckt7j139ycw6daww5hvjv	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nmzOv:MZoqcLqJ2FbAyY6yqCRe3PSFNAPcyZXePZ6CtcV6L_o	2022-05-20 14:57:49.386084+00
gsxv3itzrsyve6edsado879goykmf7vd	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1nmzfe:PhgEvy86RZHgrQNyWblMW7inKXArcVUMQ1xe_5jUVXQ	2022-05-20 15:15:06.746725+00
eqpfofrsbxawcusetq3c8d8041jazzeg	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1nmzik:tx6wAixke48woByQBh_1xCw3LGiZFO8G8-bnGIurfd8	2022-05-20 15:18:18.039502+00
dixqsmo158ec1jkddmiumahyq6eyrwny	.eJxVjEEOwiAQRe_C2hCgtDAu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWWonT7xiRHlx3ku5Yb01Sq-syR7kr8qBdXlvi5-Vw_w4K9vKt2XJmrVIcsspgrJ48gCbv0BFPFHnEpIwZ_GgBtYvsEQjYJiaIA3vx_gAdcjjY:1nn4UF:efKPPcuktb-oBNRoTofLGzPwRTFVc4d8kj0Qy9uEQxo	2022-05-20 20:23:39.415042+00
9hl5cf9uacqkwq3yw8i7gdpr9gym0hdc	.eJxVjEEOgyAQRe_CuiECVsRl9z0DGYaZSksxUemm6d2riRu3773_vwIQp1pW_6E5caLo6Q0pi6HUnC_CQ11HXxeafYpiEFqcWAB8UdlFfEJ5TBKnss4pyD2Rh13kfYqUb0d7OhhhGbc1GCaHLhiGTnUuQNNYjQYtUas2SD0yB4ugQV1N37BWbCypNvasg2vF7w9h5UQi:1nnHdW:uPtJ1djrZAJhX5Skbn-GLI8qO2I30_HjoBxkjZnDdPo	2022-05-21 10:26:06.40727+00
30218w9ie5x72ucyfsofd1koojta4ntb	.eJxVjDsOwyAQBe9CHSGQ-axTps8Z0C4swUkEkrGrKHdPLLmw2zcz7yMCrksJa-c5TElcxSgux40wvrhuID2xPpqMrS7zRHJT5E67vLfE79vung4K9vKvPZkMRhG4gRgcesVeg44KMfOofB6ishqZktVkMRsgzJqJGaMDY8T3B_ihOO0:1nnd7q:U-QPc_Po4JYrukCGmVTRpF6eH1pU-0OBwuQUaPnJ5hM	2022-05-22 09:22:50.447888+00
gl807qjgrntrfq5p3cmmgqop9kv9c6b1	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nnjTE:io68mqBQQQ2VkCke5p3v2jtODv4rmyTG0VixO0Yz_jA	2022-05-22 16:09:20.692913+00
d67j6xv8ay9h2wtjegpk4yqb9j11akfz	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1nnnJG:D3IEQltCN-ygPLxN5lgHl7vX3xhkicdy3ZD8yxwDO7A	2022-05-22 20:15:18.953175+00
fgdquzjcevwenpx3z49p5me17jtmhqd6	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nnzlS:KOvNdSaS6mRdeOvIcyoAPPjV-zN0ltjHmsJCfkkZ7UE	2022-05-23 09:33:14.903572+00
7r0yzcexaeu8e8ztixln0xzn2p1we2z8	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nojP5:dk6ABB_RsVmqXz8tdn8P_8UFFWN1NI4T9LF_96RYINs	2022-05-25 10:17:11.10439+00
87dmtgtpin8prbmo5g96p4yh3m552q1b	.eJxVjMsOwiAQRf-FtSE8pGVcuvcbyACDRRGStrgx_rs26abbe865H4YhtF5X96Y5p0zR0QtzYZfaSzkxh32dXF9odjmyC5OSHUaP4Ul1I_GB9d54aHWds-ebwne68FuLVK67eziYcJn-tRGEILVVSRkcADQZYbRNqDAMyts4orBKCyCklCygSJJAwzlGlKMH9v0BVhZDdA:1npt1N:s4PFTfnV2rgz-_xklB6bVuLUe61WWY0pUtMWqHBaTWo	2022-05-28 14:45:29.811896+00
wtkx3firfiy92o05estbn434eqms6ol6	.eJxVjEEOgyAURO_y1w0BhIAuu-8ZCHy-lZZCouKm6d2riRszu3lv5gsesbayuo3mNCaKjj4-ZRhKy_kGzrd1cm2h2aUIAwgDlzJ4fFM5SHz58qwMa1nnFNihsJMu7FEj5fvpXg4mv0z7mivsBUbU0SotTUe809wIE_agHbUwKnKlSXFCTp2QAa3yvdZWElpp4PcHTf5CrA:1ntWW2:qXyamwQirVNYQ8JkluYJQPU7lLrW-nnfPJjTFlnQ-mU	2022-06-07 15:32:10.913206+00
am8ylgx0o3g3yzel75zcci24lp4b390e	.eJxVjDsOwyAQBe9CHSHAJv6U6X0GtOwuMQkByTZpotw9seTG7ZuZ9xGAWGre3JuXGCKT4xfEJMZcU7oIB3WbXV15cZHEKLQRp9EDPjnvhB6Q70ViydsSvdwVedBVToU43Q73dDDDOv9rsFYpjzgEUBy09S01QREY32kaIDTUGzS6ZwqDvVrqsFOEqNgwNK0B8f0BkgpEng:1nqyDn:3xPg7wRpHUNagHzodvePKMjpxpuP9R96XWFwxt9Qv0A	2022-05-31 14:30:47.023219+00
b9mvov8xkekze09dgx6xl345sh7t716h	.eJxVjDsOwjAQBe_iGkXxN05Kes5grb1rYjC2lMQ0iLtDpDRp38y8D4MQaiube9OSYiJ09IKU2VRazhfmoG2zaystLiGbGLfsNHoITyo7wQeUe-1CLduSfLcr3UHX7laR8vVwTwczrPO_hpETWY7cDhqQjI1mlDoqspoGKaWRfZBqiEKHaIIYDXq0qiejhPVBWPb9AWVRQzA:1nuA8n:L4RLfqx5h5j_U6IFpXW9p9HrVF91W9AwNqTqcYAwwR4	2022-06-09 09:50:49.663559+00
lx2ztsevwztbgibdb2bk1x3u2j51p99y	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nr0bU:3XMJl67q4Cqc6dr4OS0vQHxaiWJ3tH_oy2GGuVCcRfg	2022-05-31 17:03:24.305076+00
ud5cgc2aba9emczx9k6oo1i427p4hbsy	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nrBpg:4HnDFmu-2eJmWsa45LsQZaDuqYIpb4eRAJY7sQGMrsM	2022-06-01 05:02:48.518093+00
zg2xjqmev7dh4mm00zuk2ykbvs23f1pu	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nrwLh:hlAf0DaBL0lcx04DOWIYFESGfTYHkIJKoJ2BA-xozBU	2022-06-03 06:42:57.099576+00
v3is8oyyg4oj9oaaz06m8w91d64pl7si	.eJxVjMsOwiAUBf-FtSHlUR4u3fsN5MIFiyIkbXFj_HfbpJtuZ-acL4EQWq-r-8Q5pxzRxTfkQq61l3IhDvo6ub7E2WUkV8IEOUEP4RXrbvAJ9dFoaHWds6d7Qg-70HvDWG5HezqYYJm2tUQRmVcGrVVGabRSj8pvCIbEOQ7INAtCAKKUQ2ImBM2jNYanwMcEmvz-YHVDdw:1ns46i:d5tIvJeCxuLTC2dp0cKDxKjeG1yfI7JYcnqfBWxtoOk	2022-06-03 15:00:00.631692+00
7uyctqp5tsnv5au65u5ra1wiojfpdse8	.eJxVjMEOwiAQRP-FsyEFCq09evcbyO6yWhQhocWL8d-1SS_N3Oa9mY8AotLy6t9c4y1y8PyCmMSUW0on4aGts28LVx-DmITqxaFEoCfnjYQH5HuRVPJaI8pNkTtd5LUETpfdPRzMsMzbWtPoyIIDY3tW5ODMhgABdcfaGYXDiLbjzhEAk7OKEYIZyGjkf8T3B4w7RPE:1ns47U:HKbekSbv0ma6GelQ5WSkXDrDQE856SgWYnDc_98oyNg	2022-06-03 15:00:48.403709+00
frmq9pvuxsqmons1ctuqwglts1hoj0wm	.eJxVjEEOgyAURO_y1w0BFRCX3XsG8oFvpaWQqHTT9O7VxI2bWcx7M19A70vNm_3QEqdIwdIbY4Ih15RuYLFus60rLTYGGEBIuJQO_YvyQcIT86MwX_K2RMcOhZ10ZWMJlO6nezmYcZ339aSkU72WXetlrxrjhZAthR6F2qPpFKeOkyEuhSbaLcMpaKO45q12iPD7A0XaQrY:1nsMmv:1Ct-OngyroYEnNRX-6ZrsHpjDKM6B4_o6c9PcwDiPic	2022-06-04 10:56:49.397526+00
h7qcuro1x6uqfhfxpea7dtq3sc0zwhro	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nsiNq:xLBDbZXILKywakVOyAmqZ_Hds1DWx5vZnVh-WVyDz7U	2022-06-05 10:00:22.183599+00
xy9y10gnxbjjy93zfc6lk76us13i242v	.eJxVjEsOgyAUAO_CuiHyV5fdewby4D0rLYVEpZumd29M3LidmcyXQYy1ld1_aE1zIvT0hpTZWFrON-ah7YtvG60-IRuZGNgFBogvKofBJ5RH5bGWfU2BHwk_7canipTvZ3sZLLAtx9c6I6h3opNESqGzIJRVpDqS2sWAoBA7aUiTjkHrwdg4SBNmcL0QBtnvD05DQwU:1nvYCi:yuOI9ZXguA_j7WQbYFZQwMRcT3jhyPrKCj7V5-WJhaA	2022-06-13 05:44:36.038532+00
9ezbvbvwenmkeswdnktcrf9sk3rxbbn2	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nvdOs:3rcHk2zdoKIrJwI0XaXsi5pEHudAma73-pDSlufV7xk	2022-06-13 11:17:30.162436+00
0xiiy6bdvdn9lqj1eyfqrfjj49zwb5hg	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1ntsin:7i04wyCp9LEmY2tIA2HychN4YDGFbtZ7CWTQg6roEvw	2022-06-08 15:14:49.79729+00
8yghwirozhaeg47uhsybz8zn22vk5i3v	.eJxVjMsOwiAQAP-FsyEsz-LRu99AFnaVqqFJaU_GfzckPeh1ZjJvkXDfato7r2kmcRYQxekXZixPbsPQA9t9kWVp2zpnORJ52C6vC_HrcrR_g4q9jq8PDngKoDSzMRQ8gvGGjWJtQ8mEhkhpx5ZtydZG50vULt8wTACOxOcL7nM3nw:1nveHy:tMZwhBciVWRlHlbjHneTs50IS7cAWAMbcrdMFwFW_Qw	2022-06-13 12:14:26.179252+00
da78qrail676g3okzpac07zdkw05izwg	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1nw5RR:4oECXuh3w5sAhp7u1iI5CEbWSHKtdPvWjdS943LCgpE	2022-06-14 17:14:01.535485+00
fxb5t29itxh3r9s9r8hmhnmr8wbbs87r	.eJxVjjsOwyAQRO9CHSGvw8e4TJ8zIGCXmISAZJs0Ue4eW3Ljdt6b0XyZC6G2stoPzSkmQktvlzIbS8v5wqxr62TbQrNNyEbWd-wUehdeVHaCT1celYda1jl5viv8oAu_V6R8O9zTwOSWaWt3wguIasDhKg1qORgvek_YoZdGq2h6hyC1BNDXYMAHACGUEg4jRdhe_f5O00Le:1nwFaP:t6TC2HlJMQAiCmfiwhHzNAttvgm8blvK3VImgHTnlsU	2022-06-15 04:03:57.312156+00
a1zgkstpd43vj84ttesqhib1l9xpgsso	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nwGBD:Kx9MwIN6y_832lNswhrWBEATY7xy6QpBbpkM6eOyiZU	2022-06-15 04:41:59.548777+00
wu4d11axe94fmv43eq0w39oik1kb9m51	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nwGs9:PeW9QO7RdSJKm_PLY7VRs3tOmXVw8bJh0mnzz5vU74k	2022-06-15 05:26:21.855517+00
ya9y3xf3s1bp71eztxpkqlkdn6atrr6o	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nwKfh:9L46NH-aLtJpUmeZccJcqklnsammmxifLpyaUDczikE	2022-06-15 09:29:45.731263+00
r76mmvgvxyzsf1lliuczf0c8cw2ua3mq	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1nyrNS:wiSfrnW0_3P_pQVmUpXb5d3OJAJEhXL5Mb6hJ0JKKnw	2022-06-22 08:49:22.257055+00
2wq81du4ileqke5txyua1fzrvfeg8kxi	.eJxVjEEOwiAQRe_C2jQUoR26dO8ZCMMMFkVI2uLGeHc16abb_977b-FDqK1s7sVLionJ8dOnLKbScj4J59s2u7by4hKJSaheHEb04cHlT-juy612oZZtSdj9lW6na3etxPmyu4eD2a_zr7aDlIq0YskskTAigbdIGsiCxEEa1MCWtAEdgEhZY5Qd7XmMIUIP4vMFdi1Diw:1o11NB:ztv4zRoCERvOy5YHAjBR6Ah3XMcaquGkwHT9qBymmqE	2022-06-28 07:54:01.874306+00
s2ze78kalueq1629n213nufd3g72hp3j	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o1OBb:bYM5B5i0N1rzB8N6DEp74b5SIMW6MH2RFv5179-2lZ0	2022-06-29 08:15:35.728031+00
yrtlv16xp2ly9rh7ivlvcpymxdh74k9n	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o1UQk:iZnH9F76FikyEhVTiAvWW4zWWV-wcECLyo1QFY2lffA	2022-06-29 14:55:38.990643+00
6odfvp62fp83unif5lxqmx4aralvl9b0	.eJxVjMEOwiAQBf-FsyECpdAevfcbyLIsFkVI2uLF-O_apJce35vJfBgg1lY296YlxUTB0QtSZmNpOV-Yg7bNrq20uBTYyKRkp9MDPqnsJDyg3CvHWrYleb4r_KArn2qgfDvcU2CGdd67gOTBy04ZEUM_AFkj9X92iGBjGJQmLwX0ypJHo4URCFcbjTGocNDs-wOACUPM:1o1Uq5:qEMskwHNUyqaz2HNMz_B1d91x0Jrus6u1GFarzccyAQ	2022-06-29 15:21:49.260888+00
lc1ebqmfgcy29je9sm6mgtbpt46fe4nb	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o1rBh:WOa1ua8OlIUwotQ0u9OVf-KPoMbdkAoRi8cEfDOniog	2022-06-30 15:13:37.894139+00
g369yk7nd6jptwm37p47gra2kmzvw2jo	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o2btn:CrV-7I2T1xkjo9gaSS7Pg2zZssmCg98eNTbjGWp510Q	2022-07-02 17:06:15.550167+00
ifujk1fzkg3d0k08d2goqo5hg15fnovi	.eJxVjDsOwyAQBe9CHVnmZ4zL9DkDWtglJiEg2SZNlLsnlty4fTPzPgxCqK1s7k1LionQ0QtSZlNpOV-Yg7bNrq20uIRsYkKy0-ghPKnsBB9Q7rULtWxL8t2udAddu1tFytfDPR3MsM7_WnpNqEgqIXkIUaEwYNWgo7DcD4M0modeGuSjMbG3I2hhUY7WkwWJ0bLvD1XKQvU:1o6WDV:GZitomHS2hNeP_KRSUgY2ElLmO3usQLSql4XyZn_zwg	2022-07-13 11:50:45.76786+00
fligvf1bsne1vsptyhgid4ux85qonpb1	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o6p13:bbmQdoSLBfM9_b7Pt7KOlIbCB9MMQjaJ1dp8jVKnAE8	2022-07-14 07:55:09.689872+00
dxs1r0vkpk683wnqegqg39vj7ey1bjvd	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o6p6i:bilpvY0Rl3dYSCXgO0GBj-SZdw9jx-wOaBIgq2DTjZg	2022-07-14 08:01:00.320785+00
vjzux4hbji62tmh0wqwnqscbttmrzl91	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o6p9u:w9aR43heIbE2U-8WDfYbAeW3m48K3XWK9NDl53so850	2022-07-14 08:04:18.402631+00
9vfnebtdx9126vbe5e9ak8gcma8diy7e	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o6tx2:kmyNbT5KHtcxTD4WVDDVhMdo9OBaZ3Qm-YDSLDOIzXg	2022-07-14 13:11:20.115933+00
opl7b42avlru1a7vn3orsz5zc9ox0sei	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o7God:jxAiYTVHXuumhycOHcCf9iiZaqMsvX_OXHZAFHu8_cc	2022-07-15 13:36:11.280563+00
mxela8t5jb31rtb8vz8bpgxxv8zixd1p	.eJxVjEEOwiAQRe_C2jRDoShduvcMBGYGiyIkbXFjvLs26abb_977H-ERayure_OcYmJy_PIpi7G0nE_C-bZOri08u0RiFL0WhzF4fHLZCD18udcOa1nnFLpN6Xa6dLdKnK-7eziY_DL9axUlROLeEpjLmQMHA1GiBAOkSdkAKK2yGgMotBAHiYEHMlr2qK2N4vsDcfFDkA:1o9Qkl:rwfvND2nIjiLIWjseRdkjwT7xgfN9TuUxc7XV6v5X68	2022-07-21 12:37:07.928736+00
ktpnl1c0mvd9uw36wfkt11qhfilx7rj9	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o9WYz:d99ZJZRXgqkag-hlvPn-574T0ME2tkzcg0nz925POVc	2022-07-21 18:49:21.341951+00
dmtb0w1t1nx7f9iegl67ciznjvoq6k6q	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1o9g4k:VBiP96jAB_uKEsFU_f3w20q4GCpQiaj80x0fxJDH6wU	2022-07-22 04:58:46.402851+00
h2rtcm6vbfsymbct1nrmh9cfvup76m8z	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oBBLz:e-0N9SB-_yEiiubVQIEKMMJiWg1-ojL7TWESnDx6xSo	2022-07-26 08:34:47.607998+00
6ng5eyndq07d6s3l1cpdcv9uwgv041k8	.eJxVjEEOwiAQRe_C2jQdoIJduvcMBGYGiyIkbXFjvLs16abb_977H-ERayure_OcYmJy_PIpi7G0nE_C-bZOri08u0RiFHIQhzF4fHL5E3r4cq8d1rLOKXR_pdvp0t0qcb7u7uFg8su01UYFAKIYgh4CAWhvrToTge0ZrWGjQwyXDSmSXpkIiNFQL8FKqwF78f0BhElD7Q:1oBFRi:B0oQ3sNh5Sl-Id274IYs4XvW1mmK3j4QbgZuMdC91q8	2022-07-26 12:56:58.138203+00
td3rqv8t4jz5cm6nypvcr9xb2jkc6yj1	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oBFY2:Ws_sy0FnWuxCxFvwLvPaTbDiFdgzHkOrXeyB7MB9AfE	2022-07-26 13:03:30.496417+00
u6nnd61z8h06sjeoheikdijn84w4ajp6	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oBFaI:nbstVt2b-P8Gh5moWvjKC49kTjIYq_92z7fPFK82LNw	2022-07-26 13:05:50.279449+00
91qnr3wixfus3kwkr6lnw25mhlmgajkg	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oBFcx:ol_KE49vFj4gGn_TEcuexQgmrI8ut4QGo8D-cu7lLhs	2022-07-26 13:08:35.352433+00
d2p7sdwj8ys6odgjm8rgvx03pg806xp7	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oBFeS:2PG11xO20DQhkztFTUi3oxxdQrDTu2JIe1CMnFT-NTc	2022-07-26 13:10:08.921262+00
f70rw3vdgabllxrgidy98s1dulvzinx0	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1oBFhC:ebyeXWaVMu5sQSz0ZrG6UW0-trr-81mqZ0RqRfUw9FI	2022-07-26 13:12:58.517075+00
u9cnyegtb05cd88knvrfp7inz9kkux3m	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1oBFhr:EzrKpaZfGwZs3FI_mTWJWzU9OprAHbLFVHrr3ClVvRc	2022-07-26 13:13:39.919874+00
f1kv2c45fvhqm9v1e2nlaqkqf7jdxfff	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1oBG6A:mtkHcl14Qm0VCRORcUG1eI9A76UUXjHk80RebAayAJU	2022-07-26 13:38:46.202256+00
i84oxxzgr380gqlyc7dqsziveelpdetv	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oBWT5:lIsMMn1XoYheVYiXl57cuUgAbZX86fwNexVIreneyaY	2022-07-27 07:07:31.30373+00
f26tpyha9zs1uck34oqxiw9cdoi8jwo8	.eJxVjEEOwiAQRe_C2jRDQaAu3XsGMjBTiyIkbXFjvLs26abb_977H4Ex1lZW_-Y5jYnJ8wtTFpfScj4Jj22dfFt49onERfRGHMaA8cllI_TAcq9drGWdU-g2pdvp0t0qcb7u7uFgwmX61zKGKIGUhV4aA0As7dmxUWpA0EwatVLsQEmreCAmpx0EQrAjB0VRfH9NLkNV:1oCGlN:gkJAeKuvRpKMxsXwhsz0_2ZorUivHPrR53ONYv7wtUk	2022-07-29 08:33:29.717053+00
9uhktwd1kolozms0vib7vjb042y3vdqu	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oElSA:PRpvwCbVKuJMhuE-uFqEW4_nEw2QZ9g-4z33vCXEErk	2022-08-05 05:43:58.11361+00
i47ij0apre5tp5hxbld2drrxo3z1uris	.eJxVjDsOwyAQBe9CHSGD-RiX6XMGxLLrmISAZJs0Ue6eWHLj9s3M-7AQY21l829a0pQIPb1CymwsLecL86Fts28rLT4hG5m07DRCiE8qO8FHKPfKYy3bkoDvCj_oym8VKV8P93Qwh3X-11GjE1YhQOxRg7MOLOhpktIa1NLgYIXUQ09gAECgwE50gJ0SDlREw74_erNDxw:1oFCf2:RJdPEC7FgQ7Wu4MPVd_6rKu7-9SbtAlx62_NwzN6Xpg	2022-08-06 10:47:04.439441+00
b0xu4iq45jh930noarbyk4fxiidswvtx	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oFD8K:rDxmUiqTrQ6bHHztYhyqN49xrTPUn9mBH31eD0CE7bY	2022-08-06 11:17:20.96373+00
d3y1k4fhsci3avkfda974j6hnz27wai7	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1oHPh9:HxCgQQIvfZSxG1Z1Kvl6GLPmIThRX2mUQA0jjOv8Vps	2022-08-12 13:06:23.601861+00
9sva6zr3smmy720x3jnmwaosirfz9vm2	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oI6zn:fvCXSTConZK7vPtrQQzqx6FuJjnqxH_fbI9j8y5Pqb8	2022-08-14 11:20:31.679998+00
o9s3jgz64yrszp883l1myo65s6ic4zvo	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oITg7:-Mf5JgHepV3iRyy9F6dukjmDccJwvADPw1H1sUSq8wo	2022-08-15 11:33:43.613393+00
hywopjwphxxkz2mf8d4qoqakw889oolq	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oJq9k:oqtSpok1uiKRPUIyDmTiaS5swcKL1qRJ4z-bNAYI-18	2022-08-19 05:45:56.448469+00
91j8pijkibgtkc7gfoo2oznjhn4vlzdd	.eJxVjMEOwiAQBf-FsyFtgQI9evcbyMIuFkVI2uLF-O_apJde38y8D4MQaiube9OSYiJ09IKU2VRazhfmoG2zaystLiGb2GDYafQQnlR2gg8o98pDLduSPN8VftCV3ypSvh7u6WCGdf7XGrpAAgXYTkGnfPBKCoXagugBRhxoNEp4Ew1ZNF4LPcjRgoy9isYgse8PdLNDrw:1oKPZ9:gqOepUg4Pk4RzBqXruZlefnsfM6E3sKg_u5EzrB40R8	2022-08-20 19:34:31.816358+00
8vtd59t9ny5vc1vpl7wcf6l4d2ax2i6t	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oLKFW:ezg9gT0SSC4TZ-u5FcoPhuZGOxoVdm5BPgUh4RwIbq0	2022-08-23 08:06:02.173532+00
qwgkywtjs5cr0oh5ub7ym3ho6bvvht6a	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oPrwl:2x-P-n3tXgeG8DuV2PAo_f3-BwrocBSLXfRw2h43qJE	2022-09-04 20:53:27.861835+00
djk2e72s4iu5g1rwbl2up3zjr93tk7b8	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oQ5CP:yhA9G8yPdd56EdIGvdIMrgcmmQHRZCJLPIxqit6pKqo	2022-09-05 11:02:29.627657+00
j1i2avec1m9l1bjj7th3jbaculnqxpua	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oQ60P:QHtHBJ-b-AIMcXKUrM249ep1sNXp_Iwz924e5W_PYKY	2022-09-05 11:54:09.639797+00
n8xoj587oqv0liy5gopn2etjf9y6l8t7	.eJxVjMEOwiAQBf-FsyFAAcGjd7-BbNnFoghJW7wY_12b9NLrm5n3YRBj63UNb5pzyoSBXpALu9ReyokF6OsU-kJzyMguTHl2GEeIT6obwQfUe-Ox1XXOI98UvtOF3xpSue7u4WCCZfrXUhpvrXIWjRIoRBKelASpAZxDAdYnZVEqJDIxSUAY9NnqIflo9OAS-_4ASAlDCg:1oQYHX:8NmZrTHDWM5kCIeVHTrJNXRP6bCORRZXwfrY9oPTQMA	2022-09-06 18:05:43.43864+00
9cl0fkzqk7a27vtaycbgo39h5rq8zk6y	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oVbNR:h0BKBW8M1NCCtYHZyRfZNDCwGI-fxytmX8DEZa0Ao9Q	2022-09-20 16:24:41.770101+00
pb4xk8oncsrha9vtue4j9a2ozhph5xbz	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oYBJn:-4-lHhUIWRUqS3rZLPAU8UxF3qkvtlJ_KCZsiy6dPrI	2022-09-27 19:11:35.594136+00
6v2s5zpor4uni3w0hot123np9kmzn1u2	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oYrCp:_Zns-BDlyuPR2Yc-MjsUA9NTTxT0i1ByPZJL-UzNbJk	2022-09-29 15:55:11.180433+00
u37v90mfzel8y7gsfihe0dmdv43vph5z	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1obQ0K:9O93TrhTGra-F9kgyP9EdPNhjGlAMQl2OK8JLgjiYnM	2022-10-06 17:28:52.015376+00
dobexd190bh19k2810tu1hzqw6oo8yl6	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1obkXF:Nfig0HoOSbQhrKovA8QzCvM9I-0vVaZT7g44ZOqqr9E	2022-10-07 15:24:13.334154+00
6aophc1o7l9c16d3s78wv6vg1gekah9i	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1obyWo:nQXrHY2CHAJclLAZOWndXBLDlzieWARZ4TajUPvbiIg	2022-10-08 06:20:42.22431+00
7m6elz42p69o06x7v8x2focp8b00bt4b	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oc292:vgay_VpbaXAqnxXzKMElyf8JeIOJ3RV86bsXKulrXO0	2022-10-08 10:12:24.044418+00
9ue7wg14ud6m4kj09y3nac5ciqvoenou	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1ocBXx:A8uoyXfh2jeB8O53AULZ_FSX5D-X_fgOdaFRXrItmCc	2022-10-08 20:14:45.452942+00
d2os0c36pikkkjxotpfszqkuqugieksi	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1ofOU1:zgQVLgeQv2XyREwPxJI7MQA4WhycHudQaGvSS1TVZmo	2022-10-17 16:39:57.60416+00
9cm3a64vj9wlctedtw2yguwzp3y46vh9	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1ohOfl:8he6OnmX_epaEeYCwpzTjwbYQF1m-IV6vyJxkrViY0E	2022-10-23 05:16:21.034668+00
z02j0e3zmzczs5mzcs9lbtak0hjlbzy9	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1ohmtN:Ecihv4QBra0GjPBNzCaeK2oyGXEWcLFTLuxyC3Q5lQc	2022-10-24 07:08:01.360555+00
cekp9w9zy6behougsdvwkuplx7sm9e84	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oicwU:oW2vjVosvLY4Jg17UUKDr3XkWreqkVPd-nxK7GhP73Y	2022-10-26 14:42:42.799611+00
v51q5tuijs7ugpvwrjdbxys6zidt61r3	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1ol65r:e2u1f9GoF8Msc90igcmrbClcyb5VRblCNst8U4hyTJ8	2022-11-02 10:14:35.016566+00
seyphxh35ij8jrsct0mjp95dzy2gpvqz	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1omEAd:bWM6a2RI9wuvp7XBjtc1JaPjDJZ1cO5BpPahInyWd5k	2022-11-05 13:04:11.076215+00
u36hgc89bysf2ipscc59tcn685rlah78	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1opX5q:yc7BBpxlZlcdvSOvPz314SA0hLOlAb5FAu9wUq8-kP4	2022-11-14 15:52:54.650221+00
2q2vzcrsw1jwbmiq8e8nutfvsr74zo9s	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1ompVn:0Epc1ToNyeN5JsZVWdRAGSrtoISy0nK4KHJRAWonCK4	2022-11-07 04:56:31.275461+00
sduoduw2c0h9fugdwsl9mpvcnol32h2c	.eJxVjEEOwiAQRe_C2pACTiku3fcMZJgZpWogKe3KeHfbpAvd_vfef6uI65Lj2mSOE6uLcur0uyWkp5Qd8APLvWqqZZmnpHdFH7TpsbK8rof7d5Cx5a0OLiTigTwF03dOzM0TEXpjwDr2KBbSYAEIAicOgUE65rO4HsRvXH2-8hc4dQ:1on3nW:hH0HTZ_UTDVCi4LetFgYLqDnkxzGotP_2kv8puwCSqA	2022-11-07 20:11:46.915215+00
7jogtbj8n27fe60j5vzkbh6o5tk7rang	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1onwoj:vFpPkKfeCRS_FGwsYX79-y3YqQefO8Tt2bvHveof50c	2022-11-10 06:56:41.188411+00
hukpuy9olzzo4y9rqm5lyaruoidqj1el	.eJxVjMsOwiAQRf-FtSHDYwRcuu83kAGmUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxEXocTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpgLP6-H-3dQqddvjU459IkAUwAbgAolg2NmcgoNKJ3JKwTj7VmPtgTSwVvDYDgjobPi_QHGLzcB:1oo6Nm:zZxjHMUu699vV5iqbpQseY6F8tWrcAmEDcR4FYqsBgI	2022-11-10 17:09:30.051478+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.django_site (id, domain, name) FROM stdin;
1	cakenuage.com	CakeNuage
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: cakenuage
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 28, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 29, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_address_id_seq', 10, true);


--
-- Name: core_carousel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_carousel_id_seq', 12, true);


--
-- Name: core_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_category_id_seq', 8, true);


--
-- Name: core_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_coupon_id_seq', 1, true);


--
-- Name: core_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_item_id_seq', 203, true);


--
-- Name: core_item_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_item_tags_id_seq', 38, true);


--
-- Name: core_itemvariation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_itemvariation_id_seq', 151, true);


--
-- Name: core_mediacontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_mediacontent_id_seq', 5, true);


--
-- Name: core_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_order_id_seq', 64, true);


--
-- Name: core_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_order_items_id_seq', 147, true);


--
-- Name: core_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_orderitem_id_seq', 135, true);


--
-- Name: core_orderitem_item_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_orderitem_item_variations_id_seq', 27, true);


--
-- Name: core_paying_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_paying_id_seq', 2, true);


--
-- Name: core_refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_refund_id_seq', 1, false);


--
-- Name: core_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_tag_id_seq', 8, true);


--
-- Name: core_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_userprofile_id_seq', 29, true);


--
-- Name: core_variation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.core_variation_id_seq', 31, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 574, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cakenuage
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: core_address core_address_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_address
    ADD CONSTRAINT core_address_pkey PRIMARY KEY (id);


--
-- Name: core_carousel core_carousel_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_carousel
    ADD CONSTRAINT core_carousel_pkey PRIMARY KEY (id);


--
-- Name: core_carousel core_carousel_slug_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_carousel
    ADD CONSTRAINT core_carousel_slug_key UNIQUE (slug);


--
-- Name: core_category core_category_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_category
    ADD CONSTRAINT core_category_pkey PRIMARY KEY (id);


--
-- Name: core_category core_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_category
    ADD CONSTRAINT core_category_slug_key UNIQUE (slug);


--
-- Name: core_coupon core_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_coupon
    ADD CONSTRAINT core_coupon_pkey PRIMARY KEY (id);


--
-- Name: core_item core_item_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item
    ADD CONSTRAINT core_item_pkey PRIMARY KEY (id);


--
-- Name: core_item core_item_slug_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item
    ADD CONSTRAINT core_item_slug_key UNIQUE (slug);


--
-- Name: core_item_tags core_item_tags_item_id_tag_id_b2f7d232_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item_tags
    ADD CONSTRAINT core_item_tags_item_id_tag_id_b2f7d232_uniq UNIQUE (item_id, tag_id);


--
-- Name: core_item_tags core_item_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item_tags
    ADD CONSTRAINT core_item_tags_pkey PRIMARY KEY (id);


--
-- Name: core_itemvariation core_itemvariation_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_itemvariation
    ADD CONSTRAINT core_itemvariation_pkey PRIMARY KEY (id);


--
-- Name: core_itemvariation core_itemvariation_variation_id_value_3a9982dd_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_itemvariation
    ADD CONSTRAINT core_itemvariation_variation_id_value_3a9982dd_uniq UNIQUE (variation_id, value);


--
-- Name: core_mediacontent core_mediacontent_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_mediacontent
    ADD CONSTRAINT core_mediacontent_pkey PRIMARY KEY (id);


--
-- Name: core_order_items core_order_items_order_id_orderitem_id_f9cea05f_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_order_id_orderitem_id_f9cea05f_uniq UNIQUE (order_id, orderitem_id);


--
-- Name: core_order_items core_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_pkey PRIMARY KEY (id);


--
-- Name: core_order core_order_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_pkey PRIMARY KEY (id);


--
-- Name: core_orderitem_item_variations core_orderitem_item_vari_orderitem_id_itemvariati_d2dae736_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem_item_variations
    ADD CONSTRAINT core_orderitem_item_vari_orderitem_id_itemvariati_d2dae736_uniq UNIQUE (orderitem_id, itemvariation_id);


--
-- Name: core_orderitem_item_variations core_orderitem_item_variations_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem_item_variations
    ADD CONSTRAINT core_orderitem_item_variations_pkey PRIMARY KEY (id);


--
-- Name: core_orderitem core_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_pkey PRIMARY KEY (id);


--
-- Name: core_paying core_paying_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_paying
    ADD CONSTRAINT core_paying_pkey PRIMARY KEY (id);


--
-- Name: core_refund core_refund_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_refund
    ADD CONSTRAINT core_refund_pkey PRIMARY KEY (id);


--
-- Name: core_tag core_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT core_tag_pkey PRIMARY KEY (id);


--
-- Name: core_tag core_tag_title_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT core_tag_title_key UNIQUE (title);


--
-- Name: core_userprofile core_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_pkey PRIMARY KEY (id);


--
-- Name: core_userprofile core_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: core_variation core_variation_item_id_name_2e059bd4_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_variation
    ADD CONSTRAINT core_variation_item_id_name_2e059bd4_uniq UNIQUE (item_id, name);


--
-- Name: core_variation core_variation_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_variation
    ADD CONSTRAINT core_variation_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: core_address_user_id_7681a39c; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_address_user_id_7681a39c ON public.core_address USING btree (user_id);


--
-- Name: core_carousel_name_cff6043c; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_carousel_name_cff6043c ON public.core_carousel USING btree (name);


--
-- Name: core_carousel_name_cff6043c_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_carousel_name_cff6043c_like ON public.core_carousel USING btree (name varchar_pattern_ops);


--
-- Name: core_carousel_slug_ce3e3c7f_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_carousel_slug_ce3e3c7f_like ON public.core_carousel USING btree (slug varchar_pattern_ops);


--
-- Name: core_category_name_55b68161; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_category_name_55b68161 ON public.core_category USING btree (name);


--
-- Name: core_category_name_55b68161_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_category_name_55b68161_like ON public.core_category USING btree (name varchar_pattern_ops);


--
-- Name: core_category_slug_384eca9c_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_category_slug_384eca9c_like ON public.core_category USING btree (slug varchar_pattern_ops);


--
-- Name: core_item_category_id_2fe5bbc8; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_item_category_id_2fe5bbc8 ON public.core_item USING btree (category_id);


--
-- Name: core_item_slug_07f502d0_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_item_slug_07f502d0_like ON public.core_item USING btree (slug varchar_pattern_ops);


--
-- Name: core_item_tags_item_id_deeece78; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_item_tags_item_id_deeece78 ON public.core_item_tags USING btree (item_id);


--
-- Name: core_item_tags_tag_id_11240cf2; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_item_tags_tag_id_11240cf2 ON public.core_item_tags USING btree (tag_id);


--
-- Name: core_itemvariation_variation_id_78657978; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_itemvariation_variation_id_78657978 ON public.core_itemvariation USING btree (variation_id);


--
-- Name: core_mediacontent_item_id_3a2f0cab; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_mediacontent_item_id_3a2f0cab ON public.core_mediacontent USING btree (item_id);


--
-- Name: core_order_coupon_id_bade53ba; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_order_coupon_id_bade53ba ON public.core_order USING btree (coupon_id);


--
-- Name: core_order_items_order_id_c5dde6c1; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_order_items_order_id_c5dde6c1 ON public.core_order_items USING btree (order_id);


--
-- Name: core_order_items_orderitem_id_e44f86b6; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_order_items_orderitem_id_e44f86b6 ON public.core_order_items USING btree (orderitem_id);


--
-- Name: core_order_payment_id_e5a26a3c; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_order_payment_id_e5a26a3c ON public.core_order USING btree (payment_id);


--
-- Name: core_order_shipping_address_id_8c054f15; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_order_shipping_address_id_8c054f15 ON public.core_order USING btree (shipping_address_id);


--
-- Name: core_order_user_id_b03bbffd; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_order_user_id_b03bbffd ON public.core_order USING btree (user_id);


--
-- Name: core_orderitem_item_id_3b7d0c2e; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_orderitem_item_id_3b7d0c2e ON public.core_orderitem USING btree (item_id);


--
-- Name: core_orderitem_item_variations_itemvariation_id_eedea2a8; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_orderitem_item_variations_itemvariation_id_eedea2a8 ON public.core_orderitem_item_variations USING btree (itemvariation_id);


--
-- Name: core_orderitem_item_variations_orderitem_id_a01fc12c; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_orderitem_item_variations_orderitem_id_a01fc12c ON public.core_orderitem_item_variations USING btree (orderitem_id);


--
-- Name: core_orderitem_user_id_323fe695; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_orderitem_user_id_323fe695 ON public.core_orderitem USING btree (user_id);


--
-- Name: core_paying_user_id_861cf53f; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_paying_user_id_861cf53f ON public.core_paying USING btree (user_id);


--
-- Name: core_refund_order_id_7fe621fa; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_refund_order_id_7fe621fa ON public.core_refund USING btree (order_id);


--
-- Name: core_tag_title_e6872830_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_tag_title_e6872830_like ON public.core_tag USING btree (title varchar_pattern_ops);


--
-- Name: core_variation_item_id_017bd91a; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX core_variation_item_id_017bd91a ON public.core_variation USING btree (item_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: cakenuage
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_address core_address_user_id_7681a39c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_address
    ADD CONSTRAINT core_address_user_id_7681a39c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_item core_item_category_id_2fe5bbc8_fk_core_category_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item
    ADD CONSTRAINT core_item_category_id_2fe5bbc8_fk_core_category_id FOREIGN KEY (category_id) REFERENCES public.core_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_item_tags core_item_tags_item_id_deeece78_fk_core_item_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item_tags
    ADD CONSTRAINT core_item_tags_item_id_deeece78_fk_core_item_id FOREIGN KEY (item_id) REFERENCES public.core_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_item_tags core_item_tags_tag_id_11240cf2_fk_core_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_item_tags
    ADD CONSTRAINT core_item_tags_tag_id_11240cf2_fk_core_tag_id FOREIGN KEY (tag_id) REFERENCES public.core_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_itemvariation core_itemvariation_variation_id_78657978_fk_core_variation_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_itemvariation
    ADD CONSTRAINT core_itemvariation_variation_id_78657978_fk_core_variation_id FOREIGN KEY (variation_id) REFERENCES public.core_variation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_mediacontent core_mediacontent_item_id_3a2f0cab_fk_core_item_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_mediacontent
    ADD CONSTRAINT core_mediacontent_item_id_3a2f0cab_fk_core_item_id FOREIGN KEY (item_id) REFERENCES public.core_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order core_order_coupon_id_bade53ba_fk_core_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_coupon_id_bade53ba_fk_core_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.core_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_items core_order_items_order_id_c5dde6c1_fk_core_order_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_order_id_c5dde6c1_fk_core_order_id FOREIGN KEY (order_id) REFERENCES public.core_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_items core_order_items_orderitem_id_e44f86b6_fk_core_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_orderitem_id_e44f86b6_fk_core_orderitem_id FOREIGN KEY (orderitem_id) REFERENCES public.core_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order core_order_payment_id_e5a26a3c_fk_core_paying_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_payment_id_e5a26a3c_fk_core_paying_id FOREIGN KEY (payment_id) REFERENCES public.core_paying(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order core_order_shipping_address_id_8c054f15_fk_core_address_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_shipping_address_id_8c054f15_fk_core_address_id FOREIGN KEY (shipping_address_id) REFERENCES public.core_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order core_order_user_id_b03bbffd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_user_id_b03bbffd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem_item_variations core_orderitem_item__itemvariation_id_eedea2a8_fk_core_item; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem_item_variations
    ADD CONSTRAINT core_orderitem_item__itemvariation_id_eedea2a8_fk_core_item FOREIGN KEY (itemvariation_id) REFERENCES public.core_itemvariation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem_item_variations core_orderitem_item__orderitem_id_a01fc12c_fk_core_orde; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem_item_variations
    ADD CONSTRAINT core_orderitem_item__orderitem_id_a01fc12c_fk_core_orde FOREIGN KEY (orderitem_id) REFERENCES public.core_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_item_id_3b7d0c2e_fk_core_item_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_item_id_3b7d0c2e_fk_core_item_id FOREIGN KEY (item_id) REFERENCES public.core_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_user_id_323fe695_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_user_id_323fe695_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_paying core_paying_user_id_861cf53f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_paying
    ADD CONSTRAINT core_paying_user_id_861cf53f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_refund core_refund_order_id_7fe621fa_fk_core_order_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_refund
    ADD CONSTRAINT core_refund_order_id_7fe621fa_fk_core_order_id FOREIGN KEY (order_id) REFERENCES public.core_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_userprofile core_userprofile_user_id_5141ad90_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_userprofile
    ADD CONSTRAINT core_userprofile_user_id_5141ad90_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_variation core_variation_item_id_017bd91a_fk_core_item_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.core_variation
    ADD CONSTRAINT core_variation_item_id_017bd91a_fk_core_item_id FOREIGN KEY (item_id) REFERENCES public.core_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk; Type: FK CONSTRAINT; Schema: public; Owner: cakenuage
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: cakenuage
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO cakenuage;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: cakenuage
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

