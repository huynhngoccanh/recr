--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    line1 character varying,
    line2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    country character varying,
    lat double precision,
    lng double precision,
    formatted_address character varying,
    owner_type character varying,
    owner_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO ubuntu;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO ubuntu;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: affiliations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE affiliations (
    id integer NOT NULL,
    coach_id integer,
    organization_type character varying,
    organization_id integer,
    organization_approved boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.affiliations OWNER TO ubuntu;

--
-- Name: affiliations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE affiliations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.affiliations_id_seq OWNER TO ubuntu;

--
-- Name: affiliations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE affiliations_id_seq OWNED BY affiliations.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ubuntu;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    description character varying,
    raw_url character varying,
    athlete_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.articles OWNER TO ubuntu;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO ubuntu;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: athletes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE athletes (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    height integer,
    weight integer,
    avatar character varying,
    primary_position character varying,
    jersey_number integer,
    bench_press integer,
    deadlift integer,
    squat integer,
    forty_yard_dash double precision,
    hundred_yard_dash double precision,
    inspirational_quote text,
    class_of integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gpa numeric(3,2),
    display_gpa boolean,
    hudl_url character varying
);


ALTER TABLE public.athletes OWNER TO ubuntu;

--
-- Name: athletes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE athletes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athletes_id_seq OWNER TO ubuntu;

--
-- Name: athletes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE athletes_id_seq OWNED BY athletes.id;


--
-- Name: centers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE centers (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.centers OWNER TO ubuntu;

--
-- Name: centers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.centers_id_seq OWNER TO ubuntu;

--
-- Name: centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE centers_id_seq OWNED BY centers.id;


--
-- Name: coaches; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE coaches (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    role integer DEFAULT 0,
    role_name character varying,
    bio text,
    avatar character varying,
    "position" integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.coaches OWNER TO ubuntu;

--
-- Name: coaches_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE coaches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coaches_id_seq OWNER TO ubuntu;

--
-- Name: coaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE coaches_id_seq OWNED BY coaches.id;


--
-- Name: colleges; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE colleges (
    id integer NOT NULL,
    name character varying,
    logo text,
    added_by_id integer,
    offensive_schema text,
    defensive_schema text,
    division integer NOT NULL,
    enrollment integer,
    team_record character varying,
    mascot character varying,
    school_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gpa_requirement numeric(3,2),
    allow_connections boolean DEFAULT true
);


ALTER TABLE public.colleges OWNER TO ubuntu;

--
-- Name: colleges_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE colleges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colleges_id_seq OWNER TO ubuntu;

--
-- Name: colleges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE colleges_id_seq OWNED BY colleges.id;


--
-- Name: connections; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE connections (
    id integer NOT NULL,
    athlete_id integer,
    college_id integer,
    athlete_approved boolean,
    college_approved boolean,
    committed boolean DEFAULT false,
    letter_of_intent_signed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_modified_by_id integer
);


ALTER TABLE public.connections OWNER TO ubuntu;

--
-- Name: connections_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connections_id_seq OWNER TO ubuntu;

--
-- Name: connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE connections_id_seq OWNED BY connections.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE conversations (
    id integer NOT NULL,
    organization_type character varying,
    organization_id integer,
    athlete_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.conversations OWNER TO ubuntu;

--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO ubuntu;

--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE conversations_id_seq OWNED BY conversations.id;


--
-- Name: cornerbacks; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE cornerbacks (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cornerbacks OWNER TO ubuntu;

--
-- Name: cornerbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE cornerbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cornerbacks_id_seq OWNER TO ubuntu;

--
-- Name: cornerbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE cornerbacks_id_seq OWNED BY cornerbacks.id;


--
-- Name: defensive_ends; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE defensive_ends (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.defensive_ends OWNER TO ubuntu;

--
-- Name: defensive_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE defensive_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defensive_ends_id_seq OWNER TO ubuntu;

--
-- Name: defensive_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE defensive_ends_id_seq OWNED BY defensive_ends.id;


--
-- Name: defensive_tackles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE defensive_tackles (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.defensive_tackles OWNER TO ubuntu;

--
-- Name: defensive_tackles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE defensive_tackles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defensive_tackles_id_seq OWNER TO ubuntu;

--
-- Name: defensive_tackles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE defensive_tackles_id_seq OWNED BY defensive_tackles.id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE enrollments (
    id integer NOT NULL,
    athlete_id integer,
    high_school_id integer,
    high_school_approved boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.enrollments OWNER TO ubuntu;

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_id_seq OWNER TO ubuntu;

--
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE enrollments_id_seq OWNED BY enrollments.id;


--
-- Name: free_safeties; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE free_safeties (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.free_safeties OWNER TO ubuntu;

--
-- Name: free_safeties_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE free_safeties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.free_safeties_id_seq OWNER TO ubuntu;

--
-- Name: free_safeties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE free_safeties_id_seq OWNED BY free_safeties.id;


--
-- Name: fullbacks; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE fullbacks (
    id integer NOT NULL,
    season integer,
    receiving_yards integer,
    receiving_touchdowns integer,
    rushing_yards integer,
    rushing_touchdowns integer,
    pancakes integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.fullbacks OWNER TO ubuntu;

--
-- Name: fullbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE fullbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fullbacks_id_seq OWNER TO ubuntu;

--
-- Name: fullbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE fullbacks_id_seq OWNED BY fullbacks.id;


--
-- Name: guards; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE guards (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.guards OWNER TO ubuntu;

--
-- Name: guards_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE guards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guards_id_seq OWNER TO ubuntu;

--
-- Name: guards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE guards_id_seq OWNED BY guards.id;


--
-- Name: high_schools; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE high_schools (
    id integer NOT NULL,
    name character varying,
    logo text,
    added_by_id integer,
    offensive_schema text,
    defensive_schema text,
    enrollment integer,
    team_record character varying,
    mascot character varying,
    school_email character varying,
    registration_coach_name character varying,
    registration_coach_phone_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    counselor_name character varying,
    counselor_email character varying,
    counselor_phone_number character varying
);


ALTER TABLE public.high_schools OWNER TO ubuntu;

--
-- Name: high_schools_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE high_schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.high_schools_id_seq OWNER TO ubuntu;

--
-- Name: high_schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE high_schools_id_seq OWNED BY high_schools.id;


--
-- Name: highlights; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE highlights (
    id integer NOT NULL,
    title character varying,
    description character varying,
    raw_url character varying,
    thumbnail_url character varying,
    tagged_positions text[] DEFAULT '{}'::text[],
    highlightable_type character varying,
    highlightable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cached_votes_total integer DEFAULT 0,
    cached_votes_score integer DEFAULT 0,
    cached_votes_up integer DEFAULT 0,
    cached_votes_down integer DEFAULT 0,
    cached_weighted_score integer DEFAULT 0,
    cached_weighted_total integer DEFAULT 0,
    cached_weighted_average double precision DEFAULT 0.0
);


ALTER TABLE public.highlights OWNER TO ubuntu;

--
-- Name: highlights_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE highlights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.highlights_id_seq OWNER TO ubuntu;

--
-- Name: highlights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE highlights_id_seq OWNED BY highlights.id;


--
-- Name: inside_linebackers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE inside_linebackers (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inside_linebackers OWNER TO ubuntu;

--
-- Name: inside_linebackers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE inside_linebackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inside_linebackers_id_seq OWNER TO ubuntu;

--
-- Name: inside_linebackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE inside_linebackers_id_seq OWNED BY inside_linebackers.id;


--
-- Name: kick_returners; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE kick_returners (
    id integer NOT NULL,
    season integer,
    kick_return_yards integer,
    kick_return_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kick_returners OWNER TO ubuntu;

--
-- Name: kick_returners_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE kick_returners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kick_returners_id_seq OWNER TO ubuntu;

--
-- Name: kick_returners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE kick_returners_id_seq OWNED BY kick_returners.id;


--
-- Name: kickers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE kickers (
    id integer NOT NULL,
    season integer,
    kicks_attempted integer,
    kicks_made integer,
    longest_kick integer,
    touchbacks integer,
    yards_per_attempt integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kickers OWNER TO ubuntu;

--
-- Name: kickers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE kickers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kickers_id_seq OWNER TO ubuntu;

--
-- Name: kickers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE kickers_id_seq OWNED BY kickers.id;


--
-- Name: left_guards; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE left_guards (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.left_guards OWNER TO ubuntu;

--
-- Name: left_guards_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE left_guards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.left_guards_id_seq OWNER TO ubuntu;

--
-- Name: left_guards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE left_guards_id_seq OWNED BY left_guards.id;


--
-- Name: left_tackles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE left_tackles (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.left_tackles OWNER TO ubuntu;

--
-- Name: left_tackles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE left_tackles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.left_tackles_id_seq OWNER TO ubuntu;

--
-- Name: left_tackles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE left_tackles_id_seq OWNED BY left_tackles.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    user_id integer,
    conversation_id integer,
    body character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_name character varying
);


ALTER TABLE public.messages OWNER TO ubuntu;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO ubuntu;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: middle_linebackers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE middle_linebackers (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.middle_linebackers OWNER TO ubuntu;

--
-- Name: middle_linebackers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE middle_linebackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.middle_linebackers_id_seq OWNER TO ubuntu;

--
-- Name: middle_linebackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE middle_linebackers_id_seq OWNED BY middle_linebackers.id;


--
-- Name: nose_tackles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE nose_tackles (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.nose_tackles OWNER TO ubuntu;

--
-- Name: nose_tackles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE nose_tackles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nose_tackles_id_seq OWNER TO ubuntu;

--
-- Name: nose_tackles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE nose_tackles_id_seq OWNED BY nose_tackles.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    recipient_id integer,
    actor_id integer,
    read_at timestamp without time zone,
    completed boolean DEFAULT false,
    action character varying,
    notifiable_id integer,
    notifiable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO ubuntu;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO ubuntu;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: outside_linebackers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE outside_linebackers (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.outside_linebackers OWNER TO ubuntu;

--
-- Name: outside_linebackers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE outside_linebackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outside_linebackers_id_seq OWNER TO ubuntu;

--
-- Name: outside_linebackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE outside_linebackers_id_seq OWNED BY outside_linebackers.id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE phone_numbers (
    id integer NOT NULL,
    digits character varying,
    owner_type character varying,
    owner_id integer,
    info character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.phone_numbers OWNER TO ubuntu;

--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phone_numbers_id_seq OWNER TO ubuntu;

--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE phone_numbers_id_seq OWNED BY phone_numbers.id;


--
-- Name: punt_returners; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE punt_returners (
    id integer NOT NULL,
    season integer,
    punt_return_yards integer,
    punt_return_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.punt_returners OWNER TO ubuntu;

--
-- Name: punt_returners_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE punt_returners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.punt_returners_id_seq OWNER TO ubuntu;

--
-- Name: punt_returners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE punt_returners_id_seq OWNED BY punt_returners.id;


--
-- Name: punters; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE punters (
    id integer NOT NULL,
    season integer,
    punts integer,
    yards_per_attempt integer,
    longest_punt integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.punters OWNER TO ubuntu;

--
-- Name: punters_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE punters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.punters_id_seq OWNER TO ubuntu;

--
-- Name: punters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE punters_id_seq OWNED BY punters.id;


--
-- Name: quarterbacks; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE quarterbacks (
    id integer NOT NULL,
    season integer,
    passing_yards integer,
    passing_touchdowns integer,
    rushing_yards integer,
    rushing_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quarterbacks OWNER TO ubuntu;

--
-- Name: quarterbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE quarterbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quarterbacks_id_seq OWNER TO ubuntu;

--
-- Name: quarterbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE quarterbacks_id_seq OWNED BY quarterbacks.id;


--
-- Name: references; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE "references" (
    id integer NOT NULL,
    athlete_id integer,
    relationship character varying,
    name character varying,
    contact_method character varying,
    email character varying,
    phone_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public."references" OWNER TO ubuntu;

--
-- Name: references_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.references_id_seq OWNER TO ubuntu;

--
-- Name: references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE references_id_seq OWNED BY "references".id;


--
-- Name: right_guards; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE right_guards (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.right_guards OWNER TO ubuntu;

--
-- Name: right_guards_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE right_guards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.right_guards_id_seq OWNER TO ubuntu;

--
-- Name: right_guards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE right_guards_id_seq OWNED BY right_guards.id;


--
-- Name: right_tackles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE right_tackles (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.right_tackles OWNER TO ubuntu;

--
-- Name: right_tackles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE right_tackles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.right_tackles_id_seq OWNER TO ubuntu;

--
-- Name: right_tackles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE right_tackles_id_seq OWNED BY right_tackles.id;


--
-- Name: running_backs; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE running_backs (
    id integer NOT NULL,
    season integer,
    rushing_yards integer,
    rushing_touchdowns integer,
    receiving_yards integer,
    receiving_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.running_backs OWNER TO ubuntu;

--
-- Name: running_backs_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE running_backs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.running_backs_id_seq OWNER TO ubuntu;

--
-- Name: running_backs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE running_backs_id_seq OWNED BY running_backs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ubuntu;

--
-- Name: stats; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE stats (
    id integer NOT NULL,
    athlete_id integer,
    position_type character varying,
    position_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_modified_by_id integer
);


ALTER TABLE public.stats OWNER TO ubuntu;

--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO ubuntu;

--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE stats_id_seq OWNED BY stats.id;


--
-- Name: strong_safeties; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE strong_safeties (
    id integer NOT NULL,
    season integer,
    sacks integer,
    interceptions integer,
    forced_fumbles integer,
    tackles integer,
    pass_breakups integer,
    tackles_for_loss integer,
    defensive_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.strong_safeties OWNER TO ubuntu;

--
-- Name: strong_safeties_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE strong_safeties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strong_safeties_id_seq OWNER TO ubuntu;

--
-- Name: strong_safeties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE strong_safeties_id_seq OWNED BY strong_safeties.id;


--
-- Name: tackles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE tackles (
    id integer NOT NULL,
    season integer,
    pancakes integer,
    sacks_allowed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tackles OWNER TO ubuntu;

--
-- Name: tackles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE tackles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tackles_id_seq OWNER TO ubuntu;

--
-- Name: tackles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE tackles_id_seq OWNED BY tackles.id;


--
-- Name: tight_ends; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE tight_ends (
    id integer NOT NULL,
    season integer,
    receiving_yards integer,
    catches integer,
    receiving_touchdowns integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tight_ends OWNER TO ubuntu;

--
-- Name: tight_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE tight_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tight_ends_id_seq OWNER TO ubuntu;

--
-- Name: tight_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE tight_ends_id_seq OWNED BY tight_ends.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    profile_type character varying,
    profile_id integer,
    role integer DEFAULT 4,
    completed_registration_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    invitation_token character varying,
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_type character varying,
    invited_by_id integer,
    invitations_count integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO ubuntu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ubuntu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE votes (
    id integer NOT NULL,
    votable_type character varying,
    votable_id integer,
    voter_type character varying,
    voter_id integer,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.votes OWNER TO ubuntu;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.votes_id_seq OWNER TO ubuntu;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: wide_receivers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE wide_receivers (
    id integer NOT NULL,
    season integer,
    receiving_yards integer,
    receiving_touchdowns integer,
    yards_after_catches integer,
    catches integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.wide_receivers OWNER TO ubuntu;

--
-- Name: wide_receivers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE wide_receivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wide_receivers_id_seq OWNER TO ubuntu;

--
-- Name: wide_receivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE wide_receivers_id_seq OWNED BY wide_receivers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY affiliations ALTER COLUMN id SET DEFAULT nextval('affiliations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY athletes ALTER COLUMN id SET DEFAULT nextval('athletes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY centers ALTER COLUMN id SET DEFAULT nextval('centers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY coaches ALTER COLUMN id SET DEFAULT nextval('coaches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY colleges ALTER COLUMN id SET DEFAULT nextval('colleges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY connections ALTER COLUMN id SET DEFAULT nextval('connections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY conversations ALTER COLUMN id SET DEFAULT nextval('conversations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY cornerbacks ALTER COLUMN id SET DEFAULT nextval('cornerbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY defensive_ends ALTER COLUMN id SET DEFAULT nextval('defensive_ends_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY defensive_tackles ALTER COLUMN id SET DEFAULT nextval('defensive_tackles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY enrollments ALTER COLUMN id SET DEFAULT nextval('enrollments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY free_safeties ALTER COLUMN id SET DEFAULT nextval('free_safeties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY fullbacks ALTER COLUMN id SET DEFAULT nextval('fullbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY guards ALTER COLUMN id SET DEFAULT nextval('guards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY high_schools ALTER COLUMN id SET DEFAULT nextval('high_schools_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY highlights ALTER COLUMN id SET DEFAULT nextval('highlights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY inside_linebackers ALTER COLUMN id SET DEFAULT nextval('inside_linebackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY kick_returners ALTER COLUMN id SET DEFAULT nextval('kick_returners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY kickers ALTER COLUMN id SET DEFAULT nextval('kickers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY left_guards ALTER COLUMN id SET DEFAULT nextval('left_guards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY left_tackles ALTER COLUMN id SET DEFAULT nextval('left_tackles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY middle_linebackers ALTER COLUMN id SET DEFAULT nextval('middle_linebackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY nose_tackles ALTER COLUMN id SET DEFAULT nextval('nose_tackles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY outside_linebackers ALTER COLUMN id SET DEFAULT nextval('outside_linebackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY phone_numbers ALTER COLUMN id SET DEFAULT nextval('phone_numbers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY punt_returners ALTER COLUMN id SET DEFAULT nextval('punt_returners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY punters ALTER COLUMN id SET DEFAULT nextval('punters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY quarterbacks ALTER COLUMN id SET DEFAULT nextval('quarterbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY "references" ALTER COLUMN id SET DEFAULT nextval('references_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY right_guards ALTER COLUMN id SET DEFAULT nextval('right_guards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY right_tackles ALTER COLUMN id SET DEFAULT nextval('right_tackles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY running_backs ALTER COLUMN id SET DEFAULT nextval('running_backs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY stats ALTER COLUMN id SET DEFAULT nextval('stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY strong_safeties ALTER COLUMN id SET DEFAULT nextval('strong_safeties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY tackles ALTER COLUMN id SET DEFAULT nextval('tackles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY tight_ends ALTER COLUMN id SET DEFAULT nextval('tight_ends_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY wide_receivers ALTER COLUMN id SET DEFAULT nextval('wide_receivers_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY addresses (id, line1, line2, city, state, zip, country, lat, lng, formatted_address, owner_type, owner_id, created_at, updated_at) FROM stdin;
1067509287	Will Curve	\N	East Kailynhaven	IA	97999	\N	\N	\N	\N	HighSchool	179264607	2017-12-09 21:06:18.906423	2017-12-09 21:06:18.906423
1067509288	Kemmer Key	\N	Miguelberg	IL	18509-3626	\N	\N	\N	\N	HighSchool	179264608	2017-12-09 21:06:19.650793	2017-12-09 21:06:19.650793
1067509289	Tyrique Trace	\N	Port Cyrilberg	AL	71250-0176	\N	\N	\N	\N	HighSchool	179264609	2017-12-09 21:06:20.151437	2017-12-09 21:06:20.151437
1067509290	Estell Junction	\N	Lake Lura	MD	52750	\N	\N	\N	\N	HighSchool	179264610	2017-12-09 21:06:20.64758	2017-12-09 21:06:20.64758
1067509126	1 Selma Ave	\N	Webster Groves	MO	63119	USA	\N	\N	1 Selma Ave, Webster Groves, MO 63119	College	718964484	2017-12-09 19:45:42.992352	2017-12-09 19:45:42.992352
704881815	100 Selma Ave	\N	Webster Groves	MO	63119	USA	\N	\N	100 Selma Ave, Webster Groves, MO 63119	HighSchool	179264526	2017-12-09 19:45:42.992352	2017-12-09 19:45:42.992352
1067509291	Lavina Creek	\N	Hackettmouth	FL	10491	\N	\N	\N	\N	HighSchool	179264611	2017-12-09 21:06:21.156306	2017-12-09 21:06:21.156306
1067509292	Terry Track	\N	South Gisselleburgh	ME	79471	\N	\N	\N	\N	HighSchool	179264612	2017-12-09 21:06:21.656389	2017-12-09 21:06:21.656389
1067509293	Renner Harbor	\N	Greenfelderside	NC	74130	\N	\N	\N	\N	HighSchool	179264613	2017-12-09 21:06:22.154397	2017-12-09 21:06:22.154397
1067509294	Hoppe Island	\N	Lexifort	HI	64317	\N	\N	\N	\N	HighSchool	179264614	2017-12-09 21:06:22.650451	2017-12-09 21:06:22.650451
1067509295	Fay Lock	\N	East Maud	IN	37396-9058	\N	\N	\N	\N	HighSchool	179264615	2017-12-09 21:06:23.157504	2017-12-09 21:06:23.157504
1067509296	Connor Square	\N	East Cristalview	IL	34236	\N	\N	\N	\N	HighSchool	179264616	2017-12-09 21:06:23.6591	2017-12-09 21:06:23.6591
1067509297	Wilhelm Trace	\N	South Miles	NE	19096	\N	\N	\N	\N	HighSchool	179264617	2017-12-09 21:06:24.170351	2017-12-09 21:06:24.170351
1067509298	Jacobs Inlet	\N	South Albert	ND	91575-8688	\N	\N	\N	\N	HighSchool	179264618	2017-12-09 21:06:24.679289	2017-12-09 21:06:24.679289
1067509299	Marjolaine Junctions	\N	West Gracielaville	GA	22071-0304	\N	\N	\N	\N	HighSchool	179264619	2017-12-09 21:06:25.190105	2017-12-09 21:06:25.190105
1067509300	Kilback Crescent	\N	Donnyshire	AK	95677-0983	\N	\N	\N	\N	HighSchool	179264620	2017-12-09 21:06:25.695695	2017-12-09 21:06:25.695695
1067509301	Lemke Extension	\N	West Eleazarmouth	OK	41427-0283	\N	\N	\N	\N	HighSchool	179264621	2017-12-09 21:06:26.194849	2017-12-09 21:06:26.194849
1067509302	Estevan Islands	\N	South Millerbury	AZ	75735	\N	\N	\N	\N	HighSchool	179264622	2017-12-09 21:06:26.692346	2017-12-09 21:06:26.692346
1067509303	Gisselle River	\N	West Boydberg	RI	40413-2271	\N	\N	\N	\N	HighSchool	179264623	2017-12-09 21:06:27.193556	2017-12-09 21:06:27.193556
1067509304	Arvel Parkways	\N	Garnettland	IN	50707	\N	\N	\N	\N	HighSchool	179264624	2017-12-09 21:06:27.695946	2017-12-09 21:06:27.695946
1067509305	Jacques Courts	\N	South Carleyville	KS	32410	\N	\N	\N	\N	HighSchool	179264625	2017-12-09 21:06:28.205914	2017-12-09 21:06:28.205914
1067509306	Heloise Lane	\N	Schneidermouth	LA	40687	\N	\N	\N	\N	HighSchool	179264626	2017-12-09 21:06:28.693415	2017-12-09 21:06:28.693415
1067509307	Fisher Islands	\N	Rickeyfurt	SD	65405-4698	\N	\N	\N	\N	College	718964565	2017-12-09 21:06:29.231833	2017-12-09 21:06:29.231833
1067509308	Jakayla Meadows	\N	Lake Lethatown	ND	73579-8053	\N	\N	\N	\N	College	718964566	2017-12-09 21:06:29.47373	2017-12-09 21:06:29.47373
1067509309	Porter Orchard	\N	North Alaynashire	MI	50089	\N	\N	\N	\N	College	718964567	2017-12-09 21:06:29.716562	2017-12-09 21:06:29.716562
1067509310	Feil Park	\N	South Gustview	AZ	31242-5047	\N	\N	\N	\N	College	718964568	2017-12-09 21:06:29.960769	2017-12-09 21:06:29.960769
1067509311	Roberts Cliff	\N	Gaylordville	NV	64286-4795	\N	\N	\N	\N	College	718964569	2017-12-09 21:06:30.209128	2017-12-09 21:06:30.209128
1067509312	Lysanne Heights	\N	Kerlukebury	IL	46936	\N	\N	\N	\N	College	718964570	2017-12-09 21:06:30.456922	2017-12-09 21:06:30.456922
1067509313	Hintz Burg	\N	Schinnerville	LA	53485-1058	\N	\N	\N	\N	College	718964571	2017-12-09 21:06:30.707393	2017-12-09 21:06:30.707393
1067509314	Hegmann Parkway	\N	West Kallie	ME	23493	\N	\N	\N	\N	College	718964572	2017-12-09 21:06:30.95507	2017-12-09 21:06:30.95507
1067509315	Louvenia Loop	\N	Verlieborough	NY	71888	\N	\N	\N	\N	College	718964573	2017-12-09 21:06:31.199963	2017-12-09 21:06:31.199963
1067509316	Elisa Island	\N	East Rashawnland	NE	58158-9172	\N	\N	\N	\N	College	718964574	2017-12-09 21:06:31.44059	2017-12-09 21:06:31.44059
1067509317	Littel Knolls	\N	Jarenville	SC	29539	\N	\N	\N	\N	College	718964575	2017-12-09 21:06:31.683166	2017-12-09 21:06:31.683166
1067509318	Winfield Branch	\N	Lloydmouth	MD	36639	\N	\N	\N	\N	College	718964576	2017-12-09 21:06:31.928691	2017-12-09 21:06:31.928691
1067509319	Quigley Loaf	\N	Yundttown	WA	12279	\N	\N	\N	\N	College	718964577	2017-12-09 21:06:32.173045	2017-12-09 21:06:32.173045
1067509320	Will Shores	\N	West Edgardo	VT	48001	\N	\N	\N	\N	College	718964578	2017-12-09 21:06:32.422673	2017-12-09 21:06:32.422673
1067509321	Gerhold Views	\N	Floport	SC	90853-8290	\N	\N	\N	\N	College	718964579	2017-12-09 21:06:32.667617	2017-12-09 21:06:32.667617
1067509322	Morissette Junctions	\N	Altenwerthchester	AK	43061	\N	\N	\N	\N	College	718964580	2017-12-09 21:06:32.912989	2017-12-09 21:06:32.912989
1067509323	Kelley Hill	\N	West Berneice	MN	63457	\N	\N	\N	\N	College	718964581	2017-12-09 21:06:33.157168	2017-12-09 21:06:33.157168
1067509324	Abner Prairie	\N	Rolfsonmouth	MN	98405	\N	\N	\N	\N	College	718964582	2017-12-09 21:06:33.401231	2017-12-09 21:06:33.401231
1067509325	Charlie Canyon	\N	South Gordonton	OR	15142	\N	\N	\N	\N	College	718964583	2017-12-09 21:06:33.649207	2017-12-09 21:06:33.649207
1067509326	Kozey Crossing	\N	North Jarred	VT	22394	\N	\N	\N	\N	College	718964584	2017-12-09 21:06:33.895606	2017-12-09 21:06:33.895606
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('addresses_id_seq', 1067509326, true);


--
-- Data for Name: affiliations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY affiliations (id, coach_id, organization_type, organization_id, organization_approved, created_at, updated_at) FROM stdin;
638121974	706170480	HighSchool	179264526	t	2017-12-09 19:45:42.947258	2017-12-09 19:45:42.947258
480054703	644468115	College	718964484	t	2017-12-09 19:45:42.947258	2017-12-09 19:45:42.947258
638122455	706170961	HighSchool	179264607	t	2017-12-09 21:06:19.090687	2017-12-09 21:06:19.090687
638122456	706170962	HighSchool	179264607	t	2017-12-09 21:06:19.169058	2017-12-09 21:06:19.169058
638122457	706170963	HighSchool	179264607	t	2017-12-09 21:06:19.247218	2017-12-09 21:06:19.247218
638122458	706170964	HighSchool	179264608	t	2017-12-09 21:06:19.730611	2017-12-09 21:06:19.730611
638122459	706170965	HighSchool	179264608	t	2017-12-09 21:06:19.807845	2017-12-09 21:06:19.807845
638122460	706170966	HighSchool	179264608	t	2017-12-09 21:06:19.887609	2017-12-09 21:06:19.887609
638122461	706170967	HighSchool	179264609	t	2017-12-09 21:06:20.232627	2017-12-09 21:06:20.232627
638122462	706170968	HighSchool	179264609	t	2017-12-09 21:06:20.310937	2017-12-09 21:06:20.310937
638122463	706170969	HighSchool	179264609	t	2017-12-09 21:06:20.389622	2017-12-09 21:06:20.389622
638122464	706170970	HighSchool	179264610	t	2017-12-09 21:06:20.727707	2017-12-09 21:06:20.727707
638122465	706170971	HighSchool	179264610	t	2017-12-09 21:06:20.806298	2017-12-09 21:06:20.806298
638122466	706170972	HighSchool	179264610	t	2017-12-09 21:06:20.886337	2017-12-09 21:06:20.886337
638122467	706170973	HighSchool	179264611	t	2017-12-09 21:06:21.238399	2017-12-09 21:06:21.238399
638122468	706170974	HighSchool	179264611	t	2017-12-09 21:06:21.318501	2017-12-09 21:06:21.318501
638122469	706170975	HighSchool	179264611	t	2017-12-09 21:06:21.397868	2017-12-09 21:06:21.397868
638122470	706170976	HighSchool	179264612	t	2017-12-09 21:06:21.735971	2017-12-09 21:06:21.735971
638122471	706170977	HighSchool	179264612	t	2017-12-09 21:06:21.813447	2017-12-09 21:06:21.813447
638122472	706170978	HighSchool	179264612	t	2017-12-09 21:06:21.892007	2017-12-09 21:06:21.892007
638122473	706170979	HighSchool	179264613	t	2017-12-09 21:06:22.234719	2017-12-09 21:06:22.234719
638122474	706170980	HighSchool	179264613	t	2017-12-09 21:06:22.313275	2017-12-09 21:06:22.313275
638122475	706170981	HighSchool	179264613	t	2017-12-09 21:06:22.391276	2017-12-09 21:06:22.391276
638122476	706170982	HighSchool	179264614	t	2017-12-09 21:06:22.731657	2017-12-09 21:06:22.731657
638122477	706170983	HighSchool	179264614	t	2017-12-09 21:06:22.810608	2017-12-09 21:06:22.810608
638122478	706170984	HighSchool	179264614	t	2017-12-09 21:06:22.889844	2017-12-09 21:06:22.889844
638122479	706170985	HighSchool	179264615	t	2017-12-09 21:06:23.238208	2017-12-09 21:06:23.238208
638122480	706170986	HighSchool	179264615	t	2017-12-09 21:06:23.317284	2017-12-09 21:06:23.317284
638122481	706170987	HighSchool	179264615	t	2017-12-09 21:06:23.397033	2017-12-09 21:06:23.397033
638122482	706170988	HighSchool	179264616	t	2017-12-09 21:06:23.740282	2017-12-09 21:06:23.740282
638122483	706170989	HighSchool	179264616	t	2017-12-09 21:06:23.82207	2017-12-09 21:06:23.82207
638122484	706170990	HighSchool	179264616	t	2017-12-09 21:06:23.901403	2017-12-09 21:06:23.901403
638122485	706170991	HighSchool	179264617	t	2017-12-09 21:06:24.250624	2017-12-09 21:06:24.250624
638122486	706170992	HighSchool	179264617	t	2017-12-09 21:06:24.32903	2017-12-09 21:06:24.32903
638122487	706170993	HighSchool	179264617	t	2017-12-09 21:06:24.408132	2017-12-09 21:06:24.408132
638122488	706170994	HighSchool	179264618	t	2017-12-09 21:06:24.762067	2017-12-09 21:06:24.762067
638122489	706170995	HighSchool	179264618	t	2017-12-09 21:06:24.843262	2017-12-09 21:06:24.843262
638122490	706170996	HighSchool	179264618	t	2017-12-09 21:06:24.923346	2017-12-09 21:06:24.923346
638122491	706170997	HighSchool	179264619	t	2017-12-09 21:06:25.270947	2017-12-09 21:06:25.270947
638122492	706170998	HighSchool	179264619	t	2017-12-09 21:06:25.349397	2017-12-09 21:06:25.349397
638122493	706170999	HighSchool	179264619	t	2017-12-09 21:06:25.42872	2017-12-09 21:06:25.42872
638122494	706171000	HighSchool	179264620	t	2017-12-09 21:06:25.776047	2017-12-09 21:06:25.776047
638122495	706171001	HighSchool	179264620	t	2017-12-09 21:06:25.855649	2017-12-09 21:06:25.855649
638122496	706171002	HighSchool	179264620	t	2017-12-09 21:06:25.934222	2017-12-09 21:06:25.934222
638122497	706171003	HighSchool	179264621	t	2017-12-09 21:06:26.274608	2017-12-09 21:06:26.274608
638122498	706171004	HighSchool	179264621	t	2017-12-09 21:06:26.354241	2017-12-09 21:06:26.354241
638122499	706171005	HighSchool	179264621	t	2017-12-09 21:06:26.432119	2017-12-09 21:06:26.432119
638122500	706171006	HighSchool	179264622	t	2017-12-09 21:06:26.771446	2017-12-09 21:06:26.771446
638122501	706171007	HighSchool	179264622	t	2017-12-09 21:06:26.850215	2017-12-09 21:06:26.850215
638122502	706171008	HighSchool	179264622	t	2017-12-09 21:06:26.9285	2017-12-09 21:06:26.9285
638122503	706171009	HighSchool	179264623	t	2017-12-09 21:06:27.273795	2017-12-09 21:06:27.273795
638122504	706171010	HighSchool	179264623	t	2017-12-09 21:06:27.351835	2017-12-09 21:06:27.351835
638122505	706171011	HighSchool	179264623	t	2017-12-09 21:06:27.43044	2017-12-09 21:06:27.43044
638122506	706171012	HighSchool	179264624	t	2017-12-09 21:06:27.776539	2017-12-09 21:06:27.776539
638122507	706171013	HighSchool	179264624	t	2017-12-09 21:06:27.855153	2017-12-09 21:06:27.855153
638122508	706171014	HighSchool	179264624	t	2017-12-09 21:06:27.934154	2017-12-09 21:06:27.934154
638122509	706171015	HighSchool	179264625	t	2017-12-09 21:06:28.283717	2017-12-09 21:06:28.283717
638122510	706171016	HighSchool	179264625	t	2017-12-09 21:06:28.361688	2017-12-09 21:06:28.361688
638122511	706171017	HighSchool	179264625	t	2017-12-09 21:06:28.43957	2017-12-09 21:06:28.43957
638122512	706171018	HighSchool	179264626	t	2017-12-09 21:06:28.772332	2017-12-09 21:06:28.772332
638122513	706171019	HighSchool	179264626	t	2017-12-09 21:06:28.850553	2017-12-09 21:06:28.850553
638122514	706171020	HighSchool	179264626	t	2017-12-09 21:06:28.933504	2017-12-09 21:06:28.933504
638122515	706171021	College	718964565	t	2017-12-09 21:06:29.309977	2017-12-09 21:06:29.309977
638122516	706171022	College	718964565	t	2017-12-09 21:06:29.387609	2017-12-09 21:06:29.387609
638122517	706171023	College	718964565	t	2017-12-09 21:06:29.465162	2017-12-09 21:06:29.465162
638122518	706171024	College	718964566	t	2017-12-09 21:06:29.551627	2017-12-09 21:06:29.551627
638122519	706171025	College	718964566	t	2017-12-09 21:06:29.629593	2017-12-09 21:06:29.629593
638122520	706171026	College	718964566	t	2017-12-09 21:06:29.70774	2017-12-09 21:06:29.70774
638122521	706171027	College	718964567	t	2017-12-09 21:06:29.796045	2017-12-09 21:06:29.796045
638122522	706171028	College	718964567	t	2017-12-09 21:06:29.874208	2017-12-09 21:06:29.874208
638122523	706171029	College	718964567	t	2017-12-09 21:06:29.95205	2017-12-09 21:06:29.95205
638122524	706171030	College	718964568	t	2017-12-09 21:06:30.043906	2017-12-09 21:06:30.043906
638122525	706171031	College	718964568	t	2017-12-09 21:06:30.12155	2017-12-09 21:06:30.12155
638122526	706171032	College	718964568	t	2017-12-09 21:06:30.1997	2017-12-09 21:06:30.1997
638122527	706171033	College	718964569	t	2017-12-09 21:06:30.289828	2017-12-09 21:06:30.289828
638122528	706171034	College	718964569	t	2017-12-09 21:06:30.368795	2017-12-09 21:06:30.368795
638122529	706171035	College	718964569	t	2017-12-09 21:06:30.447299	2017-12-09 21:06:30.447299
638122530	706171036	College	718964570	t	2017-12-09 21:06:30.537283	2017-12-09 21:06:30.537283
638122531	706171037	College	718964570	t	2017-12-09 21:06:30.617185	2017-12-09 21:06:30.617185
638122532	706171038	College	718964570	t	2017-12-09 21:06:30.697808	2017-12-09 21:06:30.697808
638122533	706171039	College	718964571	t	2017-12-09 21:06:30.787672	2017-12-09 21:06:30.787672
638122534	706171040	College	718964571	t	2017-12-09 21:06:30.866641	2017-12-09 21:06:30.866641
638122535	706171041	College	718964571	t	2017-12-09 21:06:30.945839	2017-12-09 21:06:30.945839
638122536	706171042	College	718964572	t	2017-12-09 21:06:31.035204	2017-12-09 21:06:31.035204
638122537	706171043	College	718964572	t	2017-12-09 21:06:31.113588	2017-12-09 21:06:31.113588
638122538	706171044	College	718964572	t	2017-12-09 21:06:31.190922	2017-12-09 21:06:31.190922
638122539	706171045	College	718964573	t	2017-12-09 21:06:31.277054	2017-12-09 21:06:31.277054
638122540	706171046	College	718964573	t	2017-12-09 21:06:31.354139	2017-12-09 21:06:31.354139
638122541	706171047	College	718964573	t	2017-12-09 21:06:31.431743	2017-12-09 21:06:31.431743
638122542	706171048	College	718964574	t	2017-12-09 21:06:31.5185	2017-12-09 21:06:31.5185
638122543	706171049	College	718964574	t	2017-12-09 21:06:31.596494	2017-12-09 21:06:31.596494
638122544	706171050	College	718964574	t	2017-12-09 21:06:31.673831	2017-12-09 21:06:31.673831
638122545	706171051	College	718964575	t	2017-12-09 21:06:31.762821	2017-12-09 21:06:31.762821
638122546	706171052	College	718964575	t	2017-12-09 21:06:31.840485	2017-12-09 21:06:31.840485
638122547	706171053	College	718964575	t	2017-12-09 21:06:31.919581	2017-12-09 21:06:31.919581
638122548	706171054	College	718964576	t	2017-12-09 21:06:32.007853	2017-12-09 21:06:32.007853
638122549	706171055	College	718964576	t	2017-12-09 21:06:32.085688	2017-12-09 21:06:32.085688
638122550	706171056	College	718964576	t	2017-12-09 21:06:32.164154	2017-12-09 21:06:32.164154
638122551	706171057	College	718964577	t	2017-12-09 21:06:32.257042	2017-12-09 21:06:32.257042
638122552	706171058	College	718964577	t	2017-12-09 21:06:32.335177	2017-12-09 21:06:32.335177
638122553	706171059	College	718964577	t	2017-12-09 21:06:32.413617	2017-12-09 21:06:32.413617
638122554	706171060	College	718964578	t	2017-12-09 21:06:32.501776	2017-12-09 21:06:32.501776
638122555	706171061	College	718964578	t	2017-12-09 21:06:32.580318	2017-12-09 21:06:32.580318
638122556	706171062	College	718964578	t	2017-12-09 21:06:32.658445	2017-12-09 21:06:32.658445
638122557	706171063	College	718964579	t	2017-12-09 21:06:32.74706	2017-12-09 21:06:32.74706
638122558	706171064	College	718964579	t	2017-12-09 21:06:32.825215	2017-12-09 21:06:32.825215
638122559	706171065	College	718964579	t	2017-12-09 21:06:32.903941	2017-12-09 21:06:32.903941
638122560	706171066	College	718964580	t	2017-12-09 21:06:32.991951	2017-12-09 21:06:32.991951
638122561	706171067	College	718964580	t	2017-12-09 21:06:33.069658	2017-12-09 21:06:33.069658
638122562	706171068	College	718964580	t	2017-12-09 21:06:33.147878	2017-12-09 21:06:33.147878
638122563	706171069	College	718964581	t	2017-12-09 21:06:33.235524	2017-12-09 21:06:33.235524
638122564	706171070	College	718964581	t	2017-12-09 21:06:33.313191	2017-12-09 21:06:33.313191
638122565	706171071	College	718964581	t	2017-12-09 21:06:33.391721	2017-12-09 21:06:33.391721
638122566	706171072	College	718964582	t	2017-12-09 21:06:33.481099	2017-12-09 21:06:33.481099
638122567	706171073	College	718964582	t	2017-12-09 21:06:33.560341	2017-12-09 21:06:33.560341
638122568	706171074	College	718964582	t	2017-12-09 21:06:33.639682	2017-12-09 21:06:33.639682
638122569	706171075	College	718964583	t	2017-12-09 21:06:33.729474	2017-12-09 21:06:33.729474
638122570	706171076	College	718964583	t	2017-12-09 21:06:33.808687	2017-12-09 21:06:33.808687
638122571	706171077	College	718964583	t	2017-12-09 21:06:33.886539	2017-12-09 21:06:33.886539
638122572	706171078	College	718964584	t	2017-12-09 21:06:33.975391	2017-12-09 21:06:33.975391
638122573	706171079	College	718964584	t	2017-12-09 21:06:34.053567	2017-12-09 21:06:34.053567
638122574	706171080	College	718964584	t	2017-12-09 21:06:34.130134	2017-12-09 21:06:34.130134
\.


--
-- Name: affiliations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('affiliations_id_seq', 638122574, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-11-30 19:56:47.715623	2017-11-30 19:56:47.715623
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY articles (id, title, description, raw_url, athlete_id, created_at, updated_at) FROM stdin;
19769223	Completely Awesome Article	One of, if not *the* best article ever written.	http://bit.ly/IqT6zt	3900196	2017-12-09 19:45:42.965169	2017-12-09 19:45:42.965169
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('articles_id_seq', 19769223, true);


--
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY athletes (id, first_name, last_name, height, weight, avatar, primary_position, jersey_number, bench_press, deadlift, squat, forty_yard_dash, hundred_yard_dash, inspirational_quote, class_of, created_at, updated_at, gpa, display_gpa, hudl_url) FROM stdin;
3900196	Athletic	Athlete	60	150	\N	QB	10	\N	\N	\N	\N	\N	\N	2017	2017-12-09 19:45:42.937621	2017-12-09 19:45:42.937621	\N	\N	\N
3900480	Alexandrine	Baumbach	59	149	\N	WR	91	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:26.518648	2017-12-09 21:06:26.518648	\N	\N	\N
3900486	Lazaro	Ullrich	84	350	\N	SS	28	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:27.518603	2017-12-09 21:06:27.518603	\N	\N	\N
3900487	Josephine	Orn	102	297	\N	LG	66	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:27.604204	2017-12-09 21:06:27.604204	\N	\N	\N
3900495	Fleta	Cruickshank	102	301	\N	MLB	95	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:29.023055	2017-12-09 21:06:29.023055	\N	\N	\N
3900496	Shea	Leuschke	70	343	\N	RG	64	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:29.103437	2017-12-09 21:07:04.925931	\N	\N	\N
3900494	Jana	Parker	82	358	\N	QB	6	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:28.936671	2017-12-09 21:07:05.256868	\N	\N	\N
3900493	Maggie	Doyle	95	268	\N	G	58	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:28.605406	2017-12-09 21:07:05.401834	\N	\N	\N
3900492	Nathanael	Halvorson	61	114	\N	DE	21	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:28.523781	2017-12-09 21:07:05.502069	\N	\N	\N
3900491	Fannie	Hermiston	72	315	\N	P	37	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:28.442682	2017-12-09 21:07:05.633614	\N	\N	\N
3900490	Mario	Herzog	106	170	\N	ILB	90	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:28.109679	2017-12-09 21:07:05.789699	\N	\N	\N
3900489	Mark	Heidenreich	87	222	\N	LT	20	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:28.026129	2017-12-09 21:07:05.90302	\N	\N	\N
3900488	Raven	Barton	89	207	\N	FS	25	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:27.937747	2017-12-09 21:07:06.019588	\N	\N	\N
3900485	Darwin	Weber	71	134	\N	FB	43	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:27.433831	2017-12-09 21:07:06.316492	\N	\N	\N
3900484	Edmond	Veum	88	379	\N	WR	25	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:27.104385	2017-12-09 21:07:06.427417	\N	\N	\N
3900483	Bruce	Lindgren	69	238	\N	TE	75	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:27.022002	2017-12-09 21:07:06.558941	\N	\N	\N
3900482	Nelda	Gulgowski	92	194	\N	FS	74	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:26.931944	2017-12-09 21:07:06.666186	\N	\N	\N
3900481	Winfield	Bahringer	98	347	\N	OLB	14	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:26.602183	2017-12-09 21:07:06.75407	\N	\N	\N
3900479	Dejuan	O'Conner	97	304	\N	QB	35	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:26.435407	2017-12-09 21:07:06.927708	\N	\N	\N
3900478	Lloyd	Morar	109	317	\N	RT	25	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:26.10485	2017-12-09 21:07:07.01826	\N	\N	\N
3900477	Monique	Parisian	82	148	\N	ILB	48	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:26.022315	2017-12-09 21:07:07.128665	\N	\N	\N
3900476	Buck	Hermann	84	201	\N	PR	34	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:25.938254	2017-12-09 21:07:07.2461	\N	\N	\N
3900475	Neoma	Senger	111	292	\N	LT	91	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:25.604524	2017-12-09 21:07:07.335815	\N	\N	\N
3900474	Francisca	Langworth	87	184	\N	CB	54	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:25.517341	2017-12-09 21:07:07.443304	\N	\N	\N
3900473	Fredy	Bashirian	101	152	\N	LG	37	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:25.4325	2017-12-09 21:07:07.521101	\N	\N	\N
3900472	Kyleigh	Langosh	103	320	\N	DT	23	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:25.098629	2017-12-09 21:07:07.614161	\N	\N	\N
3900471	Enrique	Hane	66	240	\N	LT	67	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:25.015239	2017-12-09 21:07:12.784636	\N	\N	\N
3900470	Ellen	Jast	100	186	\N	P	64	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:24.926984	2017-12-09 21:07:12.858816	\N	\N	\N
3900469	Neil	Abshire	91	390	\N	RT	48	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:24.584729	2017-12-09 21:07:12.948272	\N	\N	\N
3900468	Jimmie	Tillman	88	379	\N	DT	62	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:24.496706	2017-12-09 21:07:13.303906	\N	\N	\N
3900467	Olaf	Powlowski	56	151	\N	QB	69	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:24.411797	2017-12-09 21:07:13.395928	\N	\N	\N
3900466	Federico	Goodwin	90	320	\N	T	86	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:24.078332	2017-12-09 21:07:13.516099	\N	\N	\N
3900465	Bridgette	Schulist	72	260	\N	MLB	42	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:23.993792	2017-12-09 21:07:13.627076	\N	\N	\N
3900464	Nico	Kiehn	70	260	\N	FS	68	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:23.904671	2017-12-09 21:07:13.889325	\N	\N	\N
3900463	Merl	Flatley	109	300	\N	C	96	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:23.568129	2017-12-09 21:07:13.984877	\N	\N	\N
3900462	Velma	Vandervort	86	289	\N	RT	5	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:23.484179	2017-12-09 21:07:14.075151	\N	\N	\N
3900461	Leonor	Hammes	111	119	\N	CB	50	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:23.400757	2017-12-09 21:07:14.165463	\N	\N	\N
3900460	Camden	Schinner	81	337	\N	C	87	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:23.06544	2017-12-09 21:07:14.276596	\N	\N	\N
3900459	Rosella	Toy	67	217	\N	P	27	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:22.982762	2017-12-09 21:07:14.368082	\N	\N	\N
3900458	Moses	Weimann	100	274	\N	KR	33	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:22.893418	2017-12-09 21:07:14.460568	\N	\N	\N
3900457	Preston	Wunsch	77	354	\N	FB	35	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:22.559419	2017-12-09 21:07:14.551014	\N	\N	\N
3900456	Karelle	Senger	90	321	\N	RT	74	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:22.476745	2017-12-09 21:07:14.660955	\N	\N	\N
3900455	Amira	Conroy	92	361	\N	PR	63	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:22.394521	2017-12-09 21:07:14.73354	\N	\N	\N
3900454	Audreanne	Dicki	66	133	\N	P	86	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:22.064435	2017-12-09 21:07:14.82337	\N	\N	\N
3900453	Arvid	McCullough	64	162	\N	ILB	79	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:21.980807	2017-12-09 21:07:14.907317	\N	\N	\N
3900452	Hilario	Bode	61	272	\N	TE	90	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:21.895516	2017-12-09 21:07:14.986576	\N	\N	\N
3900451	Phoebe	Eichmann	58	175	\N	PR	46	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:21.567947	2017-12-09 21:07:15.122181	\N	\N	\N
3900450	Delphine	Walker	102	106	\N	ILB	10	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:21.483864	2017-12-09 21:07:15.219723	\N	\N	\N
3900449	Hal	Wunsch	92	204	\N	NT	40	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:21.401237	2017-12-09 21:07:15.298365	\N	\N	\N
3900448	Otha	Swift	64	296	\N	OLB	59	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:21.064087	2017-12-09 21:07:15.384873	\N	\N	\N
3900447	Brice	Schuster	108	114	\N	CB	58	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:20.979989	2017-12-09 21:07:15.494516	\N	\N	\N
3900446	Norene	Cartwright	88	130	\N	G	96	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:20.889714	2017-12-09 21:07:15.583744	\N	\N	\N
3900445	Carissa	Walker	70	156	\N	FS	92	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:20.55728	2017-12-09 21:07:15.67589	\N	\N	\N
3900444	Max	Heidenreich	81	315	\N	LG	2	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:20.475438	2017-12-09 21:07:15.764526	\N	\N	\N
3900443	Wilford	Schamberger	97	147	\N	ILB	49	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:20.392878	2017-12-09 21:07:15.851702	\N	\N	\N
3900442	Charley	Johnson	59	259	\N	CB	98	\N	\N	\N	\N	\N	\N	2018	2017-12-09 21:06:20.061242	2017-12-09 21:07:15.94662	\N	\N	\N
3900441	Lilly	Gottlieb	75	329	\N	DT	7	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:19.973625	2017-12-09 21:07:16.03567	\N	\N	\N
3900440	Leo	Ullrich	95	357	\N	C	60	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:19.890659	2017-12-09 21:07:16.111946	\N	\N	\N
3900439	Tamara	Swift	71	330	\N	RG	94	\N	\N	\N	\N	\N	\N	2016	2017-12-09 21:06:19.563102	2017-12-09 21:07:16.200765	\N	\N	\N
3900438	Furman	Klein	92	131	\N	G	99	\N	\N	\N	\N	\N	\N	2017	2017-12-09 21:06:19.481	2017-12-09 21:07:16.304412	\N	\N	\N
3900437	Loy	Moen	78	266	\N	OLB	59	\N	\N	\N	\N	\N	\N	2019	2017-12-09 21:06:19.34227	2017-12-09 21:07:16.394116	\N	\N	\N
\.


--
-- Name: athletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('athletes_id_seq', 3900496, true);


--
-- Data for Name: centers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY centers (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
35993429	2013	6	1	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
726045287	2015	6	1	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
844088287	2016	6	1	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
844088288	2017	82	2	2017-12-09 21:07:06.100663	2017-12-09 21:07:06.100663
844088289	2016	177	68	2017-12-09 21:07:06.106732	2017-12-09 21:07:06.106732
844088290	2015	88	11	2017-12-09 21:07:06.112495	2017-12-09 21:07:06.112495
844088291	2014	145	193	2017-12-09 21:07:06.118444	2017-12-09 21:07:06.118444
844088292	2016	92	114	2017-12-09 21:07:12.820361	2017-12-09 21:07:12.820361
844088293	2015	67	115	2017-12-09 21:07:12.82672	2017-12-09 21:07:12.82672
844088294	2014	33	35	2017-12-09 21:07:12.833428	2017-12-09 21:07:12.833428
844088295	2013	178	129	2017-12-09 21:07:12.839803	2017-12-09 21:07:12.839803
844088296	2016	168	138	2017-12-09 21:07:13.994057	2017-12-09 21:07:13.994057
844088297	2015	121	189	2017-12-09 21:07:14.000634	2017-12-09 21:07:14.000634
844088298	2014	131	185	2017-12-09 21:07:14.006857	2017-12-09 21:07:14.006857
844088299	2013	179	44	2017-12-09 21:07:14.013319	2017-12-09 21:07:14.013319
844088300	2017	122	82	2017-12-09 21:07:14.285639	2017-12-09 21:07:14.285639
844088301	2016	197	114	2017-12-09 21:07:14.291871	2017-12-09 21:07:14.291871
844088302	2015	64	138	2017-12-09 21:07:14.297903	2017-12-09 21:07:14.297903
844088303	2014	168	127	2017-12-09 21:07:14.305504	2017-12-09 21:07:14.305504
844088304	2018	170	24	2017-12-09 21:07:14.883976	2017-12-09 21:07:14.883976
844088305	2017	80	142	2017-12-09 21:07:14.890223	2017-12-09 21:07:14.890223
844088306	2016	120	48	2017-12-09 21:07:14.896811	2017-12-09 21:07:14.896811
844088307	2015	123	105	2017-12-09 21:07:14.902914	2017-12-09 21:07:14.902914
844088308	2018	16	101	2017-12-09 21:07:15.25898	2017-12-09 21:07:15.25898
844088309	2017	166	7	2017-12-09 21:07:15.265329	2017-12-09 21:07:15.265329
844088310	2016	74	114	2017-12-09 21:07:15.272035	2017-12-09 21:07:15.272035
844088311	2015	65	73	2017-12-09 21:07:15.27899	2017-12-09 21:07:15.27899
844088312	2018	108	56	2017-12-09 21:07:15.891783	2017-12-09 21:07:15.891783
844088313	2017	45	73	2017-12-09 21:07:15.899003	2017-12-09 21:07:15.899003
844088314	2016	139	1	2017-12-09 21:07:15.905496	2017-12-09 21:07:15.905496
844088315	2015	110	60	2017-12-09 21:07:15.912018	2017-12-09 21:07:15.912018
844088316	2016	8	38	2017-12-09 21:07:16.120683	2017-12-09 21:07:16.120683
844088317	2015	126	43	2017-12-09 21:07:16.126816	2017-12-09 21:07:16.126816
844088318	2014	44	24	2017-12-09 21:07:16.132924	2017-12-09 21:07:16.132924
844088319	2013	165	145	2017-12-09 21:07:16.139161	2017-12-09 21:07:16.139161
\.


--
-- Name: centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('centers_id_seq', 844088319, true);


--
-- Data for Name: coaches; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY coaches (id, first_name, last_name, role, role_name, bio, avatar, "position", created_at, updated_at) FROM stdin;
706170480	HS	Coach	1	Head Coach	He's witty, affectionate, helpful and perhaps a little too harsh. Which isn't out of the ordinary for someone with his position. He was born in an average family in a developing port. He lived happily until he was about 16 years old, but at that point things changed. He started playing football.	\N	0	2017-12-09 19:45:42.831332	2017-12-09 19:45:42.831332
644468115	College	Coach	1	Head Coach	He's witty, affectionate, helpful and perhaps a little too harsh. Which isn't out of the ordinary for someone with his position. He was born in an average family in a developing port. He lived happily until he was about 16 years old, but at that point things changed. He started playing football.	\N	0	2017-12-09 19:45:42.831332	2017-12-09 19:45:42.831332
706170961	Juanita	Prohaska	0	Coach	Selfies marfa health 90's biodiesel shoreditch yolo fashion axe.Diy fixie butcher raw denim.Kinfolk twee aesthetic fixie.	\N	0	2017-12-09 21:06:18.933457	2017-12-09 21:06:18.933457
706170962	Murl	Murphy	0	Coach	Viral vegan occupy yuccie wayfarers.Wayfarers etsy yuccie chartreuse keffiyeh paleo selvage knausgaard.Art party chia butcher craft beer cardigan try-hard skateboard.	\N	0	2017-12-09 21:06:19.094341	2017-12-09 21:06:19.094341
706170963	Frieda	Johns	0	Coach	Try-hard paleo leggings.Before they sold out photo booth cray you probably haven't heard of them migas humblebrag phlogiston.Echo humblebrag farm-to-table 3 wolf moon letterpress freegan narwhal.	\N	0	2017-12-09 21:06:19.171506	2017-12-09 21:06:19.171506
706170964	Darion	Huel	0	Coach	Thundercats letterpress carry schlitz.Godard put a bird on it carry meh bushwick humblebrag sustainable.Pitchfork neutra art party artisan waistcoat taxidermy shoreditch.	\N	0	2017-12-09 21:06:19.653935	2017-12-09 21:06:19.653935
706170965	Kamryn	Fahey	0	Coach	Salvia chartreuse mustache.Cliche pitchfork kale chips cornhole.Ugh asymmetrical deep v schlitz portland umami hoodie.	\N	0	2017-12-09 21:06:19.733073	2017-12-09 21:06:19.733073
706170966	Jane	Harris	0	Coach	Next level pug cronut squid ennui phlogiston.+1 normcore twee pop-up.Fixie gastropub shoreditch hammock microdosing chambray leggings semiotics.	\N	0	2017-12-09 21:06:19.810539	2017-12-09 21:06:19.810539
706170967	Catharine	Carter	0	Coach	Disrupt church-key muggle magic crucifix leggings.Narwhal twee neutra austin mixtape.Schlitz yuccie poutine try-hard.	\N	0	2017-12-09 21:06:20.15468	2017-12-09 21:06:20.15468
706170968	Ben	Berge	0	Coach	Austin everyday pinterest.Five dollar toast cred sartorial gastropub vinegar freegan letterpress.Messenger bag tote bag actually street brunch.	\N	0	2017-12-09 21:06:20.23526	2017-12-09 21:06:20.23526
706170969	Gwen	Lind	0	Coach	Trust fund artisan you probably haven't heard of them brooklyn cornhole.Cred hella biodiesel fashion axe pork belly occupy.Xoxo next level skateboard.	\N	0	2017-12-09 21:06:20.313455	2017-12-09 21:06:20.313455
706170970	Elenor	Trantow	0	Coach	Kogi pug salvia chambray.Taxidermy wes anderson wayfarers plaid mustache pickled mixtape hashtag.Mustache microdosing 90's wolf.	\N	0	2017-12-09 21:06:20.650997	2017-12-09 21:06:20.650997
706170971	Florida	Kling	0	Coach	Kickstarter vinegar paleo knausgaard semiotics tofu etsy.Thundercats mixtape waistcoat.Umami distillery dreamcatcher.	\N	0	2017-12-09 21:06:20.730194	2017-12-09 21:06:20.730194
706170972	Vesta	Beer	0	Coach	Typewriter raw denim actually chia flexitarian taxidermy.Raw denim waistcoat disrupt portland sartorial post-ironic lo-fi selfies.Artisan ethical meh tote bag chicharrones normcore banh mi.	\N	0	2017-12-09 21:06:20.808832	2017-12-09 21:06:20.808832
706170973	Hugh	Durgan	0	Coach	Hammock heirloom cliche.Leggings heirloom synth stumptown typewriter.Mlkshk selfies retro echo.	\N	0	2017-12-09 21:06:21.159891	2017-12-09 21:06:21.159891
706170974	Reyna	Leannon	0	Coach	Cray deep v yolo.Intelligentsia neutra organic yuccie ugh kitsch.Quinoa carry pug slow-carb post-ironic authentic.	\N	0	2017-12-09 21:06:21.241081	2017-12-09 21:06:21.241081
706170975	Esther	Zemlak	0	Coach	Everyday phlogiston kitsch diy 90's.Tilde vhs dreamcatcher chia lumbersexual fanny pack sustainable blog.Retro literally keytar beard skateboard quinoa blog.	\N	0	2017-12-09 21:06:21.321253	2017-12-09 21:06:21.321253
706170976	Everett	Rutherford	0	Coach	Chia pitchfork mlkshk shoreditch pickled.Twee dreamcatcher taxidermy.Banjo ugh polaroid yr actually chambray 8-bit.	\N	0	2017-12-09 21:06:21.65969	2017-12-09 21:06:21.65969
706170977	Ettie	McGlynn	0	Coach	Chambray cold-pressed meh vegan bespoke austin kogi artisan.Pour-over neutra shoreditch.Knausgaard gentrify art party freegan trust fund readymade mlkshk post-ironic.	\N	0	2017-12-09 21:06:21.738587	2017-12-09 21:06:21.738587
706170978	Chauncey	Kuvalis	0	Coach	90's kickstarter squid.Bushwick offal locavore.Wes anderson umami farm-to-table.	\N	0	2017-12-09 21:06:21.815969	2017-12-09 21:06:21.815969
706170979	Johann	Predovic	0	Coach	Polaroid post-ironic typewriter yuccie salvia.Flexitarian phlogiston muggle magic lomo.Distillery offal aesthetic hammock blog iphone.	\N	0	2017-12-09 21:06:22.157919	2017-12-09 21:06:22.157919
706170980	Alek	Hegmann	0	Coach	Hoodie pitchfork tofu ethical.Seitan squid vinyl chicharrones.Authentic chartreuse fanny pack yolo direct trade shabby chic.	\N	0	2017-12-09 21:06:22.23755	2017-12-09 21:06:22.23755
706170981	Ardella	Stamm	0	Coach	Disrupt normcore migas distillery.Before they sold out yr +1 goth photo booth stumptown.Authentic gluten-free twee lomo vinyl waistcoat yuccie plaid.	\N	0	2017-12-09 21:06:22.315928	2017-12-09 21:06:22.315928
706170982	Terrence	Koepp	0	Coach	Pickled hashtag selvage try-hard pop-up neutra.Chia seitan lomo godard pbr&b gentrify try-hard.8-bit cleanse lo-fi.	\N	0	2017-12-09 21:06:22.653703	2017-12-09 21:06:22.653703
706170983	Alisa	Glover	0	Coach	Meh cliche tousled banh mi keffiyeh street brooklyn.Chillwave echo literally thundercats scenester.Narwhal farm-to-table leggings shoreditch food truck ugh fixie.	\N	0	2017-12-09 21:06:22.734319	2017-12-09 21:06:22.734319
706170984	Kellen	Deckow	0	Coach	Meditation sartorial carry 8-bit.Taxidermy hammock austin cliche.Try-hard salvia before they sold out portland tumblr schlitz.	\N	0	2017-12-09 21:06:22.813411	2017-12-09 21:06:22.813411
706170985	Janiya	Muller	0	Coach	Williamsburg carry hashtag bitters tousled distillery actually phlogiston.Migas mixtape occupy sustainable portland.Tote bag pbr&b raw denim.	\N	0	2017-12-09 21:06:23.161336	2017-12-09 21:06:23.161336
706170986	Margie	Beier	0	Coach	Pinterest cliche helvetica organic chillwave vinyl.Cornhole yolo tilde you probably haven't heard of them.Keffiyeh wayfarers pop-up readymade offal loko typewriter.	\N	0	2017-12-09 21:06:23.241448	2017-12-09 21:06:23.241448
706170987	Kenny	Kutch	0	Coach	Selfies photo booth banjo.Readymade 3 wolf moon phlogiston austin.Vhs freegan disrupt post-ironic heirloom lomo shoreditch humblebrag.	\N	0	2017-12-09 21:06:23.320473	2017-12-09 21:06:23.320473
706170988	Jermey	Heathcote	0	Coach	Polaroid brunch wolf lomo raw denim.Actually intelligentsia craft beer cold-pressed banjo.Chicharrones vinyl selfies hella dreamcatcher.	\N	0	2017-12-09 21:06:23.663036	2017-12-09 21:06:23.663036
706170989	Amani	Haley	0	Coach	Austin paleo locavore polaroid.Tousled cred viral irony everyday vice brooklyn semiotics.Kitsch fingerstache tote bag keytar.	\N	0	2017-12-09 21:06:23.743806	2017-12-09 21:06:23.743806
706170990	Izabella	Ondricka	0	Coach	Keytar pug cold-pressed before they sold out stumptown raw denim craft beer.Cleanse photo booth franzen thundercats shoreditch swag try-hard.Seitan neutra trust fund direct trade chartreuse raw denim.	\N	0	2017-12-09 21:06:23.824876	2017-12-09 21:06:23.824876
706170991	Terrell	Olson	0	Coach	You probably haven't heard of them fanny pack kickstarter.Fingerstache goth paleo.Cred pabst loko flannel celiac brooklyn trust fund pop-up.	\N	0	2017-12-09 21:06:24.17418	2017-12-09 21:06:24.17418
706170992	Monica	Cremin	0	Coach	Mumblecore messenger bag drinking humblebrag jean shorts.+1 crucifix offal goth cleanse chicharrones messenger bag.Intelligentsia bicycle rights 3 wolf moon selvage readymade single-origin coffee.	\N	0	2017-12-09 21:06:24.253615	2017-12-09 21:06:24.253615
706170993	Emie	Hyatt	0	Coach	Listicle trust fund direct trade five dollar toast kitsch truffaut +1 distillery.Deep v tote bag messenger bag brooklyn cray migas.Tattooed pour-over 90's butcher chambray chartreuse mlkshk.	\N	0	2017-12-09 21:06:24.332053	2017-12-09 21:06:24.332053
706170994	Colten	Lesch	0	Coach	Hoodie yuccie 3 wolf moon.Pinterest selfies lumbersexual fashion axe hashtag trust fund cred letterpress.Everyday beard synth health fingerstache.	\N	0	2017-12-09 21:06:24.682935	2017-12-09 21:06:24.682935
706170995	Marge	Schimmel	0	Coach	Neutra next level heirloom stumptown ethical organic.Vhs phlogiston literally forage tumblr.Farm-to-table fixie deep v crucifix.	\N	0	2017-12-09 21:06:24.765537	2017-12-09 21:06:24.765537
706170996	Reyes	Sipes	0	Coach	Taxidermy humblebrag food truck.Williamsburg wes anderson venmo knausgaard put a bird on it pinterest.Distillery whatever pbr&b.	\N	0	2017-12-09 21:06:24.846521	2017-12-09 21:06:24.846521
706170997	Javier	Terry	0	Coach	Literally gastropub heirloom put a bird on it disrupt.Park schlitz salvia loko neutra cornhole.Mustache pork belly you probably haven't heard of them irony church-key.	\N	0	2017-12-09 21:06:25.193805	2017-12-09 21:06:25.193805
706170998	Zelma	Harber	0	Coach	Meditation aesthetic diy viral.Pbr&b iphone street master etsy.Messenger bag yr fashion axe banh mi carry.	\N	0	2017-12-09 21:06:25.273783	2017-12-09 21:06:25.273783
706170999	Sabina	Feeney	0	Coach	Wes anderson actually goth chillwave tousled bitters health.Goth sustainable squid.Irony thundercats cred pinterest bespoke.	\N	0	2017-12-09 21:06:25.352598	2017-12-09 21:06:25.352598
706171000	Ken	Greenfelder	0	Coach	Fashion axe occupy cliche blog.Messenger bag direct trade carry keffiyeh skateboard letterpress freegan jean shorts.Freegan kale chips food truck yr normcore whatever.	\N	0	2017-12-09 21:06:25.699386	2017-12-09 21:06:25.699386
706171001	Bennie	Streich	0	Coach	Direct trade intelligentsia tumblr kitsch vinegar.Skateboard green juice readymade.Health food truck ugh austin.	\N	0	2017-12-09 21:06:25.778858	2017-12-09 21:06:25.778858
706171002	Clinton	Wolff	0	Coach	Tote bag artisan lomo.Jean shorts blog vegan.Plaid church-key franzen hammock flexitarian jean shorts.	\N	0	2017-12-09 21:06:25.858412	2017-12-09 21:06:25.858412
706171003	Adah	Russel	0	Coach	Migas chambray master.Ramps ugh knausgaard kinfolk cray forage chillwave pabst.Keytar small batch wolf cornhole.	\N	0	2017-12-09 21:06:26.198257	2017-12-09 21:06:26.198257
706171004	Rosa	Maggio	0	Coach	Food truck knausgaard wes anderson artisan lumbersexual whatever.Brooklyn seitan venmo.Typewriter viral schlitz flannel venmo swag chillwave roof.	\N	0	2017-12-09 21:06:26.278185	2017-12-09 21:06:26.278185
706171005	Dalton	Cummerata	0	Coach	Skateboard plaid humblebrag.Wolf thundercats irony locavore vinyl ramps.Offal gentrify wayfarers echo messenger bag.	\N	0	2017-12-09 21:06:26.356851	2017-12-09 21:06:26.356851
706171006	Larissa	Medhurst	0	Coach	Selvage xoxo muggle magic wolf deep v tote bag.Church-key flannel biodiesel irony blue bottle park humblebrag.Small batch ethical narwhal stumptown blog venmo dreamcatcher ugh.	\N	0	2017-12-09 21:06:26.695561	2017-12-09 21:06:26.695561
706171007	Frances	Beatty	0	Coach	Bicycle rights green juice vinyl organic mumblecore typewriter lumbersexual drinking.Williamsburg cleanse 90's meh bicycle rights.Austin pop-up viral.	\N	0	2017-12-09 21:06:26.774377	2017-12-09 21:06:26.774377
706171008	Desmond	Anderson	0	Coach	Bicycle rights williamsburg flannel you probably haven't heard of them cliche fingerstache.Yuccie godard skateboard narwhal lumbersexual pbr&b chia.Letterpress kitsch thundercats lo-fi.	\N	0	2017-12-09 21:06:26.852675	2017-12-09 21:06:26.852675
706171009	Ricardo	Senger	0	Coach	Listicle pitchfork asymmetrical irony brooklyn vhs cliche mixtape.Mixtape humblebrag shoreditch kitsch echo retro.Kale chips disrupt offal etsy marfa put a bird on it.	\N	0	2017-12-09 21:06:27.19683	2017-12-09 21:06:27.19683
706171010	Thaddeus	Lynch	0	Coach	Kitsch kogi sustainable letterpress kinfolk post-ironic narwhal.Disrupt tumblr raw denim letterpress cliche.Flannel skateboard banh mi deep v trust fund.	\N	0	2017-12-09 21:06:27.276296	2017-12-09 21:06:27.276296
706171011	Bianka	Heaney	0	Coach	Pabst swag umami.Tote bag venmo listicle godard mumblecore flannel pop-up.Paleo hoodie mumblecore.	\N	0	2017-12-09 21:06:27.354461	2017-12-09 21:06:27.354461
706171012	Mya	Mayert	0	Coach	Loko locavore cardigan phlogiston hoodie actually celiac brooklyn.Butcher shabby chic gluten-free truffaut fixie kitsch loko skateboard.Gentrify keffiyeh biodiesel cornhole kickstarter mlkshk migas.	\N	0	2017-12-09 21:06:27.699309	2017-12-09 21:06:27.699309
706171013	Dayne	Price	0	Coach	Cred ennui food truck pork belly yr carry waistcoat selfies.Cornhole thundercats shoreditch you probably haven't heard of them.Cleanse iphone forage narwhal before they sold out neutra chillwave ugh.	\N	0	2017-12-09 21:06:27.779248	2017-12-09 21:06:27.779248
706171014	Idella	Pouros	0	Coach	Swag single-origin coffee mlkshk sriracha venmo schlitz.Seitan stumptown austin lomo whatever chartreuse kombucha.Intelligentsia readymade microdosing deep v disrupt.	\N	0	2017-12-09 21:06:27.858071	2017-12-09 21:06:27.858071
706171015	Eino	Fisher	0	Coach	Readymade mumblecore tacos master.Bespoke single-origin coffee organic kinfolk.Try-hard freegan green juice organic stumptown salvia.	\N	0	2017-12-09 21:06:28.209069	2017-12-09 21:06:28.209069
706171016	Rolando	Schiller	0	Coach	Pitchfork synth truffaut green juice art party locavore wes anderson.Pour-over chartreuse next level vice fingerstache occupy pinterest.Sartorial aesthetic salvia.	\N	0	2017-12-09 21:06:28.2861	2017-12-09 21:06:28.2861
706171017	Vincent	Durgan	0	Coach	Selfies raw denim chartreuse pinterest.Meditation wes anderson phlogiston loko diy blog.Cleanse heirloom flexitarian cornhole vice.	\N	0	2017-12-09 21:06:28.364221	2017-12-09 21:06:28.364221
706171018	Delfina	MacGyver	0	Coach	Humblebrag sartorial wayfarers 8-bit meh farm-to-table.Freegan polaroid intelligentsia crucifix bicycle rights.Pour-over banh mi blue bottle flexitarian.	\N	0	2017-12-09 21:06:28.696629	2017-12-09 21:06:28.696629
706171019	Cordia	Hartmann	0	Coach	Organic salvia narwhal migas irony heirloom ethical readymade.Chia tattooed ramps fashion axe church-key.Scenester bushwick distillery.	\N	0	2017-12-09 21:06:28.774832	2017-12-09 21:06:28.774832
706171020	Keaton	Kessler	0	Coach	Literally yolo flannel microdosing portland keytar.Twee tilde tumblr chartreuse polaroid.Church-key squid carry.	\N	0	2017-12-09 21:06:28.852882	2017-12-09 21:06:28.852882
706171021	Wallace	Schumm	0	Coach	Fingerstache sustainable heirloom retro yuccie lo-fi.Gentrify distillery artisan waistcoat salvia.Deep v celiac freegan seitan.	\N	0	2017-12-09 21:06:29.234911	2017-12-09 21:06:29.234911
706171022	Winston	Hudson	0	Coach	Raw denim stumptown austin mixtape mustache bushwick.Yr single-origin coffee gentrify next level whatever hammock kogi messenger bag.Ennui godard literally street messenger bag crucifix.	\N	0	2017-12-09 21:06:29.312404	2017-12-09 21:06:29.312404
706171023	Patience	Ortiz	0	Coach	Disrupt godard readymade hella bespoke shabby chic.Pickled gastropub poutine marfa banjo direct trade kogi.Wolf sartorial keytar slow-carb truffaut locavore.	\N	0	2017-12-09 21:06:29.39014	2017-12-09 21:06:29.39014
706171024	Daisha	Kuphal	0	Coach	Etsy irony wayfarers neutra.Venmo blog lomo everyday marfa selfies.Pop-up retro vegan.	\N	0	2017-12-09 21:06:29.476711	2017-12-09 21:06:29.476711
706171025	Jerel	Kertzmann	0	Coach	Flexitarian scenester kogi.Bicycle rights distillery chillwave poutine hashtag viral.Xoxo tote bag kinfolk pabst trust fund.	\N	0	2017-12-09 21:06:29.554097	2017-12-09 21:06:29.554097
706171026	Meggie	Kreiger	0	Coach	Disrupt fashion axe mixtape locavore godard blue bottle carry sriracha.Wayfarers portland master pork belly.Paleo art party waistcoat biodiesel neutra drinking pitchfork meh.	\N	0	2017-12-09 21:06:29.631989	2017-12-09 21:06:29.631989
706171027	Alaina	VonRueden	0	Coach	Asymmetrical meditation mixtape.Austin godard tacos polaroid vinyl paleo kombucha.Bitters kogi carry keffiyeh pug tofu craft beer.	\N	0	2017-12-09 21:06:29.719558	2017-12-09 21:06:29.719558
706171028	Jan	Satterfield	0	Coach	Swag dreamcatcher green juice flannel you probably haven't heard of them.Loko 8-bit cray pbr&b direct trade slow-carb.Ramps health meh helvetica kale chips.	\N	0	2017-12-09 21:06:29.798651	2017-12-09 21:06:29.798651
706171029	Skye	Ankunding	0	Coach	Venmo blog sustainable roof whatever slow-carb.Asymmetrical vinegar seitan pour-over.Messenger bag 3 wolf moon church-key ramps tumblr normcore semiotics pbr&b.	\N	0	2017-12-09 21:06:29.87671	2017-12-09 21:06:29.87671
706171030	Tressa	Kovacek	0	Coach	Pbr&b cornhole franzen.Paleo stumptown normcore forage mustache scenester echo distillery.Letterpress chillwave phlogiston crucifix offal whatever ennui selfies.	\N	0	2017-12-09 21:06:29.963888	2017-12-09 21:06:29.963888
706171031	Jacey	Jerde	0	Coach	Hoodie tilde shabby chic salvia.Etsy try-hard brunch mustache scenester raw denim put a bird on it.Pabst neutra small batch mlkshk bicycle rights farm-to-table direct trade.	\N	0	2017-12-09 21:06:30.046496	2017-12-09 21:06:30.046496
706171032	Melba	Little	0	Coach	Cardigan mixtape street muggle magic synth.Squid sartorial ethical meditation messenger bag.Cliche meggings knausgaard cornhole sartorial paleo photo booth.	\N	0	2017-12-09 21:06:30.124208	2017-12-09 21:06:30.124208
706171033	Carmen	MacGyver	0	Coach	Blue bottle semiotics sartorial fingerstache polaroid.Chambray intelligentsia green juice crucifix kickstarter blog photo booth.Twee you probably haven't heard of them iphone phlogiston godard before they sold out vhs.	\N	0	2017-12-09 21:06:30.212748	2017-12-09 21:06:30.212748
706171034	Lesly	Beahan	0	Coach	Twee freegan artisan wes anderson schlitz.Synth ramps leggings chicharrones everyday kitsch.Chicharrones tumblr shabby chic.	\N	0	2017-12-09 21:06:30.292623	2017-12-09 21:06:30.292623
706171035	Rosalee	Hahn	0	Coach	Tumblr gentrify pitchfork cold-pressed.Before they sold out xoxo chambray.Intelligentsia pinterest cronut.	\N	0	2017-12-09 21:06:30.37149	2017-12-09 21:06:30.37149
706171036	Keara	Parker	0	Coach	Hammock messenger bag keytar.Crucifix tumblr slow-carb chambray.Wolf kombucha aesthetic heirloom butcher meggings.	\N	0	2017-12-09 21:06:30.460547	2017-12-09 21:06:30.460547
706171037	Jaylen	Hermiston	0	Coach	Franzen biodiesel roof tattooed.Poutine mustache actually farm-to-table iphone yolo viral seitan.Single-origin coffee tote bag whatever chillwave lumbersexual street yolo normcore.	\N	0	2017-12-09 21:06:30.540151	2017-12-09 21:06:30.540151
706171038	Sallie	Kemmer	0	Coach	Meditation artisan try-hard lumbersexual tofu.Chicharrones shabby chic street lomo gentrify tousled.Migas food truck helvetica messenger bag banjo try-hard you probably haven't heard of them butcher.	\N	0	2017-12-09 21:06:30.620003	2017-12-09 21:06:30.620003
706171039	Emanuel	Parker	0	Coach	Blog franzen cronut mlkshk.Etsy ugh franzen try-hard craft beer.Cleanse deep v yolo biodiesel slow-carb direct trade selfies synth.	\N	0	2017-12-09 21:06:30.711187	2017-12-09 21:06:30.711187
706171040	Stephon	Franecki	0	Coach	Schlitz tacos occupy meggings.Health pickled selvage twee kitsch shoreditch.Yr health pinterest.	\N	0	2017-12-09 21:06:30.790527	2017-12-09 21:06:30.790527
706171041	Tressa	Feil	0	Coach	Flannel photo booth portland microdosing intelligentsia.Schlitz kinfolk you probably haven't heard of them offal keffiyeh.Chartreuse blue bottle authentic muggle magic leggings meditation swag thundercats.	\N	0	2017-12-09 21:06:30.869576	2017-12-09 21:06:30.869576
706171042	Alden	Haley	0	Coach	Cold-pressed tote bag gastropub.Raw denim wayfarers yuccie waistcoat asymmetrical tacos slow-carb pug.Craft beer fashion axe pour-over farm-to-table deep v green juice flexitarian.	\N	0	2017-12-09 21:06:30.958649	2017-12-09 21:06:30.958649
706171043	Jaylon	Howell	0	Coach	Listicle neutra next level banh mi selfies sriracha tilde truffaut.Humblebrag distillery swag jean shorts try-hard twee.Vinegar umami chillwave keffiyeh.	\N	0	2017-12-09 21:06:31.037952	2017-12-09 21:06:31.037952
706171044	Kay	Dibbert	0	Coach	Cardigan ugh locavore roof.Banjo ethical try-hard five dollar toast heirloom knausgaard pug.Five dollar toast wes anderson humblebrag aesthetic seitan.	\N	0	2017-12-09 21:06:31.11618	2017-12-09 21:06:31.11618
706171045	Brock	Huels	0	Coach	Street humblebrag pop-up messenger bag.Kitsch scenester plaid yr photo booth organic.Freegan cold-pressed meggings.	\N	0	2017-12-09 21:06:31.202906	2017-12-09 21:06:31.202906
706171046	Leila	Bailey	0	Coach	Cray literally tilde iphone vice five dollar toast pabst.Polaroid deep v brunch cronut actually you probably haven't heard of them umami.Green juice literally next level.	\N	0	2017-12-09 21:06:31.279593	2017-12-09 21:06:31.279593
706171047	Carmen	Schuppe	0	Coach	Mixtape cardigan goth meh cleanse authentic.Flannel art party +1 lomo humblebrag taxidermy schlitz.Beard pour-over knausgaard park fingerstache.	\N	0	2017-12-09 21:06:31.356647	2017-12-09 21:06:31.356647
706171048	Landen	Dach	0	Coach	Health literally narwhal tousled taxidermy synth humblebrag bicycle rights.Mumblecore brooklyn everyday.Butcher skateboard shoreditch fixie goth franzen.	\N	0	2017-12-09 21:06:31.443736	2017-12-09 21:06:31.443736
706171049	August	Crooks	0	Coach	Pickled pour-over loko.Farm-to-table freegan wes anderson organic cronut.Polaroid waistcoat vinegar farm-to-table cliche scenester everyday vegan.	\N	0	2017-12-09 21:06:31.520937	2017-12-09 21:06:31.520937
706171050	Nellie	Willms	0	Coach	Pop-up authentic kale chips carry.Five dollar toast flannel waistcoat brooklyn meditation typewriter.Hella retro tousled twee.	\N	0	2017-12-09 21:06:31.599031	2017-12-09 21:06:31.599031
706171051	Myrtis	Smitham	0	Coach	Tousled cronut pabst green juice neutra chillwave post-ironic tote bag.Art party mumblecore artisan direct trade literally etsy pbr&b farm-to-table.Chia dreamcatcher cronut aesthetic kickstarter offal asymmetrical tofu.	\N	0	2017-12-09 21:06:31.686647	2017-12-09 21:06:31.686647
706171052	Edgardo	Gutkowski	0	Coach	Lo-fi ennui pinterest thundercats street park before they sold out.You probably haven't heard of them direct trade keytar.Tousled butcher craft beer yuccie next level.	\N	0	2017-12-09 21:06:31.7652	2017-12-09 21:06:31.7652
706171053	Rosetta	Goyette	0	Coach	Diy tote bag five dollar toast iphone tilde fanny pack.Disrupt kitsch chia trust fund cardigan mustache cred knausgaard.Direct trade pork belly hoodie 90's tumblr craft beer.	\N	0	2017-12-09 21:06:31.843028	2017-12-09 21:06:31.843028
706171054	Ephraim	Kassulke	0	Coach	Mixtape kogi williamsburg stumptown phlogiston.Phlogiston jean shorts kickstarter.Bespoke vinyl marfa fingerstache chillwave.	\N	0	2017-12-09 21:06:31.931825	2017-12-09 21:06:31.931825
706171055	Rod	Fisher	0	Coach	Poutine typewriter vice green juice asymmetrical sriracha squid.Whatever synth kickstarter park.Thundercats tousled bitters phlogiston meggings waistcoat chambray bespoke.	\N	0	2017-12-09 21:06:32.01054	2017-12-09 21:06:32.01054
706171056	Holden	Lowe	0	Coach	Iphone shoreditch neutra ugh fashion axe vhs.Skateboard fashion axe letterpress you probably haven't heard of them.Neutra quinoa chicharrones meggings.	\N	0	2017-12-09 21:06:32.088511	2017-12-09 21:06:32.088511
706171057	Wyatt	Kautzer	0	Coach	Authentic 90's try-hard.Pitchfork cornhole helvetica muggle magic pinterest.Cronut irony mlkshk vinegar pabst drinking listicle.	\N	0	2017-12-09 21:06:32.176029	2017-12-09 21:06:32.176029
706171058	Trinity	Kassulke	0	Coach	Lomo truffaut single-origin coffee etsy semiotics celiac food truck distillery.Everyday sustainable plaid pinterest fashion axe freegan meh.Schlitz bicycle rights echo scenester goth diy freegan.	\N	0	2017-12-09 21:06:32.259612	2017-12-09 21:06:32.259612
706171059	Domenic	King	0	Coach	Yr cronut yuccie.Franzen iphone ugh.Chia locavore tattooed wayfarers twee hoodie cold-pressed keffiyeh.	\N	0	2017-12-09 21:06:32.337738	2017-12-09 21:06:32.337738
706171060	Marco	Wisozk	0	Coach	Loko pinterest intelligentsia xoxo pitchfork selfies deep v.Retro raw denim sustainable migas.Kombucha muggle magic mumblecore thundercats banh mi.	\N	0	2017-12-09 21:06:32.425702	2017-12-09 21:06:32.425702
706171061	Jammie	Batz	0	Coach	Etsy narwhal franzen sartorial photo booth next level.Meditation banh mi letterpress raw denim tilde hella.Vice helvetica portland authentic twee distillery direct trade.	\N	0	2017-12-09 21:06:32.504413	2017-12-09 21:06:32.504413
706171062	Letha	Hills	0	Coach	Organic marfa gentrify wayfarers disrupt blog.Pabst microdosing literally cardigan chicharrones sartorial.Freegan trust fund migas food truck pour-over echo plaid.	\N	0	2017-12-09 21:06:32.583059	2017-12-09 21:06:32.583059
706171063	Tiffany	Larson	0	Coach	Kombucha vegan yolo brunch cred scenester pickled.Fingerstache offal park tacos pour-over waistcoat mlkshk neutra.Humblebrag brooklyn actually bicycle rights swag lumbersexual mlkshk.	\N	0	2017-12-09 21:06:32.670701	2017-12-09 21:06:32.670701
706171064	Dakota	Turcotte	0	Coach	Literally chicharrones helvetica craft beer.Mustache intelligentsia dreamcatcher you probably haven't heard of them craft beer.Tumblr you probably haven't heard of them health.	\N	0	2017-12-09 21:06:32.749644	2017-12-09 21:06:32.749644
706171065	Dell	Schneider	0	Coach	Deep v selvage drinking cold-pressed tofu pork belly.Wolf cornhole chia actually carry pbr&b.Pabst 3 wolf moon blue bottle quinoa neutra.	\N	0	2017-12-09 21:06:32.827805	2017-12-09 21:06:32.827805
706171066	Ladarius	Dietrich	0	Coach	Food truck quinoa vhs.Cronut tumblr humblebrag marfa vinegar ramps blog.+1 selfies brunch pug twee waistcoat lomo.	\N	0	2017-12-09 21:06:32.916006	2017-12-09 21:06:32.916006
706171067	Joy	Huels	0	Coach	Plaid meggings listicle.Truffaut cliche waistcoat everyday banjo umami.Cray yolo goth celiac kickstarter.	\N	0	2017-12-09 21:06:32.994619	2017-12-09 21:06:32.994619
706171068	Boyd	Powlowski	0	Coach	Cornhole lo-fi chia.Cronut synth pabst cred muggle magic +1.Jean shorts selvage pug aesthetic xoxo.	\N	0	2017-12-09 21:06:33.072299	2017-12-09 21:06:33.072299
706171069	Twila	Powlowski	0	Coach	Sustainable try-hard brooklyn waistcoat.Carry small batch lo-fi ethical pbr&b tote bag shoreditch disrupt.Cred normcore ethical blue bottle.	\N	0	2017-12-09 21:06:33.160385	2017-12-09 21:06:33.160385
706171070	Virgil	Haley	0	Coach	Selfies narwhal vinyl cliche try-hard.Gentrify raw denim green juice bitters pug 3 wolf moon artisan fanny pack.Vice brooklyn food truck single-origin coffee aesthetic.	\N	0	2017-12-09 21:06:33.238071	2017-12-09 21:06:33.238071
706171071	Ambrose	Dibbert	0	Coach	Bespoke 90's you probably haven't heard of them lomo tattooed flannel.Street austin five dollar toast vinegar humblebrag organic before they sold out bitters.Readymade stumptown blog next level sustainable normcore franzen.	\N	0	2017-12-09 21:06:33.315891	2017-12-09 21:06:33.315891
706171072	Gregorio	Vandervort	0	Coach	Readymade organic synth freegan typewriter bicycle rights food truck humblebrag.Hella lomo polaroid.Put a bird on it meh distillery schlitz.	\N	0	2017-12-09 21:06:33.404449	2017-12-09 21:06:33.404449
706171073	Silas	Simonis	0	Coach	Stumptown goth pour-over beard tofu banjo bicycle rights.Typewriter distillery letterpress bicycle rights kickstarter normcore heirloom.Goth cornhole tousled bushwick mlkshk asymmetrical freegan.	\N	0	2017-12-09 21:06:33.483951	2017-12-09 21:06:33.483951
706171074	Mia	Wiza	0	Coach	Fingerstache banjo single-origin coffee.Bushwick green juice yr kale chips.Carry mustache skateboard.	\N	0	2017-12-09 21:06:33.563117	2017-12-09 21:06:33.563117
706171075	Arvel	Weimann	0	Coach	Five dollar toast vhs shoreditch.Sustainable microdosing aesthetic shoreditch chia.Mustache meh loko ramps yolo.	\N	0	2017-12-09 21:06:33.652479	2017-12-09 21:06:33.652479
706171076	Rudolph	Mante	0	Coach	Leggings hashtag gentrify bushwick photo booth mixtape offal.Kogi kombucha pabst skateboard banh mi.Schlitz cleanse authentic pop-up neutra letterpress.	\N	0	2017-12-09 21:06:33.732156	2017-12-09 21:06:33.732156
706171077	Vivien	Pfeffer	0	Coach	Kale chips kitsch cleanse 90's shoreditch waistcoat pour-over stumptown.Beard biodiesel lomo.Tote bag tattooed gastropub hella chartreuse.	\N	0	2017-12-09 21:06:33.811211	2017-12-09 21:06:33.811211
706171078	Eva	Kohler	0	Coach	Try-hard lomo gluten-free tousled artisan pinterest.Lomo umami authentic master.Semiotics mumblecore dreamcatcher muggle magic.	\N	0	2017-12-09 21:06:33.898671	2017-12-09 21:06:33.898671
706171079	Jacquelyn	Altenwerth	0	Coach	Gluten-free small batch authentic.Gentrify iphone direct trade.Sartorial kale chips celiac pbr&b lomo pour-over flannel.	\N	0	2017-12-09 21:06:33.978049	2017-12-09 21:06:33.978049
706171080	Darion	Effertz	0	Coach	Fanny pack shoreditch chillwave stumptown truffaut.Cold-pressed hashtag sriracha raw denim cred sartorial single-origin coffee.Forage art party seitan semiotics iphone banh mi mustache.	\N	0	2017-12-09 21:06:34.056221	2017-12-09 21:06:34.056221
\.


--
-- Name: coaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('coaches_id_seq', 706171080, true);


--
-- Data for Name: colleges; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY colleges (id, name, logo, added_by_id, offensive_schema, defensive_schema, division, enrollment, team_record, mascot, school_email, created_at, updated_at, gpa_requirement, allow_connections) FROM stdin;
718964484	Typical College	\N	\N	We get the ball into their endzone!	We don't let them breathe.	2	5000	5-2	Otter	college@example.com	2017-12-09 19:45:42.784919	2017-12-09 19:45:42.784919	\N	t
718964565	Latent Abilities University	\N	\N	Cardigan photo booth franzen crucifix dreamcatcher flexitarian organic umami.Echo cardigan cred humblebrag single-origin coffee leggings.Mixtape fanny pack venmo literally butcher.	Cray mixtape hammock taxidermy shoreditch meditation lomo.Next level park poutine authentic.Chicharrones phlogiston listicle vhs craft beer offal.	3	2668	6-0	gnomes	marietta_langworth@vonbeier.net	2017-12-09 21:06:29.229458	2017-12-09 21:06:29.229458	\N	t
718964566	Radar Sense University	\N	\N	Celiac meggings migas fashion axe jean shorts.Austin jean shorts food truck wayfarers pabst whatever.Bushwick hashtag yr retro sriracha cred.	Plaid vinegar sartorial keytar.Plaid crucifix listicle vice scenester lo-fi.Pabst locavore chicharrones leggings put a bird on it vice tumblr neutra.	3	3400	6-2	bees	loren.barrows@bruenhaley.org	2017-12-09 21:06:29.47207	2017-12-09 21:06:29.47207	\N	t
718964567	Sonic Scream University	\N	\N	Etsy wes anderson master irony messenger bag pabst single-origin coffee.Thundercats mixtape ramps before they sold out deep v.8-bit gluten-free pitchfork.	Food truck kinfolk five dollar toast yuccie hella ramps before they sold out brunch.Hella flannel retro offal truffaut.Narwhal kinfolk five dollar toast.	3	2221	0-0	banshees	ludie.nader@bernier.io	2017-12-09 21:06:29.714664	2017-12-09 21:06:29.714664	\N	t
718964568	Vaporising Beams University	\N	\N	Art party polaroid farm-to-table.Cardigan chillwave drinking small batch etsy.Bitters scenester offal.	Goth franzen before they sold out bushwick selfies venmo tumblr.Irony disrupt direct trade pour-over.Cardigan lo-fi umami.	2	1439	6-6	pigs	leonora_fisher@kshlerin.co	2017-12-09 21:06:29.959014	2017-12-09 21:06:29.959014	\N	t
718964569	Audiokinesis University	\N	\N	Fixie taxidermy squid deep v.Pabst organic williamsburg mumblecore tacos shoreditch gentrify goth.Retro lumbersexual heirloom intelligentsia you probably haven't heard of them.	Skateboard scenester wayfarers farm-to-table iphone biodiesel street.Tacos yr kombucha cray retro pop-up brunch butcher.Helvetica vegan phlogiston you probably haven't heard of them narwhal portland blog umami.	2	329	3-2	griffins	pedro_lesch@heelgoyette.com	2017-12-09 21:06:30.207232	2017-12-09 21:06:30.207232	\N	t
718964570	Energy Beams University	\N	\N	Normcore mlkshk ugh lo-fi church-key schlitz celiac asymmetrical.Occupy selfies marfa yuccie stumptown tousled beard.Yuccie brooklyn keytar scenester put a bird on it art party.	Cold-pressed flannel retro crucifix listicle.Letterpress seitan disrupt.Cray intelligentsia synth park shoreditch xoxo.	2	1197	1-3	crows	johathan.wunsch@weimann.com	2017-12-09 21:06:30.455075	2017-12-09 21:06:30.455075	\N	t
718964571	Power Sense University	\N	\N	Kale chips xoxo listicle.Pickled plaid vinegar pop-up taxidermy everyday.Sartorial kinfolk mustache twee paleo raw denim.	Slow-carb tacos pitchfork.Phlogiston forage vinegar tote bag umami etsy.Intelligentsia scenester skateboard normcore typewriter post-ironic poutine.	2	790	5-2	gooses	magdalen_jones@wehner.biz	2017-12-09 21:06:30.705414	2017-12-09 21:06:30.705414	\N	t
718964572	Density Control University	\N	\N	Selvage twee post-ironic farm-to-table artisan banh mi pabst distillery.Meditation sriracha kinfolk meh synth hoodie roof.Dreamcatcher pour-over artisan austin beard xoxo 8-bit selvage.	Kombucha marfa truffaut portland.Paleo beard fanny pack vegan quinoa vinyl listicle.Hammock post-ironic skateboard mumblecore goth squid chartreuse.	3	2523	6-6	sorcerors	narciso.bruen@volkman.biz	2017-12-09 21:06:30.95299	2017-12-09 21:06:30.95299	\N	t
718964573	Regeneration University	\N	\N	Kitsch yolo farm-to-table.Tumblr yolo quinoa twee fingerstache.Tousled cliche green juice yr williamsburg.	Gastropub kombucha tousled loko listicle everyday 90's.Yuccie small batch keytar vinyl cray actually hashtag.Squid sriracha tousled.	3	1878	7-6	sheep	heather.schmitt@schumm.info	2017-12-09 21:06:31.198263	2017-12-09 21:06:31.198263	\N	t
718964574	Wallcrawling University	\N	\N	Asymmetrical organic kinfolk.Cleanse authentic cronut five dollar toast kogi.Hoodie cronut raw denim mumblecore try-hard fixie put a bird on it readymade.	Vice ethical tousled drinking.Leggings swag selfies next level mustache biodiesel.Try-hard mumblecore godard thundercats banh mi pour-over.	3	4096	3-6	goats	reva.runte@schuppe.biz	2017-12-09 21:06:31.438815	2017-12-09 21:06:31.438815	\N	t
718964575	Intangibility University	\N	\N	Vinegar slow-carb street tote bag cardigan etsy typewriter pour-over.Tattooed ennui hammock vegan trust fund kale chips.Blue bottle fixie before they sold out selfies.	Chillwave muggle magic goth selfies post-ironic literally narwhal.Tofu phlogiston try-hard.Synth listicle raw denim pug organic everyday meditation selfies.	2	4586	5-1	cats	garrison.kris@schimmel.net	2017-12-09 21:06:31.681152	2017-12-09 21:06:31.681152	\N	t
718964576	Natural Weapons University	\N	\N	Jean shorts tumblr chicharrones before they sold out carry chillwave swag aesthetic.Typewriter bicycle rights next level loko art party carry fanny pack.Brunch fanny pack franzen taxidermy selvage.	Photo booth franzen cred direct trade.Intelligentsia poutine butcher truffaut tacos.Pour-over godard carry fashion axe ennui mixtape.	2	4716	7-6	penguins	idella@hartmann.name	2017-12-09 21:06:31.9269	2017-12-09 21:06:31.9269	\N	t
718964577	Telepathy Resistance University	\N	\N	Pinterest poutine cleanse pop-up.Lo-fi small batch bicycle rights tacos.Bitters chicharrones quinoa swag.	3 wolf moon selfies shoreditch health celiac.Kombucha vhs migas.Blue bottle bushwick locavore artisan.	2	945	7-2	whales	damion@turnerdurgan.org	2017-12-09 21:06:32.17132	2017-12-09 21:06:32.17132	\N	t
718964578	Magic University	\N	\N	Small batch irony gastropub iphone.Selfies marfa synth.Meditation freegan stumptown gluten-free raw denim waistcoat chartreuse.	Vice chillwave thundercats aesthetic yuccie.Mustache wolf biodiesel wes anderson green juice master selfies lomo.Green juice pinterest readymade mlkshk fingerstache.	2	2484	7-6	rabbits	jedediah.johnston@hanesanford.com	2017-12-09 21:06:32.420778	2017-12-09 21:06:32.420778	\N	t
718964579	Vision - Infrared University	\N	\N	Actually sriracha park flexitarian wolf church-key.Deep v vice cronut pinterest echo loko mixtape.Williamsburg venmo meggings try-hard hoodie crucifix pabst.	Art party pop-up messenger bag.Blog heirloom godard normcore chillwave yolo.Microdosing yuccie cronut photo booth lo-fi master diy schlitz.	2	4026	5-7	vixens	sandrine@moenpurdy.net	2017-12-09 21:06:32.66582	2017-12-09 21:06:32.66582	\N	t
718964580	Durability University	\N	\N	Paleo pug distillery literally trust fund.Fashion axe cronut messenger bag.Thundercats disrupt waistcoat readymade.	You probably haven't heard of them chillwave stumptown master keytar echo hella.Pop-up authentic dreamcatcher.Tumblr narwhal butcher.	3	2773	5-0	people	ro@kleinwitting.co	2017-12-09 21:06:32.911049	2017-12-09 21:06:32.911049	\N	t
718964581	Intangibility University	\N	\N	Gastropub banh mi ramps quinoa mlkshk.Poutine marfa photo booth deep v church-key leggings literally.Sartorial leggings kitsch chia kickstarter street plaid.	Meggings locavore cold-pressed farm-to-table chicharrones pork belly craft beer.Lumbersexual truffaut chicharrones.Ethical knausgaard pabst.	3	2494	1-3	prophets	mariah.pfannerstill@damoremcdermott.co	2017-12-09 21:06:33.155444	2017-12-09 21:06:33.155444	\N	t
718964582	Vision - Telescopic University	\N	\N	Plaid chartreuse bushwick trust fund sustainable tattooed biodiesel.Beard godard neutra master yr.Yuccie disrupt ramps umami kinfolk blog.	Typewriter actually thundercats loko truffaut shoreditch.Fanny pack trust fund blue bottle aesthetic wolf.Scenester helvetica ramps farm-to-table kickstarter banjo master.	2	3555	6-2	prophets	florencio_cole@smith.net	2017-12-09 21:06:33.399352	2017-12-09 21:06:33.399352	\N	t
718964583	Radiation Control University	\N	\N	Wes anderson semiotics venmo jean shorts pickled put a bird on it xoxo gastropub.Shoreditch asymmetrical artisan cold-pressed.Austin vice typewriter fanny pack brunch forage tofu williamsburg.	Selfies humblebrag pitchfork.Tumblr pitchfork cleanse offal kitsch dreamcatcher lumbersexual gluten-free.Photo booth beard actually distillery sartorial portland.	2	3901	6-2	witches	cole.prohaska@mcglynnschaefer.net	2017-12-09 21:06:33.64741	2017-12-09 21:06:33.64741	\N	t
718964584	Darkforce Manipulation University	\N	\N	Kombucha mlkshk blue bottle.Schlitz park pickled.Gastropub pitchfork paleo tumblr brooklyn.	Lumbersexual williamsburg kitsch.Actually pabst farm-to-table gluten-free.Narwhal chartreuse jean shorts yr plaid pinterest beard echo.	2	2238	6-7	vixens	zetta@heathcoterobel.io	2017-12-09 21:06:33.893668	2017-12-09 21:06:33.893668	\N	t
\.


--
-- Name: colleges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('colleges_id_seq', 718964584, true);


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY connections (id, athlete_id, college_id, athlete_approved, college_approved, committed, letter_of_intent_signed, created_at, updated_at, last_modified_by_id) FROM stdin;
558305566	3900196	718964583	\N	\N	f	f	2017-12-09 21:13:00.390285	2017-12-09 21:13:00.390285	\N
558305206	3900496	718964565	t	f	f	f	2017-12-09 21:06:34.161136	2017-12-09 21:06:34.161136	\N
558305208	3900496	718964574	f	\N	f	f	2017-12-09 21:06:34.227474	2017-12-09 21:06:34.227474	\N
558305210	3900496	718964566	f	f	f	f	2017-12-09 21:06:34.268362	2017-12-09 21:06:34.268362	\N
558305211	3900496	718964577	\N	\N	f	f	2017-12-09 21:06:34.288966	2017-12-09 21:06:34.288966	\N
558305213	3900495	718964567	t	\N	f	f	2017-12-09 21:06:34.333437	2017-12-09 21:06:34.333437	\N
558305214	3900495	718964574	f	\N	f	f	2017-12-09 21:06:34.35282	2017-12-09 21:06:34.35282	\N
558305215	3900495	718964580	t	t	f	f	2017-12-09 21:06:34.372957	2017-12-09 21:06:34.372957	\N
558305216	3900495	718964579	f	f	f	f	2017-12-09 21:06:34.393837	2017-12-09 21:06:34.393837	\N
558305217	3900495	718964581	\N	\N	f	f	2017-12-09 21:06:34.413865	2017-12-09 21:06:34.413865	\N
558305220	3900494	718964568	f	\N	f	f	2017-12-09 21:06:34.47786	2017-12-09 21:06:34.47786	\N
558305222	3900494	718964579	f	f	f	f	2017-12-09 21:06:34.51805	2017-12-09 21:06:34.51805	\N
558305223	3900494	718964571	\N	\N	f	f	2017-12-09 21:06:34.557208	2017-12-09 21:06:34.557208	\N
558305226	3900493	718964567	f	\N	f	f	2017-12-09 21:06:34.622054	2017-12-09 21:06:34.622054	\N
558305228	3900493	718964582	f	f	f	f	2017-12-09 21:06:34.659729	2017-12-09 21:06:34.659729	\N
558305229	3900493	718964569	\N	\N	f	f	2017-12-09 21:06:34.678661	2017-12-09 21:06:34.678661	\N
558305232	3900492	718964579	f	\N	f	f	2017-12-09 21:06:34.74151	2017-12-09 21:06:34.74151	\N
558305234	3900492	718964574	f	f	f	f	2017-12-09 21:06:34.780585	2017-12-09 21:06:34.780585	\N
558305235	3900492	718964572	\N	\N	f	f	2017-12-09 21:06:34.800854	2017-12-09 21:06:34.800854	\N
558305238	3900491	718964576	f	\N	f	f	2017-12-09 21:06:34.863678	2017-12-09 21:06:34.863678	\N
558305240	3900491	718964574	f	f	f	f	2017-12-09 21:06:34.902839	2017-12-09 21:06:34.902839	\N
558305241	3900491	718964572	\N	\N	f	f	2017-12-09 21:06:34.923051	2017-12-09 21:06:34.923051	\N
558305244	3900490	718964566	f	\N	f	f	2017-12-09 21:06:34.988111	2017-12-09 21:06:34.988111	\N
558305245	3900490	718964574	t	t	f	f	2017-12-09 21:06:35.009933	2017-12-09 21:06:35.009933	\N
558305246	3900490	718964579	f	f	f	f	2017-12-09 21:06:35.031136	2017-12-09 21:06:35.031136	\N
558305247	3900490	718964584	\N	\N	f	f	2017-12-09 21:06:35.050552	2017-12-09 21:06:35.050552	\N
558305250	3900489	718964571	f	\N	f	f	2017-12-09 21:06:35.220848	2017-12-09 21:06:35.220848	\N
558305252	3900489	718964580	f	f	f	f	2017-12-09 21:06:35.263546	2017-12-09 21:06:35.263546	\N
558305253	3900489	718964577	\N	\N	f	f	2017-12-09 21:06:35.283251	2017-12-09 21:06:35.283251	\N
558305256	3900488	718964579	f	\N	f	f	2017-12-09 21:06:35.349129	2017-12-09 21:06:35.349129	\N
558305258	3900488	718964576	f	f	f	f	2017-12-09 21:06:35.38978	2017-12-09 21:06:35.38978	\N
558305259	3900488	718964583	\N	\N	f	f	2017-12-09 21:06:35.410881	2017-12-09 21:06:35.410881	\N
558305261	3900487	718964571	t	\N	f	f	2017-12-09 21:06:35.455497	2017-12-09 21:06:35.455497	\N
558305262	3900487	718964577	f	\N	f	f	2017-12-09 21:06:35.476871	2017-12-09 21:06:35.476871	\N
558305264	3900487	718964583	f	f	f	f	2017-12-09 21:06:35.518952	2017-12-09 21:06:35.518952	\N
558305265	3900487	718964566	\N	\N	f	f	2017-12-09 21:06:35.539418	2017-12-09 21:06:35.539418	\N
558305267	3900486	718964581	t	\N	f	f	2017-12-09 21:06:35.586144	2017-12-09 21:06:35.586144	\N
558305268	3900486	718964572	f	\N	f	f	2017-12-09 21:06:35.606165	2017-12-09 21:06:35.606165	\N
558305269	3900486	718964577	t	t	f	f	2017-12-09 21:06:35.712849	2017-12-09 21:06:35.712849	\N
558305270	3900486	718964484	f	f	f	f	2017-12-09 21:06:35.735273	2017-12-09 21:06:35.735273	\N
558305271	3900486	718964570	\N	\N	f	f	2017-12-09 21:06:35.755643	2017-12-09 21:06:35.755643	\N
558305274	3900485	718964584	f	\N	f	f	2017-12-09 21:06:35.820484	2017-12-09 21:06:35.820484	\N
558305276	3900485	718964571	f	f	f	f	2017-12-09 21:06:35.860316	2017-12-09 21:06:35.860316	\N
558305277	3900485	718964580	\N	\N	f	f	2017-12-09 21:06:35.880257	2017-12-09 21:06:35.880257	\N
558305278	3900484	718964583	t	f	f	f	2017-12-09 21:06:35.906707	2017-12-09 21:06:35.906707	\N
558305280	3900484	718964577	f	\N	f	f	2017-12-09 21:06:35.963755	2017-12-09 21:06:35.963755	\N
558305281	3900484	718964576	t	t	f	f	2017-12-09 21:06:35.984788	2017-12-09 21:06:35.984788	\N
558305282	3900484	718964484	f	f	f	f	2017-12-09 21:06:36.006128	2017-12-09 21:06:36.006128	\N
558305283	3900484	718964566	\N	\N	f	f	2017-12-09 21:06:37.885007	2017-12-09 21:06:37.885007	\N
558305286	3900483	718964578	f	\N	f	f	2017-12-09 21:06:37.956357	2017-12-09 21:06:37.956357	\N
558305288	3900483	718964566	f	f	f	f	2017-12-09 21:06:37.997894	2017-12-09 21:06:37.997894	\N
558305289	3900483	718964584	\N	\N	f	f	2017-12-09 21:06:38.018286	2017-12-09 21:06:38.018286	\N
558305290	3900482	718964578	t	f	f	f	2017-12-09 21:06:38.041238	2017-12-09 21:06:38.041238	\N
558305292	3900482	718964575	f	\N	f	f	2017-12-09 21:06:38.07971	2017-12-09 21:06:38.07971	\N
558305294	3900482	718964582	f	f	f	f	2017-12-09 21:06:38.118404	2017-12-09 21:06:38.118404	\N
558305295	3900482	718964570	\N	\N	f	f	2017-12-09 21:06:38.13764	2017-12-09 21:06:38.13764	\N
558305296	3900481	718964568	t	f	f	f	2017-12-09 21:06:38.160847	2017-12-09 21:06:38.160847	\N
558305298	3900481	718964575	f	\N	f	f	2017-12-09 21:06:38.200473	2017-12-09 21:06:38.200473	\N
558305300	3900481	718964569	f	f	f	f	2017-12-09 21:06:38.239287	2017-12-09 21:06:38.239287	\N
558305301	3900481	718964582	\N	\N	f	f	2017-12-09 21:06:38.258407	2017-12-09 21:06:38.258407	\N
558305302	3900480	718964577	t	f	f	f	2017-12-09 21:06:38.280999	2017-12-09 21:06:38.280999	\N
558305304	3900480	718964484	f	\N	f	f	2017-12-09 21:06:38.319642	2017-12-09 21:06:38.319642	\N
558305306	3900480	718964578	f	f	f	f	2017-12-09 21:06:38.358674	2017-12-09 21:06:38.358674	\N
558305307	3900480	718964570	\N	\N	f	f	2017-12-09 21:06:38.378439	2017-12-09 21:06:38.378439	\N
558305309	3900479	718964584	t	\N	f	f	2017-12-09 21:06:38.434658	2017-12-09 21:06:38.434658	\N
558305310	3900479	718964578	f	\N	f	f	2017-12-09 21:06:38.455659	2017-12-09 21:06:38.455659	\N
558305312	3900479	718964566	f	f	f	f	2017-12-09 21:06:38.495429	2017-12-09 21:06:38.495429	\N
558305313	3900479	718964484	\N	\N	f	f	2017-12-09 21:06:38.515476	2017-12-09 21:06:38.515476	\N
558305316	3900478	718964584	f	\N	f	f	2017-12-09 21:06:38.580744	2017-12-09 21:06:38.580744	\N
558305318	3900478	718964570	f	f	f	f	2017-12-09 21:06:38.622072	2017-12-09 21:06:38.622072	\N
558305319	3900478	718964484	\N	\N	f	f	2017-12-09 21:06:38.642918	2017-12-09 21:06:38.642918	\N
558305322	3900477	718964484	f	\N	f	f	2017-12-09 21:06:43.291385	2017-12-09 21:06:43.291385	\N
558305324	3900477	718964573	f	f	f	f	2017-12-09 21:06:43.333804	2017-12-09 21:06:43.333804	\N
558305325	3900477	718964569	\N	\N	f	f	2017-12-09 21:06:43.356828	2017-12-09 21:06:43.356828	\N
558305328	3900476	718964584	f	\N	f	f	2017-12-09 21:06:43.423823	2017-12-09 21:06:43.423823	\N
558305329	3900476	718964574	t	t	f	f	2017-12-09 21:06:43.445911	2017-12-09 21:06:43.445911	\N
558305330	3900476	718964578	f	f	f	f	2017-12-09 21:06:43.467179	2017-12-09 21:06:43.467179	\N
558305331	3900476	718964569	\N	\N	f	f	2017-12-09 21:06:43.48923	2017-12-09 21:06:43.48923	\N
558305334	3900475	718964574	f	\N	f	f	2017-12-09 21:06:43.557756	2017-12-09 21:06:43.557756	\N
558305336	3900475	718964573	f	f	f	f	2017-12-09 21:06:43.612321	2017-12-09 21:06:43.612321	\N
558305337	3900475	718964580	\N	\N	f	f	2017-12-09 21:06:43.632586	2017-12-09 21:06:43.632586	\N
558305340	3900474	718964567	f	\N	f	f	2017-12-09 21:06:43.696702	2017-12-09 21:06:43.696702	\N
558305342	3900474	718964576	f	f	f	f	2017-12-09 21:06:43.73557	2017-12-09 21:06:43.73557	\N
558305343	3900474	718964569	\N	\N	f	f	2017-12-09 21:06:43.754901	2017-12-09 21:06:43.754901	\N
558305346	3900473	718964581	f	\N	f	f	2017-12-09 21:06:43.816779	2017-12-09 21:06:43.816779	\N
558305348	3900473	718964574	f	f	f	f	2017-12-09 21:06:43.857679	2017-12-09 21:06:43.857679	\N
558305349	3900473	718964484	\N	\N	f	f	2017-12-09 21:06:43.877677	2017-12-09 21:06:43.877677	\N
558305350	3900472	718964573	t	f	f	f	2017-12-09 21:06:43.901832	2017-12-09 21:06:43.901832	\N
558305351	3900472	718964571	t	\N	f	f	2017-12-09 21:06:43.921551	2017-12-09 21:06:43.921551	\N
558305352	3900472	718964568	f	\N	f	f	2017-12-09 21:06:43.941212	2017-12-09 21:06:43.941212	\N
558305353	3900472	718964584	t	t	f	f	2017-12-09 21:06:43.961073	2017-12-09 21:06:43.961073	\N
558305354	3900472	718964570	f	f	f	f	2017-12-09 21:06:43.981256	2017-12-09 21:06:43.981256	\N
558305355	3900472	718964574	\N	\N	f	f	2017-12-09 21:06:44.007713	2017-12-09 21:06:44.007713	\N
558305358	3900471	718964578	f	\N	f	f	2017-12-09 21:06:44.071185	2017-12-09 21:06:44.071185	\N
558305360	3900471	718964573	f	f	f	f	2017-12-09 21:06:45.439454	2017-12-09 21:06:45.439454	\N
558305361	3900471	718964584	\N	\N	f	f	2017-12-09 21:06:45.459276	2017-12-09 21:06:45.459276	\N
558305364	3900470	718964581	f	\N	f	f	2017-12-09 21:06:45.522629	2017-12-09 21:06:45.522629	\N
558305366	3900470	718964573	f	f	f	f	2017-12-09 21:06:45.562877	2017-12-09 21:06:45.562877	\N
558305367	3900470	718964574	\N	\N	f	f	2017-12-09 21:06:45.582081	2017-12-09 21:06:45.582081	\N
558305370	3900469	718964572	f	\N	f	f	2017-12-09 21:06:45.645069	2017-12-09 21:06:45.645069	\N
558305372	3900469	718964574	f	f	f	f	2017-12-09 21:06:45.685071	2017-12-09 21:06:45.685071	\N
558305373	3900469	718964578	\N	\N	f	f	2017-12-09 21:06:45.704831	2017-12-09 21:06:45.704831	\N
558305375	3900468	718964566	t	\N	f	f	2017-12-09 21:06:45.750236	2017-12-09 21:06:45.750236	\N
558305376	3900468	718964580	f	\N	f	f	2017-12-09 21:06:45.774805	2017-12-09 21:06:45.774805	\N
558305377	3900468	718964578	t	t	f	f	2017-12-09 21:06:45.800171	2017-12-09 21:06:45.800171	\N
558305378	3900468	718964569	f	f	f	f	2017-12-09 21:06:45.825045	2017-12-09 21:06:45.825045	\N
558305379	3900468	718964571	\N	\N	f	f	2017-12-09 21:06:45.84844	2017-12-09 21:06:45.84844	\N
558305380	3900467	718964571	t	f	f	f	2017-12-09 21:06:45.872453	2017-12-09 21:06:45.872453	\N
558305382	3900467	718964580	f	\N	f	f	2017-12-09 21:06:45.911246	2017-12-09 21:06:45.911246	\N
558305383	3900467	718964565	t	t	f	f	2017-12-09 21:06:45.933292	2017-12-09 21:06:45.933292	\N
558305384	3900467	718964582	f	f	f	f	2017-12-09 21:06:45.959416	2017-12-09 21:06:45.959416	\N
558305385	3900467	718964576	\N	\N	f	f	2017-12-09 21:06:45.98629	2017-12-09 21:06:45.98629	\N
558305386	3900466	718964583	t	f	f	f	2017-12-09 21:06:46.01176	2017-12-09 21:06:46.01176	\N
558305387	3900466	718964569	t	\N	f	f	2017-12-09 21:06:46.032506	2017-12-09 21:06:46.032506	\N
558305388	3900466	718964573	f	\N	f	f	2017-12-09 21:06:46.053324	2017-12-09 21:06:46.053324	\N
558305389	3900466	718964574	t	t	f	f	2017-12-09 21:06:46.073486	2017-12-09 21:06:46.073486	\N
558305390	3900466	718964575	f	f	f	f	2017-12-09 21:06:46.093391	2017-12-09 21:06:46.093391	\N
558305391	3900466	718964576	\N	\N	f	f	2017-12-09 21:06:46.113811	2017-12-09 21:06:46.113811	\N
558305392	3900465	718964566	t	f	f	f	2017-12-09 21:06:46.148367	2017-12-09 21:06:46.148367	\N
558305393	3900465	718964579	t	\N	f	f	2017-12-09 21:06:46.167602	2017-12-09 21:06:46.167602	\N
558305394	3900465	718964575	f	\N	f	f	2017-12-09 21:06:46.187738	2017-12-09 21:06:46.187738	\N
558305395	3900465	718964576	t	t	f	f	2017-12-09 21:06:46.207439	2017-12-09 21:06:46.207439	\N
558305396	3900465	718964570	f	f	f	f	2017-12-09 21:06:46.226116	2017-12-09 21:06:46.226116	\N
558305397	3900465	718964583	\N	\N	f	f	2017-12-09 21:06:46.245165	2017-12-09 21:06:46.245165	\N
558305398	3900464	718964570	t	f	f	f	2017-12-09 21:06:46.267438	2017-12-09 21:06:46.267438	\N
558305399	3900464	718964581	t	\N	f	f	2017-12-09 21:06:46.286846	2017-12-09 21:06:46.286846	\N
558305400	3900464	718964566	f	\N	f	f	2017-12-09 21:06:46.730009	2017-12-09 21:06:46.730009	\N
558305401	3900464	718964569	t	t	f	f	2017-12-09 21:06:46.755027	2017-12-09 21:06:46.755027	\N
558305402	3900464	718964574	f	f	f	f	2017-12-09 21:06:46.778453	2017-12-09 21:06:46.778453	\N
558305403	3900464	718964575	\N	\N	f	f	2017-12-09 21:06:46.801547	2017-12-09 21:06:46.801547	\N
558305404	3900463	718964573	t	f	f	f	2017-12-09 21:06:46.830185	2017-12-09 21:06:46.830185	\N
558305405	3900463	718964582	t	\N	f	f	2017-12-09 21:06:46.855932	2017-12-09 21:06:46.855932	\N
558305406	3900463	718964580	f	\N	f	f	2017-12-09 21:06:46.879486	2017-12-09 21:06:46.879486	\N
558305407	3900463	718964484	t	t	f	f	2017-12-09 21:06:46.903789	2017-12-09 21:06:46.903789	\N
558305408	3900463	718964565	f	f	f	f	2017-12-09 21:06:46.927195	2017-12-09 21:06:46.927195	\N
558305409	3900463	718964579	\N	\N	f	f	2017-12-09 21:06:46.949228	2017-12-09 21:06:46.949228	\N
558305410	3900462	718964572	t	f	f	f	2017-12-09 21:06:46.97412	2017-12-09 21:06:46.97412	\N
558305411	3900462	718964577	t	\N	f	f	2017-12-09 21:06:46.994981	2017-12-09 21:06:46.994981	\N
558305412	3900462	718964573	f	\N	f	f	2017-12-09 21:06:47.015341	2017-12-09 21:06:47.015341	\N
558305413	3900462	718964567	t	t	f	f	2017-12-09 21:06:47.035655	2017-12-09 21:06:47.035655	\N
558305414	3900462	718964583	f	f	f	f	2017-12-09 21:06:47.055494	2017-12-09 21:06:47.055494	\N
558305415	3900462	718964568	\N	\N	f	f	2017-12-09 21:06:47.075721	2017-12-09 21:06:47.075721	\N
558305416	3900461	718964583	t	f	f	f	2017-12-09 21:06:47.099657	2017-12-09 21:06:47.099657	\N
558305417	3900461	718964569	t	\N	f	f	2017-12-09 21:06:47.119482	2017-12-09 21:06:47.119482	\N
558305418	3900461	718964571	f	\N	f	f	2017-12-09 21:06:47.139246	2017-12-09 21:06:47.139246	\N
558305419	3900461	718964582	t	t	f	f	2017-12-09 21:06:47.159335	2017-12-09 21:06:47.159335	\N
558305420	3900461	718964574	f	f	f	f	2017-12-09 21:06:47.179082	2017-12-09 21:06:47.179082	\N
558305421	3900461	718964568	\N	\N	f	f	2017-12-09 21:06:47.199121	2017-12-09 21:06:47.199121	\N
558305422	3900460	718964565	t	f	f	f	2017-12-09 21:06:47.223219	2017-12-09 21:06:47.223219	\N
558305423	3900460	718964573	t	\N	f	f	2017-12-09 21:06:47.243532	2017-12-09 21:06:47.243532	\N
558305424	3900460	718964581	f	\N	f	f	2017-12-09 21:06:47.263127	2017-12-09 21:06:47.263127	\N
558305425	3900460	718964575	t	t	f	f	2017-12-09 21:06:47.282495	2017-12-09 21:06:47.282495	\N
558305426	3900460	718964568	f	f	f	f	2017-12-09 21:06:47.302085	2017-12-09 21:06:47.302085	\N
558305427	3900460	718964580	\N	\N	f	f	2017-12-09 21:06:47.322265	2017-12-09 21:06:47.322265	\N
558305428	3900459	718964573	t	f	f	f	2017-12-09 21:06:47.346378	2017-12-09 21:06:47.346378	\N
558305429	3900459	718964580	t	\N	f	f	2017-12-09 21:06:47.365972	2017-12-09 21:06:47.365972	\N
558305430	3900459	718964571	f	\N	f	f	2017-12-09 21:06:47.385113	2017-12-09 21:06:47.385113	\N
558305431	3900459	718964579	t	t	f	f	2017-12-09 21:06:47.404852	2017-12-09 21:06:47.404852	\N
558305432	3900459	718964581	f	f	f	f	2017-12-09 21:06:47.425085	2017-12-09 21:06:47.425085	\N
558305433	3900459	718964576	\N	\N	f	f	2017-12-09 21:06:47.44483	2017-12-09 21:06:47.44483	\N
558305434	3900458	718964581	t	f	f	f	2017-12-09 21:06:47.468386	2017-12-09 21:06:47.468386	\N
558305435	3900458	718964584	t	\N	f	f	2017-12-09 21:06:49.580492	2017-12-09 21:06:49.580492	\N
558305436	3900458	718964573	f	\N	f	f	2017-12-09 21:06:49.604648	2017-12-09 21:06:49.604648	\N
558305437	3900458	718964576	t	t	f	f	2017-12-09 21:06:49.62534	2017-12-09 21:06:49.62534	\N
558305438	3900458	718964572	f	f	f	f	2017-12-09 21:06:49.645452	2017-12-09 21:06:49.645452	\N
558305439	3900458	718964567	\N	\N	f	f	2017-12-09 21:06:49.666184	2017-12-09 21:06:49.666184	\N
558305440	3900457	718964584	t	f	f	f	2017-12-09 21:06:49.689985	2017-12-09 21:06:49.689985	\N
558305441	3900457	718964571	t	\N	f	f	2017-12-09 21:06:49.710141	2017-12-09 21:06:49.710141	\N
558305442	3900457	718964568	f	\N	f	f	2017-12-09 21:06:49.730718	2017-12-09 21:06:49.730718	\N
558305443	3900457	718964579	t	t	f	f	2017-12-09 21:06:49.751263	2017-12-09 21:06:49.751263	\N
558305444	3900457	718964567	f	f	f	f	2017-12-09 21:06:49.771842	2017-12-09 21:06:49.771842	\N
558305445	3900457	718964484	\N	\N	f	f	2017-12-09 21:06:49.792461	2017-12-09 21:06:49.792461	\N
558305446	3900456	718964569	t	f	f	f	2017-12-09 21:06:49.817155	2017-12-09 21:06:49.817155	\N
558305447	3900456	718964581	t	\N	f	f	2017-12-09 21:06:49.849541	2017-12-09 21:06:49.849541	\N
558305448	3900456	718964571	f	\N	f	f	2017-12-09 21:06:49.869483	2017-12-09 21:06:49.869483	\N
558305449	3900456	718964577	t	t	f	f	2017-12-09 21:06:49.888601	2017-12-09 21:06:49.888601	\N
558305450	3900456	718964583	f	f	f	f	2017-12-09 21:06:49.907877	2017-12-09 21:06:49.907877	\N
558305451	3900456	718964579	\N	\N	f	f	2017-12-09 21:06:49.929547	2017-12-09 21:06:49.929547	\N
558305452	3900455	718964565	t	f	f	f	2017-12-09 21:06:49.955534	2017-12-09 21:06:49.955534	\N
558305453	3900455	718964568	t	\N	f	f	2017-12-09 21:06:49.976193	2017-12-09 21:06:49.976193	\N
558305454	3900455	718964582	f	\N	f	f	2017-12-09 21:06:49.99673	2017-12-09 21:06:49.99673	\N
558305455	3900455	718964484	t	t	f	f	2017-12-09 21:06:50.016505	2017-12-09 21:06:50.016505	\N
558305456	3900455	718964575	f	f	f	f	2017-12-09 21:06:50.035893	2017-12-09 21:06:50.035893	\N
558305457	3900455	718964567	\N	\N	f	f	2017-12-09 21:06:50.055855	2017-12-09 21:06:50.055855	\N
558305458	3900454	718964573	t	f	f	f	2017-12-09 21:06:50.078891	2017-12-09 21:06:50.078891	\N
558305459	3900454	718964578	t	\N	f	f	2017-12-09 21:06:50.098156	2017-12-09 21:06:50.098156	\N
558305460	3900454	718964574	f	\N	f	f	2017-12-09 21:06:50.117466	2017-12-09 21:06:50.117466	\N
558305461	3900454	718964584	t	t	f	f	2017-12-09 21:06:50.1368	2017-12-09 21:06:50.1368	\N
558305462	3900454	718964580	f	f	f	f	2017-12-09 21:06:50.156527	2017-12-09 21:06:50.156527	\N
558305463	3900454	718964571	\N	\N	f	f	2017-12-09 21:06:50.175488	2017-12-09 21:06:50.175488	\N
558305464	3900453	718964578	t	f	f	f	2017-12-09 21:06:50.198449	2017-12-09 21:06:50.198449	\N
558305465	3900453	718964581	t	\N	f	f	2017-12-09 21:06:50.218351	2017-12-09 21:06:50.218351	\N
558305466	3900453	718964572	f	\N	f	f	2017-12-09 21:06:50.238074	2017-12-09 21:06:50.238074	\N
558305467	3900453	718964567	t	t	f	f	2017-12-09 21:06:50.257203	2017-12-09 21:06:50.257203	\N
558305468	3900453	718964570	f	f	f	f	2017-12-09 21:06:50.278199	2017-12-09 21:06:50.278199	\N
558305469	3900453	718964576	\N	\N	f	f	2017-12-09 21:06:50.297864	2017-12-09 21:06:50.297864	\N
558305470	3900452	718964570	t	f	f	f	2017-12-09 21:06:50.321826	2017-12-09 21:06:50.321826	\N
558305471	3900452	718964582	t	\N	f	f	2017-12-09 21:06:50.34234	2017-12-09 21:06:50.34234	\N
558305472	3900452	718964574	f	\N	f	f	2017-12-09 21:06:50.361699	2017-12-09 21:06:50.361699	\N
558305473	3900452	718964578	t	t	f	f	2017-12-09 21:06:50.381165	2017-12-09 21:06:50.381165	\N
558305474	3900452	718964484	f	f	f	f	2017-12-09 21:06:50.401203	2017-12-09 21:06:50.401203	\N
558305475	3900452	718964577	\N	\N	f	f	2017-12-09 21:06:50.422016	2017-12-09 21:06:50.422016	\N
558305476	3900451	718964582	t	f	f	f	2017-12-09 21:06:50.446696	2017-12-09 21:06:50.446696	\N
558305477	3900451	718964571	t	\N	f	f	2017-12-09 21:06:50.467515	2017-12-09 21:06:50.467515	\N
558305478	3900451	718964580	f	\N	f	f	2017-12-09 21:06:50.48828	2017-12-09 21:06:50.48828	\N
558305479	3900451	718964569	t	t	f	f	2017-12-09 21:06:50.5088	2017-12-09 21:06:50.5088	\N
558305480	3900451	718964583	f	f	f	f	2017-12-09 21:06:50.530886	2017-12-09 21:06:50.530886	\N
558305481	3900451	718964584	\N	\N	f	f	2017-12-09 21:06:50.551134	2017-12-09 21:06:50.551134	\N
558305482	3900450	718964579	t	f	f	f	2017-12-09 21:06:50.575479	2017-12-09 21:06:50.575479	\N
558305483	3900450	718964567	t	\N	f	f	2017-12-09 21:06:50.595957	2017-12-09 21:06:50.595957	\N
558305484	3900450	718964581	f	\N	f	f	2017-12-09 21:06:52.695832	2017-12-09 21:06:52.695832	\N
558305485	3900450	718964570	t	t	f	f	2017-12-09 21:06:52.719096	2017-12-09 21:06:52.719096	\N
558305486	3900450	718964574	f	f	f	f	2017-12-09 21:06:52.739766	2017-12-09 21:06:52.739766	\N
558305487	3900450	718964578	\N	\N	f	f	2017-12-09 21:06:52.759826	2017-12-09 21:06:52.759826	\N
558305488	3900449	718964567	t	f	f	f	2017-12-09 21:06:52.784167	2017-12-09 21:06:52.784167	\N
558305489	3900449	718964571	t	\N	f	f	2017-12-09 21:06:52.80434	2017-12-09 21:06:52.80434	\N
558305490	3900449	718964573	f	\N	f	f	2017-12-09 21:06:52.825017	2017-12-09 21:06:52.825017	\N
558305491	3900449	718964575	t	t	f	f	2017-12-09 21:06:52.844943	2017-12-09 21:06:52.844943	\N
558305492	3900449	718964581	f	f	f	f	2017-12-09 21:06:52.864824	2017-12-09 21:06:52.864824	\N
558305493	3900449	718964579	\N	\N	f	f	2017-12-09 21:06:52.884579	2017-12-09 21:06:52.884579	\N
558305494	3900448	718964571	t	f	f	f	2017-12-09 21:06:52.907975	2017-12-09 21:06:52.907975	\N
558305495	3900448	718964577	t	\N	f	f	2017-12-09 21:06:52.927726	2017-12-09 21:06:52.927726	\N
558305496	3900448	718964579	f	\N	f	f	2017-12-09 21:06:52.947536	2017-12-09 21:06:52.947536	\N
558305497	3900448	718964581	t	t	f	f	2017-12-09 21:06:52.968404	2017-12-09 21:06:52.968404	\N
558305498	3900448	718964572	f	f	f	f	2017-12-09 21:06:52.991122	2017-12-09 21:06:52.991122	\N
558305499	3900448	718964573	\N	\N	f	f	2017-12-09 21:06:53.012585	2017-12-09 21:06:53.012585	\N
558305500	3900447	718964577	t	f	f	f	2017-12-09 21:06:53.036445	2017-12-09 21:06:53.036445	\N
558305501	3900447	718964570	t	\N	f	f	2017-12-09 21:06:53.056882	2017-12-09 21:06:53.056882	\N
558305502	3900447	718964573	f	\N	f	f	2017-12-09 21:06:53.090188	2017-12-09 21:06:53.090188	\N
558305503	3900447	718964576	t	t	f	f	2017-12-09 21:06:53.110544	2017-12-09 21:06:53.110544	\N
558305504	3900447	718964568	f	f	f	f	2017-12-09 21:06:53.130468	2017-12-09 21:06:53.130468	\N
558305505	3900447	718964565	\N	\N	f	f	2017-12-09 21:06:56.308168	2017-12-09 21:06:56.308168	\N
558305506	3900446	718964574	t	f	f	f	2017-12-09 21:06:56.33381	2017-12-09 21:06:56.33381	\N
558305507	3900446	718964573	t	\N	f	f	2017-12-09 21:06:56.354389	2017-12-09 21:06:56.354389	\N
558305508	3900446	718964579	f	\N	f	f	2017-12-09 21:06:56.376256	2017-12-09 21:06:56.376256	\N
558305509	3900446	718964568	t	t	f	f	2017-12-09 21:06:56.398283	2017-12-09 21:06:56.398283	\N
558305510	3900446	718964582	f	f	f	f	2017-12-09 21:06:56.41916	2017-12-09 21:06:56.41916	\N
558305511	3900446	718964572	\N	\N	f	f	2017-12-09 21:06:56.440406	2017-12-09 21:06:56.440406	\N
558305512	3900445	718964565	t	f	f	f	2017-12-09 21:06:56.464329	2017-12-09 21:06:56.464329	\N
558305513	3900445	718964574	t	\N	f	f	2017-12-09 21:06:56.484512	2017-12-09 21:06:56.484512	\N
558305514	3900445	718964579	f	\N	f	f	2017-12-09 21:06:56.504445	2017-12-09 21:06:56.504445	\N
558305515	3900445	718964573	t	t	f	f	2017-12-09 21:06:56.525406	2017-12-09 21:06:56.525406	\N
558305516	3900445	718964580	f	f	f	f	2017-12-09 21:06:56.545536	2017-12-09 21:06:56.545536	\N
558305517	3900445	718964570	\N	\N	f	f	2017-12-09 21:06:56.567678	2017-12-09 21:06:56.567678	\N
558305518	3900444	718964569	t	f	f	f	2017-12-09 21:06:56.592065	2017-12-09 21:06:56.592065	\N
558305519	3900444	718964574	t	\N	f	f	2017-12-09 21:06:56.613098	2017-12-09 21:06:56.613098	\N
558305520	3900444	718964578	f	\N	f	f	2017-12-09 21:06:56.633825	2017-12-09 21:06:56.633825	\N
558305521	3900444	718964566	t	t	f	f	2017-12-09 21:06:56.653476	2017-12-09 21:06:56.653476	\N
558305522	3900444	718964570	f	f	f	f	2017-12-09 21:06:56.673624	2017-12-09 21:06:56.673624	\N
558305523	3900444	718964575	\N	\N	f	f	2017-12-09 21:06:56.694381	2017-12-09 21:06:56.694381	\N
558305524	3900443	718964583	t	f	f	f	2017-12-09 21:06:56.717903	2017-12-09 21:06:56.717903	\N
558305525	3900443	718964567	t	\N	f	f	2017-12-09 21:06:56.737246	2017-12-09 21:06:56.737246	\N
558305526	3900443	718964576	f	\N	f	f	2017-12-09 21:06:56.756438	2017-12-09 21:06:56.756438	\N
558305527	3900443	718964584	t	t	f	f	2017-12-09 21:06:56.776149	2017-12-09 21:06:56.776149	\N
558305528	3900443	718964574	f	f	f	f	2017-12-09 21:06:56.7958	2017-12-09 21:06:56.7958	\N
558305529	3900443	718964573	\N	\N	f	f	2017-12-09 21:06:56.815442	2017-12-09 21:06:56.815442	\N
558305530	3900442	718964484	t	f	f	f	2017-12-09 21:06:56.839016	2017-12-09 21:06:56.839016	\N
558305531	3900442	718964570	t	\N	f	f	2017-12-09 21:06:56.859061	2017-12-09 21:06:56.859061	\N
558305532	3900442	718964582	f	\N	f	f	2017-12-09 21:06:56.878352	2017-12-09 21:06:56.878352	\N
558305533	3900442	718964578	t	t	f	f	2017-12-09 21:06:56.898271	2017-12-09 21:06:56.898271	\N
558305534	3900442	718964581	f	f	f	f	2017-12-09 21:06:56.918475	2017-12-09 21:06:56.918475	\N
558305535	3900442	718964580	\N	\N	f	f	2017-12-09 21:06:58.77169	2017-12-09 21:06:58.77169	\N
558305536	3900441	718964566	t	f	f	f	2017-12-09 21:06:58.80021	2017-12-09 21:06:58.80021	\N
558305537	3900441	718964583	t	\N	f	f	2017-12-09 21:06:58.820652	2017-12-09 21:06:58.820652	\N
558305538	3900441	718964580	f	\N	f	f	2017-12-09 21:06:58.84065	2017-12-09 21:06:58.84065	\N
558305539	3900441	718964575	t	t	f	f	2017-12-09 21:06:58.860667	2017-12-09 21:06:58.860667	\N
558305540	3900441	718964569	f	f	f	f	2017-12-09 21:06:58.880597	2017-12-09 21:06:58.880597	\N
558305541	3900441	718964484	\N	\N	f	f	2017-12-09 21:06:58.901696	2017-12-09 21:06:58.901696	\N
558305542	3900440	718964568	t	f	f	f	2017-12-09 21:06:58.925275	2017-12-09 21:06:58.925275	\N
558305543	3900440	718964584	t	\N	f	f	2017-12-09 21:06:58.946428	2017-12-09 21:06:58.946428	\N
558305544	3900440	718964580	f	\N	f	f	2017-12-09 21:06:58.968588	2017-12-09 21:06:58.968588	\N
558305545	3900440	718964578	t	t	f	f	2017-12-09 21:06:58.991553	2017-12-09 21:06:58.991553	\N
558305546	3900440	718964577	f	f	f	f	2017-12-09 21:06:59.013078	2017-12-09 21:06:59.013078	\N
558305547	3900440	718964565	\N	\N	f	f	2017-12-09 21:06:59.033687	2017-12-09 21:06:59.033687	\N
558305548	3900439	718964577	t	f	f	f	2017-12-09 21:06:59.057307	2017-12-09 21:06:59.057307	\N
558305549	3900439	718964573	t	\N	f	f	2017-12-09 21:06:59.078004	2017-12-09 21:06:59.078004	\N
558305550	3900439	718964584	f	\N	f	f	2017-12-09 21:06:59.098116	2017-12-09 21:06:59.098116	\N
558305551	3900439	718964571	t	t	f	f	2017-12-09 21:06:59.118157	2017-12-09 21:06:59.118157	\N
558305552	3900439	718964578	f	f	f	f	2017-12-09 21:06:59.13883	2017-12-09 21:06:59.13883	\N
558305553	3900439	718964484	\N	\N	f	f	2017-12-09 21:06:59.159406	2017-12-09 21:06:59.159406	\N
558305554	3900438	718964570	t	f	f	f	2017-12-09 21:06:59.184346	2017-12-09 21:06:59.184346	\N
558305555	3900438	718964571	t	\N	f	f	2017-12-09 21:06:59.206012	2017-12-09 21:06:59.206012	\N
558305556	3900438	718964582	f	\N	f	f	2017-12-09 21:06:59.226371	2017-12-09 21:06:59.226371	\N
558305557	3900438	718964568	t	t	f	f	2017-12-09 21:06:59.259093	2017-12-09 21:06:59.259093	\N
558305558	3900438	718964577	f	f	f	f	2017-12-09 21:06:59.278695	2017-12-09 21:06:59.278695	\N
558305559	3900438	718964584	\N	\N	f	f	2017-12-09 21:06:59.29751	2017-12-09 21:06:59.29751	\N
558305560	3900437	718964484	t	f	f	f	2017-12-09 21:06:59.319602	2017-12-09 21:06:59.319602	\N
558305561	3900437	718964583	t	\N	f	f	2017-12-09 21:06:59.33916	2017-12-09 21:06:59.33916	\N
558305562	3900437	718964569	f	\N	f	f	2017-12-09 21:07:01.671838	2017-12-09 21:07:01.671838	\N
558305563	3900437	718964570	t	t	f	f	2017-12-09 21:07:01.694523	2017-12-09 21:07:01.694523	\N
558305564	3900437	718964571	f	f	f	f	2017-12-09 21:07:01.714875	2017-12-09 21:07:01.714875	\N
558305565	3900437	718964565	\N	\N	f	f	2017-12-09 21:07:01.734745	2017-12-09 21:07:01.734745	\N
558303765	3900196	718964484	t	t	f	t	2017-12-09 19:45:42.80116	2017-12-09 21:07:01.767769	\N
558305207	3900496	718964571	t	\N	t	f	2017-12-09 21:06:34.207029	2017-12-09 21:07:01.791413	\N
558305209	3900496	718964484	t	t	f	t	2017-12-09 21:06:34.248049	2017-12-09 21:07:01.803259	\N
558305212	3900495	718964583	t	f	t	f	2017-12-09 21:06:34.31346	2017-12-09 21:07:01.814948	\N
558305218	3900494	718964484	t	f	t	f	2017-12-09 21:06:34.437504	2017-12-09 21:07:01.847692	\N
558305219	3900494	718964565	t	\N	t	t	2017-12-09 21:06:34.457797	2017-12-09 21:07:01.859649	\N
558305221	3900494	718964574	t	t	t	f	2017-12-09 21:06:34.498975	2017-12-09 21:07:01.871011	\N
558305224	3900493	718964577	t	f	t	t	2017-12-09 21:06:34.581943	2017-12-09 21:07:01.882694	\N
558305225	3900493	718964566	t	\N	f	t	2017-12-09 21:06:34.60271	2017-12-09 21:07:01.894065	\N
558305227	3900493	718964484	t	t	f	t	2017-12-09 21:06:34.641122	2017-12-09 21:07:01.906619	\N
558305230	3900492	718964582	t	f	t	t	2017-12-09 21:06:34.701753	2017-12-09 21:07:01.923648	\N
558305231	3900492	718964576	t	\N	f	t	2017-12-09 21:06:34.721671	2017-12-09 21:07:01.936064	\N
558305233	3900492	718964577	t	t	t	t	2017-12-09 21:06:34.760922	2017-12-09 21:07:01.94842	\N
558305236	3900491	718964580	t	f	f	t	2017-12-09 21:06:34.824379	2017-12-09 21:07:01.962283	\N
558305237	3900491	718964484	t	\N	t	t	2017-12-09 21:06:34.844293	2017-12-09 21:07:01.97468	\N
558305239	3900491	718964565	t	t	t	f	2017-12-09 21:06:34.883348	2017-12-09 21:07:01.986693	\N
558305242	3900490	718964570	t	f	f	t	2017-12-09 21:06:34.94724	2017-12-09 21:07:01.999095	\N
558305243	3900490	718964577	t	\N	t	f	2017-12-09 21:06:34.967951	2017-12-09 21:07:02.011345	\N
558305248	3900489	718964570	t	f	t	t	2017-12-09 21:06:35.073673	2017-12-09 21:07:02.034248	\N
558305249	3900489	718964567	t	\N	t	t	2017-12-09 21:06:35.093478	2017-12-09 21:07:02.046178	\N
558305251	3900489	718964573	t	t	f	t	2017-12-09 21:06:35.243756	2017-12-09 21:07:02.058105	\N
558305254	3900488	718964568	t	f	f	t	2017-12-09 21:06:35.307472	2017-12-09 21:07:02.069583	\N
558305255	3900488	718964566	t	\N	f	t	2017-12-09 21:06:35.328453	2017-12-09 21:07:02.081443	\N
558305257	3900488	718964567	t	t	f	t	2017-12-09 21:06:35.36901	2017-12-09 21:07:02.092726	\N
558305260	3900487	718964565	t	f	t	f	2017-12-09 21:06:35.435388	2017-12-09 21:07:02.104373	\N
558305263	3900487	718964581	t	t	t	f	2017-12-09 21:06:35.498144	2017-12-09 21:07:02.126828	\N
558305266	3900486	718964576	t	f	t	f	2017-12-09 21:06:35.563349	2017-12-09 21:07:02.138615	\N
558305272	3900485	718964484	t	f	t	f	2017-12-09 21:06:35.780154	2017-12-09 21:07:02.171599	\N
558305273	3900485	718964572	t	\N	t	t	2017-12-09 21:06:35.800311	2017-12-09 21:07:02.183506	\N
558305275	3900485	718964575	t	t	f	t	2017-12-09 21:06:35.840732	2017-12-09 21:07:02.19546	\N
558305279	3900484	718964580	t	\N	f	t	2017-12-09 21:06:35.928425	2017-12-09 21:07:02.219808	\N
558305284	3900483	718964568	t	f	t	f	2017-12-09 21:06:37.915911	2017-12-09 21:07:02.243412	\N
558305285	3900483	718964574	t	\N	t	t	2017-12-09 21:06:37.935971	2017-12-09 21:07:02.255441	\N
558305287	3900483	718964571	t	t	t	t	2017-12-09 21:06:37.976512	2017-12-09 21:07:02.266854	\N
558305291	3900482	718964572	t	\N	t	f	2017-12-09 21:06:38.060464	2017-12-09 21:07:02.289134	\N
558305293	3900482	718964577	t	t	f	t	2017-12-09 21:06:38.099141	2017-12-09 21:07:02.301173	\N
558305297	3900481	718964566	t	\N	f	t	2017-12-09 21:06:38.180689	2017-12-09 21:07:02.324225	\N
558305299	3900481	718964583	t	t	t	f	2017-12-09 21:06:38.220193	2017-12-09 21:07:02.335653	\N
558305303	3900480	718964575	t	\N	f	t	2017-12-09 21:06:38.300238	2017-12-09 21:07:02.358512	\N
558305305	3900480	718964574	t	t	t	t	2017-12-09 21:06:38.339545	2017-12-09 21:07:02.370109	\N
558305308	3900479	718964572	t	f	f	t	2017-12-09 21:06:38.412184	2017-12-09 21:07:02.3823	\N
558305311	3900479	718964583	t	t	t	f	2017-12-09 21:06:38.475665	2017-12-09 21:07:02.404927	\N
558305314	3900478	718964567	t	f	t	f	2017-12-09 21:06:38.540974	2017-12-09 21:07:02.416551	\N
558305315	3900478	718964576	t	\N	f	t	2017-12-09 21:06:38.560581	2017-12-09 21:07:04.505942	\N
558305317	3900478	718964571	t	t	f	t	2017-12-09 21:06:38.601202	2017-12-09 21:07:04.521174	\N
558305320	3900477	718964582	t	f	f	t	2017-12-09 21:06:43.248856	2017-12-09 21:07:04.533601	\N
558305321	3900477	718964565	t	\N	t	f	2017-12-09 21:06:43.270638	2017-12-09 21:07:04.545924	\N
558305323	3900477	718964581	t	t	t	t	2017-12-09 21:06:43.312851	2017-12-09 21:07:04.558964	\N
558305326	3900476	718964571	t	f	t	t	2017-12-09 21:06:43.382185	2017-12-09 21:07:04.571193	\N
558305327	3900476	718964572	t	\N	f	t	2017-12-09 21:06:43.402808	2017-12-09 21:07:04.583686	\N
558305332	3900475	718964582	t	f	f	t	2017-12-09 21:06:43.51591	2017-12-09 21:07:04.607479	\N
558305333	3900475	718964576	t	\N	f	t	2017-12-09 21:06:43.537012	2017-12-09 21:07:04.619676	\N
558305335	3900475	718964581	t	t	t	t	2017-12-09 21:06:43.578988	2017-12-09 21:07:04.632173	\N
558305338	3900474	718964568	t	f	t	t	2017-12-09 21:06:43.656619	2017-12-09 21:07:04.64384	\N
558305339	3900474	718964575	t	\N	t	t	2017-12-09 21:06:43.676801	2017-12-09 21:07:04.655585	\N
558305341	3900474	718964582	t	t	t	f	2017-12-09 21:06:43.715819	2017-12-09 21:07:04.667678	\N
558305344	3900473	718964575	t	f	t	f	2017-12-09 21:06:43.777962	2017-12-09 21:07:04.679919	\N
558305345	3900473	718964584	t	\N	t	t	2017-12-09 21:06:43.797718	2017-12-09 21:07:04.692105	\N
558305347	3900473	718964567	t	t	t	f	2017-12-09 21:06:43.837134	2017-12-09 21:07:04.704501	\N
558305356	3900471	718964579	t	f	t	f	2017-12-09 21:06:44.032066	2017-12-09 21:07:04.752209	\N
558305357	3900471	718964582	t	\N	t	t	2017-12-09 21:06:44.051516	2017-12-09 21:07:04.764424	\N
558305359	3900471	718964581	t	t	t	f	2017-12-09 21:06:45.419422	2017-12-09 21:07:04.776283	\N
558305362	3900470	718964571	t	f	f	t	2017-12-09 21:06:45.482654	2017-12-09 21:07:04.788885	\N
558305363	3900470	718964484	t	\N	t	f	2017-12-09 21:06:45.502826	2017-12-09 21:07:04.820412	\N
558305365	3900470	718964578	t	t	t	f	2017-12-09 21:06:45.542769	2017-12-09 21:07:04.832324	\N
558305368	3900469	718964568	t	f	f	t	2017-12-09 21:06:45.60563	2017-12-09 21:07:04.844356	\N
558305369	3900469	718964565	t	\N	t	f	2017-12-09 21:06:45.625575	2017-12-09 21:07:04.856199	\N
558305371	3900469	718964484	t	t	t	f	2017-12-09 21:06:45.665603	2017-12-09 21:07:04.867948	\N
558305374	3900468	718964573	t	f	t	t	2017-12-09 21:06:45.730106	2017-12-09 21:07:04.879285	\N
558305381	3900467	718964569	t	\N	t	t	2017-12-09 21:06:45.891986	2017-12-09 21:07:04.922705	\N
\.


--
-- Name: connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('connections_id_seq', 558305566, true);


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY conversations (id, organization_type, organization_id, athlete_id, created_at, updated_at) FROM stdin;
1441	College	718964565	3900496	2017-12-09 21:06:34.195607	2017-12-09 21:06:34.195607
1442	College	718964571	3900496	2017-12-09 21:06:34.219538	2017-12-09 21:06:34.219538
1443	College	718964574	3900496	2017-12-09 21:06:34.23971	2017-12-09 21:06:34.23971
1444	College	718964484	3900496	2017-12-09 21:06:34.260248	2017-12-09 21:06:34.260248
1445	College	718964566	3900496	2017-12-09 21:06:34.280969	2017-12-09 21:06:34.280969
1446	College	718964577	3900496	2017-12-09 21:06:34.301223	2017-12-09 21:06:34.301223
1447	College	718964583	3900495	2017-12-09 21:06:34.325601	2017-12-09 21:06:34.325601
1448	College	718964567	3900495	2017-12-09 21:06:34.344847	2017-12-09 21:06:34.344847
1449	College	718964574	3900495	2017-12-09 21:06:34.364553	2017-12-09 21:06:34.364553
1450	College	718964580	3900495	2017-12-09 21:06:34.385618	2017-12-09 21:06:34.385618
1451	College	718964579	3900495	2017-12-09 21:06:34.405914	2017-12-09 21:06:34.405914
1452	College	718964581	3900495	2017-12-09 21:06:34.425846	2017-12-09 21:06:34.425846
1453	College	718964484	3900494	2017-12-09 21:06:34.449756	2017-12-09 21:06:34.449756
1454	College	718964565	3900494	2017-12-09 21:06:34.469543	2017-12-09 21:06:34.469543
1455	College	718964568	3900494	2017-12-09 21:06:34.490684	2017-12-09 21:06:34.490684
1456	College	718964574	3900494	2017-12-09 21:06:34.510236	2017-12-09 21:06:34.510236
1457	College	718964579	3900494	2017-12-09 21:06:34.52943	2017-12-09 21:06:34.52943
1458	College	718964571	3900494	2017-12-09 21:06:34.570623	2017-12-09 21:06:34.570623
1459	College	718964577	3900493	2017-12-09 21:06:34.5948	2017-12-09 21:06:34.5948
1460	College	718964566	3900493	2017-12-09 21:06:34.614228	2017-12-09 21:06:34.614228
1461	College	718964567	3900493	2017-12-09 21:06:34.633731	2017-12-09 21:06:34.633731
1462	College	718964484	3900493	2017-12-09 21:06:34.652349	2017-12-09 21:06:34.652349
1463	College	718964582	3900493	2017-12-09 21:06:34.670984	2017-12-09 21:06:34.670984
1464	College	718964569	3900493	2017-12-09 21:06:34.690233	2017-12-09 21:06:34.690233
1465	College	718964582	3900492	2017-12-09 21:06:34.713544	2017-12-09 21:06:34.713544
1466	College	718964576	3900492	2017-12-09 21:06:34.733332	2017-12-09 21:06:34.733332
1467	College	718964579	3900492	2017-12-09 21:06:34.753089	2017-12-09 21:06:34.753089
1468	College	718964577	3900492	2017-12-09 21:06:34.772742	2017-12-09 21:06:34.772742
1469	College	718964574	3900492	2017-12-09 21:06:34.792547	2017-12-09 21:06:34.792547
1470	College	718964572	3900492	2017-12-09 21:06:34.812489	2017-12-09 21:06:34.812489
1471	College	718964580	3900491	2017-12-09 21:06:34.8364	2017-12-09 21:06:34.8364
1472	College	718964484	3900491	2017-12-09 21:06:34.855894	2017-12-09 21:06:34.855894
1473	College	718964576	3900491	2017-12-09 21:06:34.875551	2017-12-09 21:06:34.875551
1474	College	718964565	3900491	2017-12-09 21:06:34.894877	2017-12-09 21:06:34.894877
1475	College	718964574	3900491	2017-12-09 21:06:34.915034	2017-12-09 21:06:34.915034
1476	College	718964572	3900491	2017-12-09 21:06:34.934999	2017-12-09 21:06:34.934999
1477	College	718964570	3900490	2017-12-09 21:06:34.959814	2017-12-09 21:06:34.959814
1478	College	718964577	3900490	2017-12-09 21:06:34.979998	2017-12-09 21:06:34.979998
1479	College	718964566	3900490	2017-12-09 21:06:35.000388	2017-12-09 21:06:35.000388
1480	College	718964574	3900490	2017-12-09 21:06:35.022885	2017-12-09 21:06:35.022885
1481	College	718964579	3900490	2017-12-09 21:06:35.042858	2017-12-09 21:06:35.042858
1482	College	718964584	3900490	2017-12-09 21:06:35.062109	2017-12-09 21:06:35.062109
1483	College	718964570	3900489	2017-12-09 21:06:35.085628	2017-12-09 21:06:35.085628
1484	College	718964567	3900489	2017-12-09 21:06:35.21086	2017-12-09 21:06:35.21086
1485	College	718964571	3900489	2017-12-09 21:06:35.23507	2017-12-09 21:06:35.23507
1486	College	718964573	3900489	2017-12-09 21:06:35.255565	2017-12-09 21:06:35.255565
1487	College	718964580	3900489	2017-12-09 21:06:35.275318	2017-12-09 21:06:35.275318
1488	College	718964577	3900489	2017-12-09 21:06:35.295166	2017-12-09 21:06:35.295166
1489	College	718964568	3900488	2017-12-09 21:06:35.320133	2017-12-09 21:06:35.320133
1490	College	718964566	3900488	2017-12-09 21:06:35.340701	2017-12-09 21:06:35.340701
1491	College	718964579	3900488	2017-12-09 21:06:35.360787	2017-12-09 21:06:35.360787
1492	College	718964567	3900488	2017-12-09 21:06:35.381235	2017-12-09 21:06:35.381235
1493	College	718964576	3900488	2017-12-09 21:06:35.40212	2017-12-09 21:06:35.40212
1494	College	718964583	3900488	2017-12-09 21:06:35.423224	2017-12-09 21:06:35.423224
1495	College	718964565	3900487	2017-12-09 21:06:35.447533	2017-12-09 21:06:35.447533
1496	College	718964571	3900487	2017-12-09 21:06:35.468349	2017-12-09 21:06:35.468349
1497	College	718964577	3900487	2017-12-09 21:06:35.489549	2017-12-09 21:06:35.489549
1498	College	718964581	3900487	2017-12-09 21:06:35.510486	2017-12-09 21:06:35.510486
1499	College	718964583	3900487	2017-12-09 21:06:35.531286	2017-12-09 21:06:35.531286
1500	College	718964566	3900487	2017-12-09 21:06:35.551094	2017-12-09 21:06:35.551094
1501	College	718964576	3900486	2017-12-09 21:06:35.577517	2017-12-09 21:06:35.577517
1502	College	718964581	3900486	2017-12-09 21:06:35.598112	2017-12-09 21:06:35.598112
1503	College	718964572	3900486	2017-12-09 21:06:35.618292	2017-12-09 21:06:35.618292
1504	College	718964577	3900486	2017-12-09 21:06:35.727053	2017-12-09 21:06:35.727053
1505	College	718964484	3900486	2017-12-09 21:06:35.747323	2017-12-09 21:06:35.747323
1506	College	718964570	3900486	2017-12-09 21:06:35.767884	2017-12-09 21:06:35.767884
1507	College	718964484	3900485	2017-12-09 21:06:35.792259	2017-12-09 21:06:35.792259
1508	College	718964572	3900485	2017-12-09 21:06:35.812466	2017-12-09 21:06:35.812466
1509	College	718964584	3900485	2017-12-09 21:06:35.832768	2017-12-09 21:06:35.832768
1510	College	718964575	3900485	2017-12-09 21:06:35.852554	2017-12-09 21:06:35.852554
1511	College	718964571	3900485	2017-12-09 21:06:35.872185	2017-12-09 21:06:35.872185
1512	College	718964580	3900485	2017-12-09 21:06:35.892788	2017-12-09 21:06:35.892788
1513	College	718964583	3900484	2017-12-09 21:06:35.919902	2017-12-09 21:06:35.919902
1514	College	718964580	3900484	2017-12-09 21:06:35.954508	2017-12-09 21:06:35.954508
1515	College	718964577	3900484	2017-12-09 21:06:35.975973	2017-12-09 21:06:35.975973
1516	College	718964576	3900484	2017-12-09 21:06:35.99744	2017-12-09 21:06:35.99744
1517	College	718964484	3900484	2017-12-09 21:06:37.875421	2017-12-09 21:06:37.875421
1518	College	718964566	3900484	2017-12-09 21:06:37.899417	2017-12-09 21:06:37.899417
1519	College	718964568	3900483	2017-12-09 21:06:37.927961	2017-12-09 21:06:37.927961
1520	College	718964574	3900483	2017-12-09 21:06:37.948009	2017-12-09 21:06:37.948009
1521	College	718964578	3900483	2017-12-09 21:06:37.968439	2017-12-09 21:06:37.968439
1522	College	718964571	3900483	2017-12-09 21:06:37.988671	2017-12-09 21:06:37.988671
1523	College	718964566	3900483	2017-12-09 21:06:38.010433	2017-12-09 21:06:38.010433
1524	College	718964584	3900483	2017-12-09 21:06:38.029763	2017-12-09 21:06:38.029763
1525	College	718964578	3900482	2017-12-09 21:06:38.052778	2017-12-09 21:06:38.052778
1526	College	718964572	3900482	2017-12-09 21:06:38.071944	2017-12-09 21:06:38.071944
1527	College	718964575	3900482	2017-12-09 21:06:38.091071	2017-12-09 21:06:38.091071
1528	College	718964577	3900482	2017-12-09 21:06:38.110761	2017-12-09 21:06:38.110761
1529	College	718964582	3900482	2017-12-09 21:06:38.129805	2017-12-09 21:06:38.129805
1530	College	718964570	3900482	2017-12-09 21:06:38.149255	2017-12-09 21:06:38.149255
1531	College	718964568	3900481	2017-12-09 21:06:38.172714	2017-12-09 21:06:38.172714
1532	College	718964566	3900481	2017-12-09 21:06:38.192591	2017-12-09 21:06:38.192591
1533	College	718964575	3900481	2017-12-09 21:06:38.212347	2017-12-09 21:06:38.212347
1534	College	718964583	3900481	2017-12-09 21:06:38.231531	2017-12-09 21:06:38.231531
1535	College	718964569	3900481	2017-12-09 21:06:38.250752	2017-12-09 21:06:38.250752
1536	College	718964582	3900481	2017-12-09 21:06:38.269754	2017-12-09 21:06:38.269754
1537	College	718964577	3900480	2017-12-09 21:06:38.292375	2017-12-09 21:06:38.292375
1538	College	718964575	3900480	2017-12-09 21:06:38.311879	2017-12-09 21:06:38.311879
1539	College	718964484	3900480	2017-12-09 21:06:38.331683	2017-12-09 21:06:38.331683
1540	College	718964574	3900480	2017-12-09 21:06:38.351075	2017-12-09 21:06:38.351075
1541	College	718964578	3900480	2017-12-09 21:06:38.370422	2017-12-09 21:06:38.370422
1542	College	718964570	3900480	2017-12-09 21:06:38.391504	2017-12-09 21:06:38.391504
1543	College	718964572	3900479	2017-12-09 21:06:38.424924	2017-12-09 21:06:38.424924
1544	College	718964584	3900479	2017-12-09 21:06:38.447086	2017-12-09 21:06:38.447086
1545	College	718964578	3900479	2017-12-09 21:06:38.467779	2017-12-09 21:06:38.467779
1546	College	718964583	3900479	2017-12-09 21:06:38.487607	2017-12-09 21:06:38.487607
1547	College	718964566	3900479	2017-12-09 21:06:38.50738	2017-12-09 21:06:38.50738
1548	College	718964484	3900479	2017-12-09 21:06:38.528425	2017-12-09 21:06:38.528425
1549	College	718964567	3900478	2017-12-09 21:06:38.552836	2017-12-09 21:06:38.552836
1550	College	718964576	3900478	2017-12-09 21:06:38.572711	2017-12-09 21:06:38.572711
1551	College	718964584	3900478	2017-12-09 21:06:38.592887	2017-12-09 21:06:38.592887
1552	College	718964571	3900478	2017-12-09 21:06:38.613708	2017-12-09 21:06:38.613708
1553	College	718964570	3900478	2017-12-09 21:06:38.63469	2017-12-09 21:06:38.63469
1554	College	718964484	3900478	2017-12-09 21:06:38.654721	2017-12-09 21:06:38.654721
1555	College	718964582	3900477	2017-12-09 21:06:43.261997	2017-12-09 21:06:43.261997
1556	College	718964565	3900477	2017-12-09 21:06:43.282982	2017-12-09 21:06:43.282982
1557	College	718964484	3900477	2017-12-09 21:06:43.304063	2017-12-09 21:06:43.304063
1558	College	718964581	3900477	2017-12-09 21:06:43.32538	2017-12-09 21:06:43.32538
1559	College	718964573	3900477	2017-12-09 21:06:43.347972	2017-12-09 21:06:43.347972
1560	College	718964569	3900477	2017-12-09 21:06:43.369575	2017-12-09 21:06:43.369575
1561	College	718964571	3900476	2017-12-09 21:06:43.394486	2017-12-09 21:06:43.394486
1562	College	718964572	3900476	2017-12-09 21:06:43.415152	2017-12-09 21:06:43.415152
1563	College	718964584	3900476	2017-12-09 21:06:43.437283	2017-12-09 21:06:43.437283
1564	College	718964574	3900476	2017-12-09 21:06:43.458923	2017-12-09 21:06:43.458923
1565	College	718964578	3900476	2017-12-09 21:06:43.480567	2017-12-09 21:06:43.480567
1566	College	718964569	3900476	2017-12-09 21:06:43.502657	2017-12-09 21:06:43.502657
1567	College	718964582	3900475	2017-12-09 21:06:43.528525	2017-12-09 21:06:43.528525
1568	College	718964576	3900475	2017-12-09 21:06:43.549439	2017-12-09 21:06:43.549439
1569	College	718964574	3900475	2017-12-09 21:06:43.570572	2017-12-09 21:06:43.570572
1570	College	718964581	3900475	2017-12-09 21:06:43.60441	2017-12-09 21:06:43.60441
1571	College	718964573	3900475	2017-12-09 21:06:43.624411	2017-12-09 21:06:43.624411
1572	College	718964580	3900475	2017-12-09 21:06:43.644383	2017-12-09 21:06:43.644383
1573	College	718964568	3900474	2017-12-09 21:06:43.66853	2017-12-09 21:06:43.66853
1574	College	718964575	3900474	2017-12-09 21:06:43.688291	2017-12-09 21:06:43.688291
1575	College	718964567	3900474	2017-12-09 21:06:43.708096	2017-12-09 21:06:43.708096
1576	College	718964582	3900474	2017-12-09 21:06:43.727703	2017-12-09 21:06:43.727703
1577	College	718964576	3900474	2017-12-09 21:06:43.747058	2017-12-09 21:06:43.747058
1578	College	718964569	3900474	2017-12-09 21:06:43.766548	2017-12-09 21:06:43.766548
1579	College	718964575	3900473	2017-12-09 21:06:43.789906	2017-12-09 21:06:43.789906
1580	College	718964584	3900473	2017-12-09 21:06:43.809046	2017-12-09 21:06:43.809046
1581	College	718964581	3900473	2017-12-09 21:06:43.828861	2017-12-09 21:06:43.828861
1582	College	718964567	3900473	2017-12-09 21:06:43.849573	2017-12-09 21:06:43.849573
1583	College	718964574	3900473	2017-12-09 21:06:43.869522	2017-12-09 21:06:43.869522
1584	College	718964484	3900473	2017-12-09 21:06:43.889557	2017-12-09 21:06:43.889557
1585	College	718964573	3900472	2017-12-09 21:06:43.913664	2017-12-09 21:06:43.913664
1586	College	718964571	3900472	2017-12-09 21:06:43.933294	2017-12-09 21:06:43.933294
1587	College	718964568	3900472	2017-12-09 21:06:43.953063	2017-12-09 21:06:43.953063
1588	College	718964584	3900472	2017-12-09 21:06:43.972852	2017-12-09 21:06:43.972852
1589	College	718964570	3900472	2017-12-09 21:06:43.998644	2017-12-09 21:06:43.998644
1590	College	718964574	3900472	2017-12-09 21:06:44.01995	2017-12-09 21:06:44.01995
1591	College	718964579	3900471	2017-12-09 21:06:44.043666	2017-12-09 21:06:44.043666
1592	College	718964582	3900471	2017-12-09 21:06:44.063075	2017-12-09 21:06:44.063075
1593	College	718964578	3900471	2017-12-09 21:06:45.410811	2017-12-09 21:06:45.410811
1594	College	718964581	3900471	2017-12-09 21:06:45.43141	2017-12-09 21:06:45.43141
1595	College	718964573	3900471	2017-12-09 21:06:45.45122	2017-12-09 21:06:45.45122
1596	College	718964584	3900471	2017-12-09 21:06:45.470925	2017-12-09 21:06:45.470925
1597	College	718964571	3900470	2017-12-09 21:06:45.494556	2017-12-09 21:06:45.494556
1598	College	718964484	3900470	2017-12-09 21:06:45.514801	2017-12-09 21:06:45.514801
1599	College	718964581	3900470	2017-12-09 21:06:45.534621	2017-12-09 21:06:45.534621
1600	College	718964578	3900470	2017-12-09 21:06:45.554615	2017-12-09 21:06:45.554615
1601	College	718964573	3900470	2017-12-09 21:06:45.574421	2017-12-09 21:06:45.574421
1602	College	718964574	3900470	2017-12-09 21:06:45.593907	2017-12-09 21:06:45.593907
1603	College	718964568	3900469	2017-12-09 21:06:45.617533	2017-12-09 21:06:45.617533
1604	College	718964565	3900469	2017-12-09 21:06:45.637414	2017-12-09 21:06:45.637414
1605	College	718964572	3900469	2017-12-09 21:06:45.657599	2017-12-09 21:06:45.657599
1606	College	718964484	3900469	2017-12-09 21:06:45.677253	2017-12-09 21:06:45.677253
1607	College	718964574	3900469	2017-12-09 21:06:45.696743	2017-12-09 21:06:45.696743
1608	College	718964578	3900469	2017-12-09 21:06:45.716922	2017-12-09 21:06:45.716922
1609	College	718964573	3900468	2017-12-09 21:06:45.742328	2017-12-09 21:06:45.742328
1610	College	718964566	3900468	2017-12-09 21:06:45.764177	2017-12-09 21:06:45.764177
1611	College	718964580	3900468	2017-12-09 21:06:45.790129	2017-12-09 21:06:45.790129
1612	College	718964578	3900468	2017-12-09 21:06:45.814859	2017-12-09 21:06:45.814859
1613	College	718964569	3900468	2017-12-09 21:06:45.839036	2017-12-09 21:06:45.839036
1614	College	718964571	3900468	2017-12-09 21:06:45.860625	2017-12-09 21:06:45.860625
1615	College	718964571	3900467	2017-12-09 21:06:45.883979	2017-12-09 21:06:45.883979
1616	College	718964569	3900467	2017-12-09 21:06:45.903588	2017-12-09 21:06:45.903588
1617	College	718964580	3900467	2017-12-09 21:06:45.92417	2017-12-09 21:06:45.92417
1618	College	718964565	3900467	2017-12-09 21:06:45.95078	2017-12-09 21:06:45.95078
1619	College	718964582	3900467	2017-12-09 21:06:45.972773	2017-12-09 21:06:45.972773
1620	College	718964576	3900467	2017-12-09 21:06:45.999051	2017-12-09 21:06:45.999051
1621	College	718964583	3900466	2017-12-09 21:06:46.024251	2017-12-09 21:06:46.024251
1622	College	718964569	3900466	2017-12-09 21:06:46.044975	2017-12-09 21:06:46.044975
1623	College	718964573	3900466	2017-12-09 21:06:46.065327	2017-12-09 21:06:46.065327
1624	College	718964574	3900466	2017-12-09 21:06:46.08557	2017-12-09 21:06:46.08557
1625	College	718964575	3900466	2017-12-09 21:06:46.105433	2017-12-09 21:06:46.105433
1626	College	718964576	3900466	2017-12-09 21:06:46.136555	2017-12-09 21:06:46.136555
1627	College	718964566	3900465	2017-12-09 21:06:46.159991	2017-12-09 21:06:46.159991
1628	College	718964579	3900465	2017-12-09 21:06:46.179652	2017-12-09 21:06:46.179652
1629	College	718964575	3900465	2017-12-09 21:06:46.199458	2017-12-09 21:06:46.199458
1630	College	718964576	3900465	2017-12-09 21:06:46.218634	2017-12-09 21:06:46.218634
1631	College	718964570	3900465	2017-12-09 21:06:46.237597	2017-12-09 21:06:46.237597
1632	College	718964583	3900465	2017-12-09 21:06:46.256174	2017-12-09 21:06:46.256174
1633	College	718964570	3900464	2017-12-09 21:06:46.278967	2017-12-09 21:06:46.278967
1634	College	718964581	3900464	2017-12-09 21:06:46.298875	2017-12-09 21:06:46.298875
1635	College	718964566	3900464	2017-12-09 21:06:46.744908	2017-12-09 21:06:46.744908
1636	College	718964569	3900464	2017-12-09 21:06:46.768954	2017-12-09 21:06:46.768954
1637	College	718964574	3900464	2017-12-09 21:06:46.792546	2017-12-09 21:06:46.792546
1638	College	718964575	3900464	2017-12-09 21:06:46.81588	2017-12-09 21:06:46.81588
1639	College	718964573	3900463	2017-12-09 21:06:46.846097	2017-12-09 21:06:46.846097
1640	College	718964582	3900463	2017-12-09 21:06:46.870053	2017-12-09 21:06:46.870053
1641	College	718964580	3900463	2017-12-09 21:06:46.894087	2017-12-09 21:06:46.894087
1642	College	718964484	3900463	2017-12-09 21:06:46.917812	2017-12-09 21:06:46.917812
1643	College	718964565	3900463	2017-12-09 21:06:46.940266	2017-12-09 21:06:46.940266
1644	College	718964579	3900463	2017-12-09 21:06:46.962011	2017-12-09 21:06:46.962011
1645	College	718964572	3900462	2017-12-09 21:06:46.98653	2017-12-09 21:06:46.98653
1646	College	718964577	3900462	2017-12-09 21:06:47.007023	2017-12-09 21:06:47.007023
1647	College	718964573	3900462	2017-12-09 21:06:47.027672	2017-12-09 21:06:47.027672
1648	College	718964567	3900462	2017-12-09 21:06:47.047586	2017-12-09 21:06:47.047586
1649	College	718964583	3900462	2017-12-09 21:06:47.067602	2017-12-09 21:06:47.067602
1650	College	718964568	3900462	2017-12-09 21:06:47.087584	2017-12-09 21:06:47.087584
1651	College	718964583	3900461	2017-12-09 21:06:47.111518	2017-12-09 21:06:47.111518
1652	College	718964569	3900461	2017-12-09 21:06:47.131335	2017-12-09 21:06:47.131335
1653	College	718964571	3900461	2017-12-09 21:06:47.150978	2017-12-09 21:06:47.150978
1654	College	718964582	3900461	2017-12-09 21:06:47.170903	2017-12-09 21:06:47.170903
1655	College	718964574	3900461	2017-12-09 21:06:47.191104	2017-12-09 21:06:47.191104
1656	College	718964568	3900461	2017-12-09 21:06:47.211407	2017-12-09 21:06:47.211407
1657	College	718964565	3900460	2017-12-09 21:06:47.235266	2017-12-09 21:06:47.235266
1658	College	718964573	3900460	2017-12-09 21:06:47.255207	2017-12-09 21:06:47.255207
1659	College	718964581	3900460	2017-12-09 21:06:47.274764	2017-12-09 21:06:47.274764
1660	College	718964575	3900460	2017-12-09 21:06:47.294	2017-12-09 21:06:47.294
1661	College	718964568	3900460	2017-12-09 21:06:47.313879	2017-12-09 21:06:47.313879
1662	College	718964580	3900460	2017-12-09 21:06:47.334521	2017-12-09 21:06:47.334521
1663	College	718964573	3900459	2017-12-09 21:06:47.358078	2017-12-09 21:06:47.358078
1664	College	718964580	3900459	2017-12-09 21:06:47.377492	2017-12-09 21:06:47.377492
1665	College	718964571	3900459	2017-12-09 21:06:47.396984	2017-12-09 21:06:47.396984
1666	College	718964579	3900459	2017-12-09 21:06:47.416947	2017-12-09 21:06:47.416947
1667	College	718964581	3900459	2017-12-09 21:06:47.43693	2017-12-09 21:06:47.43693
1668	College	718964576	3900459	2017-12-09 21:06:47.456821	2017-12-09 21:06:47.456821
1669	College	718964581	3900458	2017-12-09 21:06:47.480195	2017-12-09 21:06:47.480195
1670	College	718964584	3900458	2017-12-09 21:06:49.596161	2017-12-09 21:06:49.596161
1671	College	718964573	3900458	2017-12-09 21:06:49.617121	2017-12-09 21:06:49.617121
1672	College	718964576	3900458	2017-12-09 21:06:49.637319	2017-12-09 21:06:49.637319
1673	College	718964572	3900458	2017-12-09 21:06:49.657597	2017-12-09 21:06:49.657597
1674	College	718964567	3900458	2017-12-09 21:06:49.678152	2017-12-09 21:06:49.678152
1675	College	718964584	3900457	2017-12-09 21:06:49.702052	2017-12-09 21:06:49.702052
1676	College	718964571	3900457	2017-12-09 21:06:49.722379	2017-12-09 21:06:49.722379
1677	College	718964568	3900457	2017-12-09 21:06:49.743055	2017-12-09 21:06:49.743055
1678	College	718964579	3900457	2017-12-09 21:06:49.763379	2017-12-09 21:06:49.763379
1679	College	718964567	3900457	2017-12-09 21:06:49.784292	2017-12-09 21:06:49.784292
1680	College	718964484	3900457	2017-12-09 21:06:49.804568	2017-12-09 21:06:49.804568
1681	College	718964569	3900456	2017-12-09 21:06:49.840853	2017-12-09 21:06:49.840853
1682	College	718964581	3900456	2017-12-09 21:06:49.861501	2017-12-09 21:06:49.861501
1683	College	718964571	3900456	2017-12-09 21:06:49.88073	2017-12-09 21:06:49.88073
1684	College	718964577	3900456	2017-12-09 21:06:49.899932	2017-12-09 21:06:49.899932
1685	College	718964583	3900456	2017-12-09 21:06:49.920057	2017-12-09 21:06:49.920057
1686	College	718964579	3900456	2017-12-09 21:06:49.942551	2017-12-09 21:06:49.942551
1687	College	718964565	3900455	2017-12-09 21:06:49.96812	2017-12-09 21:06:49.96812
1688	College	718964568	3900455	2017-12-09 21:06:49.988577	2017-12-09 21:06:49.988577
1689	College	718964582	3900455	2017-12-09 21:06:50.00848	2017-12-09 21:06:50.00848
1690	College	718964484	3900455	2017-12-09 21:06:50.028054	2017-12-09 21:06:50.028054
1691	College	718964575	3900455	2017-12-09 21:06:50.047786	2017-12-09 21:06:50.047786
1692	College	718964567	3900455	2017-12-09 21:06:50.067414	2017-12-09 21:06:50.067414
1693	College	718964573	3900454	2017-12-09 21:06:50.090427	2017-12-09 21:06:50.090427
1694	College	718964578	3900454	2017-12-09 21:06:50.109656	2017-12-09 21:06:50.109656
1695	College	718964574	3900454	2017-12-09 21:06:50.1289	2017-12-09 21:06:50.1289
1696	College	718964584	3900454	2017-12-09 21:06:50.148423	2017-12-09 21:06:50.148423
1697	College	718964580	3900454	2017-12-09 21:06:50.167937	2017-12-09 21:06:50.167937
1698	College	718964571	3900454	2017-12-09 21:06:50.18717	2017-12-09 21:06:50.18717
1699	College	718964578	3900453	2017-12-09 21:06:50.210077	2017-12-09 21:06:50.210077
1700	College	718964581	3900453	2017-12-09 21:06:50.230242	2017-12-09 21:06:50.230242
1701	College	718964572	3900453	2017-12-09 21:06:50.249417	2017-12-09 21:06:50.249417
1702	College	718964567	3900453	2017-12-09 21:06:50.269281	2017-12-09 21:06:50.269281
1703	College	718964570	3900453	2017-12-09 21:06:50.289908	2017-12-09 21:06:50.289908
1704	College	718964576	3900453	2017-12-09 21:06:50.309799	2017-12-09 21:06:50.309799
1705	College	718964570	3900452	2017-12-09 21:06:50.333941	2017-12-09 21:06:50.333941
1706	College	718964582	3900452	2017-12-09 21:06:50.354045	2017-12-09 21:06:50.354045
1707	College	718964574	3900452	2017-12-09 21:06:50.373195	2017-12-09 21:06:50.373195
1708	College	718964578	3900452	2017-12-09 21:06:50.392956	2017-12-09 21:06:50.392956
1709	College	718964484	3900452	2017-12-09 21:06:50.413639	2017-12-09 21:06:50.413639
1710	College	718964577	3900452	2017-12-09 21:06:50.434638	2017-12-09 21:06:50.434638
1711	College	718964582	3900451	2017-12-09 21:06:50.458933	2017-12-09 21:06:50.458933
1712	College	718964571	3900451	2017-12-09 21:06:50.480208	2017-12-09 21:06:50.480208
1713	College	718964580	3900451	2017-12-09 21:06:50.500498	2017-12-09 21:06:50.500498
1714	College	718964569	3900451	2017-12-09 21:06:50.522271	2017-12-09 21:06:50.522271
1715	College	718964583	3900451	2017-12-09 21:06:50.542999	2017-12-09 21:06:50.542999
1716	College	718964584	3900451	2017-12-09 21:06:50.563825	2017-12-09 21:06:50.563825
1717	College	718964579	3900450	2017-12-09 21:06:50.587612	2017-12-09 21:06:50.587612
1718	College	718964567	3900450	2017-12-09 21:06:50.607765	2017-12-09 21:06:50.607765
1719	College	718964581	3900450	2017-12-09 21:06:52.710659	2017-12-09 21:06:52.710659
1720	College	718964570	3900450	2017-12-09 21:06:52.731418	2017-12-09 21:06:52.731418
1721	College	718964574	3900450	2017-12-09 21:06:52.751714	2017-12-09 21:06:52.751714
1722	College	718964578	3900450	2017-12-09 21:06:52.772155	2017-12-09 21:06:52.772155
1723	College	718964567	3900449	2017-12-09 21:06:52.796006	2017-12-09 21:06:52.796006
1724	College	718964571	3900449	2017-12-09 21:06:52.816515	2017-12-09 21:06:52.816515
1725	College	718964573	3900449	2017-12-09 21:06:52.836915	2017-12-09 21:06:52.836915
1726	College	718964575	3900449	2017-12-09 21:06:52.856834	2017-12-09 21:06:52.856834
1727	College	718964581	3900449	2017-12-09 21:06:52.87657	2017-12-09 21:06:52.87657
1728	College	718964579	3900449	2017-12-09 21:06:52.896381	2017-12-09 21:06:52.896381
1729	College	718964571	3900448	2017-12-09 21:06:52.91956	2017-12-09 21:06:52.91956
1730	College	718964577	3900448	2017-12-09 21:06:52.939627	2017-12-09 21:06:52.939627
1731	College	718964579	3900448	2017-12-09 21:06:52.959379	2017-12-09 21:06:52.959379
1732	College	718964581	3900448	2017-12-09 21:06:52.981615	2017-12-09 21:06:52.981615
1733	College	718964572	3900448	2017-12-09 21:06:53.003917	2017-12-09 21:06:53.003917
1734	College	718964573	3900448	2017-12-09 21:06:53.024646	2017-12-09 21:06:53.024646
1735	College	718964577	3900447	2017-12-09 21:06:53.048559	2017-12-09 21:06:53.048559
1736	College	718964570	3900447	2017-12-09 21:06:53.069907	2017-12-09 21:06:53.069907
1737	College	718964573	3900447	2017-12-09 21:06:53.102423	2017-12-09 21:06:53.102423
1738	College	718964576	3900447	2017-12-09 21:06:53.122431	2017-12-09 21:06:53.122431
1739	College	718964568	3900447	2017-12-09 21:06:56.298654	2017-12-09 21:06:56.298654
1740	College	718964565	3900447	2017-12-09 21:06:56.321226	2017-12-09 21:06:56.321226
1741	College	718964574	3900446	2017-12-09 21:06:56.345951	2017-12-09 21:06:56.345951
1742	College	718964573	3900446	2017-12-09 21:06:56.366059	2017-12-09 21:06:56.366059
1743	College	718964579	3900446	2017-12-09 21:06:56.389032	2017-12-09 21:06:56.389032
1744	College	718964568	3900446	2017-12-09 21:06:56.410606	2017-12-09 21:06:56.410606
1745	College	718964582	3900446	2017-12-09 21:06:56.43194	2017-12-09 21:06:56.43194
1746	College	718964572	3900446	2017-12-09 21:06:56.452556	2017-12-09 21:06:56.452556
1747	College	718964565	3900445	2017-12-09 21:06:56.476559	2017-12-09 21:06:56.476559
1748	College	718964574	3900445	2017-12-09 21:06:56.496616	2017-12-09 21:06:56.496616
1749	College	718964579	3900445	2017-12-09 21:06:56.51713	2017-12-09 21:06:56.51713
1750	College	718964573	3900445	2017-12-09 21:06:56.537223	2017-12-09 21:06:56.537223
1751	College	718964580	3900445	2017-12-09 21:06:56.559048	2017-12-09 21:06:56.559048
1752	College	718964570	3900445	2017-12-09 21:06:56.579802	2017-12-09 21:06:56.579802
1753	College	718964569	3900444	2017-12-09 21:06:56.604657	2017-12-09 21:06:56.604657
1754	College	718964574	3900444	2017-12-09 21:06:56.625788	2017-12-09 21:06:56.625788
1755	College	718964578	3900444	2017-12-09 21:06:56.645578	2017-12-09 21:06:56.645578
1756	College	718964566	3900444	2017-12-09 21:06:56.665508	2017-12-09 21:06:56.665508
1757	College	718964570	3900444	2017-12-09 21:06:56.685814	2017-12-09 21:06:56.685814
1758	College	718964575	3900444	2017-12-09 21:06:56.706261	2017-12-09 21:06:56.706261
1759	College	718964583	3900443	2017-12-09 21:06:56.729433	2017-12-09 21:06:56.729433
1760	College	718964567	3900443	2017-12-09 21:06:56.748564	2017-12-09 21:06:56.748564
1761	College	718964576	3900443	2017-12-09 21:06:56.768212	2017-12-09 21:06:56.768212
1762	College	718964584	3900443	2017-12-09 21:06:56.787881	2017-12-09 21:06:56.787881
1763	College	718964574	3900443	2017-12-09 21:06:56.807615	2017-12-09 21:06:56.807615
1764	College	718964573	3900443	2017-12-09 21:06:56.827331	2017-12-09 21:06:56.827331
1765	College	718964484	3900442	2017-12-09 21:06:56.85077	2017-12-09 21:06:56.85077
1766	College	718964570	3900442	2017-12-09 21:06:56.870564	2017-12-09 21:06:56.870564
1767	College	718964582	3900442	2017-12-09 21:06:56.890126	2017-12-09 21:06:56.890126
1768	College	718964578	3900442	2017-12-09 21:06:56.910431	2017-12-09 21:06:56.910431
1769	College	718964581	3900442	2017-12-09 21:06:58.760944	2017-12-09 21:06:58.760944
1770	College	718964580	3900442	2017-12-09 21:06:58.786735	2017-12-09 21:06:58.786735
1771	College	718964566	3900441	2017-12-09 21:06:58.8123	2017-12-09 21:06:58.8123
1772	College	718964583	3900441	2017-12-09 21:06:58.832615	2017-12-09 21:06:58.832615
1773	College	718964580	3900441	2017-12-09 21:06:58.852604	2017-12-09 21:06:58.852604
1774	College	718964575	3900441	2017-12-09 21:06:58.872446	2017-12-09 21:06:58.872446
1775	College	718964569	3900441	2017-12-09 21:06:58.893692	2017-12-09 21:06:58.893692
1776	College	718964484	3900441	2017-12-09 21:06:58.913225	2017-12-09 21:06:58.913225
1777	College	718964568	3900440	2017-12-09 21:06:58.937797	2017-12-09 21:06:58.937797
1778	College	718964584	3900440	2017-12-09 21:06:58.95971	2017-12-09 21:06:58.95971
1779	College	718964580	3900440	2017-12-09 21:06:58.98204	2017-12-09 21:06:58.98204
1780	College	718964578	3900440	2017-12-09 21:06:59.004453	2017-12-09 21:06:59.004453
1781	College	718964577	3900440	2017-12-09 21:06:59.025153	2017-12-09 21:06:59.025153
1782	College	718964565	3900440	2017-12-09 21:06:59.045818	2017-12-09 21:06:59.045818
1783	College	718964577	3900439	2017-12-09 21:06:59.069499	2017-12-09 21:06:59.069499
1784	College	718964573	3900439	2017-12-09 21:06:59.09	2017-12-09 21:06:59.09
1785	College	718964584	3900439	2017-12-09 21:06:59.109835	2017-12-09 21:06:59.109835
1786	College	718964571	3900439	2017-12-09 21:06:59.130475	2017-12-09 21:06:59.130475
1787	College	718964578	3900439	2017-12-09 21:06:59.151109	2017-12-09 21:06:59.151109
1788	College	718964484	3900439	2017-12-09 21:06:59.171856	2017-12-09 21:06:59.171856
1789	College	718964570	3900438	2017-12-09 21:06:59.197237	2017-12-09 21:06:59.197237
1790	College	718964571	3900438	2017-12-09 21:06:59.217904	2017-12-09 21:06:59.217904
1791	College	718964582	3900438	2017-12-09 21:06:59.239222	2017-12-09 21:06:59.239222
1792	College	718964568	3900438	2017-12-09 21:06:59.270962	2017-12-09 21:06:59.270962
1793	College	718964577	3900438	2017-12-09 21:06:59.289946	2017-12-09 21:06:59.289946
1794	College	718964584	3900438	2017-12-09 21:06:59.308652	2017-12-09 21:06:59.308652
1795	College	718964484	3900437	2017-12-09 21:06:59.331269	2017-12-09 21:06:59.331269
1796	College	718964583	3900437	2017-12-09 21:06:59.350516	2017-12-09 21:06:59.350516
1797	College	718964569	3900437	2017-12-09 21:07:01.686143	2017-12-09 21:07:01.686143
1798	College	718964570	3900437	2017-12-09 21:07:01.706642	2017-12-09 21:07:01.706642
1799	College	718964571	3900437	2017-12-09 21:07:01.726554	2017-12-09 21:07:01.726554
1800	College	718964565	3900437	2017-12-09 21:07:01.74703	2017-12-09 21:07:01.74703
1801	College	718964583	3900196	2017-12-09 21:13:00.439467	2017-12-09 21:13:00.439467
\.


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('conversations_id_seq', 1801, true);


--
-- Data for Name: cornerbacks; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY cornerbacks (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2016	140	138	57	153	105	182	183	2017-12-09 21:07:07.220682	2017-12-09 21:07:07.220682
2	2015	2	122	160	158	64	130	21	2017-12-09 21:07:07.22808	2017-12-09 21:07:07.22808
3	2014	83	37	148	18	156	3	120	2017-12-09 21:07:07.234839	2017-12-09 21:07:07.234839
4	2013	4	30	37	66	171	26	29	2017-12-09 21:07:07.241416	2017-12-09 21:07:07.241416
5	2016	78	124	178	2	62	107	160	2017-12-09 21:07:07.310313	2017-12-09 21:07:07.310313
6	2015	34	6	58	65	178	193	2	2017-12-09 21:07:07.317153	2017-12-09 21:07:07.317153
7	2014	126	14	196	144	100	172	132	2017-12-09 21:07:07.323928	2017-12-09 21:07:07.323928
8	2013	171	6	1	80	182	125	186	2017-12-09 21:07:07.330904	2017-12-09 21:07:07.330904
9	2016	129	77	7	171	102	112	150	2017-12-09 21:07:07.452192	2017-12-09 21:07:07.452192
10	2015	119	161	87	88	151	161	75	2017-12-09 21:07:07.459173	2017-12-09 21:07:07.459173
11	2014	184	7	62	167	187	96	7	2017-12-09 21:07:07.465754	2017-12-09 21:07:07.465754
12	2013	122	85	175	18	22	134	57	2017-12-09 21:07:07.472529	2017-12-09 21:07:07.472529
13	2016	138	41	139	78	59	101	176	2017-12-09 21:07:07.5896	2017-12-09 21:07:07.5896
14	2015	185	125	143	8	41	123	167	2017-12-09 21:07:07.596579	2017-12-09 21:07:07.596579
15	2014	180	48	83	6	72	156	53	2017-12-09 21:07:07.603143	2017-12-09 21:07:07.603143
16	2013	166	134	194	92	16	148	128	2017-12-09 21:07:07.609663	2017-12-09 21:07:07.609663
17	2016	153	121	94	144	153	164	176	2017-12-09 21:07:12.923636	2017-12-09 21:07:12.923636
18	2015	164	129	21	167	5	13	199	2017-12-09 21:07:12.930719	2017-12-09 21:07:12.930719
19	2014	146	136	34	85	60	40	68	2017-12-09 21:07:12.93708	2017-12-09 21:07:12.93708
20	2013	91	91	122	63	156	58	65	2017-12-09 21:07:12.943592	2017-12-09 21:07:12.943592
21	2018	1	92	146	131	42	152	70	2017-12-09 21:07:13.602311	2017-12-09 21:07:13.602311
22	2017	80	8	89	35	146	113	119	2017-12-09 21:07:13.60913	2017-12-09 21:07:13.60913
23	2016	66	31	28	142	51	40	198	2017-12-09 21:07:13.615953	2017-12-09 21:07:13.615953
24	2015	161	171	138	25	56	147	176	2017-12-09 21:07:13.622659	2017-12-09 21:07:13.622659
25	2019	71	76	110	147	79	28	163	2017-12-09 21:07:14.111541	2017-12-09 21:07:14.111541
26	2018	99	63	57	170	195	67	62	2017-12-09 21:07:14.118141	2017-12-09 21:07:14.118141
27	2017	74	186	152	5	185	185	127	2017-12-09 21:07:14.124877	2017-12-09 21:07:14.124877
28	2016	33	135	39	129	156	42	35	2017-12-09 21:07:14.132887	2017-12-09 21:07:14.132887
29	2018	130	66	172	132	109	97	58	2017-12-09 21:07:14.174113	2017-12-09 21:07:14.174113
30	2017	106	53	95	88	125	117	171	2017-12-09 21:07:14.182285	2017-12-09 21:07:14.182285
31	2016	8	101	185	66	80	191	169	2017-12-09 21:07:14.188988	2017-12-09 21:07:14.188988
32	2015	32	172	153	151	85	13	163	2017-12-09 21:07:14.196009	2017-12-09 21:07:14.196009
33	2016	80	26	161	131	157	166	176	2017-12-09 21:07:15.503136	2017-12-09 21:07:15.503136
34	2015	35	5	134	102	5	192	168	2017-12-09 21:07:15.509788	2017-12-09 21:07:15.509788
35	2014	71	127	152	42	148	89	28	2017-12-09 21:07:15.516827	2017-12-09 21:07:15.516827
36	2013	89	19	50	8	135	75	179	2017-12-09 21:07:15.524435	2017-12-09 21:07:15.524435
37	2018	18	44	9	23	50	31	139	2017-12-09 21:07:15.956158	2017-12-09 21:07:15.956158
38	2017	47	105	129	131	0	150	167	2017-12-09 21:07:15.962686	2017-12-09 21:07:15.962686
39	2016	139	40	19	118	149	144	70	2017-12-09 21:07:15.969402	2017-12-09 21:07:15.969402
40	2015	198	81	109	97	90	154	169	2017-12-09 21:07:15.97605	2017-12-09 21:07:15.97605
\.


--
-- Name: cornerbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('cornerbacks_id_seq', 40, true);


--
-- Data for Name: defensive_ends; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY defensive_ends (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2017	172	64	199	173	39	9	166	2017-12-09 21:07:05.533948	2017-12-09 21:07:05.533948
2	2016	155	106	194	186	168	185	68	2017-12-09 21:07:05.541221	2017-12-09 21:07:05.541221
3	2015	87	1	11	28	112	52	20	2017-12-09 21:07:05.54803	2017-12-09 21:07:05.54803
4	2014	62	103	92	143	101	173	188	2017-12-09 21:07:05.554271	2017-12-09 21:07:05.554271
5	2016	155	2	37	155	193	141	92	2017-12-09 21:07:06.29152	2017-12-09 21:07:06.29152
6	2015	88	113	152	101	142	152	112	2017-12-09 21:07:06.297993	2017-12-09 21:07:06.297993
7	2014	87	142	198	108	53	168	1	2017-12-09 21:07:06.304776	2017-12-09 21:07:06.304776
8	2013	66	28	153	197	31	54	132	2017-12-09 21:07:06.311707	2017-12-09 21:07:06.311707
9	2016	153	185	118	65	172	18	46	2017-12-09 21:07:06.403891	2017-12-09 21:07:06.403891
10	2015	87	12	39	67	147	82	106	2017-12-09 21:07:06.41028	2017-12-09 21:07:06.41028
11	2014	195	44	126	73	134	124	159	2017-12-09 21:07:06.416614	2017-12-09 21:07:06.416614
12	2013	20	107	196	145	34	9	162	2017-12-09 21:07:06.422962	2017-12-09 21:07:06.422962
13	2016	140	148	32	88	126	96	151	2017-12-09 21:07:14.770275	2017-12-09 21:07:14.770275
14	2015	90	183	114	43	68	0	90	2017-12-09 21:07:14.776679	2017-12-09 21:07:14.776679
15	2014	155	134	130	13	148	88	100	2017-12-09 21:07:14.783747	2017-12-09 21:07:14.783747
16	2013	196	32	169	3	132	125	21	2017-12-09 21:07:14.790353	2017-12-09 21:07:14.790353
17	2019	102	169	112	97	166	48	192	2017-12-09 21:07:15.194065	2017-12-09 21:07:15.194065
18	2018	1	128	23	16	125	186	90	2017-12-09 21:07:15.201832	2017-12-09 21:07:15.201832
19	2017	24	185	165	46	55	28	46	2017-12-09 21:07:15.208542	2017-12-09 21:07:15.208542
20	2016	185	42	24	181	54	2	25	2017-12-09 21:07:15.21505	2017-12-09 21:07:15.21505
\.


--
-- Name: defensive_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('defensive_ends_id_seq', 20, true);


--
-- Data for Name: defensive_tackles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY defensive_tackles (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2016	120	111	92	64	130	66	128	2017-12-09 21:07:05.878054	2017-12-09 21:07:05.878054
2	2015	132	54	140	75	198	188	78	2017-12-09 21:07:05.88562	2017-12-09 21:07:05.88562
3	2014	58	153	163	26	65	138	182	2017-12-09 21:07:05.891803	2017-12-09 21:07:05.891803
4	2013	28	180	147	140	75	96	116	2017-12-09 21:07:05.89833	2017-12-09 21:07:05.89833
5	2016	27	158	173	30	103	150	47	2017-12-09 21:07:06.818741	2017-12-09 21:07:06.818741
6	2015	65	184	153	125	38	131	85	2017-12-09 21:07:06.825152	2017-12-09 21:07:06.825152
7	2014	44	19	196	68	117	59	94	2017-12-09 21:07:06.831592	2017-12-09 21:07:06.831592
8	2013	60	69	33	194	184	41	159	2017-12-09 21:07:06.837928	2017-12-09 21:07:06.837928
9	2017	61	29	92	150	136	24	169	2017-12-09 21:07:07.622791	2017-12-09 21:07:07.622791
10	2016	43	120	184	46	178	130	9	2017-12-09 21:07:07.629935	2017-12-09 21:07:07.629935
11	2015	169	54	27	109	25	193	193	2017-12-09 21:07:07.636501	2017-12-09 21:07:07.636501
12	2014	90	184	182	85	108	156	28	2017-12-09 21:07:12.738659	2017-12-09 21:07:12.738659
13	2019	4	168	4	175	87	102	147	2017-12-09 21:07:13.313506	2017-12-09 21:07:13.313506
14	2018	30	105	187	18	38	22	93	2017-12-09 21:07:13.32185	2017-12-09 21:07:13.32185
15	2017	176	75	114	62	35	40	66	2017-12-09 21:07:13.328248	2017-12-09 21:07:13.328248
16	2016	160	12	56	117	90	22	12	2017-12-09 21:07:13.334923	2017-12-09 21:07:13.334923
17	2019	83	45	179	98	62	27	115	2017-12-09 21:07:14.607316	2017-12-09 21:07:14.607316
18	2018	2	95	8	27	71	163	2	2017-12-09 21:07:14.614658	2017-12-09 21:07:14.614658
19	2017	122	117	102	17	41	0	187	2017-12-09 21:07:14.621247	2017-12-09 21:07:14.621247
20	2016	84	127	34	156	57	186	117	2017-12-09 21:07:14.628356	2017-12-09 21:07:14.628356
21	2019	76	27	158	66	181	125	66	2017-12-09 21:07:16.044733	2017-12-09 21:07:16.044733
22	2018	38	64	89	192	118	64	123	2017-12-09 21:07:16.051341	2017-12-09 21:07:16.051341
23	2017	178	155	88	57	91	104	96	2017-12-09 21:07:16.058246	2017-12-09 21:07:16.058246
24	2016	81	165	72	31	115	82	102	2017-12-09 21:07:16.064585	2017-12-09 21:07:16.064585
\.


--
-- Name: defensive_tackles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('defensive_tackles_id_seq', 24, true);


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY enrollments (id, athlete_id, high_school_id, high_school_approved, created_at, updated_at) FROM stdin;
611703988	3900196	179264526	t	2017-12-09 19:45:43.015525	2017-12-09 19:45:43.015525
611704229	3900437	179264607	t	2017-12-09 21:06:19.476561	2017-12-09 21:06:19.476561
611704230	3900438	179264607	t	2017-12-09 21:06:19.559995	2017-12-09 21:06:19.559995
611704231	3900439	179264607	t	2017-12-09 21:06:19.641978	2017-12-09 21:06:19.641978
611704232	3900440	179264608	t	2017-12-09 21:06:19.970477	2017-12-09 21:06:19.970477
611704233	3900441	179264608	t	2017-12-09 21:06:20.05796	2017-12-09 21:06:20.05796
611704234	3900442	179264608	t	2017-12-09 21:06:20.141805	2017-12-09 21:06:20.141805
611704235	3900443	179264609	t	2017-12-09 21:06:20.47252	2017-12-09 21:06:20.47252
611704236	3900444	179264609	t	2017-12-09 21:06:20.554381	2017-12-09 21:06:20.554381
611704237	3900445	179264609	t	2017-12-09 21:06:20.637737	2017-12-09 21:06:20.637737
611704238	3900446	179264610	t	2017-12-09 21:06:20.97676	2017-12-09 21:06:20.97676
611704239	3900447	179264610	t	2017-12-09 21:06:21.060937	2017-12-09 21:06:21.060937
611704240	3900448	179264610	t	2017-12-09 21:06:21.146485	2017-12-09 21:06:21.146485
611704241	3900449	179264611	t	2017-12-09 21:06:21.480471	2017-12-09 21:06:21.480471
611704242	3900450	179264611	t	2017-12-09 21:06:21.56473	2017-12-09 21:06:21.56473
611704243	3900451	179264611	t	2017-12-09 21:06:21.647243	2017-12-09 21:06:21.647243
611704244	3900452	179264612	t	2017-12-09 21:06:21.977524	2017-12-09 21:06:21.977524
611704245	3900453	179264612	t	2017-12-09 21:06:22.06111	2017-12-09 21:06:22.06111
611704246	3900454	179264612	t	2017-12-09 21:06:22.144429	2017-12-09 21:06:22.144429
611704247	3900455	179264613	t	2017-12-09 21:06:22.473515	2017-12-09 21:06:22.473515
611704248	3900456	179264613	t	2017-12-09 21:06:22.556142	2017-12-09 21:06:22.556142
611704249	3900457	179264613	t	2017-12-09 21:06:22.640686	2017-12-09 21:06:22.640686
611704250	3900458	179264614	t	2017-12-09 21:06:22.97937	2017-12-09 21:06:22.97937
611704251	3900459	179264614	t	2017-12-09 21:06:23.062237	2017-12-09 21:06:23.062237
611704252	3900460	179264614	t	2017-12-09 21:06:23.145263	2017-12-09 21:06:23.145263
611704253	3900461	179264615	t	2017-12-09 21:06:23.480404	2017-12-09 21:06:23.480404
611704254	3900462	179264615	t	2017-12-09 21:06:23.564221	2017-12-09 21:06:23.564221
611704255	3900463	179264615	t	2017-12-09 21:06:23.648311	2017-12-09 21:06:23.648311
611704256	3900464	179264616	t	2017-12-09 21:06:23.990149	2017-12-09 21:06:23.990149
611704257	3900465	179264616	t	2017-12-09 21:06:24.074719	2017-12-09 21:06:24.074719
611704258	3900466	179264616	t	2017-12-09 21:06:24.159396	2017-12-09 21:06:24.159396
611704259	3900467	179264617	t	2017-12-09 21:06:24.492277	2017-12-09 21:06:24.492277
611704260	3900468	179264617	t	2017-12-09 21:06:24.580966	2017-12-09 21:06:24.580966
611704261	3900469	179264617	t	2017-12-09 21:06:24.667659	2017-12-09 21:06:24.667659
611704262	3900470	179264618	t	2017-12-09 21:06:25.011567	2017-12-09 21:06:25.011567
611704263	3900471	179264618	t	2017-12-09 21:06:25.095134	2017-12-09 21:06:25.095134
611704264	3900472	179264618	t	2017-12-09 21:06:25.179182	2017-12-09 21:06:25.179182
611704265	3900473	179264619	t	2017-12-09 21:06:25.513555	2017-12-09 21:06:25.513555
611704266	3900474	179264619	t	2017-12-09 21:06:25.599999	2017-12-09 21:06:25.599999
611704267	3900475	179264619	t	2017-12-09 21:06:25.685987	2017-12-09 21:06:25.685987
611704268	3900476	179264620	t	2017-12-09 21:06:26.01876	2017-12-09 21:06:26.01876
611704269	3900477	179264620	t	2017-12-09 21:06:26.101482	2017-12-09 21:06:26.101482
611704270	3900478	179264620	t	2017-12-09 21:06:26.18392	2017-12-09 21:06:26.18392
611704271	3900479	179264621	t	2017-12-09 21:06:26.515151	2017-12-09 21:06:26.515151
611704272	3900480	179264621	t	2017-12-09 21:06:26.598199	2017-12-09 21:06:26.598199
611704273	3900481	179264621	t	2017-12-09 21:06:26.682235	2017-12-09 21:06:26.682235
611704274	3900482	179264622	t	2017-12-09 21:06:27.018473	2017-12-09 21:06:27.018473
611704275	3900483	179264622	t	2017-12-09 21:06:27.101282	2017-12-09 21:06:27.101282
611704276	3900484	179264622	t	2017-12-09 21:06:27.183663	2017-12-09 21:06:27.183663
611704277	3900485	179264623	t	2017-12-09 21:06:27.514492	2017-12-09 21:06:27.514492
611704278	3900486	179264623	t	2017-12-09 21:06:27.600697	2017-12-09 21:06:27.600697
611704279	3900487	179264623	t	2017-12-09 21:06:27.686045	2017-12-09 21:06:27.686045
611704280	3900488	179264624	t	2017-12-09 21:06:28.022767	2017-12-09 21:06:28.022767
611704281	3900489	179264624	t	2017-12-09 21:06:28.106199	2017-12-09 21:06:28.106199
611704282	3900490	179264624	t	2017-12-09 21:06:28.197096	2017-12-09 21:06:28.197096
611704283	3900491	179264625	t	2017-12-09 21:06:28.521015	2017-12-09 21:06:28.521015
611704284	3900492	179264625	t	2017-12-09 21:06:28.602459	2017-12-09 21:06:28.602459
611704285	3900493	179264625	t	2017-12-09 21:06:28.68467	2017-12-09 21:06:28.68467
611704286	3900494	179264626	t	2017-12-09 21:06:29.020141	2017-12-09 21:06:29.020141
611704287	3900495	179264626	t	2017-12-09 21:06:29.100689	2017-12-09 21:06:29.100689
611704288	3900496	179264626	t	2017-12-09 21:06:29.181289	2017-12-09 21:06:29.181289
\.


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('enrollments_id_seq', 611704288, true);


--
-- Data for Name: free_safeties; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY free_safeties (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2016	51	197	144	199	41	45	138	2017-12-09 21:07:05.963974	2017-12-09 21:07:05.963974
2	2015	49	12	120	8	65	6	157	2017-12-09 21:07:05.971181	2017-12-09 21:07:05.971181
3	2014	5	153	176	30	167	177	193	2017-12-09 21:07:05.977968	2017-12-09 21:07:05.977968
4	2013	5	25	141	0	155	118	58	2017-12-09 21:07:05.984958	2017-12-09 21:07:05.984958
5	2017	84	13	135	93	62	183	165	2017-12-09 21:07:06.028297	2017-12-09 21:07:06.028297
6	2016	95	145	151	124	99	34	188	2017-12-09 21:07:06.034803	2017-12-09 21:07:06.034803
7	2015	21	107	148	48	180	70	168	2017-12-09 21:07:06.041223	2017-12-09 21:07:06.041223
8	2014	165	102	114	6	24	193	104	2017-12-09 21:07:06.047526	2017-12-09 21:07:06.047526
9	2018	43	169	164	44	110	156	79	2017-12-09 21:07:06.674786	2017-12-09 21:07:06.674786
10	2017	83	106	6	166	93	70	108	2017-12-09 21:07:06.681701	2017-12-09 21:07:06.681701
11	2016	121	72	157	6	117	39	69	2017-12-09 21:07:06.687976	2017-12-09 21:07:06.687976
12	2015	96	24	63	119	151	57	78	2017-12-09 21:07:06.694337	2017-12-09 21:07:06.694337
13	2016	129	174	42	79	17	29	129	2017-12-09 21:07:13.89838	2017-12-09 21:07:13.89838
14	2015	59	72	69	31	64	40	58	2017-12-09 21:07:13.905062	2017-12-09 21:07:13.905062
15	2014	19	132	137	19	105	97	69	2017-12-09 21:07:13.912025	2017-12-09 21:07:13.912025
16	2013	174	71	65	115	12	190	70	2017-12-09 21:07:13.919928	2017-12-09 21:07:13.919928
17	2016	161	71	64	70	45	88	19	2017-12-09 21:07:15.684851	2017-12-09 21:07:15.684851
18	2015	45	111	88	123	129	84	46	2017-12-09 21:07:15.691354	2017-12-09 21:07:15.691354
19	2014	141	177	61	85	134	187	60	2017-12-09 21:07:15.697839	2017-12-09 21:07:15.697839
20	2013	52	137	187	108	52	46	169	2017-12-09 21:07:15.704325	2017-12-09 21:07:15.704325
21	2019	164	135	22	101	111	65	133	2017-12-09 21:07:16.433548	2017-12-09 21:07:16.433548
22	2018	147	102	100	4	176	40	74	2017-12-09 21:07:16.440359	2017-12-09 21:07:16.440359
23	2017	23	68	140	198	11	45	35	2017-12-09 21:07:16.448479	2017-12-09 21:07:16.448479
24	2016	87	34	18	99	182	38	198	2017-12-09 21:07:16.455229	2017-12-09 21:07:16.455229
\.


--
-- Name: free_safeties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('free_safeties_id_seq', 24, true);


--
-- Data for Name: fullbacks; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY fullbacks (id, season, receiving_yards, receiving_touchdowns, rushing_yards, rushing_touchdowns, pancakes, created_at, updated_at) FROM stdin;
1	2016	170	150	98	121	141	2017-12-09 21:07:06.347465	2017-12-09 21:07:06.347465
2	2015	82	142	10	172	5	2017-12-09 21:07:06.354466	2017-12-09 21:07:06.354466
3	2014	24	168	3	65	134	2017-12-09 21:07:06.360965	2017-12-09 21:07:06.360965
4	2013	133	67	104	105	67	2017-12-09 21:07:06.367283	2017-12-09 21:07:06.367283
5	2019	35	161	128	120	194	2017-12-09 21:07:06.463453	2017-12-09 21:07:06.463453
6	2018	191	23	90	43	35	2017-12-09 21:07:06.469923	2017-12-09 21:07:06.469923
7	2017	175	73	107	19	33	2017-12-09 21:07:06.476341	2017-12-09 21:07:06.476341
8	2016	48	98	45	32	27	2017-12-09 21:07:06.482701	2017-12-09 21:07:06.482701
9	2017	112	156	85	194	74	2017-12-09 21:07:06.615437	2017-12-09 21:07:06.615437
10	2016	157	129	175	73	110	2017-12-09 21:07:06.621614	2017-12-09 21:07:06.621614
11	2015	168	75	119	159	46	2017-12-09 21:07:06.627707	2017-12-09 21:07:06.627707
12	2014	59	82	157	130	61	2017-12-09 21:07:06.63424	2017-12-09 21:07:06.63424
13	2019	49	148	52	28	110	2017-12-09 21:07:07.104627	2017-12-09 21:07:07.104627
14	2018	37	28	81	107	178	2017-12-09 21:07:07.111272	2017-12-09 21:07:07.111272
15	2017	90	19	28	13	129	2017-12-09 21:07:07.117613	2017-12-09 21:07:07.117613
16	2016	17	143	14	134	166	2017-12-09 21:07:07.124019	2017-12-09 21:07:07.124019
17	2016	70	13	162	144	0	2017-12-09 21:07:07.558017	2017-12-09 21:07:07.558017
18	2015	5	129	91	23	47	2017-12-09 21:07:07.564602	2017-12-09 21:07:07.564602
19	2014	187	118	8	106	25	2017-12-09 21:07:07.571931	2017-12-09 21:07:07.571931
20	2013	128	53	79	32	51	2017-12-09 21:07:07.579948	2017-12-09 21:07:07.579948
21	2016	108	106	159	84	111	2017-12-09 21:07:13.95944	2017-12-09 21:07:13.95944
22	2015	15	71	39	71	52	2017-12-09 21:07:13.966417	2017-12-09 21:07:13.966417
23	2014	35	121	127	175	78	2017-12-09 21:07:13.973039	2017-12-09 21:07:13.973039
24	2013	73	8	122	29	159	2017-12-09 21:07:13.980068	2017-12-09 21:07:13.980068
25	2018	182	56	11	132	69	2017-12-09 21:07:14.205172	2017-12-09 21:07:14.205172
26	2017	25	197	68	1	29	2017-12-09 21:07:14.211713	2017-12-09 21:07:14.211713
27	2016	1	58	189	17	6	2017-12-09 21:07:14.218558	2017-12-09 21:07:14.218558
28	2015	131	93	134	83	176	2017-12-09 21:07:14.224889	2017-12-09 21:07:14.224889
29	2017	180	147	49	69	88	2017-12-09 21:07:14.315154	2017-12-09 21:07:14.315154
30	2016	132	133	16	75	19	2017-12-09 21:07:14.322357	2017-12-09 21:07:14.322357
31	2015	19	130	64	85	144	2017-12-09 21:07:14.328892	2017-12-09 21:07:14.328892
32	2014	127	55	7	156	108	2017-12-09 21:07:14.335903	2017-12-09 21:07:14.335903
33	2019	106	153	2	80	56	2017-12-09 21:07:14.560112	2017-12-09 21:07:14.560112
34	2018	184	41	106	98	22	2017-12-09 21:07:14.566816	2017-12-09 21:07:14.566816
35	2017	150	173	197	42	192	2017-12-09 21:07:14.573825	2017-12-09 21:07:14.573825
36	2016	82	19	148	122	43	2017-12-09 21:07:14.58053	2017-12-09 21:07:14.58053
37	2017	149	145	170	193	147	2017-12-09 21:07:15.827144	2017-12-09 21:07:15.827144
38	2016	21	13	46	177	122	2017-12-09 21:07:15.833616	2017-12-09 21:07:15.833616
39	2015	186	173	120	156	170	2017-12-09 21:07:15.84006	2017-12-09 21:07:15.84006
40	2014	95	62	2	46	131	2017-12-09 21:07:15.84659	2017-12-09 21:07:15.84659
\.


--
-- Name: fullbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('fullbacks_id_seq', 40, true);


--
-- Data for Name: guards; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY guards (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
1	2018	31	92	2017-12-09 21:07:05.188854	2017-12-09 21:07:05.188854
2	2017	183	191	2017-12-09 21:07:05.19549	2017-12-09 21:07:05.19549
3	2016	197	184	2017-12-09 21:07:05.201586	2017-12-09 21:07:05.201586
4	2015	91	53	2017-12-09 21:07:05.2076	2017-12-09 21:07:05.2076
5	2016	64	0	2017-12-09 21:07:05.410418	2017-12-09 21:07:05.410418
6	2015	23	6	2017-12-09 21:07:05.41667	2017-12-09 21:07:05.41667
7	2014	66	42	2017-12-09 21:07:05.422906	2017-12-09 21:07:05.422906
8	2013	31	144	2017-12-09 21:07:05.42923	2017-12-09 21:07:05.42923
9	2017	0	181	2017-12-09 21:07:06.055713	2017-12-09 21:07:06.055713
10	2016	196	153	2017-12-09 21:07:06.061526	2017-12-09 21:07:06.061526
11	2015	68	51	2017-12-09 21:07:06.067326	2017-12-09 21:07:06.067326
12	2014	87	101	2017-12-09 21:07:06.073143	2017-12-09 21:07:06.073143
13	2018	53	97	2017-12-09 21:07:06.155803	2017-12-09 21:07:06.155803
14	2017	134	10	2017-12-09 21:07:06.161893	2017-12-09 21:07:06.161893
15	2016	119	19	2017-12-09 21:07:06.167851	2017-12-09 21:07:06.167851
16	2015	30	169	2017-12-09 21:07:06.173947	2017-12-09 21:07:06.173947
17	2019	11	134	2017-12-09 21:07:15.426274	2017-12-09 21:07:15.426274
18	2018	99	83	2017-12-09 21:07:15.432458	2017-12-09 21:07:15.432458
19	2017	159	155	2017-12-09 21:07:15.438837	2017-12-09 21:07:15.438837
20	2016	92	112	2017-12-09 21:07:15.445473	2017-12-09 21:07:15.445473
21	2019	45	165	2017-12-09 21:07:15.592203	2017-12-09 21:07:15.592203
22	2018	152	42	2017-12-09 21:07:15.599508	2017-12-09 21:07:15.599508
23	2017	197	88	2017-12-09 21:07:15.607918	2017-12-09 21:07:15.607918
24	2016	145	188	2017-12-09 21:07:15.613908	2017-12-09 21:07:15.613908
25	2017	122	51	2017-12-09 21:07:16.313101	2017-12-09 21:07:16.313101
26	2016	173	142	2017-12-09 21:07:16.319478	2017-12-09 21:07:16.319478
27	2015	162	8	2017-12-09 21:07:16.325604	2017-12-09 21:07:16.325604
28	2014	197	13	2017-12-09 21:07:16.33151	2017-12-09 21:07:16.33151
\.


--
-- Name: guards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('guards_id_seq', 28, true);


--
-- Data for Name: high_schools; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY high_schools (id, name, logo, added_by_id, offensive_schema, defensive_schema, enrollment, team_record, mascot, school_email, registration_coach_name, registration_coach_phone_number, created_at, updated_at, counselor_name, counselor_email, counselor_phone_number) FROM stdin;
179264526	Standard High School	\N	\N	We get the ball into their endzone!	We don't let them breathe.	1499	9-3	Penguin	high_school@example.com	\N	\N	2017-12-09 19:45:42.956493	2017-12-09 19:45:42.956493	\N	\N	\N
179264607	Geonosis High School	\N	\N	Offal carry cleanse skateboard hella chambray.Wolf salvia tofu lomo occupy.Loko yuccie pour-over actually asymmetrical paleo hoodie.	Viral retro iphone chillwave thundercats flannel biodiesel distillery.Chillwave lomo cliche kale chips brunch deep v.Ennui semiotics sriracha lumbersexual tumblr photo booth shabby chic.	1910	6-1	griffins	monica@sauer.net	\N	\N	2017-12-09 21:06:18.902951	2017-12-09 21:06:18.902951	\N	\N	\N
179264608	Naboo High School	\N	\N	Polaroid sartorial lo-fi vinyl.Brooklyn whatever plaid photo booth fixie.Truffaut keytar hella vegan.	Plaid biodiesel farm-to-table bicycle rights.Franzen chicharrones humblebrag vhs.Ramps semiotics five dollar toast.	4345	1-6	black cats	courtney_crona@crooks.net	\N	\N	2017-12-09 21:06:19.649006	2017-12-09 21:06:19.649006	\N	\N	\N
179264609	Takodana High School	\N	\N	Stumptown loko vegan.Wes anderson salvia yr.Gastropub vinegar tumblr hammock bitters.	Meggings retro drinking.Wayfarers messenger bag lo-fi meggings paleo migas bespoke street.Celiac flexitarian tilde freegan echo blog diy.	1850	5-5	birds	jacey_fay@mclaughlin.biz	\N	\N	2017-12-09 21:06:20.14957	2017-12-09 21:06:20.14957	\N	\N	\N
179264610	Geonosis High School	\N	\N	Diy humblebrag marfa twee austin kickstarter salvia try-hard.Aesthetic dreamcatcher ethical.Vegan tattooed 3 wolf moon pour-over pabst humblebrag.	Aesthetic direct trade biodiesel williamsburg jean shorts health organic scenester.Pour-over salvia leggings retro gentrify drinking art party.Direct trade listicle blog meh venmo mustache godard waistcoat.	2671	3-4	giants	amara_schulist@olson.name	\N	\N	2017-12-09 21:06:20.645625	2017-12-09 21:06:20.645625	\N	\N	\N
179264611	Hoth High School	\N	\N	Fingerstache cardigan schlitz.Lumbersexual sriracha squid kale chips drinking bicycle rights bitters park.Yuccie everyday kinfolk food truck hella fanny pack.	Marfa goth lumbersexual gastropub drinking 3 wolf moon.Pour-over paleo five dollar toast selfies occupy.Authentic yolo leggings blog xoxo meggings sustainable.	447	0-2	dolphins	declan.klein@macgyver.co	\N	\N	2017-12-09 21:06:21.154418	2017-12-09 21:06:21.154418	\N	\N	\N
179264612	Tatooine High School	\N	\N	Xoxo twee actually ethical lomo loko you probably haven't heard of them.Loko park celiac authentic tumblr.Cliche brooklyn hoodie.	Scenester raw denim sriracha food truck shabby chic try-hard iphone pbr&b.Meditation slow-carb blue bottle.Plaid hammock tote bag etsy intelligentsia hoodie.	621	5-5	black cats	jeffrey.krajcik@ornrempel.com	\N	\N	2017-12-09 21:06:21.654581	2017-12-09 21:06:21.654581	\N	\N	\N
179264613	Yavin High School	\N	\N	Lumbersexual sartorial kombucha bicycle rights brunch yolo kale chips cray.Post-ironic selvage 8-bit everyday.Taxidermy sriracha vinegar lo-fi twee marfa raw denim 3 wolf moon.	Marfa cred waistcoat.Whatever pbr&b godard lumbersexual selvage stumptown.Flannel forage mumblecore neutra direct trade blog pitchfork selvage.	2566	0-7	worshipers	moses@sawayn.biz	\N	\N	2017-12-09 21:06:22.152338	2017-12-09 21:06:22.152338	\N	\N	\N
179264614	Kamino High School	\N	\N	Knausgaard authentic shoreditch asymmetrical taxidermy.Tacos shabby chic tote bag letterpress chia viral fingerstache heirloom.Pickled tofu paleo.	Locavore you probably haven't heard of them gastropub cliche gentrify fixie brunch scenester.Diy flannel loko disrupt tofu selfies kickstarter.Mlkshk venmo literally park cornhole skateboard occupy.	469	0-7	horses	maude.klein@friesenmante.com	\N	\N	2017-12-09 21:06:22.648381	2017-12-09 21:06:22.648381	\N	\N	\N
179264615	Hosnian Prime High School	\N	\N	Vhs you probably haven't heard of them mixtape tattooed actually seitan.Banjo venmo blue bottle aesthetic.Meditation keytar seitan blue bottle +1 fanny pack.	Truffaut 3 wolf moon diy.Kickstarter fanny pack neutra umami literally polaroid intelligentsia.Food truck pop-up authentic trust fund occupy pork belly literally franzen.	312	1-3	warlocks	elvis@towne.name	\N	\N	2017-12-09 21:06:23.155218	2017-12-09 21:06:23.155218	\N	\N	\N
179264616	Utapau High School	\N	\N	Post-ironic kinfolk vinegar wes anderson scenester put a bird on it salvia.+1 ramps schlitz organic migas.Muggle magic selfies waistcoat salvia leggings street roof tattooed.	Sriracha +1 franzen pitchfork swag brunch tofu.Polaroid irony waistcoat cliche echo chartreuse williamsburg goth.Swag roof cronut.	3451	3-7	giants	jaquelin_davis@block.com	\N	\N	2017-12-09 21:06:23.656964	2017-12-09 21:06:23.656964	\N	\N	\N
179264617	Hoth High School	\N	\N	Locavore loko 8-bit swag carry etsy.Ramps occupy artisan kale chips.Lo-fi echo five dollar toast.	Migas salvia meditation williamsburg flexitarian.Keytar drinking art party trust fund raw denim.3 wolf moon slow-carb hoodie freegan vhs viral muggle magic.	3794	2-3	dwarves	nelda@connelly.net	\N	\N	2017-12-09 21:06:24.168258	2017-12-09 21:06:24.168258	\N	\N	\N
179264618	Takodana High School	\N	\N	Sustainable irony authentic waistcoat.Messenger bag beard chicharrones authentic flexitarian distillery.Portland pop-up small batch hammock echo squid literally.	Phlogiston celiac craft beer pinterest.Shabby chic bicycle rights flannel cred yolo.Cold-pressed quinoa +1.	4436	4-5	cats	kenya_crist@purdyleuschke.com	\N	\N	2017-12-09 21:06:24.677077	2017-12-09 21:06:24.677077	\N	\N	\N
179264619	Coruscant High School	\N	\N	Yr vinegar whatever pabst heirloom cronut kombucha.Church-key sartorial chartreuse single-origin coffee before they sold out sustainable seitan salvia.Drinking swag bushwick.	Bushwick seitan flannel green juice lomo.3 wolf moon meditation hashtag carry phlogiston fingerstache messenger bag.Chia aesthetic williamsburg.	1632	5-3	chickens	grady.walsh@jacobson.org	\N	\N	2017-12-09 21:06:25.187827	2017-12-09 21:06:25.187827	\N	\N	\N
179264620	Geonosis High School	\N	\N	Next level offal tilde tacos pork belly cliche 8-bit normcore.Tacos cornhole trust fund thundercats roof sartorial master kombucha.Williamsburg typewriter chambray hashtag listicle sriracha kitsch.	Pug diy pop-up bicycle rights.Aesthetic microdosing farm-to-table bespoke ennui kinfolk next level.Microdosing tousled truffaut cornhole mustache gluten-free.	412	1-2	fishes	ismael@mcdermott.com	\N	\N	2017-12-09 21:06:25.694071	2017-12-09 21:06:25.694071	\N	\N	\N
179264621	Tatooine High School	\N	\N	8-bit heirloom pickled keffiyeh yolo tilde.Artisan vinyl gastropub.Xoxo art party chambray waistcoat semiotics migas locavore.	Tilde xoxo cleanse kombucha authentic bicycle rights direct trade.Jean shorts forage fixie direct trade banh mi actually.Godard craft beer +1 hella ugh.	3737	4-6	horses	orion.graham@yundtmaggio.co	\N	\N	2017-12-09 21:06:26.192658	2017-12-09 21:06:26.192658	\N	\N	\N
179264622	Naboo High School	\N	\N	Bushwick gluten-free mumblecore park wes anderson church-key stumptown cold-pressed.Pug butcher meditation.Kogi kitsch williamsburg sriracha kinfolk helvetica ennui messenger bag.	Flexitarian pop-up cold-pressed.Cardigan austin paleo.Truffaut 90's tofu keytar.	1643	5-5	werewolves	price@schambergerlabadie.com	\N	\N	2017-12-09 21:06:26.690332	2017-12-09 21:06:26.690332	\N	\N	\N
179264623	Kashyyyk High School	\N	\N	Brooklyn mixtape tofu sustainable.Schlitz diy tofu aesthetic pickled cred blue bottle.Photo booth fanny pack sustainable pug kombucha williamsburg synth carry.	Blog forage chambray.Art party xoxo pitchfork butcher street gluten-free leggings.Cold-pressed narwhal kinfolk scenester deep v flannel austin kitsch.	2617	0-0	ghosts	roberto@hodkiewicz.net	\N	\N	2017-12-09 21:06:27.191459	2017-12-09 21:06:27.191459	\N	\N	\N
179264624	Tatooine High School	\N	\N	Chambray drinking narwhal.Seitan asymmetrical gluten-free kickstarter umami ugh cronut swag.Schlitz cleanse hella wes anderson try-hard scenester narwhal microdosing.	Hashtag microdosing food truck shoreditch poutine.Butcher lumbersexual kickstarter banh mi lo-fi flexitarian williamsburg carry.Viral food truck cornhole irony narwhal.	4791	1-6	chimeras	erwin_toy@bauch.com	\N	\N	2017-12-09 21:06:27.693833	2017-12-09 21:06:27.693833	\N	\N	\N
179264625	DQar High School	\N	\N	Cornhole asymmetrical aesthetic phlogiston mlkshk xoxo pitchfork.Tofu green juice bicycle rights biodiesel.Etsy fashion axe pork belly humblebrag.	Dreamcatcher pinterest hashtag echo marfa viral typewriter retro.Irony kitsch artisan locavore cray distillery.Bushwick kitsch polaroid shoreditch flexitarian ugh fashion axe.	595	2-1	pigs	cheyenne_torphy@lindgrenheathcote.info	\N	\N	2017-12-09 21:06:28.204157	2017-12-09 21:06:28.204157	\N	\N	\N
179264626	Sullust High School	\N	\N	Street pug everyday.Health vinyl craft beer tofu goth green juice occupy.Tacos gluten-free letterpress distillery schlitz.	Polaroid cliche freegan.Thundercats organic seitan.Tacos you probably haven't heard of them authentic tumblr.	1036	3-3	gnomes	archibald.miller@mayert.info	\N	\N	2017-12-09 21:06:28.691613	2017-12-09 21:06:28.691613	\N	\N	\N
\.


--
-- Name: high_schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('high_schools_id_seq', 179264626, true);


--
-- Data for Name: highlights; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY highlights (id, title, description, raw_url, thumbnail_url, tagged_positions, highlightable_type, highlightable_id, created_at, updated_at, cached_votes_total, cached_votes_score, cached_votes_up, cached_votes_down, cached_weighted_score, cached_weighted_total, cached_weighted_average) FROM stdin;
569836226	Completely Awesome Video	Probably the best football video ever	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{}	Athlete	3900196	2017-12-09 19:45:43.001919	2017-12-09 19:45:43.001919	0	0	0	0	0	0	0
569836627	Virginia goblins	Art party hashtag mumblecore poutine. Kickstarter blue bottle echo waistcoat pour-over williamsburg 90's. Chillwave retro loko readymade bicycle rights crucifix master.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{WR,NT}	Athlete	3900437	2017-12-09 21:06:19.364355	2017-12-09 21:06:19.364355	0	0	0	0	0	0	0
569836628	Indiana prophets	Small batch lumbersexual forage bespoke aesthetic crucifix. Tofu cliche forage. Poutine cold-pressed gluten-free craft beer artisan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{OLB,DT}	Athlete	3900438	2017-12-09 21:06:19.484321	2017-12-09 21:06:19.484321	0	0	0	0	0	0	0
569836629	Texas ghosts	Bespoke vegan gluten-free keytar 8-bit fixie. Seitan brunch celiac. Scenester disrupt pinterest.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DE,KR}	Athlete	3900439	2017-12-09 21:06:19.566535	2017-12-09 21:06:19.566535	0	0	0	0	0	0	0
569836630	Tennessee tigers	Thundercats hammock beard knausgaard squid single-origin coffee tote bag trust fund. Normcore tumblr hoodie. Keytar quinoa vinegar portland mumblecore church-key.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FB,ILB}	HighSchool	179264607	2017-12-09 21:06:19.64467	2017-12-09 21:06:19.64467	0	0	0	0	0	0	0
569836631	Washington monkeys	Helvetica williamsburg everyday polaroid. Art party hashtag locavore kombucha fixie vhs asymmetrical fanny pack. Chartreuse literally semiotics.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,LT}	Athlete	3900440	2017-12-09 21:06:19.894322	2017-12-09 21:06:19.894322	0	0	0	0	0	0	0
569836632	Nebraska fishes	Messenger bag deep v ennui blue bottle. Brunch organic kogi cray. Irony austin flannel semiotics kinfolk gastropub church-key knausgaard.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DE,G}	Athlete	3900441	2017-12-09 21:06:19.977214	2017-12-09 21:06:19.977214	0	0	0	0	0	0	0
569836633	Illinois vampires	Roof yolo intelligentsia artisan raw denim fashion axe church-key. Single-origin coffee whatever fashion axe yolo pabst waistcoat wes anderson gastropub. Narwhal direct trade mlkshk letterpress photo booth gentrify.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RB,K}	Athlete	3900442	2017-12-09 21:06:20.064919	2017-12-09 21:06:20.064919	0	0	0	0	0	0	0
569836634	Massachusetts buffalo	Farm-to-table cliche cray. Quinoa gentrify sriracha whatever chartreuse tacos. Wolf wes anderson 8-bit.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RB,C}	HighSchool	179264608	2017-12-09 21:06:20.144804	2017-12-09 21:06:20.144804	0	0	0	0	0	0	0
569836635	Ohio enchanters	Yuccie polaroid keytar disrupt. Austin knausgaard occupy pork belly. Bespoke gastropub yolo flannel.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RT,K}	Athlete	3900443	2017-12-09 21:06:20.396729	2017-12-09 21:06:20.396729	0	0	0	0	0	0	0
569836636	Georgia witches	Hella muggle magic jean shorts. Authentic quinoa knausgaard neutra ramps kickstarter. Street tofu keffiyeh.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LG,FB}	Athlete	3900444	2017-12-09 21:06:20.479126	2017-12-09 21:06:20.479126	0	0	0	0	0	0	0
569836637	Wisconsin geese	Kombucha goth cornhole pabst swag small batch tofu. Williamsburg next level dreamcatcher jean shorts cray sriracha selvage microdosing. Mixtape xoxo pinterest quinoa fingerstache aesthetic ugh tote bag.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{G,TE}	Athlete	3900445	2017-12-09 21:06:20.560902	2017-12-09 21:06:20.560902	0	0	0	0	0	0	0
569836638	Alaska fishes	Street mumblecore ennui brooklyn try-hard hashtag. Normcore wayfarers vinyl neutra lumbersexual food truck vhs. Deep v kickstarter sriracha.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DT,FS}	HighSchool	179264609	2017-12-09 21:06:20.640847	2017-12-09 21:06:20.640847	0	0	0	0	0	0	0
569836639	California warlocks	Bitters chicharrones hashtag cold-pressed tacos pickled shabby chic. Street shoreditch ramps bushwick. Wayfarers sustainable flexitarian.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RG,ILB}	Athlete	3900446	2017-12-09 21:06:20.893747	2017-12-09 21:06:20.893747	0	0	0	0	0	0	0
569836640	New York spiders	Kickstarter vhs echo muggle magic asymmetrical chia selvage. Muggle magic hoodie flexitarian single-origin coffee. Pug celiac bushwick.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,ILB}	Athlete	3900447	2017-12-09 21:06:20.983793	2017-12-09 21:06:20.983793	0	0	0	0	0	0	0
569836641	Georgia owls	Williamsburg letterpress craft beer shoreditch. Gentrify sartorial wolf chambray pour-over authentic. Cardigan pour-over mixtape tilde narwhal organic blue bottle sustainable.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{PR,SS}	Athlete	3900448	2017-12-09 21:06:21.068212	2017-12-09 21:06:21.068212	0	0	0	0	0	0	0
569836642	Alabama griffins	Next level gluten-free portland crucifix ennui. Scenester art party muggle magic put a bird on it. Skateboard wolf intelligentsia heirloom mumblecore bushwick.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RT,P}	HighSchool	179264610	2017-12-09 21:06:21.149324	2017-12-09 21:06:21.149324	0	0	0	0	0	0	0
569836643	Kentucky frogs	Gastropub church-key selvage sustainable forage fingerstache. Loko brunch try-hard locavore distillery vice gastropub williamsburg. Street marfa phlogiston goth.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{SS,T}	Athlete	3900449	2017-12-09 21:06:21.405074	2017-12-09 21:06:21.405074	0	0	0	0	0	0	0
569836644	Wyoming geese	Wolf hammock cleanse organic. Craft beer gentrify pabst readymade lumbersexual. Actually five dollar toast art party hoodie chicharrones try-hard seitan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{NT,QB}	Athlete	3900450	2017-12-09 21:06:21.487834	2017-12-09 21:06:21.487834	0	0	0	0	0	0	0
569836645	New Mexico horses	Vinyl stumptown skateboard intelligentsia fanny pack 90's. Neutra offal bushwick literally knausgaard. Goth umami synth green juice art party fixie.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{WR,NT}	Athlete	3900451	2017-12-09 21:06:21.571847	2017-12-09 21:06:21.571847	0	0	0	0	0	0	0
569836646	Idaho lions	Forage tattooed shabby chic disrupt brooklyn actually put a bird on it hoodie. Tacos crucifix pickled. Ramps umami twee.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{NT,TE}	HighSchool	179264611	2017-12-09 21:06:21.650051	2017-12-09 21:06:21.650051	0	0	0	0	0	0	0
569836647	South Carolina gnomes	Chambray hashtag skateboard butcher meh sustainable yolo vhs. Ethical keytar migas cold-pressed meditation. Next level etsy selvage trust fund biodiesel dreamcatcher park.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,OLB}	Athlete	3900452	2017-12-09 21:06:21.900131	2017-12-09 21:06:21.900131	0	0	0	0	0	0	0
569836648	New Jersey prophets	Selfies keffiyeh viral. Actually neutra bushwick pork belly whatever vegan messenger bag selfies. Pug typewriter pitchfork gastropub.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{SS,QB}	Athlete	3900453	2017-12-09 21:06:21.984872	2017-12-09 21:06:21.984872	0	0	0	0	0	0	0
569836649	California werewolves	Vegan tacos artisan. Vegan chia pitchfork. Lo-fi farm-to-table actually.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RB,C}	Athlete	3900454	2017-12-09 21:06:22.068333	2017-12-09 21:06:22.068333	0	0	0	0	0	0	0
569836650	New Jersey foxes	Goth actually austin biodiesel banjo blog. Twee deep v skateboard scenester carry. Plaid thundercats polaroid hashtag banjo twee.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,LT}	HighSchool	179264612	2017-12-09 21:06:22.147545	2017-12-09 21:06:22.147545	0	0	0	0	0	0	0
569836651	Kentucky owls	Skateboard banjo fanny pack. Semiotics butcher fanny pack marfa. Irony mlkshk park viral blue bottle yuccie chicharrones kogi.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,SS}	Athlete	3900455	2017-12-09 21:06:22.398455	2017-12-09 21:06:22.398455	0	0	0	0	0	0	0
569836652	South Carolina druids	Plaid viral tattooed. Yolo organic lo-fi franzen cardigan. Disrupt pbr&b small batch chambray photo booth echo hashtag mixtape.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{OLB,K}	Athlete	3900456	2017-12-09 21:06:22.480627	2017-12-09 21:06:22.480627	0	0	0	0	0	0	0
569836653	Louisiana monkeys	Trust fund gluten-free blue bottle scenester flannel chicharrones austin quinoa. Chicharrones venmo yr. Pug readymade sartorial cardigan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FB,LG}	Athlete	3900457	2017-12-09 21:06:22.563703	2017-12-09 21:06:22.563703	0	0	0	0	0	0	0
569836654	Georgia foxes	Migas semiotics blog actually wayfarers. Bushwick freegan vhs truffaut tousled drinking flexitarian. Park lomo kickstarter mlkshk cronut tofu chambray post-ironic.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{C,LT}	HighSchool	179264613	2017-12-09 21:06:22.643514	2017-12-09 21:06:22.643514	0	0	0	0	0	0	0
569836655	Maryland goats	Authentic yr ugh leggings shoreditch migas plaid. Poutine chia kinfolk banjo mixtape direct trade fanny pack. Ethical small batch paleo.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,PR}	Athlete	3900458	2017-12-09 21:06:22.897712	2017-12-09 21:06:22.897712	0	0	0	0	0	0	0
569836656	Maine druids	Quinoa pickled skateboard put a bird on it viral. Ugh kinfolk whatever pug leggings everyday vhs meh. Williamsburg ugh before they sold out goth wolf plaid.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,SS}	Athlete	3900459	2017-12-09 21:06:22.98675	2017-12-09 21:06:22.98675	0	0	0	0	0	0	0
569836657	Louisiana chimeras	Mlkshk hoodie vinyl. Single-origin coffee shoreditch tote bag bitters pork belly. Kitsch meggings xoxo pop-up ennui bicycle rights disrupt.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{OLB,WR}	Athlete	3900460	2017-12-09 21:06:23.069461	2017-12-09 21:06:23.069461	0	0	0	0	0	0	0
569836658	Louisiana buffalo	Kinfolk literally 3 wolf moon viral. Tote bag occupy quinoa thundercats hella. Carry sriracha vice tilde pinterest franzen williamsburg.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{P,WR}	HighSchool	179264614	2017-12-09 21:06:23.149673	2017-12-09 21:06:23.149673	0	0	0	0	0	0	0
569836659	Utah ducks	Kinfolk wolf williamsburg hella. Yolo direct trade phlogiston pug sriracha asymmetrical xoxo. Organic heirloom plaid pinterest +1 kickstarter chia.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DE,LT}	Athlete	3900461	2017-12-09 21:06:23.405026	2017-12-09 21:06:23.405026	0	0	0	0	0	0	0
569836660	New Mexico bears	Authentic beard pickled vegan chartreuse. Mumblecore ennui before they sold out schlitz drinking cronut gentrify bicycle rights. Poutine raw denim vhs church-key pug gluten-free drinking fingerstache.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{MLB,DE}	Athlete	3900462	2017-12-09 21:06:23.488809	2017-12-09 21:06:23.488809	0	0	0	0	0	0	0
569836661	Maine cattle	Cold-pressed listicle neutra keffiyeh crucifix viral. Messenger bag paleo yuccie try-hard. Portland taxidermy ethical wayfarers organic authentic actually.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LG,C}	Athlete	3900463	2017-12-09 21:06:23.572628	2017-12-09 21:06:23.572628	0	0	0	0	0	0	0
569836662	Maryland werewolves	Butcher yuccie master portland banjo. Kinfolk try-hard vinyl ennui fixie. Kale chips polaroid diy cornhole put a bird on it poutine blue bottle small batch.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{P,CB}	HighSchool	179264615	2017-12-09 21:06:23.651348	2017-12-09 21:06:23.651348	0	0	0	0	0	0	0
569836663	Oklahoma spiders	Asymmetrical echo before they sold out. Neutra sartorial selfies. Direct trade salvia freegan stumptown.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{T,RB}	Athlete	3900464	2017-12-09 21:06:23.909196	2017-12-09 21:06:23.909196	0	0	0	0	0	0	0
569836664	West Virginia zebras	Xoxo twee 3 wolf moon. Kinfolk beard hashtag kombucha. Letterpress wes anderson pabst pickled schlitz franzen.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,SS}	Athlete	3900465	2017-12-09 21:06:23.998457	2017-12-09 21:06:23.998457	0	0	0	0	0	0	0
569836665	Arkansas ogres	Disrupt brunch readymade. Meditation scenester 8-bit. Keffiyeh kombucha gentrify schlitz chicharrones kogi freegan yr.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LT,TE}	Athlete	3900466	2017-12-09 21:06:24.082745	2017-12-09 21:06:24.082745	0	0	0	0	0	0	0
569836666	Washington owls	Church-key sartorial farm-to-table. Gastropub retro paleo goth 8-bit vice marfa pop-up. Pickled actually shabby chic blog drinking distillery blue bottle meditation.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FS,QB}	HighSchool	179264616	2017-12-09 21:06:24.16278	2017-12-09 21:06:24.16278	0	0	0	0	0	0	0
569836667	Montana people	Banh mi humblebrag vice flexitarian pug flannel meggings etsy. Craft beer yuccie chillwave seitan aesthetic selfies heirloom. Gluten-free banh mi ramps seitan keffiyeh cold-pressed vegan mustache.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{P,WR}	Athlete	3900467	2017-12-09 21:06:24.416014	2017-12-09 21:06:24.416014	0	0	0	0	0	0	0
569836668	Vermont nemesis	Leggings fanny pack yuccie tousled. Microdosing thundercats chicharrones. Meditation yuccie single-origin coffee humblebrag echo occupy health listicle.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RB,KR}	Athlete	3900468	2017-12-09 21:06:24.501981	2017-12-09 21:06:24.501981	0	0	0	0	0	0	0
569836669	Arkansas bats	Keytar meggings quinoa leggings banjo poutine tofu. Blog before they sold out squid food truck loko letterpress. Wayfarers meditation bicycle rights street butcher locavore pabst hashtag.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FB,LT}	Athlete	3900469	2017-12-09 21:06:24.589185	2017-12-09 21:06:24.589185	0	0	0	0	0	0	0
569836670	Pennsylvania black cats	Organic gluten-free five dollar toast flexitarian post-ironic. Food truck fanny pack xoxo lumbersexual deep v. Asymmetrical cardigan ennui master paleo meggings artisan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{MLB,PR}	HighSchool	179264617	2017-12-09 21:06:24.670928	2017-12-09 21:06:24.670928	0	0	0	0	0	0	0
569836671	Wyoming giants	Banjo fanny pack blog salvia pitchfork messenger bag mlkshk tacos. Hashtag shabby chic post-ironic fingerstache twee. Chillwave offal gluten-free fingerstache knausgaard venmo 90's echo.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{CB,G}	Athlete	3900470	2017-12-09 21:06:24.932362	2017-12-09 21:06:24.932362	0	0	0	0	0	0	0
569836672	Maine ghosts	Xoxo yolo viral tattooed kinfolk locavore. Literally fanny pack retro cronut photo booth 3 wolf moon etsy. Jean shorts shabby chic kickstarter taxidermy etsy.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RT,MLB}	Athlete	3900471	2017-12-09 21:06:25.019414	2017-12-09 21:06:25.019414	0	0	0	0	0	0	0
569836673	Florida spirits	Forage raw denim muggle magic everyday letterpress farm-to-table. Master taxidermy fanny pack banjo put a bird on it blog salvia chambray. Kickstarter letterpress retro humblebrag.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DT,DE}	Athlete	3900472	2017-12-09 21:06:25.102993	2017-12-09 21:06:25.102993	0	0	0	0	0	0	0
569836674	Kentucky wolves	Marfa biodiesel semiotics tousled 8-bit leggings. Umami chia actually poutine fashion axe five dollar toast. Humblebrag microdosing paleo quinoa.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RG,SS}	HighSchool	179264618	2017-12-09 21:06:25.182726	2017-12-09 21:06:25.182726	0	0	0	0	0	0	0
569836675	Minnesota cattle	Kombucha banh mi neutra. Authentic pinterest cred synth organic. Wolf quinoa muggle magic shoreditch.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{G,WR}	Athlete	3900473	2017-12-09 21:06:25.43679	2017-12-09 21:06:25.43679	0	0	0	0	0	0	0
569836676	Georgia prophets	Pbr&b echo put a bird on it. Twee kombucha sartorial kitsch park. Literally five dollar toast 90's diy.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FS,MLB}	Athlete	3900474	2017-12-09 21:06:25.521772	2017-12-09 21:06:25.521772	0	0	0	0	0	0	0
569836677	Indiana wolves	Heirloom master iphone franzen. Celiac migas wes anderson. Hammock selfies actually chia forage cliche.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{MLB,SS}	Athlete	3900475	2017-12-09 21:06:25.609527	2017-12-09 21:06:25.609527	0	0	0	0	0	0	0
569836678	Massachusetts pigs	Kitsch put a bird on it skateboard. Bitters hella ennui beard neutra crucifix meggings locavore. Food truck ramps waistcoat master cornhole shoreditch.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FS,SS}	HighSchool	179264619	2017-12-09 21:06:25.689011	2017-12-09 21:06:25.689011	0	0	0	0	0	0	0
569836679	Maryland sons	Etsy kinfolk occupy iphone wolf bicycle rights. Williamsburg listicle heirloom tousled thundercats post-ironic. Schlitz bushwick church-key lumbersexual chicharrones neutra salvia venmo.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{NT,RG}	Athlete	3900476	2017-12-09 21:06:25.942401	2017-12-09 21:06:25.942401	0	0	0	0	0	0	0
569836680	Colorado chickens	+1 actually phlogiston taxidermy tilde fanny pack forage. Forage park aesthetic. Art party phlogiston polaroid hoodie mumblecore wolf semiotics.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LG,TE}	Athlete	3900477	2017-12-09 21:06:26.02627	2017-12-09 21:06:26.02627	0	0	0	0	0	0	0
569836681	Connecticut goblins	Waistcoat semiotics kitsch cray kale chips keytar. Venmo organic kickstarter messenger bag asymmetrical tote bag ennui. Before they sold out tilde hashtag roof seitan health.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{TE,SS}	Athlete	3900478	2017-12-09 21:06:26.108599	2017-12-09 21:06:26.108599	0	0	0	0	0	0	0
569836682	Mississippi gooses	Diy vinegar drinking. Flannel meggings deep v gentrify. Master keffiyeh irony tumblr slow-carb.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,CB}	HighSchool	179264620	2017-12-09 21:06:26.187487	2017-12-09 21:06:26.187487	0	0	0	0	0	0	0
569836683	North Carolina frogs	Flannel 8-bit fixie meh pour-over. 3 wolf moon fanny pack phlogiston sartorial truffaut cred. Typewriter craft beer photo booth tofu literally.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{CB,RB}	Athlete	3900479	2017-12-09 21:06:26.439081	2017-12-09 21:06:26.439081	0	0	0	0	0	0	0
569836684	South Carolina buffalo	Tofu microdosing food truck thundercats fixie plaid cold-pressed fashion axe. Yolo banh mi jean shorts craft beer. Intelligentsia actually squid typewriter jean shorts.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LG,LT}	Athlete	3900480	2017-12-09 21:06:26.522652	2017-12-09 21:06:26.522652	0	0	0	0	0	0	0
569836685	Alabama ogres	Church-key sustainable trust fund deep v wolf carry pop-up. Gluten-free try-hard scenester retro. Vice farm-to-table meditation tote bag.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{OLB,MLB}	Athlete	3900481	2017-12-09 21:06:26.606684	2017-12-09 21:06:26.606684	0	0	0	0	0	0	0
569836686	Colorado ducks	Truffaut wolf farm-to-table actually cardigan +1. Cornhole roof keffiyeh hoodie slow-carb celiac salvia. Polaroid portland pitchfork bespoke taxidermy franzen.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{G,SS}	HighSchool	179264621	2017-12-09 21:06:26.685595	2017-12-09 21:06:26.685595	0	0	0	0	0	0	0
569836687	North Dakota people	Fashion axe migas blog food truck. Leggings sartorial xoxo. Mustache next level lomo.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,OLB}	Athlete	3900482	2017-12-09 21:06:26.936483	2017-12-09 21:06:26.936483	0	0	0	0	0	0	0
569836688	South Dakota cats	Park single-origin coffee you probably haven't heard of them green juice asymmetrical. Crucifix goth cardigan lomo diy. Occupy roof flexitarian brunch seitan yr.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{KR,RG}	Athlete	3900483	2017-12-09 21:06:27.025826	2017-12-09 21:06:27.025826	0	0	0	0	0	0	0
569836689	Maine cats	Pickled loko vegan pug tousled polaroid. Chartreuse banjo typewriter crucifix. Tacos roof ugh food truck narwhal kickstarter.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FB,CB}	Athlete	3900484	2017-12-09 21:06:27.108161	2017-12-09 21:06:27.108161	0	0	0	0	0	0	0
569836690	Mississippi giants	Mlkshk church-key mustache microdosing cray. Godard vinegar twee hoodie diy mumblecore poutine. Iphone phlogiston normcore leggings selvage squid kinfolk freegan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RB,NT}	HighSchool	179264622	2017-12-09 21:06:27.18669	2017-12-09 21:06:27.18669	0	0	0	0	0	0	0
569836691	Kentucky goats	Gastropub put a bird on it portland typewriter chambray. Narwhal tilde pabst kogi. Butcher skateboard church-key gluten-free tattooed.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LT,T}	Athlete	3900485	2017-12-09 21:06:27.437729	2017-12-09 21:06:27.437729	0	0	0	0	0	0	0
569836692	Montana dolphins	Polaroid swag locavore. Ramps cardigan mixtape tacos skateboard five dollar toast knausgaard letterpress. Offal pug kale chips disrupt letterpress xoxo tilde 90's.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RT,FB}	Athlete	3900486	2017-12-09 21:06:27.523014	2017-12-09 21:06:27.523014	0	0	0	0	0	0	0
569836693	California worshipers	Godard post-ironic franzen health heirloom wayfarers 90's letterpress. Fingerstache church-key everyday lomo sartorial listicle. Wes anderson banjo kombucha shoreditch chambray freegan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{G,KR}	Athlete	3900487	2017-12-09 21:06:27.608508	2017-12-09 21:06:27.608508	0	0	0	0	0	0	0
569836694	Rhode Island chickens	Typewriter thundercats truffaut direct trade umami 8-bit. Scenester kinfolk literally kitsch loko pinterest. Pop-up letterpress put a bird on it biodiesel literally actually.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{ILB,C}	HighSchool	179264623	2017-12-09 21:06:27.689034	2017-12-09 21:06:27.689034	0	0	0	0	0	0	0
569836695	Tennessee birds	Portland 8-bit 90's. Squid deep v before they sold out godard pitchfork phlogiston put a bird on it fashion axe. Try-hard skateboard butcher vinyl.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{TE,SS}	Athlete	3900488	2017-12-09 21:06:27.941832	2017-12-09 21:06:27.941832	0	0	0	0	0	0	0
569836696	Maine bears	Cliche put a bird on it gentrify taxidermy. Pbr&b cold-pressed drinking literally quinoa jean shorts freegan. Hashtag etsy tattooed.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RG,ILB}	Athlete	3900489	2017-12-09 21:06:28.03031	2017-12-09 21:06:28.03031	0	0	0	0	0	0	0
569836697	Ohio druids	Pork belly marfa cliche chicharrones scenester narwhal try-hard muggle magic. Single-origin coffee 3 wolf moon yr kogi tumblr ramps. Muggle magic gentrify chartreuse yr iphone health.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{NT,FB}	Athlete	3900490	2017-12-09 21:06:28.121498	2017-12-09 21:06:28.121498	0	0	0	0	0	0	0
569836698	New Hampshire geese	Gentrify locavore literally. Literally squid tote bag letterpress truffaut. Helvetica mlkshk roof ethical drinking seitan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{G,WR}	HighSchool	179264624	2017-12-09 21:06:28.19986	2017-12-09 21:06:28.19986	0	0	0	0	0	0	0
569836699	Maine black cats	Knausgaard tacos try-hard chartreuse fanny pack marfa. Drinking neutra mlkshk forage hella hashtag blue bottle hoodie. Yr neutra selfies seitan kombucha.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{T,P}	Athlete	3900491	2017-12-09 21:06:28.446159	2017-12-09 21:06:28.446159	0	0	0	0	0	0	0
569836700	Alabama gnomes	Meditation artisan kickstarter forage chillwave banjo franzen. Yr leggings ugh. Bespoke synth park fashion axe sartorial hashtag.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DT,C}	Athlete	3900492	2017-12-09 21:06:28.527173	2017-12-09 21:06:28.527173	0	0	0	0	0	0	0
569836701	Ohio frogs	Ugh portland small batch. Mixtape yr occupy narwhal. Sartorial vhs ennui locavore.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{CB,LG}	Athlete	3900493	2017-12-09 21:06:28.608713	2017-12-09 21:06:28.608713	0	0	0	0	0	0	0
569836702	New York ducks	Whatever skateboard artisan flexitarian. Lumbersexual bushwick bespoke master muggle magic 8-bit twee truffaut. Celiac retro shoreditch.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{K,T}	HighSchool	179264625	2017-12-09 21:06:28.687294	2017-12-09 21:06:28.687294	0	0	0	0	0	0	0
569836703	New Mexico zebras	Flexitarian quinoa meditation narwhal microdosing cronut plaid loko. Fingerstache cliche wes anderson food truck wayfarers asymmetrical humblebrag. Keffiyeh cardigan venmo chicharrones.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{P,DT}	Athlete	3900494	2017-12-09 21:06:28.940453	2017-12-09 21:06:28.940453	0	0	0	0	0	0	0
569836704	California lycanthropes	Paleo brunch ennui. Celiac park pour-over forage. Typewriter +1 meggings farm-to-table.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{WR,KR}	Athlete	3900495	2017-12-09 21:06:29.02632	2017-12-09 21:06:29.02632	0	0	0	0	0	0	0
569836705	Louisiana foxes	Five dollar toast microdosing neutra. Selvage selfies church-key squid gentrify pork belly pitchfork vhs. Flannel godard locavore pabst vhs migas.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FS,RT}	Athlete	3900496	2017-12-09 21:06:29.106688	2017-12-09 21:06:29.106688	0	0	0	0	0	0	0
569836706	Maine witches	Wes anderson celiac flannel mustache fanny pack vhs master. Synth locavore small batch selvage asymmetrical cornhole microdosing. Vice food truck waistcoat yolo fanny pack poutine five dollar toast.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{TE,RB}	HighSchool	179264626	2017-12-09 21:06:29.184011	2017-12-09 21:06:29.184011	0	0	0	0	0	0	0
569836707	Maine exorcists	Pbr&b five dollar toast whatever put a bird on it salvia. Hella heirloom yuccie blog meggings semiotics. Locavore roof keffiyeh.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{TE,K}	College	718964565	2017-12-09 21:06:29.467935	2017-12-09 21:06:29.467935	0	0	0	0	0	0	0
569836708	Kentucky prophets	Fashion axe church-key viral occupy post-ironic franzen pork belly iphone. Schlitz cray pork belly. Waistcoat loko knausgaard.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DT,MLB}	College	718964566	2017-12-09 21:06:29.710459	2017-12-09 21:06:29.710459	0	0	0	0	0	0	0
569836709	Pennsylvania worshipers	Salvia chillwave actually mixtape. Bushwick tattooed chartreuse kogi ennui fingerstache five dollar toast church-key. Pbr&b synth plaid xoxo deep v blog.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,WR}	College	718964567	2017-12-09 21:06:29.954755	2017-12-09 21:06:29.954755	0	0	0	0	0	0	0
569836710	West Virginia vampires	Yolo whatever dreamcatcher locavore meggings occupy quinoa. Twee portland thundercats listicle retro cronut kinfolk schlitz. Cred hashtag artisan pinterest cronut polaroid next level letterpress.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{PR,LG}	College	718964568	2017-12-09 21:06:30.202693	2017-12-09 21:06:30.202693	0	0	0	0	0	0	0
569836711	Massachusetts goblins	Godard church-key microdosing. Authentic venmo blue bottle dreamcatcher pbr&b. Sustainable diy street seitan offal muggle magic cardigan.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RT,ILB}	College	718964569	2017-12-09 21:06:30.450354	2017-12-09 21:06:30.450354	0	0	0	0	0	0	0
569836712	Mississippi crows	Squid ennui sartorial umami banh mi meditation pop-up. Phlogiston venmo irony. Dreamcatcher banjo wes anderson occupy.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{K,OLB}	College	718964570	2017-12-09 21:06:30.700793	2017-12-09 21:06:30.700793	0	0	0	0	0	0	0
569836713	North Dakota exorcists	Salvia fashion axe brooklyn shabby chic cred actually carry listicle. Chia selvage polaroid swag mixtape goth. Narwhal beard etsy selfies meditation.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{G,DT}	College	718964571	2017-12-09 21:06:30.94856	2017-12-09 21:06:30.94856	0	0	0	0	0	0	0
569836714	Tennessee goats	Ethical craft beer pour-over lomo trust fund poutine park. Distillery direct trade small batch chillwave health 90's offal. Typewriter normcore keytar yr locavore.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,WR}	College	718964572	2017-12-09 21:06:31.193992	2017-12-09 21:06:31.193992	0	0	0	0	0	0	0
569836715	New York conspirators	Mixtape heirloom twee quinoa next level helvetica. Austin kinfolk yr pbr&b meggings leggings. Tofu pug mlkshk wayfarers direct trade lo-fi 8-bit.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LT,DE}	College	718964573	2017-12-09 21:06:31.434408	2017-12-09 21:06:31.434408	0	0	0	0	0	0	0
569836716	Nevada werewolves	Austin vegan mixtape ugh fashion axe stumptown pbr&b pop-up. Tofu truffaut goth. Flannel wes anderson kinfolk franzen fixie typewriter lumbersexual five dollar toast.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LG,C}	College	718964574	2017-12-09 21:06:31.676616	2017-12-09 21:06:31.676616	0	0	0	0	0	0	0
569836717	Indiana conspirators	Kale chips vinyl small batch cronut kombucha crucifix. Deep v you probably haven't heard of them dreamcatcher single-origin coffee leggings truffaut polaroid letterpress. Messenger bag migas viral tote bag franzen gentrify.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,LT}	College	718964575	2017-12-09 21:06:31.922469	2017-12-09 21:06:31.922469	0	0	0	0	0	0	0
569836718	Nevada geese	Hashtag mlkshk schlitz 90's normcore quinoa. Actually master synth kale chips semiotics 8-bit tofu. Vhs disrupt cardigan vinyl godard master thundercats austin.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{RG,QB}	College	718964576	2017-12-09 21:06:32.167023	2017-12-09 21:06:32.167023	0	0	0	0	0	0	0
569836719	Alabama conspirators	Pabst goth chambray chia direct trade. Chillwave gluten-free sartorial kale chips. Diy vice pitchfork pop-up food truck.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{K,SS}	College	718964577	2017-12-09 21:06:32.416322	2017-12-09 21:06:32.416322	0	0	0	0	0	0	0
569836720	California black cats	Organic leggings seitan cray. Flexitarian kale chips bicycle rights actually cleanse kickstarter truffaut cred. Ennui food truck cleanse gluten-free meh williamsburg brunch occupy.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FB,RB}	College	718964578	2017-12-09 21:06:32.661328	2017-12-09 21:06:32.661328	0	0	0	0	0	0	0
569836721	Alaska foxes	Butcher wolf hoodie kale chips bitters truffaut put a bird on it. Knausgaard scenester fashion axe keffiyeh. Mustache selvage cliche narwhal blue bottle mumblecore tote bag.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{LG,RB}	College	718964579	2017-12-09 21:06:32.906717	2017-12-09 21:06:32.906717	0	0	0	0	0	0	0
569836722	California bats	Chillwave asymmetrical raw denim plaid slow-carb banjo aesthetic. Austin bespoke deep v cray cronut pug schlitz lo-fi. Asymmetrical listicle goth vinyl yuccie muggle magic raw denim.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{QB,SS}	College	718964580	2017-12-09 21:06:33.151037	2017-12-09 21:06:33.151037	0	0	0	0	0	0	0
569836723	Florida horses	90's trust fund pop-up lo-fi pickled hoodie knausgaard. 3 wolf moon yr poutine bushwick cred vegan. Pop-up vinegar 3 wolf moon you probably haven't heard of them.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{FS,OLB}	College	718964581	2017-12-09 21:06:33.394834	2017-12-09 21:06:33.394834	0	0	0	0	0	0	0
569836724	Washington gnomes	Lumbersexual ethical tousled venmo readymade pickled. Keytar dreamcatcher blue bottle pbr&b typewriter offal. Bicycle rights plaid tilde disrupt.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{T,RG}	College	718964582	2017-12-09 21:06:33.642575	2017-12-09 21:06:33.642575	0	0	0	0	0	0	0
569836725	North Carolina pigs	Etsy chia wes anderson. Brunch crucifix cliche cornhole. 3 wolf moon goth 8-bit put a bird on it craft beer.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{DT,QB}	College	718964583	2017-12-09 21:06:33.889202	2017-12-09 21:06:33.889202	0	0	0	0	0	0	0
569836726	Michigan fishes	Biodiesel goth pitchfork sustainable drinking. Stumptown scenester muggle magic portland poutine. Pickled kitsch kogi direct trade cold-pressed scenester food truck church-key.	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	{NT,RG}	College	718964584	2017-12-09 21:06:34.132913	2017-12-09 21:06:34.132913	0	0	0	0	0	0	0
\.


--
-- Name: highlights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('highlights_id_seq', 569836726, true);


--
-- Data for Name: inside_linebackers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY inside_linebackers (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2019	23	164	70	76	115	66	16	2017-12-09 21:07:05.738808	2017-12-09 21:07:05.738808
2	2018	16	141	61	84	171	195	59	2017-12-09 21:07:05.745662	2017-12-09 21:07:05.745662
3	2017	70	192	149	77	144	175	23	2017-12-09 21:07:05.752348	2017-12-09 21:07:05.752348
4	2016	46	57	172	70	96	186	1	2017-12-09 21:07:05.758651	2017-12-09 21:07:05.758651
5	2016	6	126	173	71	158	102	170	2017-12-09 21:07:05.798027	2017-12-09 21:07:05.798027
6	2015	178	115	171	134	66	10	9	2017-12-09 21:07:05.804659	2017-12-09 21:07:05.804659
7	2014	115	194	16	34	51	0	174	2017-12-09 21:07:05.811358	2017-12-09 21:07:05.811358
8	2013	89	43	196	10	78	117	161	2017-12-09 21:07:05.817737	2017-12-09 21:07:05.817737
9	2016	5	191	120	156	103	128	189	2017-12-09 21:07:07.13767	2017-12-09 21:07:07.13767
10	2015	125	186	97	111	120	113	65	2017-12-09 21:07:07.144281	2017-12-09 21:07:07.144281
11	2014	65	79	3	69	65	55	147	2017-12-09 21:07:07.150851	2017-12-09 21:07:07.150851
12	2013	159	50	182	100	99	73	182	2017-12-09 21:07:07.157399	2017-12-09 21:07:07.157399
13	2016	17	175	59	1	57	25	62	2017-12-09 21:07:12.894739	2017-12-09 21:07:12.894739
14	2015	64	12	1	41	1	98	79	2017-12-09 21:07:12.901249	2017-12-09 21:07:12.901249
15	2014	40	149	183	41	75	42	54	2017-12-09 21:07:12.908095	2017-12-09 21:07:12.908095
16	2013	186	99	127	55	136	113	33	2017-12-09 21:07:12.914893	2017-12-09 21:07:12.914893
17	2016	69	157	188	56	64	55	94	2017-12-09 21:07:14.915684	2017-12-09 21:07:14.915684
18	2015	93	117	2	190	187	170	88	2017-12-09 21:07:14.922352	2017-12-09 21:07:14.922352
19	2014	97	93	103	38	133	158	114	2017-12-09 21:07:14.928746	2017-12-09 21:07:14.928746
20	2013	58	145	77	125	101	108	3	2017-12-09 21:07:14.935335	2017-12-09 21:07:14.935335
21	2018	126	51	36	126	179	108	73	2017-12-09 21:07:15.228782	2017-12-09 21:07:15.228782
22	2017	187	49	157	133	185	53	51	2017-12-09 21:07:15.235377	2017-12-09 21:07:15.235377
23	2016	102	62	179	108	65	3	165	2017-12-09 21:07:15.241952	2017-12-09 21:07:15.241952
24	2015	65	34	96	195	178	178	84	2017-12-09 21:07:15.248487	2017-12-09 21:07:15.248487
25	2018	79	97	81	182	171	174	176	2017-12-09 21:07:15.861263	2017-12-09 21:07:15.861263
26	2017	46	67	24	71	114	59	60	2017-12-09 21:07:15.870138	2017-12-09 21:07:15.870138
27	2016	184	15	173	16	98	115	43	2017-12-09 21:07:15.876686	2017-12-09 21:07:15.876686
28	2015	163	164	125	117	144	194	122	2017-12-09 21:07:15.883151	2017-12-09 21:07:15.883151
29	2016	132	164	192	185	106	20	7	2017-12-09 21:07:16.176456	2017-12-09 21:07:16.176456
30	2015	96	63	103	68	153	27	168	2017-12-09 21:07:16.18303	2017-12-09 21:07:16.18303
31	2014	188	177	182	93	83	113	190	2017-12-09 21:07:16.189684	2017-12-09 21:07:16.189684
32	2013	51	135	137	145	131	167	186	2017-12-09 21:07:16.196097	2017-12-09 21:07:16.196097
33	2016	18	147	146	60	107	35	156	2017-12-09 21:07:16.2368	2017-12-09 21:07:16.2368
34	2015	158	64	157	29	187	98	1	2017-12-09 21:07:16.24343	2017-12-09 21:07:16.24343
35	2014	137	176	5	181	7	171	102	2017-12-09 21:07:16.2499	2017-12-09 21:07:16.2499
36	2013	184	67	66	103	70	78	122	2017-12-09 21:07:16.256918	2017-12-09 21:07:16.256918
\.


--
-- Name: inside_linebackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('inside_linebackers_id_seq', 36, true);


--
-- Data for Name: kick_returners; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY kick_returners (id, season, kick_return_yards, kick_return_touchdowns, created_at, updated_at) FROM stdin;
1	2018	111	6	2017-12-09 21:07:14.252832	2017-12-09 21:07:14.252832
2	2017	185	8	2017-12-09 21:07:14.259701	2017-12-09 21:07:14.259701
3	2016	153	2	2017-12-09 21:07:14.265915	2017-12-09 21:07:14.265915
4	2015	15	124	2017-12-09 21:07:14.272078	2017-12-09 21:07:14.272078
5	2017	12	61	2017-12-09 21:07:14.344707	2017-12-09 21:07:14.344707
6	2016	39	61	2017-12-09 21:07:14.350976	2017-12-09 21:07:14.350976
7	2015	27	154	2017-12-09 21:07:14.357281	2017-12-09 21:07:14.357281
8	2014	80	196	2017-12-09 21:07:14.363638	2017-12-09 21:07:14.363638
9	2018	52	131	2017-12-09 21:07:14.469474	2017-12-09 21:07:14.469474
10	2017	193	88	2017-12-09 21:07:14.475715	2017-12-09 21:07:14.475715
11	2016	112	101	2017-12-09 21:07:14.482002	2017-12-09 21:07:14.482002
12	2015	24	137	2017-12-09 21:07:14.488303	2017-12-09 21:07:14.488303
13	2016	46	145	2017-12-09 21:07:15.561049	2017-12-09 21:07:15.561049
14	2015	81	127	2017-12-09 21:07:15.567418	2017-12-09 21:07:15.567418
15	2014	76	142	2017-12-09 21:07:15.573664	2017-12-09 21:07:15.573664
16	2013	135	41	2017-12-09 21:07:15.579524	2017-12-09 21:07:15.579524
\.


--
-- Name: kick_returners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('kick_returners_id_seq', 16, true);


--
-- Data for Name: kickers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY kickers (id, season, kicks_attempted, kicks_made, longest_kick, touchbacks, yards_per_attempt, created_at, updated_at) FROM stdin;
1	2019	121	169	55	118	131	2017-12-09 21:07:06.516314	2017-12-09 21:07:06.516314
2	2018	158	84	113	70	144	2017-12-09 21:07:06.542059	2017-12-09 21:07:06.542059
3	2017	80	57	11	13	41	2017-12-09 21:07:06.548244	2017-12-09 21:07:06.548244
4	2016	94	159	174	126	197	2017-12-09 21:07:06.554447	2017-12-09 21:07:06.554447
5	2019	153	177	31	97	112	2017-12-09 21:07:13.344272	2017-12-09 21:07:13.344272
6	2018	93	12	42	184	125	2017-12-09 21:07:13.350982	2017-12-09 21:07:13.350982
7	2017	29	92	190	82	44	2017-12-09 21:07:13.357398	2017-12-09 21:07:13.357398
8	2016	13	122	142	6	59	2017-12-09 21:07:13.363862	2017-12-09 21:07:13.363862
9	2016	36	171	169	85	91	2017-12-09 21:07:13.929991	2017-12-09 21:07:13.929991
10	2015	164	72	111	133	157	2017-12-09 21:07:13.936706	2017-12-09 21:07:13.936706
11	2014	95	113	111	114	55	2017-12-09 21:07:13.943278	2017-12-09 21:07:13.943278
12	2013	69	199	135	67	185	2017-12-09 21:07:13.950275	2017-12-09 21:07:13.950275
13	2018	52	5	126	88	41	2017-12-09 21:07:14.526495	2017-12-09 21:07:14.526495
14	2017	52	132	86	61	50	2017-12-09 21:07:14.53295	2017-12-09 21:07:14.53295
15	2016	38	182	13	72	93	2017-12-09 21:07:14.53955	2017-12-09 21:07:14.53955
16	2015	113	86	128	2	170	2017-12-09 21:07:14.546399	2017-12-09 21:07:14.546399
17	2019	149	26	45	142	18	2017-12-09 21:07:14.696485	2017-12-09 21:07:14.696485
18	2018	94	169	157	56	76	2017-12-09 21:07:14.70274	2017-12-09 21:07:14.70274
19	2017	43	155	49	37	132	2017-12-09 21:07:14.708976	2017-12-09 21:07:14.708976
20	2016	184	69	89	24	179	2017-12-09 21:07:14.715107	2017-12-09 21:07:14.715107
21	2019	116	155	58	5	36	2017-12-09 21:07:15.650965	2017-12-09 21:07:15.650965
22	2018	172	170	133	97	121	2017-12-09 21:07:15.658424	2017-12-09 21:07:15.658424
23	2017	183	149	115	170	56	2017-12-09 21:07:15.66503	2017-12-09 21:07:15.66503
24	2016	119	39	15	152	25	2017-12-09 21:07:15.671397	2017-12-09 21:07:15.671397
\.


--
-- Name: kickers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('kickers_id_seq', 24, true);


--
-- Data for Name: left_guards; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY left_guards (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
1	2019	141	170	2017-12-09 21:07:05.332546	2017-12-09 21:07:05.332546
2	2018	160	196	2017-12-09 21:07:05.339421	2017-12-09 21:07:05.339421
3	2017	182	13	2017-12-09 21:07:05.345466	2017-12-09 21:07:05.345466
4	2016	103	16	2017-12-09 21:07:05.351258	2017-12-09 21:07:05.351258
5	2018	13	64	2017-12-09 21:07:06.129403	2017-12-09 21:07:06.129403
6	2017	122	56	2017-12-09 21:07:06.135468	2017-12-09 21:07:06.135468
7	2016	124	103	2017-12-09 21:07:06.141692	2017-12-09 21:07:06.141692
8	2015	153	67	2017-12-09 21:07:06.147707	2017-12-09 21:07:06.147707
9	2016	148	199	2017-12-09 21:07:06.791509	2017-12-09 21:07:06.791509
10	2015	185	184	2017-12-09 21:07:06.797768	2017-12-09 21:07:06.797768
11	2014	54	145	2017-12-09 21:07:06.804047	2017-12-09 21:07:06.804047
12	2013	159	130	2017-12-09 21:07:06.810193	2017-12-09 21:07:06.810193
13	2016	81	15	2017-12-09 21:07:06.90466	2017-12-09 21:07:06.90466
14	2015	63	96	2017-12-09 21:07:06.910887	2017-12-09 21:07:06.910887
15	2014	90	180	2017-12-09 21:07:06.917103	2017-12-09 21:07:06.917103
16	2013	124	179	2017-12-09 21:07:06.923332	2017-12-09 21:07:06.923332
17	2019	157	38	2017-12-09 21:07:06.993979	2017-12-09 21:07:06.993979
18	2018	46	160	2017-12-09 21:07:07.001076	2017-12-09 21:07:07.001076
19	2017	43	129	2017-12-09 21:07:07.007427	2017-12-09 21:07:07.007427
20	2016	173	24	2017-12-09 21:07:07.013765	2017-12-09 21:07:07.013765
21	2016	113	11	2017-12-09 21:07:07.530004	2017-12-09 21:07:07.530004
22	2015	96	136	2017-12-09 21:07:07.536564	2017-12-09 21:07:07.536564
23	2014	54	44	2017-12-09 21:07:07.543069	2017-12-09 21:07:07.543069
24	2013	174	72	2017-12-09 21:07:07.549417	2017-12-09 21:07:07.549417
25	2017	152	65	2017-12-09 21:07:12.747899	2017-12-09 21:07:12.747899
26	2016	183	100	2017-12-09 21:07:12.753969	2017-12-09 21:07:12.753969
27	2015	28	8	2017-12-09 21:07:12.759909	2017-12-09 21:07:12.759909
28	2014	85	28	2017-12-09 21:07:12.76623	2017-12-09 21:07:12.76623
29	2016	95	56	2017-12-09 21:07:12.98416	2017-12-09 21:07:12.98416
30	2015	25	86	2017-12-09 21:07:12.990535	2017-12-09 21:07:12.990535
31	2014	141	49	2017-12-09 21:07:12.996817	2017-12-09 21:07:12.996817
32	2013	65	96	2017-12-09 21:07:13.267363	2017-12-09 21:07:13.267363
33	2017	1	84	2017-12-09 21:07:15.772709	2017-12-09 21:07:15.772709
34	2016	101	39	2017-12-09 21:07:15.778584	2017-12-09 21:07:15.778584
35	2015	14	77	2017-12-09 21:07:15.784664	2017-12-09 21:07:15.784664
36	2014	18	10	2017-12-09 21:07:15.790472	2017-12-09 21:07:15.790472
\.


--
-- Name: left_guards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('left_guards_id_seq', 36, true);


--
-- Data for Name: left_tackles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY left_tackles (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
1	2017	35	32	2017-12-09 21:07:05.582452	2017-12-09 21:07:05.582452
2	2016	18	62	2017-12-09 21:07:05.589069	2017-12-09 21:07:05.589069
3	2015	9	170	2017-12-09 21:07:05.595149	2017-12-09 21:07:05.595149
4	2014	174	126	2017-12-09 21:07:05.600964	2017-12-09 21:07:05.600964
5	2019	86	192	2017-12-09 21:07:05.766858	2017-12-09 21:07:05.766858
6	2018	155	146	2017-12-09 21:07:05.772949	2017-12-09 21:07:05.772949
7	2017	145	62	2017-12-09 21:07:05.779042	2017-12-09 21:07:05.779042
8	2016	52	94	2017-12-09 21:07:05.785246	2017-12-09 21:07:05.785246
9	2016	177	151	2017-12-09 21:07:05.911606	2017-12-09 21:07:05.911606
10	2015	80	142	2017-12-09 21:07:05.918121	2017-12-09 21:07:05.918121
11	2014	156	183	2017-12-09 21:07:05.924381	2017-12-09 21:07:05.924381
12	2013	58	187	2017-12-09 21:07:05.930411	2017-12-09 21:07:05.930411
13	2017	183	164	2017-12-09 21:07:07.345073	2017-12-09 21:07:07.345073
14	2016	48	111	2017-12-09 21:07:07.351885	2017-12-09 21:07:07.351885
15	2015	136	167	2017-12-09 21:07:07.358562	2017-12-09 21:07:07.358562
16	2014	90	174	2017-12-09 21:07:07.383014	2017-12-09 21:07:07.383014
17	2016	146	154	2017-12-09 21:07:12.793302	2017-12-09 21:07:12.793302
18	2015	75	128	2017-12-09 21:07:12.799779	2017-12-09 21:07:12.799779
19	2014	12	106	2017-12-09 21:07:12.805969	2017-12-09 21:07:12.805969
20	2013	158	175	2017-12-09 21:07:12.811887	2017-12-09 21:07:12.811887
21	2018	168	46	2017-12-09 21:07:14.858416	2017-12-09 21:07:14.858416
22	2017	17	110	2017-12-09 21:07:14.864203	2017-12-09 21:07:14.864203
23	2016	102	74	2017-12-09 21:07:14.869945	2017-12-09 21:07:14.869945
24	2015	197	28	2017-12-09 21:07:14.875795	2017-12-09 21:07:14.875795
25	2018	92	63	2017-12-09 21:07:15.985198	2017-12-09 21:07:15.985198
26	2017	69	7	2017-12-09 21:07:15.991405	2017-12-09 21:07:15.991405
27	2016	136	87	2017-12-09 21:07:15.997462	2017-12-09 21:07:15.997462
28	2015	190	150	2017-12-09 21:07:16.00358	2017-12-09 21:07:16.00358
\.


--
-- Name: left_tackles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('left_tackles_id_seq', 28, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY messages (id, user_id, conversation_id, body, created_at, updated_at, display_name) FROM stdin;
1	809460748	1801	Hi.	2017-12-09 21:13:30.681864	2017-12-09 21:13:30.681864	\N
2	809460748	1801	good day	2017-12-09 21:16:17.770029	2017-12-09 21:16:17.770029	\N
6	912548448	1444	hi	2017-12-21 04:28:53.063185	2017-12-21 04:28:53.063185	\N
7	912548448	1444	how are u ?	2017-12-21 04:29:35.544963	2017-12-21 04:29:35.544963	\N
8	200726649	1444	how are u ?	2017-12-21 04:31:44.163617	2017-12-21 04:31:44.163617	\N
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('messages_id_seq', 8, true);


--
-- Data for Name: middle_linebackers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY middle_linebackers (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2018	192	59	50	20	125	111	173	2017-12-09 21:07:05.140939	2017-12-09 21:07:05.140939
2	2017	5	194	193	135	118	188	51	2017-12-09 21:07:05.148462	2017-12-09 21:07:05.148462
3	2016	18	43	24	20	119	92	63	2017-12-09 21:07:05.15503	2017-12-09 21:07:05.15503
4	2015	37	178	74	76	66	71	119	2017-12-09 21:07:05.161475	2017-12-09 21:07:05.161475
5	2016	93	113	173	199	57	5	67	2017-12-09 21:07:13.635501	2017-12-09 21:07:13.635501
6	2015	90	109	29	135	105	14	110	2017-12-09 21:07:13.641735	2017-12-09 21:07:13.641735
7	2014	94	43	123	173	88	159	102	2017-12-09 21:07:13.648066	2017-12-09 21:07:13.648066
8	2013	63	150	80	35	101	55	79	2017-12-09 21:07:13.826186	2017-12-09 21:07:13.826186
9	2019	163	177	156	8	124	4	162	2017-12-09 21:07:15.160964	2017-12-09 21:07:15.160964
10	2018	199	173	145	180	91	122	181	2017-12-09 21:07:15.167812	2017-12-09 21:07:15.167812
11	2017	104	100	169	178	114	128	189	2017-12-09 21:07:15.17614	2017-12-09 21:07:15.17614
12	2016	145	114	184	88	92	152	110	2017-12-09 21:07:15.183917	2017-12-09 21:07:15.183917
13	2019	124	185	29	85	119	107	85	2017-12-09 21:07:16.463867	2017-12-09 21:07:16.463867
14	2018	56	72	199	29	158	83	142	2017-12-09 21:07:16.470282	2017-12-09 21:07:16.470282
15	2017	82	110	119	194	121	34	38	2017-12-09 21:07:16.476592	2017-12-09 21:07:16.476592
16	2016	37	50	121	83	28	35	63	2017-12-09 21:07:16.482901	2017-12-09 21:07:16.482901
\.


--
-- Name: middle_linebackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('middle_linebackers_id_seq', 16, true);


--
-- Data for Name: nose_tackles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY nose_tackles (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2016	147	178	135	155	27	2	30	2017-12-09 21:07:05.477084	2017-12-09 21:07:05.477084
2	2015	14	14	20	185	78	28	85	2017-12-09 21:07:05.484406	2017-12-09 21:07:05.484406
3	2014	189	10	106	148	79	115	166	2017-12-09 21:07:05.490732	2017-12-09 21:07:05.490732
4	2013	27	16	134	67	68	99	7	2017-12-09 21:07:05.497378	2017-12-09 21:07:05.497378
5	2016	62	67	134	178	113	41	14	2017-12-09 21:07:05.995503	2017-12-09 21:07:05.995503
6	2015	184	150	106	188	139	178	1	2017-12-09 21:07:06.002204	2017-12-09 21:07:06.002204
7	2014	129	9	147	1	55	190	102	2017-12-09 21:07:06.008735	2017-12-09 21:07:06.008735
8	2013	13	113	150	153	39	113	164	2017-12-09 21:07:06.015106	2017-12-09 21:07:06.015106
9	2016	133	190	16	181	5	3	141	2017-12-09 21:07:13.277487	2017-12-09 21:07:13.277487
10	2015	145	50	86	22	7	161	17	2017-12-09 21:07:13.284425	2017-12-09 21:07:13.284425
11	2014	115	137	100	89	50	112	0	2017-12-09 21:07:13.291515	2017-12-09 21:07:13.291515
12	2013	160	153	26	190	27	41	40	2017-12-09 21:07:13.298693	2017-12-09 21:07:13.298693
13	2016	146	109	33	91	94	98	7	2017-12-09 21:07:13.835171	2017-12-09 21:07:13.835171
14	2015	197	116	29	43	193	181	9	2017-12-09 21:07:13.841551	2017-12-09 21:07:13.841551
15	2014	179	186	157	18	32	135	180	2017-12-09 21:07:13.847935	2017-12-09 21:07:13.847935
16	2013	93	9	189	193	15	93	175	2017-12-09 21:07:13.854456	2017-12-09 21:07:13.854456
17	2017	98	3	65	60	49	83	2	2017-12-09 21:07:14.435976	2017-12-09 21:07:14.435976
18	2016	9	145	150	113	22	154	71	2017-12-09 21:07:14.442619	2017-12-09 21:07:14.442619
19	2015	150	78	134	71	135	124	0	2017-12-09 21:07:14.449153	2017-12-09 21:07:14.449153
20	2014	193	157	160	138	167	61	38	2017-12-09 21:07:14.455823	2017-12-09 21:07:14.455823
21	2016	113	43	89	20	45	62	31	2017-12-09 21:07:14.944711	2017-12-09 21:07:14.944711
22	2015	66	161	59	56	1	40	173	2017-12-09 21:07:14.952375	2017-12-09 21:07:14.952375
23	2014	40	154	96	69	83	44	6	2017-12-09 21:07:14.960028	2017-12-09 21:07:14.960028
24	2013	125	74	191	70	166	169	169	2017-12-09 21:07:14.967183	2017-12-09 21:07:14.967183
25	2017	87	14	34	164	179	115	6	2017-12-09 21:07:15.308356	2017-12-09 21:07:15.308356
26	2016	89	50	86	119	131	31	36	2017-12-09 21:07:15.319878	2017-12-09 21:07:15.319878
27	2015	188	18	138	158	32	180	22	2017-12-09 21:07:15.327473	2017-12-09 21:07:15.327473
28	2014	149	61	143	168	93	196	49	2017-12-09 21:07:15.336736	2017-12-09 21:07:15.336736
29	2017	31	184	199	152	19	147	62	2017-12-09 21:07:16.367902	2017-12-09 21:07:16.367902
30	2016	50	130	157	107	46	83	176	2017-12-09 21:07:16.374366	2017-12-09 21:07:16.374366
31	2015	154	71	190	172	155	185	141	2017-12-09 21:07:16.382405	2017-12-09 21:07:16.382405
32	2014	78	198	136	92	62	79	55	2017-12-09 21:07:16.389118	2017-12-09 21:07:16.389118
\.


--
-- Name: nose_tackles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('nose_tackles_id_seq', 32, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY notifications (id, recipient_id, actor_id, read_at, completed, action, notifiable_id, notifiable_type, created_at, updated_at) FROM stdin;
1	912548503	809460748	\N	f	sent a	1	Message	2017-12-09 21:13:30.719212	2017-12-09 21:13:30.719212
2	912548504	809460748	\N	f	sent a	1	Message	2017-12-09 21:13:30.722565	2017-12-09 21:13:30.722565
3	912548505	809460748	\N	f	sent a	1	Message	2017-12-09 21:13:30.724595	2017-12-09 21:13:30.724595
4	912548503	809460748	\N	f	sent a	2	Message	2017-12-09 21:16:17.786004	2017-12-09 21:16:17.786004
5	912548504	809460748	\N	f	sent a	2	Message	2017-12-09 21:16:17.788611	2017-12-09 21:16:17.788611
6	912548505	809460748	\N	f	sent a	2	Message	2017-12-09 21:16:17.790867	2017-12-09 21:16:17.790867
9	912548448	200726649	\N	f	sent a	8	Message	2017-12-21 04:31:44.18455	2017-12-21 04:31:44.18455
7	200726649	912548448	2018-01-08 16:19:28.94941	f	sent a	6	Message	2017-12-21 04:28:53.121084	2017-12-21 04:28:53.121084
8	200726649	912548448	2018-01-08 16:19:28.94941	f	sent a	7	Message	2017-12-21 04:29:35.658392	2017-12-21 04:29:35.658392
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('notifications_id_seq', 9, true);


--
-- Data for Name: outside_linebackers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY outside_linebackers (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2016	149	141	53	69	183	35	36	2017-12-09 21:07:05.086074	2017-12-09 21:07:05.086074
2	2015	179	37	135	15	17	53	31	2017-12-09 21:07:05.093107	2017-12-09 21:07:05.093107
3	2014	6	87	62	152	22	80	64	2017-12-09 21:07:05.099362	2017-12-09 21:07:05.099362
4	2013	151	105	195	174	169	82	129	2017-12-09 21:07:05.105693	2017-12-09 21:07:05.105693
5	2017	102	23	57	74	129	21	44	2017-12-09 21:07:05.609548	2017-12-09 21:07:05.609548
6	2016	130	75	64	179	63	69	13	2017-12-09 21:07:05.616089	2017-12-09 21:07:05.616089
7	2015	162	57	70	33	66	134	68	2017-12-09 21:07:05.622632	2017-12-09 21:07:05.622632
8	2014	96	170	11	57	72	196	133	2017-12-09 21:07:05.628885	2017-12-09 21:07:05.628885
9	2016	52	69	126	126	53	81	28	2017-12-09 21:07:06.762869	2017-12-09 21:07:06.762869
10	2015	86	127	59	36	148	129	1	2017-12-09 21:07:06.769178	2017-12-09 21:07:06.769178
11	2014	157	190	78	100	173	190	31	2017-12-09 21:07:06.776029	2017-12-09 21:07:06.776029
12	2013	12	154	67	56	92	163	6	2017-12-09 21:07:06.782861	2017-12-09 21:07:06.782861
13	2019	155	126	121	185	172	163	146	2017-12-09 21:07:15.394114	2017-12-09 21:07:15.394114
14	2018	136	24	79	141	195	13	100	2017-12-09 21:07:15.401959	2017-12-09 21:07:15.401959
15	2017	42	28	196	170	94	146	191	2017-12-09 21:07:15.409425	2017-12-09 21:07:15.409425
16	2016	128	44	190	157	136	14	74	2017-12-09 21:07:15.416894	2017-12-09 21:07:15.416894
17	2016	88	46	84	183	63	100	157	2017-12-09 21:07:15.740489	2017-12-09 21:07:15.740489
18	2015	16	173	182	92	74	185	142	2017-12-09 21:07:15.747138	2017-12-09 21:07:15.747138
19	2014	57	179	25	180	107	141	48	2017-12-09 21:07:15.753697	2017-12-09 21:07:15.753697
20	2013	89	57	58	92	32	116	123	2017-12-09 21:07:15.760109	2017-12-09 21:07:15.760109
21	2019	55	173	179	198	189	160	191	2017-12-09 21:07:16.403581	2017-12-09 21:07:16.403581
22	2018	27	114	143	157	189	30	99	2017-12-09 21:07:16.410378	2017-12-09 21:07:16.410378
23	2017	155	63	176	2	160	58	174	2017-12-09 21:07:16.417211	2017-12-09 21:07:16.417211
24	2016	101	199	38	14	62	87	75	2017-12-09 21:07:16.424292	2017-12-09 21:07:16.424292
\.


--
-- Name: outside_linebackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('outside_linebackers_id_seq', 24, true);


--
-- Data for Name: phone_numbers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY phone_numbers (id, digits, owner_type, owner_id, info, created_at, updated_at) FROM stdin;
\.


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('phone_numbers_id_seq', 1, false);


--
-- Data for Name: punt_returners; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY punt_returners (id, season, punt_return_yards, punt_return_touchdowns, created_at, updated_at) FROM stdin;
1	2019	138	97	2017-12-09 21:07:05.378643	2017-12-09 21:07:05.378643
2	2018	75	48	2017-12-09 21:07:05.385452	2017-12-09 21:07:05.385452
3	2017	39	52	2017-12-09 21:07:05.391357	2017-12-09 21:07:05.391357
4	2016	55	80	2017-12-09 21:07:05.397541	2017-12-09 21:07:05.397541
5	2016	62	0	2017-12-09 21:07:06.264962	2017-12-09 21:07:06.264962
6	2015	198	101	2017-12-09 21:07:06.271041	2017-12-09 21:07:06.271041
7	2014	181	38	2017-12-09 21:07:06.276828	2017-12-09 21:07:06.276828
8	2013	190	146	2017-12-09 21:07:06.282858	2017-12-09 21:07:06.282858
9	2016	40	14	2017-12-09 21:07:07.255068	2017-12-09 21:07:07.255068
10	2015	143	83	2017-12-09 21:07:07.261301	2017-12-09 21:07:07.261301
11	2014	120	162	2017-12-09 21:07:07.267345	2017-12-09 21:07:07.267345
12	2013	101	72	2017-12-09 21:07:07.273454	2017-12-09 21:07:07.273454
13	2016	47	140	2017-12-09 21:07:14.051218	2017-12-09 21:07:14.051218
14	2015	59	73	2017-12-09 21:07:14.058235	2017-12-09 21:07:14.058235
15	2014	163	44	2017-12-09 21:07:14.064407	2017-12-09 21:07:14.064407
16	2013	136	165	2017-12-09 21:07:14.070588	2017-12-09 21:07:14.070588
17	2016	182	10	2017-12-09 21:07:14.741759	2017-12-09 21:07:14.741759
18	2015	68	80	2017-12-09 21:07:14.74813	2017-12-09 21:07:14.74813
19	2014	61	111	2017-12-09 21:07:14.754135	2017-12-09 21:07:14.754135
20	2013	176	164	2017-12-09 21:07:14.760284	2017-12-09 21:07:14.760284
21	2019	130	174	2017-12-09 21:07:15.130934	2017-12-09 21:07:15.130934
22	2018	25	107	2017-12-09 21:07:15.137482	2017-12-09 21:07:15.137482
23	2017	119	150	2017-12-09 21:07:15.143832	2017-12-09 21:07:15.143832
24	2016	134	183	2017-12-09 21:07:15.151023	2017-12-09 21:07:15.151023
25	2017	138	52	2017-12-09 21:07:15.798685	2017-12-09 21:07:15.798685
26	2016	70	82	2017-12-09 21:07:15.804525	2017-12-09 21:07:15.804525
27	2015	58	57	2017-12-09 21:07:15.812109	2017-12-09 21:07:15.812109
28	2014	108	194	2017-12-09 21:07:15.818171	2017-12-09 21:07:15.818171
\.


--
-- Name: punt_returners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('punt_returners_id_seq', 28, true);


--
-- Data for Name: punters; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY punters (id, season, punts, yards_per_attempt, longest_punt, created_at, updated_at) FROM stdin;
1	2019	1	199	51	2017-12-09 21:07:05.662749	2017-12-09 21:07:05.662749
2	2018	20	30	14	2017-12-09 21:07:05.669875	2017-12-09 21:07:05.669875
3	2017	17	177	40	2017-12-09 21:07:05.676232	2017-12-09 21:07:05.676232
4	2016	154	191	59	2017-12-09 21:07:05.707112	2017-12-09 21:07:05.707112
5	2019	119	72	35	2017-12-09 21:07:06.965252	2017-12-09 21:07:06.965252
6	2018	18	58	46	2017-12-09 21:07:06.971805	2017-12-09 21:07:06.971805
7	2017	30	147	75	2017-12-09 21:07:06.9784	2017-12-09 21:07:06.9784
8	2016	67	113	69	2017-12-09 21:07:06.984735	2017-12-09 21:07:06.984735
9	2016	109	108	76	2017-12-09 21:07:12.867366	2017-12-09 21:07:12.867366
10	2015	163	130	73	2017-12-09 21:07:12.873741	2017-12-09 21:07:12.873741
11	2014	84	56	24	2017-12-09 21:07:12.880015	2017-12-09 21:07:12.880015
12	2013	74	44	65	2017-12-09 21:07:12.886155	2017-12-09 21:07:12.886155
13	2016	78	72	164	2017-12-09 21:07:13.863116	2017-12-09 21:07:13.863116
14	2015	165	123	89	2017-12-09 21:07:13.869015	2017-12-09 21:07:13.869015
15	2014	30	182	40	2017-12-09 21:07:13.877623	2017-12-09 21:07:13.877623
16	2013	157	55	21	2017-12-09 21:07:13.884294	2017-12-09 21:07:13.884294
17	2016	3	37	2	2017-12-09 21:07:14.022366	2017-12-09 21:07:14.022366
18	2015	68	26	45	2017-12-09 21:07:14.028803	2017-12-09 21:07:14.028803
19	2014	92	99	53	2017-12-09 21:07:14.036013	2017-12-09 21:07:14.036013
20	2013	18	36	6	2017-12-09 21:07:14.042525	2017-12-09 21:07:14.042525
21	2017	110	108	145	2017-12-09 21:07:14.376882	2017-12-09 21:07:14.376882
22	2016	41	92	62	2017-12-09 21:07:14.383553	2017-12-09 21:07:14.383553
23	2015	104	108	168	2017-12-09 21:07:14.390007	2017-12-09 21:07:14.390007
24	2014	183	90	180	2017-12-09 21:07:14.396754	2017-12-09 21:07:14.396754
25	2018	22	22	16	2017-12-09 21:07:14.831526	2017-12-09 21:07:14.831526
26	2017	28	176	126	2017-12-09 21:07:14.837672	2017-12-09 21:07:14.837672
27	2016	197	66	129	2017-12-09 21:07:14.844008	2017-12-09 21:07:14.844008
28	2015	171	148	169	2017-12-09 21:07:14.850133	2017-12-09 21:07:14.850133
29	2016	166	35	120	2017-12-09 21:07:15.533235	2017-12-09 21:07:15.533235
30	2015	127	110	87	2017-12-09 21:07:15.539525	2017-12-09 21:07:15.539525
31	2014	127	169	154	2017-12-09 21:07:15.545643	2017-12-09 21:07:15.545643
32	2013	20	187	53	2017-12-09 21:07:15.551809	2017-12-09 21:07:15.551809
33	2016	112	123	190	2017-12-09 21:07:16.148083	2017-12-09 21:07:16.148083
34	2015	103	20	172	2017-12-09 21:07:16.15462	2017-12-09 21:07:16.15462
35	2014	33	169	93	2017-12-09 21:07:16.160935	2017-12-09 21:07:16.160935
36	2013	30	104	121	2017-12-09 21:07:16.167265	2017-12-09 21:07:16.167265
37	2017	12	165	7	2017-12-09 21:07:16.340527	2017-12-09 21:07:16.340527
38	2016	10	151	29	2017-12-09 21:07:16.346871	2017-12-09 21:07:16.346871
39	2015	85	116	136	2017-12-09 21:07:16.352928	2017-12-09 21:07:16.352928
40	2014	36	4	67	2017-12-09 21:07:16.359319	2017-12-09 21:07:16.359319
\.


--
-- Name: punters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('punters_id_seq', 40, true);


--
-- Data for Name: quarterbacks; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY quarterbacks (id, season, passing_yards, passing_touchdowns, rushing_yards, rushing_touchdowns, created_at, updated_at) FROM stdin;
801653172	2013	180	8	80	2	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
833410073	2014	180	8	80	2	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
111928452	2015	180	8	80	2	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
530756924	2016	180	8	80	2	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
833410074	2019	198	3	182	195	2017-12-09 21:07:05.286532	2017-12-09 21:07:05.286532
833410075	2018	195	44	10	116	2017-12-09 21:07:05.293183	2017-12-09 21:07:05.293183
833410076	2017	135	186	81	188	2017-12-09 21:07:05.299372	2017-12-09 21:07:05.299372
833410077	2016	151	95	49	118	2017-12-09 21:07:05.305457	2017-12-09 21:07:05.305457
833410078	2016	131	171	181	121	2017-12-09 21:07:06.376321	2017-12-09 21:07:06.376321
833410079	2015	147	62	30	58	2017-12-09 21:07:06.382637	2017-12-09 21:07:06.382637
833410080	2014	129	41	85	83	2017-12-09 21:07:06.388785	2017-12-09 21:07:06.388785
833410081	2013	29	8	111	46	2017-12-09 21:07:06.395157	2017-12-09 21:07:06.395157
833410082	2017	86	62	45	11	2017-12-09 21:07:06.643052	2017-12-09 21:07:06.643052
833410083	2016	194	194	58	164	2017-12-09 21:07:06.649339	2017-12-09 21:07:06.649339
833410084	2015	39	185	122	60	2017-12-09 21:07:06.655575	2017-12-09 21:07:06.655575
833410085	2014	188	187	88	144	2017-12-09 21:07:06.661649	2017-12-09 21:07:06.661649
833410086	2019	22	103	82	69	2017-12-09 21:07:06.937012	2017-12-09 21:07:06.937012
833410087	2018	173	173	190	114	2017-12-09 21:07:06.94338	2017-12-09 21:07:06.94338
833410088	2017	195	145	198	81	2017-12-09 21:07:06.950066	2017-12-09 21:07:06.950066
833410089	2016	54	44	22	70	2017-12-09 21:07:06.956705	2017-12-09 21:07:06.956705
833410090	2016	23	180	117	168	2017-12-09 21:07:07.166351	2017-12-09 21:07:07.166351
833410091	2015	126	183	31	82	2017-12-09 21:07:07.172918	2017-12-09 21:07:07.172918
833410092	2014	184	75	149	101	2017-12-09 21:07:07.17944	2017-12-09 21:07:07.17944
833410093	2013	196	19	50	171	2017-12-09 21:07:07.185884	2017-12-09 21:07:07.185884
833410094	2016	46	106	135	190	2017-12-09 21:07:07.282135	2017-12-09 21:07:07.282135
833410095	2015	32	37	154	111	2017-12-09 21:07:07.288457	2017-12-09 21:07:07.288457
833410096	2014	45	27	80	174	2017-12-09 21:07:07.294878	2017-12-09 21:07:07.294878
833410097	2013	194	48	118	49	2017-12-09 21:07:07.301251	2017-12-09 21:07:07.301251
833410098	2019	179	17	126	79	2017-12-09 21:07:13.406921	2017-12-09 21:07:13.406921
833410099	2018	156	122	80	118	2017-12-09 21:07:13.413737	2017-12-09 21:07:13.413737
833410100	2017	149	11	193	141	2017-12-09 21:07:13.420654	2017-12-09 21:07:13.420654
833410101	2016	182	102	108	13	2017-12-09 21:07:13.426921	2017-12-09 21:07:13.426921
833410102	2018	161	170	97	149	2017-12-09 21:07:13.554876	2017-12-09 21:07:13.554876
833410103	2017	132	131	72	172	2017-12-09 21:07:13.580521	2017-12-09 21:07:13.580521
833410104	2016	31	172	9	125	2017-12-09 21:07:13.587324	2017-12-09 21:07:13.587324
833410105	2015	24	192	101	136	2017-12-09 21:07:13.593391	2017-12-09 21:07:13.593391
833410106	2018	6	54	145	69	2017-12-09 21:07:14.497302	2017-12-09 21:07:14.497302
833410107	2017	134	9	197	181	2017-12-09 21:07:14.503927	2017-12-09 21:07:14.503927
833410108	2016	49	157	19	129	2017-12-09 21:07:14.510654	2017-12-09 21:07:14.510654
833410109	2015	122	97	143	69	2017-12-09 21:07:14.517294	2017-12-09 21:07:14.517294
833410110	2017	113	84	61	15	2017-12-09 21:07:15.023537	2017-12-09 21:07:15.023537
833410111	2016	48	108	51	143	2017-12-09 21:07:15.030129	2017-12-09 21:07:15.030129
833410112	2015	187	153	199	98	2017-12-09 21:07:15.0802	2017-12-09 21:07:15.0802
833410113	2014	142	0	32	21	2017-12-09 21:07:15.088581	2017-12-09 21:07:15.088581
833410114	2019	134	66	132	84	2017-12-09 21:07:15.622295	2017-12-09 21:07:15.622295
833410115	2018	83	24	21	113	2017-12-09 21:07:15.629657	2017-12-09 21:07:15.629657
833410116	2017	102	169	56	169	2017-12-09 21:07:15.636002	2017-12-09 21:07:15.636002
833410117	2016	109	147	52	74	2017-12-09 21:07:15.642341	2017-12-09 21:07:15.642341
833410118	2018	3	75	139	158	2017-12-09 21:07:15.921048	2017-12-09 21:07:15.921048
833410119	2017	128	21	35	185	2017-12-09 21:07:15.92835	2017-12-09 21:07:15.92835
833410120	2016	53	185	19	70	2017-12-09 21:07:15.935061	2017-12-09 21:07:15.935061
833410121	2015	39	10	43	157	2017-12-09 21:07:15.941731	2017-12-09 21:07:15.941731
833410122	2019	58	74	106	98	2017-12-09 21:07:16.073675	2017-12-09 21:07:16.073675
833410123	2018	25	36	150	193	2017-12-09 21:07:16.08009	2017-12-09 21:07:16.08009
833410124	2017	29	3	79	11	2017-12-09 21:07:16.086564	2017-12-09 21:07:16.086564
833410125	2016	108	98	192	76	2017-12-09 21:07:16.092632	2017-12-09 21:07:16.092632
\.


--
-- Name: quarterbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('quarterbacks_id_seq', 833410125, true);


--
-- Data for Name: references; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY "references" (id, athlete_id, relationship, name, contact_method, email, phone_number, created_at, updated_at) FROM stdin;
\.


--
-- Name: references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('references_id_seq', 1, false);


--
-- Data for Name: right_guards; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY right_guards (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
1	2016	97	81	2017-12-09 21:07:04.985927	2017-12-09 21:07:04.985927
2	2015	120	81	2017-12-09 21:07:04.994068	2017-12-09 21:07:04.994068
3	2014	138	47	2017-12-09 21:07:05.000163	2017-12-09 21:07:05.000163
4	2013	128	138	2017-12-09 21:07:05.006264	2017-12-09 21:07:05.006264
5	2018	137	194	2017-12-09 21:07:06.182763	2017-12-09 21:07:06.182763
6	2017	14	24	2017-12-09 21:07:06.188876	2017-12-09 21:07:06.188876
7	2016	15	36	2017-12-09 21:07:06.194818	2017-12-09 21:07:06.194818
8	2015	76	56	2017-12-09 21:07:06.200657	2017-12-09 21:07:06.200657
9	2019	129	88	2017-12-09 21:07:14.638225	2017-12-09 21:07:14.638225
10	2018	136	109	2017-12-09 21:07:14.644672	2017-12-09 21:07:14.644672
11	2017	114	42	2017-12-09 21:07:14.650748	2017-12-09 21:07:14.650748
12	2016	136	39	2017-12-09 21:07:14.656723	2017-12-09 21:07:14.656723
13	2016	165	66	2017-12-09 21:07:14.79933	2017-12-09 21:07:14.79933
14	2015	156	129	2017-12-09 21:07:14.80637	2017-12-09 21:07:14.80637
15	2014	34	58	2017-12-09 21:07:14.812946	2017-12-09 21:07:14.812946
16	2013	76	161	2017-12-09 21:07:14.819082	2017-12-09 21:07:14.819082
17	2016	103	86	2017-12-09 21:07:16.209583	2017-12-09 21:07:16.209583
18	2015	63	10	2017-12-09 21:07:16.215735	2017-12-09 21:07:16.215735
19	2014	22	129	2017-12-09 21:07:16.222105	2017-12-09 21:07:16.222105
20	2013	96	177	2017-12-09 21:07:16.228026	2017-12-09 21:07:16.228026
\.


--
-- Name: right_guards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('right_guards_id_seq', 20, true);


--
-- Data for Name: right_tackles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY right_tackles (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
1	2019	195	47	2017-12-09 21:07:07.047079	2017-12-09 21:07:07.047079
2	2018	61	69	2017-12-09 21:07:07.054284	2017-12-09 21:07:07.054284
3	2017	179	121	2017-12-09 21:07:07.060421	2017-12-09 21:07:07.060421
4	2016	39	170	2017-12-09 21:07:07.06666	2017-12-09 21:07:07.06666
5	2016	101	121	2017-12-09 21:07:07.481544	2017-12-09 21:07:07.481544
6	2015	16	194	2017-12-09 21:07:07.487919	2017-12-09 21:07:07.487919
7	2014	93	177	2017-12-09 21:07:07.494227	2017-12-09 21:07:07.494227
8	2013	180	44	2017-12-09 21:07:07.50051	2017-12-09 21:07:07.50051
9	2016	166	106	2017-12-09 21:07:12.956606	2017-12-09 21:07:12.956606
10	2015	140	95	2017-12-09 21:07:12.963011	2017-12-09 21:07:12.963011
11	2014	152	16	2017-12-09 21:07:12.969157	2017-12-09 21:07:12.969157
12	2013	123	190	2017-12-09 21:07:12.975609	2017-12-09 21:07:12.975609
13	2019	74	61	2017-12-09 21:07:13.372741	2017-12-09 21:07:13.372741
14	2018	23	175	2017-12-09 21:07:13.378957	2017-12-09 21:07:13.378957
15	2017	135	55	2017-12-09 21:07:13.385025	2017-12-09 21:07:13.385025
16	2016	177	28	2017-12-09 21:07:13.391281	2017-12-09 21:07:13.391281
17	2019	141	20	2017-12-09 21:07:14.084106	2017-12-09 21:07:14.084106
18	2018	125	86	2017-12-09 21:07:14.090537	2017-12-09 21:07:14.090537
19	2017	82	167	2017-12-09 21:07:14.096781	2017-12-09 21:07:14.096781
20	2016	33	5	2017-12-09 21:07:14.102889	2017-12-09 21:07:14.102889
21	2019	57	49	2017-12-09 21:07:14.669394	2017-12-09 21:07:14.669394
22	2018	35	181	2017-12-09 21:07:14.675535	2017-12-09 21:07:14.675535
23	2017	79	12	2017-12-09 21:07:14.68176	2017-12-09 21:07:14.68176
24	2016	75	122	2017-12-09 21:07:14.687709	2017-12-09 21:07:14.687709
25	2016	99	181	2017-12-09 21:07:15.713098	2017-12-09 21:07:15.713098
26	2015	118	155	2017-12-09 21:07:15.719483	2017-12-09 21:07:15.719483
27	2014	67	134	2017-12-09 21:07:15.725734	2017-12-09 21:07:15.725734
28	2013	86	1	2017-12-09 21:07:15.731742	2017-12-09 21:07:15.731742
\.


--
-- Name: right_tackles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('right_tackles_id_seq', 28, true);


--
-- Data for Name: running_backs; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY running_backs (id, season, rushing_yards, rushing_touchdowns, receiving_yards, receiving_touchdowns, created_at, updated_at) FROM stdin;
505436969	2013	50	4	70	3	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
4509324	2014	50	4	70	3	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
927202847	2015	50	4	70	3	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
776646567	2016	50	4	70	3	2017-12-09 19:45:42.784462	2017-12-09 19:45:42.784462
927202848	2019	83	59	172	36	2017-12-09 21:07:13.49079	2017-12-09 21:07:13.49079
927202849	2018	197	23	176	131	2017-12-09 21:07:13.497879	2017-12-09 21:07:13.497879
927202850	2017	33	176	106	161	2017-12-09 21:07:13.504488	2017-12-09 21:07:13.504488
927202851	2016	43	197	0	49	2017-12-09 21:07:13.511243	2017-12-09 21:07:13.511243
927202852	2017	73	179	181	45	2017-12-09 21:07:15.097701	2017-12-09 21:07:15.097701
927202853	2016	197	91	187	3	2017-12-09 21:07:15.10459	2017-12-09 21:07:15.10459
927202854	2015	6	52	136	81	2017-12-09 21:07:15.111297	2017-12-09 21:07:15.111297
927202855	2014	172	81	47	181	2017-12-09 21:07:15.11761	2017-12-09 21:07:15.11761
\.


--
-- Name: running_backs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('running_backs_id_seq', 927202855, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY schema_migrations (version) FROM stdin;
20160315201919
20160318191445
20160318200308
20160318200830
20160318201154
20160318221805
20160406212800
20160506172031
20160506173001
20160509193702
20160509195014
20160509195317
20160509200816
20160509202756
20160509203104
20160509203237
20160509203715
20160509204048
20160509204215
20160509204417
20160509204523
20160509204731
20160509204952
20160509205250
20160509205512
20160509205924
20160509210059
20160509210158
20160509210328
20160509210434
20160509210552
20160509210702
20160509211158
20160518225245
20160524211539
20160525195309
20160528194750
20160601203238
20160601203626
20160606043248
20160607135859
20160622195231
20160622195338
20160706193054
20160830012728
20160830183825
20160919161342
20161011140647
20161011140715
20161122223116
20161212201954
20170201172403
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY stats (id, athlete_id, position_type, position_id, created_at, updated_at, last_modified_by_id) FROM stdin;
455915807	3900196	Position::Quarterback	801653172	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
88616126	3900196	Position::Quarterback	833410073	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
844045353	3900196	Position::Quarterback	111928452	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
726027669	3900196	Position::Quarterback	530756924	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
717529986	3900196	Position::RunningBack	505436969	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
882914851	3900196	Position::RunningBack	4509324	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
61277878	3900196	Position::RunningBack	927202847	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
447633170	3900196	Position::RunningBack	776646567	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
761506224	3900196	Position::Center	35993429	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
67112092	3900196	Position::Center	726045287	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
487152928	3900196	Position::Center	844088287	2017-12-09 19:45:42.813804	2017-12-09 19:45:42.813804	\N
882914852	3900496	Position::RightGuard	1	2017-12-09 21:07:04.988288	2017-12-09 21:07:04.988288	\N
882914853	3900496	Position::RightGuard	2	2017-12-09 21:07:04.995472	2017-12-09 21:07:04.995472	\N
882914854	3900496	Position::RightGuard	3	2017-12-09 21:07:05.001673	2017-12-09 21:07:05.001673	\N
882914855	3900496	Position::RightGuard	4	2017-12-09 21:07:05.007683	2017-12-09 21:07:05.007683	\N
882914856	3900496	Position::WideReceiver	1	2017-12-09 21:07:05.037553	2017-12-09 21:07:05.037553	\N
882914857	3900496	Position::WideReceiver	2	2017-12-09 21:07:05.043734	2017-12-09 21:07:05.043734	\N
882914858	3900496	Position::WideReceiver	3	2017-12-09 21:07:05.049731	2017-12-09 21:07:05.049731	\N
882914859	3900496	Position::WideReceiver	4	2017-12-09 21:07:05.055737	2017-12-09 21:07:05.055737	\N
882914860	3900496	Position::OutsideLinebacker	1	2017-12-09 21:07:05.088242	2017-12-09 21:07:05.088242	\N
882914861	3900496	Position::OutsideLinebacker	2	2017-12-09 21:07:05.094752	2017-12-09 21:07:05.094752	\N
882914862	3900496	Position::OutsideLinebacker	3	2017-12-09 21:07:05.10098	2017-12-09 21:07:05.10098	\N
882914863	3900496	Position::OutsideLinebacker	4	2017-12-09 21:07:05.107325	2017-12-09 21:07:05.107325	\N
882914864	3900495	Position::MiddleLinebacker	1	2017-12-09 21:07:05.143224	2017-12-09 21:07:05.143224	\N
882914865	3900495	Position::MiddleLinebacker	2	2017-12-09 21:07:05.150166	2017-12-09 21:07:05.150166	\N
882914866	3900495	Position::MiddleLinebacker	3	2017-12-09 21:07:05.156663	2017-12-09 21:07:05.156663	\N
882914867	3900495	Position::MiddleLinebacker	4	2017-12-09 21:07:05.163025	2017-12-09 21:07:05.163025	\N
882914868	3900495	Position::Guard	1	2017-12-09 21:07:05.190819	2017-12-09 21:07:05.190819	\N
882914869	3900495	Position::Guard	2	2017-12-09 21:07:05.19693	2017-12-09 21:07:05.19693	\N
882914870	3900495	Position::Guard	3	2017-12-09 21:07:05.203101	2017-12-09 21:07:05.203101	\N
882914871	3900495	Position::Guard	4	2017-12-09 21:07:05.209034	2017-12-09 21:07:05.209034	\N
882914872	3900495	Position::Tackle	1	2017-12-09 21:07:05.236039	2017-12-09 21:07:05.236039	\N
882914873	3900495	Position::Tackle	2	2017-12-09 21:07:05.242017	2017-12-09 21:07:05.242017	\N
882914874	3900495	Position::Tackle	3	2017-12-09 21:07:05.247885	2017-12-09 21:07:05.247885	\N
882914875	3900495	Position::Tackle	4	2017-12-09 21:07:05.254127	2017-12-09 21:07:05.254127	\N
882914876	3900494	Position::Quarterback	833410074	2017-12-09 21:07:05.288472	2017-12-09 21:07:05.288472	\N
882914877	3900494	Position::Quarterback	833410075	2017-12-09 21:07:05.294752	2017-12-09 21:07:05.294752	\N
882914878	3900494	Position::Quarterback	833410076	2017-12-09 21:07:05.300827	2017-12-09 21:07:05.300827	\N
882914879	3900494	Position::Quarterback	833410077	2017-12-09 21:07:05.306998	2017-12-09 21:07:05.306998	\N
882914880	3900494	Position::LeftGuard	1	2017-12-09 21:07:05.334571	2017-12-09 21:07:05.334571	\N
882914881	3900494	Position::LeftGuard	2	2017-12-09 21:07:05.340939	2017-12-09 21:07:05.340939	\N
882914882	3900494	Position::LeftGuard	3	2017-12-09 21:07:05.346892	2017-12-09 21:07:05.346892	\N
882914883	3900494	Position::LeftGuard	4	2017-12-09 21:07:05.353238	2017-12-09 21:07:05.353238	\N
882914884	3900494	Position::PuntReturner	1	2017-12-09 21:07:05.380742	2017-12-09 21:07:05.380742	\N
882914885	3900494	Position::PuntReturner	2	2017-12-09 21:07:05.386903	2017-12-09 21:07:05.386903	\N
882914886	3900494	Position::PuntReturner	3	2017-12-09 21:07:05.392806	2017-12-09 21:07:05.392806	\N
882914887	3900494	Position::PuntReturner	4	2017-12-09 21:07:05.39904	2017-12-09 21:07:05.39904	\N
882914888	3900493	Position::Guard	5	2017-12-09 21:07:05.411958	2017-12-09 21:07:05.411958	\N
882914889	3900493	Position::Guard	6	2017-12-09 21:07:05.418203	2017-12-09 21:07:05.418203	\N
882914890	3900493	Position::Guard	7	2017-12-09 21:07:05.424378	2017-12-09 21:07:05.424378	\N
882914891	3900493	Position::Guard	8	2017-12-09 21:07:05.43087	2017-12-09 21:07:05.43087	\N
882914892	3900493	Position::NoseTackle	1	2017-12-09 21:07:05.479498	2017-12-09 21:07:05.479498	\N
882914893	3900493	Position::NoseTackle	2	2017-12-09 21:07:05.486051	2017-12-09 21:07:05.486051	\N
882914894	3900493	Position::NoseTackle	3	2017-12-09 21:07:05.4925	2017-12-09 21:07:05.4925	\N
882914895	3900493	Position::NoseTackle	4	2017-12-09 21:07:05.499126	2017-12-09 21:07:05.499126	\N
882914896	3900492	Position::DefensiveEnd	1	2017-12-09 21:07:05.536132	2017-12-09 21:07:05.536132	\N
882914897	3900492	Position::DefensiveEnd	2	2017-12-09 21:07:05.542949	2017-12-09 21:07:05.542949	\N
882914898	3900492	Position::DefensiveEnd	3	2017-12-09 21:07:05.549661	2017-12-09 21:07:05.549661	\N
882914899	3900492	Position::DefensiveEnd	4	2017-12-09 21:07:05.555883	2017-12-09 21:07:05.555883	\N
882914900	3900492	Position::LeftTackle	1	2017-12-09 21:07:05.584409	2017-12-09 21:07:05.584409	\N
882914901	3900492	Position::LeftTackle	2	2017-12-09 21:07:05.590518	2017-12-09 21:07:05.590518	\N
882914902	3900492	Position::LeftTackle	3	2017-12-09 21:07:05.596558	2017-12-09 21:07:05.596558	\N
882914903	3900492	Position::LeftTackle	4	2017-12-09 21:07:05.602395	2017-12-09 21:07:05.602395	\N
882914904	3900492	Position::OutsideLinebacker	5	2017-12-09 21:07:05.611239	2017-12-09 21:07:05.611239	\N
882914905	3900492	Position::OutsideLinebacker	6	2017-12-09 21:07:05.617806	2017-12-09 21:07:05.617806	\N
882914906	3900492	Position::OutsideLinebacker	7	2017-12-09 21:07:05.624234	2017-12-09 21:07:05.624234	\N
882914907	3900492	Position::OutsideLinebacker	8	2017-12-09 21:07:05.630652	2017-12-09 21:07:05.630652	\N
882914908	3900491	Position::Punter	1	2017-12-09 21:07:05.664826	2017-12-09 21:07:05.664826	\N
882914909	3900491	Position::Punter	2	2017-12-09 21:07:05.671493	2017-12-09 21:07:05.671493	\N
882914910	3900491	Position::Punter	3	2017-12-09 21:07:05.67781	2017-12-09 21:07:05.67781	\N
882914911	3900491	Position::Punter	4	2017-12-09 21:07:05.708753	2017-12-09 21:07:05.708753	\N
882914912	3900491	Position::InsideLinebacker	1	2017-12-09 21:07:05.740915	2017-12-09 21:07:05.740915	\N
882914913	3900491	Position::InsideLinebacker	2	2017-12-09 21:07:05.747449	2017-12-09 21:07:05.747449	\N
882914914	3900491	Position::InsideLinebacker	3	2017-12-09 21:07:05.753974	2017-12-09 21:07:05.753974	\N
882914915	3900491	Position::InsideLinebacker	4	2017-12-09 21:07:05.760274	2017-12-09 21:07:05.760274	\N
882914916	3900491	Position::LeftTackle	5	2017-12-09 21:07:05.768315	2017-12-09 21:07:05.768315	\N
882914917	3900491	Position::LeftTackle	6	2017-12-09 21:07:05.774513	2017-12-09 21:07:05.774513	\N
882914918	3900491	Position::LeftTackle	7	2017-12-09 21:07:05.78054	2017-12-09 21:07:05.78054	\N
882914919	3900491	Position::LeftTackle	8	2017-12-09 21:07:05.786689	2017-12-09 21:07:05.786689	\N
882914920	3900490	Position::InsideLinebacker	5	2017-12-09 21:07:05.799629	2017-12-09 21:07:05.799629	\N
882914921	3900490	Position::InsideLinebacker	6	2017-12-09 21:07:05.806532	2017-12-09 21:07:05.806532	\N
882914922	3900490	Position::InsideLinebacker	7	2017-12-09 21:07:05.812954	2017-12-09 21:07:05.812954	\N
882914923	3900490	Position::InsideLinebacker	8	2017-12-09 21:07:05.819512	2017-12-09 21:07:05.819512	\N
882914924	3900490	Position::Tackle	5	2017-12-09 21:07:05.827964	2017-12-09 21:07:05.827964	\N
882914925	3900490	Position::Tackle	6	2017-12-09 21:07:05.834216	2017-12-09 21:07:05.834216	\N
882914926	3900490	Position::Tackle	7	2017-12-09 21:07:05.840421	2017-12-09 21:07:05.840421	\N
882914927	3900490	Position::Tackle	8	2017-12-09 21:07:05.846655	2017-12-09 21:07:05.846655	\N
882914928	3900490	Position::DefensiveTackle	1	2017-12-09 21:07:05.880328	2017-12-09 21:07:05.880328	\N
882914929	3900490	Position::DefensiveTackle	2	2017-12-09 21:07:05.88718	2017-12-09 21:07:05.88718	\N
882914930	3900490	Position::DefensiveTackle	3	2017-12-09 21:07:05.893447	2017-12-09 21:07:05.893447	\N
882914931	3900490	Position::DefensiveTackle	4	2017-12-09 21:07:05.900074	2017-12-09 21:07:05.900074	\N
882914932	3900489	Position::LeftTackle	9	2017-12-09 21:07:05.913196	2017-12-09 21:07:05.913196	\N
882914933	3900489	Position::LeftTackle	10	2017-12-09 21:07:05.919668	2017-12-09 21:07:05.919668	\N
882914934	3900489	Position::LeftTackle	11	2017-12-09 21:07:05.925861	2017-12-09 21:07:05.925861	\N
882914935	3900489	Position::LeftTackle	12	2017-12-09 21:07:05.931826	2017-12-09 21:07:05.931826	\N
882914936	3900489	Position::FreeSafety	1	2017-12-09 21:07:05.966203	2017-12-09 21:07:05.966203	\N
882914937	3900489	Position::FreeSafety	2	2017-12-09 21:07:05.972833	2017-12-09 21:07:05.972833	\N
882914938	3900489	Position::FreeSafety	3	2017-12-09 21:07:05.979567	2017-12-09 21:07:05.979567	\N
882914939	3900489	Position::FreeSafety	4	2017-12-09 21:07:05.986726	2017-12-09 21:07:05.986726	\N
882914940	3900489	Position::NoseTackle	5	2017-12-09 21:07:05.997278	2017-12-09 21:07:05.997278	\N
882914941	3900489	Position::NoseTackle	6	2017-12-09 21:07:06.003953	2017-12-09 21:07:06.003953	\N
882914942	3900489	Position::NoseTackle	7	2017-12-09 21:07:06.010418	2017-12-09 21:07:06.010418	\N
882914943	3900489	Position::NoseTackle	8	2017-12-09 21:07:06.016786	2017-12-09 21:07:06.016786	\N
882914944	3900488	Position::FreeSafety	5	2017-12-09 21:07:06.029989	2017-12-09 21:07:06.029989	\N
882914945	3900488	Position::FreeSafety	6	2017-12-09 21:07:06.036541	2017-12-09 21:07:06.036541	\N
882914946	3900488	Position::FreeSafety	7	2017-12-09 21:07:06.042844	2017-12-09 21:07:06.042844	\N
882914947	3900488	Position::FreeSafety	8	2017-12-09 21:07:06.049037	2017-12-09 21:07:06.049037	\N
882914948	3900488	Position::Guard	9	2017-12-09 21:07:06.057123	2017-12-09 21:07:06.057123	\N
882914949	3900488	Position::Guard	10	2017-12-09 21:07:06.062923	2017-12-09 21:07:06.062923	\N
882914950	3900488	Position::Guard	11	2017-12-09 21:07:06.068774	2017-12-09 21:07:06.068774	\N
882914951	3900488	Position::Guard	12	2017-12-09 21:07:06.074519	2017-12-09 21:07:06.074519	\N
882914952	3900488	Position::Center	844088288	2017-12-09 21:07:06.102308	2017-12-09 21:07:06.102308	\N
882914953	3900488	Position::Center	844088289	2017-12-09 21:07:06.108141	2017-12-09 21:07:06.108141	\N
882914954	3900488	Position::Center	844088290	2017-12-09 21:07:06.113921	2017-12-09 21:07:06.113921	\N
882914955	3900488	Position::Center	844088291	2017-12-09 21:07:06.119847	2017-12-09 21:07:06.119847	\N
882914956	3900487	Position::LeftGuard	5	2017-12-09 21:07:06.130911	2017-12-09 21:07:06.130911	\N
882914957	3900487	Position::LeftGuard	6	2017-12-09 21:07:06.137098	2017-12-09 21:07:06.137098	\N
882914958	3900487	Position::LeftGuard	7	2017-12-09 21:07:06.1432	2017-12-09 21:07:06.1432	\N
882914959	3900487	Position::LeftGuard	8	2017-12-09 21:07:06.149197	2017-12-09 21:07:06.149197	\N
882914960	3900487	Position::Guard	13	2017-12-09 21:07:06.1574	2017-12-09 21:07:06.1574	\N
882914961	3900487	Position::Guard	14	2017-12-09 21:07:06.163336	2017-12-09 21:07:06.163336	\N
882914962	3900487	Position::Guard	15	2017-12-09 21:07:06.169294	2017-12-09 21:07:06.169294	\N
882914963	3900487	Position::Guard	16	2017-12-09 21:07:06.175444	2017-12-09 21:07:06.175444	\N
882914964	3900487	Position::RightGuard	5	2017-12-09 21:07:06.184269	2017-12-09 21:07:06.184269	\N
882914965	3900487	Position::RightGuard	6	2017-12-09 21:07:06.190399	2017-12-09 21:07:06.190399	\N
882914966	3900487	Position::RightGuard	7	2017-12-09 21:07:06.196209	2017-12-09 21:07:06.196209	\N
882914967	3900487	Position::RightGuard	8	2017-12-09 21:07:06.202133	2017-12-09 21:07:06.202133	\N
882914968	3900486	Position::StrongSafety	1	2017-12-09 21:07:06.239219	2017-12-09 21:07:06.239219	\N
882914969	3900486	Position::StrongSafety	2	2017-12-09 21:07:06.245606	2017-12-09 21:07:06.245606	\N
882914970	3900486	Position::StrongSafety	3	2017-12-09 21:07:06.251801	2017-12-09 21:07:06.251801	\N
882914971	3900486	Position::StrongSafety	4	2017-12-09 21:07:06.25826	2017-12-09 21:07:06.25826	\N
882914972	3900486	Position::PuntReturner	5	2017-12-09 21:07:06.266465	2017-12-09 21:07:06.266465	\N
882914973	3900486	Position::PuntReturner	6	2017-12-09 21:07:06.27246	2017-12-09 21:07:06.27246	\N
882914974	3900486	Position::PuntReturner	7	2017-12-09 21:07:06.278381	2017-12-09 21:07:06.278381	\N
882914975	3900486	Position::PuntReturner	8	2017-12-09 21:07:06.284449	2017-12-09 21:07:06.284449	\N
882914976	3900486	Position::DefensiveEnd	5	2017-12-09 21:07:06.293162	2017-12-09 21:07:06.293162	\N
882914977	3900486	Position::DefensiveEnd	6	2017-12-09 21:07:06.299737	2017-12-09 21:07:06.299737	\N
882914978	3900486	Position::DefensiveEnd	7	2017-12-09 21:07:06.306651	2017-12-09 21:07:06.306651	\N
882914979	3900486	Position::DefensiveEnd	8	2017-12-09 21:07:06.313463	2017-12-09 21:07:06.313463	\N
882914980	3900485	Position::Fullback	1	2017-12-09 21:07:06.349536	2017-12-09 21:07:06.349536	\N
882914981	3900485	Position::Fullback	2	2017-12-09 21:07:06.356151	2017-12-09 21:07:06.356151	\N
882914982	3900485	Position::Fullback	3	2017-12-09 21:07:06.362539	2017-12-09 21:07:06.362539	\N
882914983	3900485	Position::Fullback	4	2017-12-09 21:07:06.36882	2017-12-09 21:07:06.36882	\N
882914984	3900485	Position::Quarterback	833410078	2017-12-09 21:07:06.377909	2017-12-09 21:07:06.377909	\N
882914985	3900485	Position::Quarterback	833410079	2017-12-09 21:07:06.384197	2017-12-09 21:07:06.384197	\N
882914986	3900485	Position::Quarterback	833410080	2017-12-09 21:07:06.390405	2017-12-09 21:07:06.390405	\N
882914987	3900485	Position::Quarterback	833410081	2017-12-09 21:07:06.396758	2017-12-09 21:07:06.396758	\N
882914988	3900485	Position::DefensiveEnd	9	2017-12-09 21:07:06.40558	2017-12-09 21:07:06.40558	\N
882914989	3900485	Position::DefensiveEnd	10	2017-12-09 21:07:06.411949	2017-12-09 21:07:06.411949	\N
882914990	3900485	Position::DefensiveEnd	11	2017-12-09 21:07:06.418257	2017-12-09 21:07:06.418257	\N
882914991	3900485	Position::DefensiveEnd	12	2017-12-09 21:07:06.424585	2017-12-09 21:07:06.424585	\N
882914992	3900484	Position::WideReceiver	5	2017-12-09 21:07:06.437488	2017-12-09 21:07:06.437488	\N
882914993	3900484	Position::WideReceiver	6	2017-12-09 21:07:06.44365	2017-12-09 21:07:06.44365	\N
882914994	3900484	Position::WideReceiver	7	2017-12-09 21:07:06.449921	2017-12-09 21:07:06.449921	\N
882914995	3900484	Position::WideReceiver	8	2017-12-09 21:07:06.456238	2017-12-09 21:07:06.456238	\N
882914996	3900484	Position::Fullback	5	2017-12-09 21:07:06.465109	2017-12-09 21:07:06.465109	\N
882914997	3900484	Position::Fullback	6	2017-12-09 21:07:06.471536	2017-12-09 21:07:06.471536	\N
882914998	3900484	Position::Fullback	7	2017-12-09 21:07:06.477955	2017-12-09 21:07:06.477955	\N
882914999	3900484	Position::Fullback	8	2017-12-09 21:07:06.484455	2017-12-09 21:07:06.484455	\N
882915000	3900484	Position::Kicker	1	2017-12-09 21:07:06.536319	2017-12-09 21:07:06.536319	\N
882915001	3900484	Position::Kicker	2	2017-12-09 21:07:06.543604	2017-12-09 21:07:06.543604	\N
882915002	3900484	Position::Kicker	3	2017-12-09 21:07:06.549841	2017-12-09 21:07:06.549841	\N
882915003	3900484	Position::Kicker	4	2017-12-09 21:07:06.556091	2017-12-09 21:07:06.556091	\N
882915004	3900483	Position::TightEnd	1	2017-12-09 21:07:06.59044	2017-12-09 21:07:06.59044	\N
882915005	3900483	Position::TightEnd	2	2017-12-09 21:07:06.596545	2017-12-09 21:07:06.596545	\N
882915006	3900483	Position::TightEnd	3	2017-12-09 21:07:06.602583	2017-12-09 21:07:06.602583	\N
882915007	3900483	Position::TightEnd	4	2017-12-09 21:07:06.608548	2017-12-09 21:07:06.608548	\N
882915008	3900483	Position::Fullback	9	2017-12-09 21:07:06.616964	2017-12-09 21:07:06.616964	\N
882915009	3900483	Position::Fullback	10	2017-12-09 21:07:06.623122	2017-12-09 21:07:06.623122	\N
882915010	3900483	Position::Fullback	11	2017-12-09 21:07:06.629343	2017-12-09 21:07:06.629343	\N
882915011	3900483	Position::Fullback	12	2017-12-09 21:07:06.635895	2017-12-09 21:07:06.635895	\N
882915012	3900483	Position::Quarterback	833410082	2017-12-09 21:07:06.644631	2017-12-09 21:07:06.644631	\N
882915013	3900483	Position::Quarterback	833410083	2017-12-09 21:07:06.650952	2017-12-09 21:07:06.650952	\N
882915014	3900483	Position::Quarterback	833410084	2017-12-09 21:07:06.65708	2017-12-09 21:07:06.65708	\N
882915015	3900483	Position::Quarterback	833410085	2017-12-09 21:07:06.663143	2017-12-09 21:07:06.663143	\N
882915016	3900482	Position::FreeSafety	9	2017-12-09 21:07:06.676441	2017-12-09 21:07:06.676441	\N
882915017	3900482	Position::FreeSafety	10	2017-12-09 21:07:06.683313	2017-12-09 21:07:06.683313	\N
882915018	3900482	Position::FreeSafety	11	2017-12-09 21:07:06.689617	2017-12-09 21:07:06.689617	\N
882915019	3900482	Position::FreeSafety	12	2017-12-09 21:07:06.69594	2017-12-09 21:07:06.69594	\N
882915020	3900482	Position::Tackle	9	2017-12-09 21:07:06.704473	2017-12-09 21:07:06.704473	\N
882915021	3900482	Position::Tackle	10	2017-12-09 21:07:06.710663	2017-12-09 21:07:06.710663	\N
882915022	3900482	Position::Tackle	11	2017-12-09 21:07:06.71689	2017-12-09 21:07:06.71689	\N
882915023	3900482	Position::Tackle	12	2017-12-09 21:07:06.722977	2017-12-09 21:07:06.722977	\N
882915024	3900482	Position::StrongSafety	5	2017-12-09 21:07:06.731725	2017-12-09 21:07:06.731725	\N
882915025	3900482	Position::StrongSafety	6	2017-12-09 21:07:06.738343	2017-12-09 21:07:06.738343	\N
882915026	3900482	Position::StrongSafety	7	2017-12-09 21:07:06.744749	2017-12-09 21:07:06.744749	\N
882915027	3900482	Position::StrongSafety	8	2017-12-09 21:07:06.751217	2017-12-09 21:07:06.751217	\N
882915028	3900481	Position::OutsideLinebacker	9	2017-12-09 21:07:06.764484	2017-12-09 21:07:06.764484	\N
882915029	3900481	Position::OutsideLinebacker	10	2017-12-09 21:07:06.770885	2017-12-09 21:07:06.770885	\N
882915030	3900481	Position::OutsideLinebacker	11	2017-12-09 21:07:06.777802	2017-12-09 21:07:06.777802	\N
882915031	3900481	Position::OutsideLinebacker	12	2017-12-09 21:07:06.784588	2017-12-09 21:07:06.784588	\N
882915032	3900481	Position::LeftGuard	9	2017-12-09 21:07:06.79311	2017-12-09 21:07:06.79311	\N
882915033	3900481	Position::LeftGuard	10	2017-12-09 21:07:06.799332	2017-12-09 21:07:06.799332	\N
882915034	3900481	Position::LeftGuard	11	2017-12-09 21:07:06.805681	2017-12-09 21:07:06.805681	\N
882915035	3900481	Position::LeftGuard	12	2017-12-09 21:07:06.811628	2017-12-09 21:07:06.811628	\N
882915036	3900481	Position::DefensiveTackle	5	2017-12-09 21:07:06.820383	2017-12-09 21:07:06.820383	\N
882915037	3900481	Position::DefensiveTackle	6	2017-12-09 21:07:06.826776	2017-12-09 21:07:06.826776	\N
882915038	3900481	Position::DefensiveTackle	7	2017-12-09 21:07:06.833251	2017-12-09 21:07:06.833251	\N
882915039	3900481	Position::DefensiveTackle	8	2017-12-09 21:07:06.839556	2017-12-09 21:07:06.839556	\N
882915040	3900480	Position::WideReceiver	9	2017-12-09 21:07:06.850685	2017-12-09 21:07:06.850685	\N
882915041	3900480	Position::WideReceiver	10	2017-12-09 21:07:06.857006	2017-12-09 21:07:06.857006	\N
882915042	3900480	Position::WideReceiver	11	2017-12-09 21:07:06.863037	2017-12-09 21:07:06.863037	\N
882915043	3900480	Position::WideReceiver	12	2017-12-09 21:07:06.869536	2017-12-09 21:07:06.869536	\N
882915044	3900480	Position::StrongSafety	9	2017-12-09 21:07:06.878558	2017-12-09 21:07:06.878558	\N
882915045	3900480	Position::StrongSafety	10	2017-12-09 21:07:06.884862	2017-12-09 21:07:06.884862	\N
882915046	3900480	Position::StrongSafety	11	2017-12-09 21:07:06.891439	2017-12-09 21:07:06.891439	\N
882915047	3900480	Position::StrongSafety	12	2017-12-09 21:07:06.897804	2017-12-09 21:07:06.897804	\N
882915048	3900480	Position::LeftGuard	13	2017-12-09 21:07:06.906233	2017-12-09 21:07:06.906233	\N
882915049	3900480	Position::LeftGuard	14	2017-12-09 21:07:06.912418	2017-12-09 21:07:06.912418	\N
882915050	3900480	Position::LeftGuard	15	2017-12-09 21:07:06.918628	2017-12-09 21:07:06.918628	\N
882915051	3900480	Position::LeftGuard	16	2017-12-09 21:07:06.924788	2017-12-09 21:07:06.924788	\N
882915052	3900479	Position::Quarterback	833410086	2017-12-09 21:07:06.938575	2017-12-09 21:07:06.938575	\N
882915053	3900479	Position::Quarterback	833410087	2017-12-09 21:07:06.945006	2017-12-09 21:07:06.945006	\N
882915054	3900479	Position::Quarterback	833410088	2017-12-09 21:07:06.951774	2017-12-09 21:07:06.951774	\N
882915055	3900479	Position::Quarterback	833410089	2017-12-09 21:07:06.958333	2017-12-09 21:07:06.958333	\N
882915056	3900479	Position::Punter	5	2017-12-09 21:07:06.966912	2017-12-09 21:07:06.966912	\N
882915057	3900479	Position::Punter	6	2017-12-09 21:07:06.973471	2017-12-09 21:07:06.973471	\N
882915058	3900479	Position::Punter	7	2017-12-09 21:07:06.97997	2017-12-09 21:07:06.97997	\N
882915059	3900479	Position::Punter	8	2017-12-09 21:07:06.986396	2017-12-09 21:07:06.986396	\N
882915060	3900479	Position::LeftGuard	17	2017-12-09 21:07:06.99576	2017-12-09 21:07:06.99576	\N
882915061	3900479	Position::LeftGuard	18	2017-12-09 21:07:07.002653	2017-12-09 21:07:07.002653	\N
882915062	3900479	Position::LeftGuard	19	2017-12-09 21:07:07.008902	2017-12-09 21:07:07.008902	\N
882915063	3900479	Position::LeftGuard	20	2017-12-09 21:07:07.015304	2017-12-09 21:07:07.015304	\N
882915064	3900478	Position::RightTackle	1	2017-12-09 21:07:07.04924	2017-12-09 21:07:07.04924	\N
882915065	3900478	Position::RightTackle	2	2017-12-09 21:07:07.055816	2017-12-09 21:07:07.055816	\N
882915066	3900478	Position::RightTackle	3	2017-12-09 21:07:07.061912	2017-12-09 21:07:07.061912	\N
882915067	3900478	Position::RightTackle	4	2017-12-09 21:07:07.068214	2017-12-09 21:07:07.068214	\N
882915068	3900478	Position::StrongSafety	13	2017-12-09 21:07:07.077645	2017-12-09 21:07:07.077645	\N
882915069	3900478	Position::StrongSafety	14	2017-12-09 21:07:07.084377	2017-12-09 21:07:07.084377	\N
882915070	3900478	Position::StrongSafety	15	2017-12-09 21:07:07.090766	2017-12-09 21:07:07.090766	\N
882915071	3900478	Position::StrongSafety	16	2017-12-09 21:07:07.097444	2017-12-09 21:07:07.097444	\N
882915072	3900478	Position::Fullback	13	2017-12-09 21:07:07.106306	2017-12-09 21:07:07.106306	\N
882915073	3900478	Position::Fullback	14	2017-12-09 21:07:07.112819	2017-12-09 21:07:07.112819	\N
882915074	3900478	Position::Fullback	15	2017-12-09 21:07:07.119202	2017-12-09 21:07:07.119202	\N
882915075	3900478	Position::Fullback	16	2017-12-09 21:07:07.125622	2017-12-09 21:07:07.125622	\N
882915076	3900477	Position::InsideLinebacker	9	2017-12-09 21:07:07.139391	2017-12-09 21:07:07.139391	\N
882915077	3900477	Position::InsideLinebacker	10	2017-12-09 21:07:07.14595	2017-12-09 21:07:07.14595	\N
882915078	3900477	Position::InsideLinebacker	11	2017-12-09 21:07:07.152537	2017-12-09 21:07:07.152537	\N
882915079	3900477	Position::InsideLinebacker	12	2017-12-09 21:07:07.159053	2017-12-09 21:07:07.159053	\N
882915080	3900477	Position::Quarterback	833410090	2017-12-09 21:07:07.167978	2017-12-09 21:07:07.167978	\N
882915081	3900477	Position::Quarterback	833410091	2017-12-09 21:07:07.174519	2017-12-09 21:07:07.174519	\N
882915082	3900477	Position::Quarterback	833410092	2017-12-09 21:07:07.181005	2017-12-09 21:07:07.181005	\N
882915083	3900477	Position::Quarterback	833410093	2017-12-09 21:07:07.187609	2017-12-09 21:07:07.187609	\N
882915084	3900477	Position::Cornerback	1	2017-12-09 21:07:07.223009	2017-12-09 21:07:07.223009	\N
882915085	3900477	Position::Cornerback	2	2017-12-09 21:07:07.229828	2017-12-09 21:07:07.229828	\N
882915086	3900477	Position::Cornerback	3	2017-12-09 21:07:07.236588	2017-12-09 21:07:07.236588	\N
882915087	3900477	Position::Cornerback	4	2017-12-09 21:07:07.243065	2017-12-09 21:07:07.243065	\N
882915088	3900476	Position::PuntReturner	9	2017-12-09 21:07:07.25655	2017-12-09 21:07:07.25655	\N
882915089	3900476	Position::PuntReturner	10	2017-12-09 21:07:07.262818	2017-12-09 21:07:07.262818	\N
882915090	3900476	Position::PuntReturner	11	2017-12-09 21:07:07.268772	2017-12-09 21:07:07.268772	\N
882915091	3900476	Position::PuntReturner	12	2017-12-09 21:07:07.274918	2017-12-09 21:07:07.274918	\N
882915092	3900476	Position::Quarterback	833410094	2017-12-09 21:07:07.283676	2017-12-09 21:07:07.283676	\N
882915093	3900476	Position::Quarterback	833410095	2017-12-09 21:07:07.29004	2017-12-09 21:07:07.29004	\N
882915094	3900476	Position::Quarterback	833410096	2017-12-09 21:07:07.29647	2017-12-09 21:07:07.29647	\N
882915095	3900476	Position::Quarterback	833410097	2017-12-09 21:07:07.302873	2017-12-09 21:07:07.302873	\N
882915096	3900476	Position::Cornerback	5	2017-12-09 21:07:07.312049	2017-12-09 21:07:07.312049	\N
882915097	3900476	Position::Cornerback	6	2017-12-09 21:07:07.318987	2017-12-09 21:07:07.318987	\N
882915098	3900476	Position::Cornerback	7	2017-12-09 21:07:07.325666	2017-12-09 21:07:07.325666	\N
882915099	3900476	Position::Cornerback	8	2017-12-09 21:07:07.33279	2017-12-09 21:07:07.33279	\N
882915100	3900475	Position::LeftTackle	13	2017-12-09 21:07:07.346908	2017-12-09 21:07:07.346908	\N
882915101	3900475	Position::LeftTackle	14	2017-12-09 21:07:07.353566	2017-12-09 21:07:07.353566	\N
882915102	3900475	Position::LeftTackle	15	2017-12-09 21:07:07.360295	2017-12-09 21:07:07.360295	\N
882915103	3900475	Position::LeftTackle	16	2017-12-09 21:07:07.384657	2017-12-09 21:07:07.384657	\N
882915104	3900475	Position::Tackle	13	2017-12-09 21:07:07.393522	2017-12-09 21:07:07.393522	\N
882915105	3900475	Position::Tackle	14	2017-12-09 21:07:07.399746	2017-12-09 21:07:07.399746	\N
882915106	3900475	Position::Tackle	15	2017-12-09 21:07:07.405981	2017-12-09 21:07:07.405981	\N
882915107	3900475	Position::Tackle	16	2017-12-09 21:07:07.412016	2017-12-09 21:07:07.412016	\N
882915108	3900475	Position::WideReceiver	13	2017-12-09 21:07:07.420959	2017-12-09 21:07:07.420959	\N
882915109	3900475	Position::WideReceiver	14	2017-12-09 21:07:07.427504	2017-12-09 21:07:07.427504	\N
882915110	3900475	Position::WideReceiver	15	2017-12-09 21:07:07.434075	2017-12-09 21:07:07.434075	\N
882915111	3900475	Position::WideReceiver	16	2017-12-09 21:07:07.440447	2017-12-09 21:07:07.440447	\N
882915112	3900474	Position::Cornerback	9	2017-12-09 21:07:07.454157	2017-12-09 21:07:07.454157	\N
882915113	3900474	Position::Cornerback	10	2017-12-09 21:07:07.460887	2017-12-09 21:07:07.460887	\N
882915114	3900474	Position::Cornerback	11	2017-12-09 21:07:07.467534	2017-12-09 21:07:07.467534	\N
882915115	3900474	Position::Cornerback	12	2017-12-09 21:07:07.474321	2017-12-09 21:07:07.474321	\N
882915116	3900474	Position::RightTackle	5	2017-12-09 21:07:07.483064	2017-12-09 21:07:07.483064	\N
882915117	3900474	Position::RightTackle	6	2017-12-09 21:07:07.489482	2017-12-09 21:07:07.489482	\N
882915118	3900474	Position::RightTackle	7	2017-12-09 21:07:07.495684	2017-12-09 21:07:07.495684	\N
882915119	3900474	Position::RightTackle	8	2017-12-09 21:07:07.502136	2017-12-09 21:07:07.502136	\N
882915120	3900473	Position::LeftGuard	21	2017-12-09 21:07:07.531744	2017-12-09 21:07:07.531744	\N
882915121	3900473	Position::LeftGuard	22	2017-12-09 21:07:07.538189	2017-12-09 21:07:07.538189	\N
882915122	3900473	Position::LeftGuard	23	2017-12-09 21:07:07.544658	2017-12-09 21:07:07.544658	\N
882915123	3900473	Position::LeftGuard	24	2017-12-09 21:07:07.55097	2017-12-09 21:07:07.55097	\N
882915124	3900473	Position::Fullback	17	2017-12-09 21:07:07.559659	2017-12-09 21:07:07.559659	\N
882915125	3900473	Position::Fullback	18	2017-12-09 21:07:07.566359	2017-12-09 21:07:07.566359	\N
882915126	3900473	Position::Fullback	19	2017-12-09 21:07:07.574175	2017-12-09 21:07:07.574175	\N
882915127	3900473	Position::Fullback	20	2017-12-09 21:07:07.581806	2017-12-09 21:07:07.581806	\N
882915128	3900473	Position::Cornerback	13	2017-12-09 21:07:07.591434	2017-12-09 21:07:07.591434	\N
882915129	3900473	Position::Cornerback	14	2017-12-09 21:07:07.59829	2017-12-09 21:07:07.59829	\N
882915130	3900473	Position::Cornerback	15	2017-12-09 21:07:07.604876	2017-12-09 21:07:07.604876	\N
882915131	3900473	Position::Cornerback	16	2017-12-09 21:07:07.611343	2017-12-09 21:07:07.611343	\N
882915132	3900472	Position::DefensiveTackle	9	2017-12-09 21:07:07.624727	2017-12-09 21:07:07.624727	\N
882915133	3900472	Position::DefensiveTackle	10	2017-12-09 21:07:07.631657	2017-12-09 21:07:07.631657	\N
882915134	3900472	Position::DefensiveTackle	11	2017-12-09 21:07:12.731074	2017-12-09 21:07:12.731074	\N
882915135	3900472	Position::DefensiveTackle	12	2017-12-09 21:07:12.740297	2017-12-09 21:07:12.740297	\N
882915136	3900472	Position::LeftGuard	25	2017-12-09 21:07:12.749477	2017-12-09 21:07:12.749477	\N
882915137	3900472	Position::LeftGuard	26	2017-12-09 21:07:12.755448	2017-12-09 21:07:12.755448	\N
882915138	3900472	Position::LeftGuard	27	2017-12-09 21:07:12.761484	2017-12-09 21:07:12.761484	\N
882915139	3900472	Position::LeftGuard	28	2017-12-09 21:07:12.767688	2017-12-09 21:07:12.767688	\N
882915140	3900471	Position::LeftTackle	17	2017-12-09 21:07:12.79488	2017-12-09 21:07:12.79488	\N
882915141	3900471	Position::LeftTackle	18	2017-12-09 21:07:12.801289	2017-12-09 21:07:12.801289	\N
882915142	3900471	Position::LeftTackle	19	2017-12-09 21:07:12.807491	2017-12-09 21:07:12.807491	\N
882915143	3900471	Position::LeftTackle	20	2017-12-09 21:07:12.813306	2017-12-09 21:07:12.813306	\N
882915144	3900471	Position::Center	844088292	2017-12-09 21:07:12.821931	2017-12-09 21:07:12.821931	\N
882915145	3900471	Position::Center	844088293	2017-12-09 21:07:12.828327	2017-12-09 21:07:12.828327	\N
882915146	3900471	Position::Center	844088294	2017-12-09 21:07:12.83497	2017-12-09 21:07:12.83497	\N
882915147	3900471	Position::Center	844088295	2017-12-09 21:07:12.841283	2017-12-09 21:07:12.841283	\N
882915148	3900470	Position::Punter	9	2017-12-09 21:07:12.868958	2017-12-09 21:07:12.868958	\N
882915149	3900470	Position::Punter	10	2017-12-09 21:07:12.875345	2017-12-09 21:07:12.875345	\N
882915150	3900470	Position::Punter	11	2017-12-09 21:07:12.881512	2017-12-09 21:07:12.881512	\N
882915151	3900470	Position::Punter	12	2017-12-09 21:07:12.887642	2017-12-09 21:07:12.887642	\N
882915152	3900470	Position::InsideLinebacker	13	2017-12-09 21:07:12.896359	2017-12-09 21:07:12.896359	\N
882915153	3900470	Position::InsideLinebacker	14	2017-12-09 21:07:12.902996	2017-12-09 21:07:12.902996	\N
882915154	3900470	Position::InsideLinebacker	15	2017-12-09 21:07:12.909856	2017-12-09 21:07:12.909856	\N
882915155	3900470	Position::InsideLinebacker	16	2017-12-09 21:07:12.91653	2017-12-09 21:07:12.91653	\N
882915156	3900470	Position::Cornerback	17	2017-12-09 21:07:12.925502	2017-12-09 21:07:12.925502	\N
882915157	3900470	Position::Cornerback	18	2017-12-09 21:07:12.932326	2017-12-09 21:07:12.932326	\N
882915158	3900470	Position::Cornerback	19	2017-12-09 21:07:12.93872	2017-12-09 21:07:12.93872	\N
882915159	3900470	Position::Cornerback	20	2017-12-09 21:07:12.945238	2017-12-09 21:07:12.945238	\N
882915160	3900469	Position::RightTackle	9	2017-12-09 21:07:12.958189	2017-12-09 21:07:12.958189	\N
882915161	3900469	Position::RightTackle	10	2017-12-09 21:07:12.964561	2017-12-09 21:07:12.964561	\N
882915162	3900469	Position::RightTackle	11	2017-12-09 21:07:12.970832	2017-12-09 21:07:12.970832	\N
882915163	3900469	Position::RightTackle	12	2017-12-09 21:07:12.977114	2017-12-09 21:07:12.977114	\N
882915164	3900469	Position::LeftGuard	29	2017-12-09 21:07:12.985766	2017-12-09 21:07:12.985766	\N
882915165	3900469	Position::LeftGuard	30	2017-12-09 21:07:12.992111	2017-12-09 21:07:12.992111	\N
882915166	3900469	Position::LeftGuard	31	2017-12-09 21:07:12.998334	2017-12-09 21:07:12.998334	\N
882915167	3900469	Position::LeftGuard	32	2017-12-09 21:07:13.269171	2017-12-09 21:07:13.269171	\N
882915168	3900469	Position::NoseTackle	9	2017-12-09 21:07:13.279322	2017-12-09 21:07:13.279322	\N
882915169	3900469	Position::NoseTackle	10	2017-12-09 21:07:13.286228	2017-12-09 21:07:13.286228	\N
882915170	3900469	Position::NoseTackle	11	2017-12-09 21:07:13.293397	2017-12-09 21:07:13.293397	\N
882915171	3900469	Position::NoseTackle	12	2017-12-09 21:07:13.30059	2017-12-09 21:07:13.30059	\N
882915172	3900468	Position::DefensiveTackle	13	2017-12-09 21:07:13.316021	2017-12-09 21:07:13.316021	\N
882915173	3900468	Position::DefensiveTackle	14	2017-12-09 21:07:13.323478	2017-12-09 21:07:13.323478	\N
882915174	3900468	Position::DefensiveTackle	15	2017-12-09 21:07:13.329928	2017-12-09 21:07:13.329928	\N
882915175	3900468	Position::DefensiveTackle	16	2017-12-09 21:07:13.336557	2017-12-09 21:07:13.336557	\N
882915176	3900468	Position::Kicker	5	2017-12-09 21:07:13.346057	2017-12-09 21:07:13.346057	\N
882915177	3900468	Position::Kicker	6	2017-12-09 21:07:13.352566	2017-12-09 21:07:13.352566	\N
882915178	3900468	Position::Kicker	7	2017-12-09 21:07:13.3591	2017-12-09 21:07:13.3591	\N
882915179	3900468	Position::Kicker	8	2017-12-09 21:07:13.365514	2017-12-09 21:07:13.365514	\N
882915180	3900468	Position::RightTackle	13	2017-12-09 21:07:13.374235	2017-12-09 21:07:13.374235	\N
882915181	3900468	Position::RightTackle	14	2017-12-09 21:07:13.380342	2017-12-09 21:07:13.380342	\N
882915182	3900468	Position::RightTackle	15	2017-12-09 21:07:13.38643	2017-12-09 21:07:13.38643	\N
882915183	3900468	Position::RightTackle	16	2017-12-09 21:07:13.392919	2017-12-09 21:07:13.392919	\N
882915184	3900467	Position::Quarterback	833410098	2017-12-09 21:07:13.408715	2017-12-09 21:07:13.408715	\N
882915185	3900467	Position::Quarterback	833410099	2017-12-09 21:07:13.41547	2017-12-09 21:07:13.41547	\N
882915186	3900467	Position::Quarterback	833410100	2017-12-09 21:07:13.422234	2017-12-09 21:07:13.422234	\N
882915187	3900467	Position::Quarterback	833410101	2017-12-09 21:07:13.428442	2017-12-09 21:07:13.428442	\N
882915188	3900467	Position::StrongSafety	17	2017-12-09 21:07:13.437775	2017-12-09 21:07:13.437775	\N
882915189	3900467	Position::StrongSafety	18	2017-12-09 21:07:13.444296	2017-12-09 21:07:13.444296	\N
882915190	3900467	Position::StrongSafety	19	2017-12-09 21:07:13.451734	2017-12-09 21:07:13.451734	\N
882915191	3900467	Position::StrongSafety	20	2017-12-09 21:07:13.458516	2017-12-09 21:07:13.458516	\N
882915192	3900467	Position::RunningBack	927202848	2017-12-09 21:07:13.492776	2017-12-09 21:07:13.492776	\N
882915193	3900467	Position::RunningBack	927202849	2017-12-09 21:07:13.49964	2017-12-09 21:07:13.49964	\N
882915194	3900467	Position::RunningBack	927202850	2017-12-09 21:07:13.506209	2017-12-09 21:07:13.506209	\N
882915195	3900467	Position::RunningBack	927202851	2017-12-09 21:07:13.512912	2017-12-09 21:07:13.512912	\N
882915196	3900466	Position::Tackle	17	2017-12-09 21:07:13.527076	2017-12-09 21:07:13.527076	\N
882915197	3900466	Position::Tackle	18	2017-12-09 21:07:13.533829	2017-12-09 21:07:13.533829	\N
882915198	3900466	Position::Tackle	19	2017-12-09 21:07:13.540492	2017-12-09 21:07:13.540492	\N
882915199	3900466	Position::Tackle	20	2017-12-09 21:07:13.546802	2017-12-09 21:07:13.546802	\N
882915200	3900466	Position::Quarterback	833410102	2017-12-09 21:07:13.556691	2017-12-09 21:07:13.556691	\N
882915201	3900466	Position::Quarterback	833410103	2017-12-09 21:07:13.582275	2017-12-09 21:07:13.582275	\N
882915202	3900466	Position::Quarterback	833410104	2017-12-09 21:07:13.588822	2017-12-09 21:07:13.588822	\N
882915203	3900466	Position::Quarterback	833410105	2017-12-09 21:07:13.595053	2017-12-09 21:07:13.595053	\N
882915204	3900466	Position::Cornerback	21	2017-12-09 21:07:13.604052	2017-12-09 21:07:13.604052	\N
882915205	3900466	Position::Cornerback	22	2017-12-09 21:07:13.610855	2017-12-09 21:07:13.610855	\N
882915206	3900466	Position::Cornerback	23	2017-12-09 21:07:13.617863	2017-12-09 21:07:13.617863	\N
882915207	3900466	Position::Cornerback	24	2017-12-09 21:07:13.624249	2017-12-09 21:07:13.624249	\N
882915208	3900465	Position::MiddleLinebacker	5	2017-12-09 21:07:13.637107	2017-12-09 21:07:13.637107	\N
882915209	3900465	Position::MiddleLinebacker	6	2017-12-09 21:07:13.643268	2017-12-09 21:07:13.643268	\N
882915210	3900465	Position::MiddleLinebacker	7	2017-12-09 21:07:13.819459	2017-12-09 21:07:13.819459	\N
882915211	3900465	Position::MiddleLinebacker	8	2017-12-09 21:07:13.827841	2017-12-09 21:07:13.827841	\N
882915212	3900465	Position::NoseTackle	13	2017-12-09 21:07:13.836818	2017-12-09 21:07:13.836818	\N
882915213	3900465	Position::NoseTackle	14	2017-12-09 21:07:13.843179	2017-12-09 21:07:13.843179	\N
882915214	3900465	Position::NoseTackle	15	2017-12-09 21:07:13.849587	2017-12-09 21:07:13.849587	\N
882915215	3900465	Position::NoseTackle	16	2017-12-09 21:07:13.856062	2017-12-09 21:07:13.856062	\N
882915216	3900465	Position::Punter	13	2017-12-09 21:07:13.864544	2017-12-09 21:07:13.864544	\N
882915217	3900465	Position::Punter	14	2017-12-09 21:07:13.871641	2017-12-09 21:07:13.871641	\N
882915218	3900465	Position::Punter	15	2017-12-09 21:07:13.879181	2017-12-09 21:07:13.879181	\N
882915219	3900465	Position::Punter	16	2017-12-09 21:07:13.886202	2017-12-09 21:07:13.886202	\N
882915220	3900464	Position::FreeSafety	13	2017-12-09 21:07:13.900143	2017-12-09 21:07:13.900143	\N
882915221	3900464	Position::FreeSafety	14	2017-12-09 21:07:13.906767	2017-12-09 21:07:13.906767	\N
882915222	3900464	Position::FreeSafety	15	2017-12-09 21:07:13.914176	2017-12-09 21:07:13.914176	\N
882915223	3900464	Position::FreeSafety	16	2017-12-09 21:07:13.92182	2017-12-09 21:07:13.92182	\N
882915224	3900464	Position::Kicker	9	2017-12-09 21:07:13.931699	2017-12-09 21:07:13.931699	\N
882915225	3900464	Position::Kicker	10	2017-12-09 21:07:13.938435	2017-12-09 21:07:13.938435	\N
882915226	3900464	Position::Kicker	11	2017-12-09 21:07:13.944902	2017-12-09 21:07:13.944902	\N
882915227	3900464	Position::Kicker	12	2017-12-09 21:07:13.951987	2017-12-09 21:07:13.951987	\N
882915228	3900464	Position::Fullback	21	2017-12-09 21:07:13.96111	2017-12-09 21:07:13.96111	\N
882915229	3900464	Position::Fullback	22	2017-12-09 21:07:13.968121	2017-12-09 21:07:13.968121	\N
882915230	3900464	Position::Fullback	23	2017-12-09 21:07:13.974921	2017-12-09 21:07:13.974921	\N
882915231	3900464	Position::Fullback	24	2017-12-09 21:07:13.981748	2017-12-09 21:07:13.981748	\N
882915232	3900463	Position::Center	844088296	2017-12-09 21:07:13.995721	2017-12-09 21:07:13.995721	\N
882915233	3900463	Position::Center	844088297	2017-12-09 21:07:14.002164	2017-12-09 21:07:14.002164	\N
882915234	3900463	Position::Center	844088298	2017-12-09 21:07:14.008566	2017-12-09 21:07:14.008566	\N
882915235	3900463	Position::Center	844088299	2017-12-09 21:07:14.014855	2017-12-09 21:07:14.014855	\N
882915236	3900463	Position::Punter	17	2017-12-09 21:07:14.023879	2017-12-09 21:07:14.023879	\N
882915237	3900463	Position::Punter	18	2017-12-09 21:07:14.0304	2017-12-09 21:07:14.0304	\N
882915238	3900463	Position::Punter	19	2017-12-09 21:07:14.037568	2017-12-09 21:07:14.037568	\N
882915239	3900463	Position::Punter	20	2017-12-09 21:07:14.044143	2017-12-09 21:07:14.044143	\N
882915240	3900463	Position::PuntReturner	13	2017-12-09 21:07:14.052715	2017-12-09 21:07:14.052715	\N
882915241	3900463	Position::PuntReturner	14	2017-12-09 21:07:14.059794	2017-12-09 21:07:14.059794	\N
882915242	3900463	Position::PuntReturner	15	2017-12-09 21:07:14.065831	2017-12-09 21:07:14.065831	\N
882915243	3900463	Position::PuntReturner	16	2017-12-09 21:07:14.072244	2017-12-09 21:07:14.072244	\N
882915244	3900462	Position::RightTackle	17	2017-12-09 21:07:14.085686	2017-12-09 21:07:14.085686	\N
882915245	3900462	Position::RightTackle	18	2017-12-09 21:07:14.092069	2017-12-09 21:07:14.092069	\N
882915246	3900462	Position::RightTackle	19	2017-12-09 21:07:14.098359	2017-12-09 21:07:14.098359	\N
882915247	3900462	Position::RightTackle	20	2017-12-09 21:07:14.104347	2017-12-09 21:07:14.104347	\N
882915248	3900462	Position::Cornerback	25	2017-12-09 21:07:14.113292	2017-12-09 21:07:14.113292	\N
882915249	3900462	Position::Cornerback	26	2017-12-09 21:07:14.119971	2017-12-09 21:07:14.119971	\N
882915250	3900462	Position::Cornerback	27	2017-12-09 21:07:14.127139	2017-12-09 21:07:14.127139	\N
882915251	3900462	Position::Cornerback	28	2017-12-09 21:07:14.13465	2017-12-09 21:07:14.13465	\N
882915252	3900462	Position::WideReceiver	17	2017-12-09 21:07:14.14364	2017-12-09 21:07:14.14364	\N
882915253	3900462	Position::WideReceiver	18	2017-12-09 21:07:14.150028	2017-12-09 21:07:14.150028	\N
882915254	3900462	Position::WideReceiver	19	2017-12-09 21:07:14.156276	2017-12-09 21:07:14.156276	\N
882915255	3900462	Position::WideReceiver	20	2017-12-09 21:07:14.162411	2017-12-09 21:07:14.162411	\N
882915256	3900461	Position::Cornerback	29	2017-12-09 21:07:14.175799	2017-12-09 21:07:14.175799	\N
882915257	3900461	Position::Cornerback	30	2017-12-09 21:07:14.184158	2017-12-09 21:07:14.184158	\N
882915258	3900461	Position::Cornerback	31	2017-12-09 21:07:14.19059	2017-12-09 21:07:14.19059	\N
882915259	3900461	Position::Cornerback	32	2017-12-09 21:07:14.197743	2017-12-09 21:07:14.197743	\N
882915260	3900461	Position::Fullback	25	2017-12-09 21:07:14.206909	2017-12-09 21:07:14.206909	\N
882915261	3900461	Position::Fullback	26	2017-12-09 21:07:14.213476	2017-12-09 21:07:14.213476	\N
882915262	3900461	Position::Fullback	27	2017-12-09 21:07:14.220199	2017-12-09 21:07:14.220199	\N
882915263	3900461	Position::Fullback	28	2017-12-09 21:07:14.226511	2017-12-09 21:07:14.226511	\N
882915264	3900461	Position::KickReturner	1	2017-12-09 21:07:14.254833	2017-12-09 21:07:14.254833	\N
882915265	3900461	Position::KickReturner	2	2017-12-09 21:07:14.261269	2017-12-09 21:07:14.261269	\N
882915266	3900461	Position::KickReturner	3	2017-12-09 21:07:14.267431	2017-12-09 21:07:14.267431	\N
882915267	3900461	Position::KickReturner	4	2017-12-09 21:07:14.273538	2017-12-09 21:07:14.273538	\N
882915268	3900460	Position::Center	844088300	2017-12-09 21:07:14.287127	2017-12-09 21:07:14.287127	\N
882915269	3900460	Position::Center	844088301	2017-12-09 21:07:14.293341	2017-12-09 21:07:14.293341	\N
882915270	3900460	Position::Center	844088302	2017-12-09 21:07:14.299371	2017-12-09 21:07:14.299371	\N
882915271	3900460	Position::Center	844088303	2017-12-09 21:07:14.307331	2017-12-09 21:07:14.307331	\N
882915272	3900460	Position::Fullback	29	2017-12-09 21:07:14.316954	2017-12-09 21:07:14.316954	\N
882915273	3900460	Position::Fullback	30	2017-12-09 21:07:14.323911	2017-12-09 21:07:14.323911	\N
882915274	3900460	Position::Fullback	31	2017-12-09 21:07:14.330718	2017-12-09 21:07:14.330718	\N
882915275	3900460	Position::Fullback	32	2017-12-09 21:07:14.337704	2017-12-09 21:07:14.337704	\N
882915276	3900460	Position::KickReturner	5	2017-12-09 21:07:14.346211	2017-12-09 21:07:14.346211	\N
882915277	3900460	Position::KickReturner	6	2017-12-09 21:07:14.35254	2017-12-09 21:07:14.35254	\N
882915278	3900460	Position::KickReturner	7	2017-12-09 21:07:14.358924	2017-12-09 21:07:14.358924	\N
882915279	3900460	Position::KickReturner	8	2017-12-09 21:07:14.365138	2017-12-09 21:07:14.365138	\N
882915280	3900459	Position::Punter	21	2017-12-09 21:07:14.378599	2017-12-09 21:07:14.378599	\N
882915281	3900459	Position::Punter	22	2017-12-09 21:07:14.385043	2017-12-09 21:07:14.385043	\N
882915282	3900459	Position::Punter	23	2017-12-09 21:07:14.391659	2017-12-09 21:07:14.391659	\N
882915283	3900459	Position::Punter	24	2017-12-09 21:07:14.398398	2017-12-09 21:07:14.398398	\N
882915284	3900459	Position::StrongSafety	21	2017-12-09 21:07:14.407541	2017-12-09 21:07:14.407541	\N
882915285	3900459	Position::StrongSafety	22	2017-12-09 21:07:14.414549	2017-12-09 21:07:14.414549	\N
882915286	3900459	Position::StrongSafety	23	2017-12-09 21:07:14.421495	2017-12-09 21:07:14.421495	\N
882915287	3900459	Position::StrongSafety	24	2017-12-09 21:07:14.428967	2017-12-09 21:07:14.428967	\N
882915288	3900459	Position::NoseTackle	17	2017-12-09 21:07:14.437734	2017-12-09 21:07:14.437734	\N
882915289	3900459	Position::NoseTackle	18	2017-12-09 21:07:14.444308	2017-12-09 21:07:14.444308	\N
882915290	3900459	Position::NoseTackle	19	2017-12-09 21:07:14.450879	2017-12-09 21:07:14.450879	\N
882915291	3900459	Position::NoseTackle	20	2017-12-09 21:07:14.457588	2017-12-09 21:07:14.457588	\N
882915292	3900458	Position::KickReturner	9	2017-12-09 21:07:14.471024	2017-12-09 21:07:14.471024	\N
882915293	3900458	Position::KickReturner	10	2017-12-09 21:07:14.477184	2017-12-09 21:07:14.477184	\N
882915294	3900458	Position::KickReturner	11	2017-12-09 21:07:14.483502	2017-12-09 21:07:14.483502	\N
882915295	3900458	Position::KickReturner	12	2017-12-09 21:07:14.489832	2017-12-09 21:07:14.489832	\N
882915296	3900458	Position::Quarterback	833410106	2017-12-09 21:07:14.499019	2017-12-09 21:07:14.499019	\N
882915297	3900458	Position::Quarterback	833410107	2017-12-09 21:07:14.505619	2017-12-09 21:07:14.505619	\N
882915298	3900458	Position::Quarterback	833410108	2017-12-09 21:07:14.512272	2017-12-09 21:07:14.512272	\N
882915299	3900458	Position::Quarterback	833410109	2017-12-09 21:07:14.518937	2017-12-09 21:07:14.518937	\N
882915300	3900458	Position::Kicker	13	2017-12-09 21:07:14.528067	2017-12-09 21:07:14.528067	\N
882915301	3900458	Position::Kicker	14	2017-12-09 21:07:14.53467	2017-12-09 21:07:14.53467	\N
882915302	3900458	Position::Kicker	15	2017-12-09 21:07:14.541262	2017-12-09 21:07:14.541262	\N
882915303	3900458	Position::Kicker	16	2017-12-09 21:07:14.548109	2017-12-09 21:07:14.548109	\N
882915304	3900457	Position::Fullback	33	2017-12-09 21:07:14.561865	2017-12-09 21:07:14.561865	\N
882915305	3900457	Position::Fullback	34	2017-12-09 21:07:14.568438	2017-12-09 21:07:14.568438	\N
882915306	3900457	Position::Fullback	35	2017-12-09 21:07:14.575457	2017-12-09 21:07:14.575457	\N
882915307	3900457	Position::Fullback	36	2017-12-09 21:07:14.582306	2017-12-09 21:07:14.582306	\N
882915308	3900457	Position::DefensiveTackle	17	2017-12-09 21:07:14.609281	2017-12-09 21:07:14.609281	\N
882915309	3900457	Position::DefensiveTackle	18	2017-12-09 21:07:14.616276	2017-12-09 21:07:14.616276	\N
882915310	3900457	Position::DefensiveTackle	19	2017-12-09 21:07:14.622893	2017-12-09 21:07:14.622893	\N
882915311	3900457	Position::DefensiveTackle	20	2017-12-09 21:07:14.630522	2017-12-09 21:07:14.630522	\N
882915312	3900457	Position::RightGuard	9	2017-12-09 21:07:14.639828	2017-12-09 21:07:14.639828	\N
882915313	3900457	Position::RightGuard	10	2017-12-09 21:07:14.646172	2017-12-09 21:07:14.646172	\N
882915314	3900457	Position::RightGuard	11	2017-12-09 21:07:14.652202	2017-12-09 21:07:14.652202	\N
882915315	3900457	Position::RightGuard	12	2017-12-09 21:07:14.658159	2017-12-09 21:07:14.658159	\N
882915316	3900456	Position::RightTackle	21	2017-12-09 21:07:14.67095	2017-12-09 21:07:14.67095	\N
882915317	3900456	Position::RightTackle	22	2017-12-09 21:07:14.677114	2017-12-09 21:07:14.677114	\N
882915318	3900456	Position::RightTackle	23	2017-12-09 21:07:14.683205	2017-12-09 21:07:14.683205	\N
882915319	3900456	Position::RightTackle	24	2017-12-09 21:07:14.689219	2017-12-09 21:07:14.689219	\N
882915320	3900456	Position::Kicker	17	2017-12-09 21:07:14.698044	2017-12-09 21:07:14.698044	\N
882915321	3900456	Position::Kicker	18	2017-12-09 21:07:14.704238	2017-12-09 21:07:14.704238	\N
882915322	3900456	Position::Kicker	19	2017-12-09 21:07:14.710524	2017-12-09 21:07:14.710524	\N
882915323	3900456	Position::Kicker	20	2017-12-09 21:07:14.716703	2017-12-09 21:07:14.716703	\N
882915324	3900455	Position::PuntReturner	17	2017-12-09 21:07:14.743369	2017-12-09 21:07:14.743369	\N
882915325	3900455	Position::PuntReturner	18	2017-12-09 21:07:14.749626	2017-12-09 21:07:14.749626	\N
882915326	3900455	Position::PuntReturner	19	2017-12-09 21:07:14.755684	2017-12-09 21:07:14.755684	\N
882915327	3900455	Position::PuntReturner	20	2017-12-09 21:07:14.763307	2017-12-09 21:07:14.763307	\N
882915328	3900455	Position::DefensiveEnd	13	2017-12-09 21:07:14.771971	2017-12-09 21:07:14.771971	\N
882915329	3900455	Position::DefensiveEnd	14	2017-12-09 21:07:14.778349	2017-12-09 21:07:14.778349	\N
882915330	3900455	Position::DefensiveEnd	15	2017-12-09 21:07:14.785397	2017-12-09 21:07:14.785397	\N
882915331	3900455	Position::DefensiveEnd	16	2017-12-09 21:07:14.79197	2017-12-09 21:07:14.79197	\N
882915332	3900455	Position::RightGuard	13	2017-12-09 21:07:14.801183	2017-12-09 21:07:14.801183	\N
882915333	3900455	Position::RightGuard	14	2017-12-09 21:07:14.80789	2017-12-09 21:07:14.80789	\N
882915334	3900455	Position::RightGuard	15	2017-12-09 21:07:14.814523	2017-12-09 21:07:14.814523	\N
882915335	3900455	Position::RightGuard	16	2017-12-09 21:07:14.820537	2017-12-09 21:07:14.820537	\N
882915336	3900454	Position::Punter	25	2017-12-09 21:07:14.833031	2017-12-09 21:07:14.833031	\N
882915337	3900454	Position::Punter	26	2017-12-09 21:07:14.839359	2017-12-09 21:07:14.839359	\N
882915338	3900454	Position::Punter	27	2017-12-09 21:07:14.845519	2017-12-09 21:07:14.845519	\N
882915339	3900454	Position::Punter	28	2017-12-09 21:07:14.85159	2017-12-09 21:07:14.85159	\N
882915340	3900454	Position::LeftTackle	21	2017-12-09 21:07:14.859861	2017-12-09 21:07:14.859861	\N
882915341	3900454	Position::LeftTackle	22	2017-12-09 21:07:14.865627	2017-12-09 21:07:14.865627	\N
882915342	3900454	Position::LeftTackle	23	2017-12-09 21:07:14.871368	2017-12-09 21:07:14.871368	\N
882915343	3900454	Position::LeftTackle	24	2017-12-09 21:07:14.877257	2017-12-09 21:07:14.877257	\N
882915344	3900454	Position::Center	844088304	2017-12-09 21:07:14.885495	2017-12-09 21:07:14.885495	\N
882915345	3900454	Position::Center	844088305	2017-12-09 21:07:14.891882	2017-12-09 21:07:14.891882	\N
882915346	3900454	Position::Center	844088306	2017-12-09 21:07:14.898307	2017-12-09 21:07:14.898307	\N
882915347	3900454	Position::Center	844088307	2017-12-09 21:07:14.904347	2017-12-09 21:07:14.904347	\N
882915348	3900453	Position::InsideLinebacker	17	2017-12-09 21:07:14.917311	2017-12-09 21:07:14.917311	\N
882915349	3900453	Position::InsideLinebacker	18	2017-12-09 21:07:14.923988	2017-12-09 21:07:14.923988	\N
882915350	3900453	Position::InsideLinebacker	19	2017-12-09 21:07:14.930388	2017-12-09 21:07:14.930388	\N
882915351	3900453	Position::InsideLinebacker	20	2017-12-09 21:07:14.937115	2017-12-09 21:07:14.937115	\N
882915352	3900453	Position::NoseTackle	21	2017-12-09 21:07:14.946447	2017-12-09 21:07:14.946447	\N
882915353	3900453	Position::NoseTackle	22	2017-12-09 21:07:14.954483	2017-12-09 21:07:14.954483	\N
882915354	3900453	Position::NoseTackle	23	2017-12-09 21:07:14.961674	2017-12-09 21:07:14.961674	\N
882915355	3900453	Position::NoseTackle	24	2017-12-09 21:07:14.968933	2017-12-09 21:07:14.968933	\N
882915356	3900452	Position::TightEnd	5	2017-12-09 21:07:14.997026	2017-12-09 21:07:14.997026	\N
882915357	3900452	Position::TightEnd	6	2017-12-09 21:07:15.003385	2017-12-09 21:07:15.003385	\N
882915358	3900452	Position::TightEnd	7	2017-12-09 21:07:15.009893	2017-12-09 21:07:15.009893	\N
882915359	3900452	Position::TightEnd	8	2017-12-09 21:07:15.016247	2017-12-09 21:07:15.016247	\N
882915360	3900452	Position::Quarterback	833410110	2017-12-09 21:07:15.025211	2017-12-09 21:07:15.025211	\N
882915361	3900452	Position::Quarterback	833410111	2017-12-09 21:07:15.031734	2017-12-09 21:07:15.031734	\N
882915362	3900452	Position::Quarterback	833410112	2017-12-09 21:07:15.082753	2017-12-09 21:07:15.082753	\N
882915363	3900452	Position::Quarterback	833410113	2017-12-09 21:07:15.090195	2017-12-09 21:07:15.090195	\N
882915364	3900452	Position::RunningBack	927202852	2017-12-09 21:07:15.099406	2017-12-09 21:07:15.099406	\N
882915365	3900452	Position::RunningBack	927202853	2017-12-09 21:07:15.106296	2017-12-09 21:07:15.106296	\N
882915366	3900452	Position::RunningBack	927202854	2017-12-09 21:07:15.112828	2017-12-09 21:07:15.112828	\N
882915367	3900452	Position::RunningBack	927202855	2017-12-09 21:07:15.11923	2017-12-09 21:07:15.11923	\N
882915368	3900451	Position::PuntReturner	21	2017-12-09 21:07:15.132474	2017-12-09 21:07:15.132474	\N
882915369	3900451	Position::PuntReturner	22	2017-12-09 21:07:15.138962	2017-12-09 21:07:15.138962	\N
882915370	3900451	Position::PuntReturner	23	2017-12-09 21:07:15.145628	2017-12-09 21:07:15.145628	\N
882915371	3900451	Position::PuntReturner	24	2017-12-09 21:07:15.152785	2017-12-09 21:07:15.152785	\N
882915372	3900451	Position::MiddleLinebacker	9	2017-12-09 21:07:15.16277	2017-12-09 21:07:15.16277	\N
882915373	3900451	Position::MiddleLinebacker	10	2017-12-09 21:07:15.170578	2017-12-09 21:07:15.170578	\N
882915374	3900451	Position::MiddleLinebacker	11	2017-12-09 21:07:15.177944	2017-12-09 21:07:15.177944	\N
882915375	3900451	Position::MiddleLinebacker	12	2017-12-09 21:07:15.185939	2017-12-09 21:07:15.185939	\N
882915376	3900451	Position::DefensiveEnd	17	2017-12-09 21:07:15.195763	2017-12-09 21:07:15.195763	\N
882915377	3900451	Position::DefensiveEnd	18	2017-12-09 21:07:15.203678	2017-12-09 21:07:15.203678	\N
882915378	3900451	Position::DefensiveEnd	19	2017-12-09 21:07:15.210192	2017-12-09 21:07:15.210192	\N
882915379	3900451	Position::DefensiveEnd	20	2017-12-09 21:07:15.216751	2017-12-09 21:07:15.216751	\N
882915380	3900450	Position::InsideLinebacker	21	2017-12-09 21:07:15.23052	2017-12-09 21:07:15.23052	\N
882915381	3900450	Position::InsideLinebacker	22	2017-12-09 21:07:15.237002	2017-12-09 21:07:15.237002	\N
882915382	3900450	Position::InsideLinebacker	23	2017-12-09 21:07:15.243654	2017-12-09 21:07:15.243654	\N
882915383	3900450	Position::InsideLinebacker	24	2017-12-09 21:07:15.250699	2017-12-09 21:07:15.250699	\N
882915384	3900450	Position::Center	844088308	2017-12-09 21:07:15.260524	2017-12-09 21:07:15.260524	\N
882915385	3900450	Position::Center	844088309	2017-12-09 21:07:15.267105	2017-12-09 21:07:15.267105	\N
882915386	3900450	Position::Center	844088310	2017-12-09 21:07:15.273577	2017-12-09 21:07:15.273577	\N
882915387	3900450	Position::Center	844088311	2017-12-09 21:07:15.280766	2017-12-09 21:07:15.280766	\N
882915388	3900449	Position::NoseTackle	25	2017-12-09 21:07:15.310147	2017-12-09 21:07:15.310147	\N
882915389	3900449	Position::NoseTackle	26	2017-12-09 21:07:15.321704	2017-12-09 21:07:15.321704	\N
882915390	3900449	Position::NoseTackle	27	2017-12-09 21:07:15.329626	2017-12-09 21:07:15.329626	\N
882915391	3900449	Position::NoseTackle	28	2017-12-09 21:07:15.338487	2017-12-09 21:07:15.338487	\N
882915392	3900449	Position::TightEnd	9	2017-12-09 21:07:15.363047	2017-12-09 21:07:15.363047	\N
882915393	3900449	Position::TightEnd	10	2017-12-09 21:07:15.369223	2017-12-09 21:07:15.369223	\N
882915394	3900449	Position::TightEnd	11	2017-12-09 21:07:15.375864	2017-12-09 21:07:15.375864	\N
882915395	3900449	Position::TightEnd	12	2017-12-09 21:07:15.38199	2017-12-09 21:07:15.38199	\N
882915396	3900448	Position::OutsideLinebacker	13	2017-12-09 21:07:15.396302	2017-12-09 21:07:15.396302	\N
882915397	3900448	Position::OutsideLinebacker	14	2017-12-09 21:07:15.403754	2017-12-09 21:07:15.403754	\N
882915398	3900448	Position::OutsideLinebacker	15	2017-12-09 21:07:15.411457	2017-12-09 21:07:15.411457	\N
882915399	3900448	Position::OutsideLinebacker	16	2017-12-09 21:07:15.418779	2017-12-09 21:07:15.418779	\N
882915400	3900448	Position::Guard	17	2017-12-09 21:07:15.42776	2017-12-09 21:07:15.42776	\N
882915401	3900448	Position::Guard	18	2017-12-09 21:07:15.434074	2017-12-09 21:07:15.434074	\N
882915402	3900448	Position::Guard	19	2017-12-09 21:07:15.440384	2017-12-09 21:07:15.440384	\N
882915403	3900448	Position::Guard	20	2017-12-09 21:07:15.446993	2017-12-09 21:07:15.446993	\N
882915404	3900448	Position::Tackle	21	2017-12-09 21:07:15.472923	2017-12-09 21:07:15.472923	\N
882915405	3900448	Position::Tackle	22	2017-12-09 21:07:15.479437	2017-12-09 21:07:15.479437	\N
882915406	3900448	Position::Tackle	23	2017-12-09 21:07:15.485635	2017-12-09 21:07:15.485635	\N
882915407	3900448	Position::Tackle	24	2017-12-09 21:07:15.491644	2017-12-09 21:07:15.491644	\N
882915408	3900447	Position::Cornerback	33	2017-12-09 21:07:15.504833	2017-12-09 21:07:15.504833	\N
882915409	3900447	Position::Cornerback	34	2017-12-09 21:07:15.511377	2017-12-09 21:07:15.511377	\N
882915410	3900447	Position::Cornerback	35	2017-12-09 21:07:15.519013	2017-12-09 21:07:15.519013	\N
882915411	3900447	Position::Cornerback	36	2017-12-09 21:07:15.526127	2017-12-09 21:07:15.526127	\N
882915412	3900447	Position::Punter	29	2017-12-09 21:07:15.534789	2017-12-09 21:07:15.534789	\N
882915413	3900447	Position::Punter	30	2017-12-09 21:07:15.541001	2017-12-09 21:07:15.541001	\N
882915414	3900447	Position::Punter	31	2017-12-09 21:07:15.54713	2017-12-09 21:07:15.54713	\N
882915415	3900447	Position::Punter	32	2017-12-09 21:07:15.553436	2017-12-09 21:07:15.553436	\N
882915416	3900447	Position::KickReturner	13	2017-12-09 21:07:15.562664	2017-12-09 21:07:15.562664	\N
882915417	3900447	Position::KickReturner	14	2017-12-09 21:07:15.56896	2017-12-09 21:07:15.56896	\N
882915418	3900447	Position::KickReturner	15	2017-12-09 21:07:15.575037	2017-12-09 21:07:15.575037	\N
882915419	3900447	Position::KickReturner	16	2017-12-09 21:07:15.580921	2017-12-09 21:07:15.580921	\N
882915420	3900446	Position::Guard	21	2017-12-09 21:07:15.593765	2017-12-09 21:07:15.593765	\N
882915421	3900446	Position::Guard	22	2017-12-09 21:07:15.601575	2017-12-09 21:07:15.601575	\N
882915422	3900446	Position::Guard	23	2017-12-09 21:07:15.609404	2017-12-09 21:07:15.609404	\N
882915423	3900446	Position::Guard	24	2017-12-09 21:07:15.615324	2017-12-09 21:07:15.615324	\N
882915424	3900446	Position::Quarterback	833410114	2017-12-09 21:07:15.624125	2017-12-09 21:07:15.624125	\N
882915425	3900446	Position::Quarterback	833410115	2017-12-09 21:07:15.631211	2017-12-09 21:07:15.631211	\N
882915426	3900446	Position::Quarterback	833410116	2017-12-09 21:07:15.637569	2017-12-09 21:07:15.637569	\N
882915427	3900446	Position::Quarterback	833410117	2017-12-09 21:07:15.643851	2017-12-09 21:07:15.643851	\N
882915428	3900446	Position::Kicker	21	2017-12-09 21:07:15.652518	2017-12-09 21:07:15.652518	\N
882915429	3900446	Position::Kicker	22	2017-12-09 21:07:15.6602	2017-12-09 21:07:15.6602	\N
882915430	3900446	Position::Kicker	23	2017-12-09 21:07:15.666681	2017-12-09 21:07:15.666681	\N
882915431	3900446	Position::Kicker	24	2017-12-09 21:07:15.672986	2017-12-09 21:07:15.672986	\N
882915432	3900445	Position::FreeSafety	17	2017-12-09 21:07:15.686544	2017-12-09 21:07:15.686544	\N
882915433	3900445	Position::FreeSafety	18	2017-12-09 21:07:15.693102	2017-12-09 21:07:15.693102	\N
882915434	3900445	Position::FreeSafety	19	2017-12-09 21:07:15.699513	2017-12-09 21:07:15.699513	\N
882915435	3900445	Position::FreeSafety	20	2017-12-09 21:07:15.706022	2017-12-09 21:07:15.706022	\N
882915436	3900445	Position::RightTackle	25	2017-12-09 21:07:15.714794	2017-12-09 21:07:15.714794	\N
882915437	3900445	Position::RightTackle	26	2017-12-09 21:07:15.720965	2017-12-09 21:07:15.720965	\N
882915438	3900445	Position::RightTackle	27	2017-12-09 21:07:15.727195	2017-12-09 21:07:15.727195	\N
882915439	3900445	Position::RightTackle	28	2017-12-09 21:07:15.733201	2017-12-09 21:07:15.733201	\N
882915440	3900445	Position::OutsideLinebacker	17	2017-12-09 21:07:15.742224	2017-12-09 21:07:15.742224	\N
882915441	3900445	Position::OutsideLinebacker	18	2017-12-09 21:07:15.748744	2017-12-09 21:07:15.748744	\N
882915442	3900445	Position::OutsideLinebacker	19	2017-12-09 21:07:15.755367	2017-12-09 21:07:15.755367	\N
882915443	3900445	Position::OutsideLinebacker	20	2017-12-09 21:07:15.761731	2017-12-09 21:07:15.761731	\N
882915444	3900444	Position::LeftGuard	33	2017-12-09 21:07:15.774221	2017-12-09 21:07:15.774221	\N
882915445	3900444	Position::LeftGuard	34	2017-12-09 21:07:15.779999	2017-12-09 21:07:15.779999	\N
882915446	3900444	Position::LeftGuard	35	2017-12-09 21:07:15.78612	2017-12-09 21:07:15.78612	\N
882915447	3900444	Position::LeftGuard	36	2017-12-09 21:07:15.791886	2017-12-09 21:07:15.791886	\N
882915448	3900444	Position::PuntReturner	25	2017-12-09 21:07:15.80016	2017-12-09 21:07:15.80016	\N
882915449	3900444	Position::PuntReturner	26	2017-12-09 21:07:15.80627	2017-12-09 21:07:15.80627	\N
882915450	3900444	Position::PuntReturner	27	2017-12-09 21:07:15.81372	2017-12-09 21:07:15.81372	\N
882915451	3900444	Position::PuntReturner	28	2017-12-09 21:07:15.8197	2017-12-09 21:07:15.8197	\N
882915452	3900444	Position::Fullback	37	2017-12-09 21:07:15.828704	2017-12-09 21:07:15.828704	\N
882915453	3900444	Position::Fullback	38	2017-12-09 21:07:15.835238	2017-12-09 21:07:15.835238	\N
882915454	3900444	Position::Fullback	39	2017-12-09 21:07:15.841808	2017-12-09 21:07:15.841808	\N
882915455	3900444	Position::Fullback	40	2017-12-09 21:07:15.848171	2017-12-09 21:07:15.848171	\N
882915456	3900443	Position::InsideLinebacker	25	2017-12-09 21:07:15.863059	2017-12-09 21:07:15.863059	\N
882915457	3900443	Position::InsideLinebacker	26	2017-12-09 21:07:15.871772	2017-12-09 21:07:15.871772	\N
882915458	3900443	Position::InsideLinebacker	27	2017-12-09 21:07:15.878376	2017-12-09 21:07:15.878376	\N
882915459	3900443	Position::InsideLinebacker	28	2017-12-09 21:07:15.884804	2017-12-09 21:07:15.884804	\N
882915460	3900443	Position::Center	844088312	2017-12-09 21:07:15.89358	2017-12-09 21:07:15.89358	\N
882915461	3900443	Position::Center	844088313	2017-12-09 21:07:15.900641	2017-12-09 21:07:15.900641	\N
882915462	3900443	Position::Center	844088314	2017-12-09 21:07:15.907071	2017-12-09 21:07:15.907071	\N
882915463	3900443	Position::Center	844088315	2017-12-09 21:07:15.913546	2017-12-09 21:07:15.913546	\N
882915464	3900443	Position::Quarterback	833410118	2017-12-09 21:07:15.922676	2017-12-09 21:07:15.922676	\N
882915465	3900443	Position::Quarterback	833410119	2017-12-09 21:07:15.930137	2017-12-09 21:07:15.930137	\N
882915466	3900443	Position::Quarterback	833410120	2017-12-09 21:07:15.936707	2017-12-09 21:07:15.936707	\N
882915467	3900443	Position::Quarterback	833410121	2017-12-09 21:07:15.943412	2017-12-09 21:07:15.943412	\N
882915468	3900442	Position::Cornerback	37	2017-12-09 21:07:15.957912	2017-12-09 21:07:15.957912	\N
882915469	3900442	Position::Cornerback	38	2017-12-09 21:07:15.964365	2017-12-09 21:07:15.964365	\N
882915470	3900442	Position::Cornerback	39	2017-12-09 21:07:15.971076	2017-12-09 21:07:15.971076	\N
882915471	3900442	Position::Cornerback	40	2017-12-09 21:07:15.977782	2017-12-09 21:07:15.977782	\N
882915472	3900442	Position::LeftTackle	25	2017-12-09 21:07:15.986683	2017-12-09 21:07:15.986683	\N
882915473	3900442	Position::LeftTackle	26	2017-12-09 21:07:15.992887	2017-12-09 21:07:15.992887	\N
882915474	3900442	Position::LeftTackle	27	2017-12-09 21:07:15.99903	2017-12-09 21:07:15.99903	\N
882915475	3900442	Position::LeftTackle	28	2017-12-09 21:07:16.005068	2017-12-09 21:07:16.005068	\N
882915476	3900442	Position::Tackle	25	2017-12-09 21:07:16.014399	2017-12-09 21:07:16.014399	\N
882915477	3900442	Position::Tackle	26	2017-12-09 21:07:16.020468	2017-12-09 21:07:16.020468	\N
882915478	3900442	Position::Tackle	27	2017-12-09 21:07:16.026517	2017-12-09 21:07:16.026517	\N
882915479	3900442	Position::Tackle	28	2017-12-09 21:07:16.032672	2017-12-09 21:07:16.032672	\N
882915480	3900441	Position::DefensiveTackle	21	2017-12-09 21:07:16.046432	2017-12-09 21:07:16.046432	\N
882915481	3900441	Position::DefensiveTackle	22	2017-12-09 21:07:16.05325	2017-12-09 21:07:16.05325	\N
882915482	3900441	Position::DefensiveTackle	23	2017-12-09 21:07:16.059811	2017-12-09 21:07:16.059811	\N
882915483	3900441	Position::DefensiveTackle	24	2017-12-09 21:07:16.066473	2017-12-09 21:07:16.066473	\N
882915484	3900441	Position::Quarterback	833410122	2017-12-09 21:07:16.075282	2017-12-09 21:07:16.075282	\N
882915485	3900441	Position::Quarterback	833410123	2017-12-09 21:07:16.081637	2017-12-09 21:07:16.081637	\N
882915486	3900441	Position::Quarterback	833410124	2017-12-09 21:07:16.088074	2017-12-09 21:07:16.088074	\N
882915487	3900441	Position::Quarterback	833410125	2017-12-09 21:07:16.094175	2017-12-09 21:07:16.094175	\N
882915488	3900440	Position::Center	844088316	2017-12-09 21:07:16.122284	2017-12-09 21:07:16.122284	\N
882915489	3900440	Position::Center	844088317	2017-12-09 21:07:16.128293	2017-12-09 21:07:16.128293	\N
882915490	3900440	Position::Center	844088318	2017-12-09 21:07:16.134384	2017-12-09 21:07:16.134384	\N
882915491	3900440	Position::Center	844088319	2017-12-09 21:07:16.140702	2017-12-09 21:07:16.140702	\N
882915492	3900440	Position::Punter	33	2017-12-09 21:07:16.149853	2017-12-09 21:07:16.149853	\N
882915493	3900440	Position::Punter	34	2017-12-09 21:07:16.156143	2017-12-09 21:07:16.156143	\N
882915494	3900440	Position::Punter	35	2017-12-09 21:07:16.162544	2017-12-09 21:07:16.162544	\N
882915495	3900440	Position::Punter	36	2017-12-09 21:07:16.168811	2017-12-09 21:07:16.168811	\N
882915496	3900440	Position::InsideLinebacker	29	2017-12-09 21:07:16.178172	2017-12-09 21:07:16.178172	\N
882915497	3900440	Position::InsideLinebacker	30	2017-12-09 21:07:16.184823	2017-12-09 21:07:16.184823	\N
882915498	3900440	Position::InsideLinebacker	31	2017-12-09 21:07:16.191393	2017-12-09 21:07:16.191393	\N
882915499	3900440	Position::InsideLinebacker	32	2017-12-09 21:07:16.19778	2017-12-09 21:07:16.19778	\N
882915500	3900439	Position::RightGuard	17	2017-12-09 21:07:16.211114	2017-12-09 21:07:16.211114	\N
882915501	3900439	Position::RightGuard	18	2017-12-09 21:07:16.21734	2017-12-09 21:07:16.21734	\N
882915502	3900439	Position::RightGuard	19	2017-12-09 21:07:16.223491	2017-12-09 21:07:16.223491	\N
882915503	3900439	Position::RightGuard	20	2017-12-09 21:07:16.229502	2017-12-09 21:07:16.229502	\N
882915504	3900439	Position::InsideLinebacker	33	2017-12-09 21:07:16.238473	2017-12-09 21:07:16.238473	\N
882915505	3900439	Position::InsideLinebacker	34	2017-12-09 21:07:16.245087	2017-12-09 21:07:16.245087	\N
882915506	3900439	Position::InsideLinebacker	35	2017-12-09 21:07:16.251583	2017-12-09 21:07:16.251583	\N
882915507	3900439	Position::InsideLinebacker	36	2017-12-09 21:07:16.258699	2017-12-09 21:07:16.258699	\N
882915508	3900439	Position::WideReceiver	21	2017-12-09 21:07:16.268083	2017-12-09 21:07:16.268083	\N
882915509	3900439	Position::WideReceiver	22	2017-12-09 21:07:16.288994	2017-12-09 21:07:16.288994	\N
882915510	3900439	Position::WideReceiver	23	2017-12-09 21:07:16.295219	2017-12-09 21:07:16.295219	\N
882915511	3900439	Position::WideReceiver	24	2017-12-09 21:07:16.301615	2017-12-09 21:07:16.301615	\N
882915512	3900438	Position::Guard	25	2017-12-09 21:07:16.314689	2017-12-09 21:07:16.314689	\N
882915513	3900438	Position::Guard	26	2017-12-09 21:07:16.320988	2017-12-09 21:07:16.320988	\N
882915514	3900438	Position::Guard	27	2017-12-09 21:07:16.327033	2017-12-09 21:07:16.327033	\N
882915515	3900438	Position::Guard	28	2017-12-09 21:07:16.332943	2017-12-09 21:07:16.332943	\N
882915516	3900438	Position::Punter	37	2017-12-09 21:07:16.342097	2017-12-09 21:07:16.342097	\N
882915517	3900438	Position::Punter	38	2017-12-09 21:07:16.348346	2017-12-09 21:07:16.348346	\N
882915518	3900438	Position::Punter	39	2017-12-09 21:07:16.354481	2017-12-09 21:07:16.354481	\N
882915519	3900438	Position::Punter	40	2017-12-09 21:07:16.360801	2017-12-09 21:07:16.360801	\N
882915520	3900438	Position::NoseTackle	29	2017-12-09 21:07:16.369635	2017-12-09 21:07:16.369635	\N
882915521	3900438	Position::NoseTackle	30	2017-12-09 21:07:16.376525	2017-12-09 21:07:16.376525	\N
882915522	3900438	Position::NoseTackle	31	2017-12-09 21:07:16.384148	2017-12-09 21:07:16.384148	\N
882915523	3900438	Position::NoseTackle	32	2017-12-09 21:07:16.390876	2017-12-09 21:07:16.390876	\N
882915524	3900437	Position::OutsideLinebacker	21	2017-12-09 21:07:16.405382	2017-12-09 21:07:16.405382	\N
882915525	3900437	Position::OutsideLinebacker	22	2017-12-09 21:07:16.411993	2017-12-09 21:07:16.411993	\N
882915526	3900437	Position::OutsideLinebacker	23	2017-12-09 21:07:16.418916	2017-12-09 21:07:16.418916	\N
882915527	3900437	Position::OutsideLinebacker	24	2017-12-09 21:07:16.426124	2017-12-09 21:07:16.426124	\N
882915528	3900437	Position::FreeSafety	21	2017-12-09 21:07:16.435326	2017-12-09 21:07:16.435326	\N
882915529	3900437	Position::FreeSafety	22	2017-12-09 21:07:16.442638	2017-12-09 21:07:16.442638	\N
882915530	3900437	Position::FreeSafety	23	2017-12-09 21:07:16.450163	2017-12-09 21:07:16.450163	\N
882915531	3900437	Position::FreeSafety	24	2017-12-09 21:07:16.456802	2017-12-09 21:07:16.456802	\N
882915532	3900437	Position::MiddleLinebacker	13	2017-12-09 21:07:16.465614	2017-12-09 21:07:16.465614	\N
882915533	3900437	Position::MiddleLinebacker	14	2017-12-09 21:07:16.471866	2017-12-09 21:07:16.471866	\N
882915534	3900437	Position::MiddleLinebacker	15	2017-12-09 21:07:16.478295	2017-12-09 21:07:16.478295	\N
882915535	3900437	Position::MiddleLinebacker	16	2017-12-09 21:07:16.484519	2017-12-09 21:07:16.484519	\N
\.


--
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('stats_id_seq', 882915535, true);


--
-- Data for Name: strong_safeties; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY strong_safeties (id, season, sacks, interceptions, forced_fumbles, tackles, pass_breakups, tackles_for_loss, defensive_touchdowns, created_at, updated_at) FROM stdin;
1	2016	189	89	29	38	5	155	4	2017-12-09 21:07:06.236918	2017-12-09 21:07:06.236918
2	2015	135	18	161	164	32	177	182	2017-12-09 21:07:06.244009	2017-12-09 21:07:06.244009
3	2014	182	68	68	133	189	74	199	2017-12-09 21:07:06.250216	2017-12-09 21:07:06.250216
4	2013	85	149	91	44	0	199	199	2017-12-09 21:07:06.256589	2017-12-09 21:07:06.256589
5	2018	191	59	42	164	147	158	2	2017-12-09 21:07:06.730071	2017-12-09 21:07:06.730071
6	2017	103	156	28	26	164	54	196	2017-12-09 21:07:06.736522	2017-12-09 21:07:06.736522
7	2016	89	183	33	10	89	155	133	2017-12-09 21:07:06.743113	2017-12-09 21:07:06.743113
8	2015	11	173	123	55	65	9	0	2017-12-09 21:07:06.749584	2017-12-09 21:07:06.749584
9	2016	82	20	162	123	139	177	5	2017-12-09 21:07:06.876709	2017-12-09 21:07:06.876709
10	2015	9	122	19	33	48	8	2	2017-12-09 21:07:06.88324	2017-12-09 21:07:06.88324
11	2014	36	175	109	168	135	177	90	2017-12-09 21:07:06.889711	2017-12-09 21:07:06.889711
12	2013	45	172	6	126	22	194	193	2017-12-09 21:07:06.896209	2017-12-09 21:07:06.896209
13	2019	124	15	69	22	125	43	39	2017-12-09 21:07:07.076	2017-12-09 21:07:07.076
14	2018	162	172	161	61	5	25	113	2017-12-09 21:07:07.082703	2017-12-09 21:07:07.082703
15	2017	9	123	163	174	74	80	161	2017-12-09 21:07:07.089161	2017-12-09 21:07:07.089161
16	2016	171	143	130	14	15	90	5	2017-12-09 21:07:07.095666	2017-12-09 21:07:07.095666
17	2019	194	28	135	182	106	153	136	2017-12-09 21:07:13.436009	2017-12-09 21:07:13.436009
18	2018	42	93	140	68	85	3	102	2017-12-09 21:07:13.442669	2017-12-09 21:07:13.442669
19	2017	38	169	146	21	139	109	80	2017-12-09 21:07:13.449773	2017-12-09 21:07:13.449773
20	2016	91	193	46	184	199	45	190	2017-12-09 21:07:13.45674	2017-12-09 21:07:13.45674
21	2017	90	5	120	23	114	81	190	2017-12-09 21:07:14.405793	2017-12-09 21:07:14.405793
22	2016	81	153	37	147	26	70	168	2017-12-09 21:07:14.412713	2017-12-09 21:07:14.412713
23	2015	5	3	10	103	76	53	1	2017-12-09 21:07:14.419778	2017-12-09 21:07:14.419778
24	2014	165	88	13	49	63	121	1	2017-12-09 21:07:14.426616	2017-12-09 21:07:14.426616
\.


--
-- Name: strong_safeties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('strong_safeties_id_seq', 24, true);


--
-- Data for Name: tackles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY tackles (id, season, pancakes, sacks_allowed, created_at, updated_at) FROM stdin;
1	2018	6	165	2017-12-09 21:07:05.234216	2017-12-09 21:07:05.234216
2	2017	51	42	2017-12-09 21:07:05.240606	2017-12-09 21:07:05.240606
3	2016	185	184	2017-12-09 21:07:05.24652	2017-12-09 21:07:05.24652
4	2015	53	113	2017-12-09 21:07:05.2525	2017-12-09 21:07:05.2525
5	2016	97	117	2017-12-09 21:07:05.82641	2017-12-09 21:07:05.82641
6	2015	154	67	2017-12-09 21:07:05.832717	2017-12-09 21:07:05.832717
7	2014	138	35	2017-12-09 21:07:05.838914	2017-12-09 21:07:05.838914
8	2013	106	129	2017-12-09 21:07:05.845164	2017-12-09 21:07:05.845164
9	2018	60	131	2017-12-09 21:07:06.703056	2017-12-09 21:07:06.703056
10	2017	122	186	2017-12-09 21:07:06.709172	2017-12-09 21:07:06.709172
11	2016	109	90	2017-12-09 21:07:06.715369	2017-12-09 21:07:06.715369
12	2015	137	156	2017-12-09 21:07:06.721477	2017-12-09 21:07:06.721477
13	2017	190	138	2017-12-09 21:07:07.391941	2017-12-09 21:07:07.391941
14	2016	19	196	2017-12-09 21:07:07.398275	2017-12-09 21:07:07.398275
15	2015	141	52	2017-12-09 21:07:07.404445	2017-12-09 21:07:07.404445
16	2014	104	8	2017-12-09 21:07:07.410552	2017-12-09 21:07:07.410552
17	2018	164	91	2017-12-09 21:07:13.525496	2017-12-09 21:07:13.525496
18	2017	60	25	2017-12-09 21:07:13.532184	2017-12-09 21:07:13.532184
19	2016	174	146	2017-12-09 21:07:13.538983	2017-12-09 21:07:13.538983
20	2015	127	110	2017-12-09 21:07:13.545222	2017-12-09 21:07:13.545222
21	2019	27	111	2017-12-09 21:07:15.471201	2017-12-09 21:07:15.471201
22	2018	54	89	2017-12-09 21:07:15.477899	2017-12-09 21:07:15.477899
23	2017	33	120	2017-12-09 21:07:15.484122	2017-12-09 21:07:15.484122
24	2016	111	3	2017-12-09 21:07:15.490192	2017-12-09 21:07:15.490192
25	2018	53	97	2017-12-09 21:07:16.012804	2017-12-09 21:07:16.012804
26	2017	112	59	2017-12-09 21:07:16.018999	2017-12-09 21:07:16.018999
27	2016	167	110	2017-12-09 21:07:16.025013	2017-12-09 21:07:16.025013
28	2015	142	10	2017-12-09 21:07:16.031178	2017-12-09 21:07:16.031178
\.


--
-- Name: tackles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('tackles_id_seq', 28, true);


--
-- Data for Name: tight_ends; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY tight_ends (id, season, receiving_yards, catches, receiving_touchdowns, created_at, updated_at) FROM stdin;
1	2017	2	75	192	2017-12-09 21:07:06.588391	2017-12-09 21:07:06.588391
2	2016	19	129	147	2017-12-09 21:07:06.595127	2017-12-09 21:07:06.595127
3	2015	180	125	167	2017-12-09 21:07:06.601081	2017-12-09 21:07:06.601081
4	2014	126	89	156	2017-12-09 21:07:06.607073	2017-12-09 21:07:06.607073
5	2017	56	16	1	2017-12-09 21:07:14.995308	2017-12-09 21:07:14.995308
6	2016	3	113	8	2017-12-09 21:07:15.001837	2017-12-09 21:07:15.001837
7	2015	42	127	116	2017-12-09 21:07:15.008128	2017-12-09 21:07:15.008128
8	2014	179	155	183	2017-12-09 21:07:15.014733	2017-12-09 21:07:15.014733
9	2017	146	182	96	2017-12-09 21:07:15.361287	2017-12-09 21:07:15.361287
10	2016	11	95	192	2017-12-09 21:07:15.367698	2017-12-09 21:07:15.367698
11	2015	157	81	199	2017-12-09 21:07:15.374331	2017-12-09 21:07:15.374331
12	2014	131	34	144	2017-12-09 21:07:15.380508	2017-12-09 21:07:15.380508
\.


--
-- Name: tight_ends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('tight_ends_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, profile_type, profile_id, role, completed_registration_at, created_at, updated_at, invitation_token, invitation_created_at, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_type, invited_by_id, invitations_count) FROM stdin;
912548329	juanita_prohaska@example.com	$2a$10$3ujLwz29jsZ9elRi7iiHOeb6uwEwVh4gHHJw1lkEXd1d6z0.Wvz8S	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170961	1	2017-12-09 21:06:18.93581	2017-12-09 21:06:19.071428	2017-12-09 21:06:19.071428	\N	\N	\N	\N	\N	\N	\N	0
912548330	murl_murphy@example.com	$2a$10$LPOauuZHQSO9gEVQP7w6/./.O4auqd5s58XcKrUgsCcgd.j5rBopW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170962	1	2017-12-09 21:06:19.096	2017-12-09 21:06:19.166548	2017-12-09 21:06:19.166548	\N	\N	\N	\N	\N	\N	\N	0
912548331	frieda_johns@example.com	$2a$10$QNGLQSH8EZy95KPTRLY00.7sc88GMrh/BOQ0I56R5zvKlP2Qjwcsu	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170963	1	2017-12-09 21:06:19.173192	2017-12-09 21:06:19.244725	2017-12-09 21:06:19.244725	\N	\N	\N	\N	\N	\N	\N	0
912548332	loy_moen@example.com	$2a$10$bk2sXXQinXgCLWd74tX4AurV7BDfdzejlD4Sx79/aMAWII2mOaiSK	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900437	1	2017-12-09 21:06:19.366801	2017-12-09 21:06:19.438041	2017-12-09 21:06:19.438041	\N	\N	\N	\N	\N	\N	\N	0
912547608	high_school_coach@example.com	$2a$10$WKfiiOEv6Pczzl2yrKQwJuKFtyM./P7Yzb3qOSSNDiJF2MVcNmF86	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170480	1	\N	2017-12-09 19:45:42.979172	2017-12-09 19:45:42.979172	\N	\N	\N	\N	\N	\N	\N	0
912548333	furman_klein@example.com	$2a$10$xQ5Sv2tFWlnlsL231uFXlOTmKrK6EGDOv/SgZwLQ7PqN.mjh6nNB.	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900438	1	2017-12-09 21:06:19.486077	2017-12-09 21:06:19.556906	2017-12-09 21:06:19.556906	\N	\N	\N	\N	\N	\N	\N	0
912548334	tamara_swift@example.com	$2a$10$M4TJuDGbcLD0N1WIUeLYw./SOSE/2UABu2CIuZTgDKdl/346DybV2	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900439	1	2017-12-09 21:06:19.568229	2017-12-09 21:06:19.63927	2017-12-09 21:06:19.63927	\N	\N	\N	\N	\N	\N	\N	0
912548335	darion_huel@example.com	$2a$10$WztpsTlTe52W3GLY7xwPHeNoLhkyZGRcYXA0ZTd6oJPAqUqHUHKQi	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170964	1	2017-12-09 21:06:19.655885	2017-12-09 21:06:19.727933	2017-12-09 21:06:19.727933	\N	\N	\N	\N	\N	\N	\N	0
912548336	kamryn_fahey@example.com	$2a$10$BoRhEX0lKPBGO5medzY0ve5mHB386QyMGj4HDgpVTZ0TQ2/8Jeyme	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170965	1	2017-12-09 21:06:19.734855	2017-12-09 21:06:19.805412	2017-12-09 21:06:19.805412	\N	\N	\N	\N	\N	\N	\N	0
912548337	jane_harris@example.com	$2a$10$NEatTsaEE/dCkSbDAdK0EORIKTNU4zef1dAYrq1Ks5ZKChI8g9JoW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170966	1	2017-12-09 21:06:19.812323	2017-12-09 21:06:19.884687	2017-12-09 21:06:19.884687	\N	\N	\N	\N	\N	\N	\N	0
912548338	leo_ullrich@example.com	$2a$10$rmMNvZEx7amB8xOTa57.EOCCxYxqDWucJ1pu6qq83qQdwportmata	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900440	1	2017-12-09 21:06:19.896103	2017-12-09 21:06:19.967467	2017-12-09 21:06:19.967467	\N	\N	\N	\N	\N	\N	\N	0
912548339	lilly_gottlieb@example.com	$2a$10$bFamNaYIotbvSL/5k4ubPe3xsmTK8HeK3SY2sIlAOTH39XzM19zdO	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900441	1	2017-12-09 21:06:19.979376	2017-12-09 21:06:20.054853	2017-12-09 21:06:20.054853	\N	\N	\N	\N	\N	\N	\N	0
912548340	charley_johnson@example.com	$2a$10$mi4gw6aYm.krf.j2QnCMveI4h/xdRYEPq2h9TERc/ag5Rf9dw5AEG	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900442	1	2017-12-09 21:06:20.066693	2017-12-09 21:06:20.139065	2017-12-09 21:06:20.139065	\N	\N	\N	\N	\N	\N	\N	0
912548341	catharine_carter@example.com	$2a$10$CUeZxuUifGxutW2OO6rVLeOgHBEsFsqYHrnXeto9Dku9ab34sotYu	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170967	1	2017-12-09 21:06:20.156641	2017-12-09 21:06:20.229695	2017-12-09 21:06:20.229695	\N	\N	\N	\N	\N	\N	\N	0
912548342	ben_berge@example.com	$2a$10$Ji1UuAEh3Iuy0oQdw3U.GO0Ti89WbGsz9V89gNc1/ltF/HVQYCTKO	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170968	1	2017-12-09 21:06:20.237399	2017-12-09 21:06:20.30812	2017-12-09 21:06:20.30812	\N	\N	\N	\N	\N	\N	\N	0
912548343	gwen_lind@example.com	$2a$10$gr6EzZaowqS0dQUIFBpj3.ojs8PbXvCgsO8tNlIybLq14gL9b./MS	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170969	1	2017-12-09 21:06:20.315389	2017-12-09 21:06:20.386281	2017-12-09 21:06:20.386281	\N	\N	\N	\N	\N	\N	\N	0
912548344	wilford_schamberger@example.com	$2a$10$w4V6eG9zGJ7aEya8zzCqJOIMJHMpoyXPnwDpYumn43Sfj5LT8Tmbm	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900443	1	2017-12-09 21:06:20.398777	2017-12-09 21:06:20.46994	2017-12-09 21:06:20.46994	\N	\N	\N	\N	\N	\N	\N	0
912548345	max_heidenreich@example.com	$2a$10$9oO85D/5tZRD5pSmwNZLruCFNqTm2kt4/LIzXtJDvTQNFrcZ5k7Yq	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900444	1	2017-12-09 21:06:20.480922	2017-12-09 21:06:20.551851	2017-12-09 21:06:20.551851	\N	\N	\N	\N	\N	\N	\N	0
912548346	carissa_walker@example.com	$2a$10$Kom25/z/HbjQ9lEpNODVSO1pn53A42nQRDpiPfdQECwIQgZgURaJa	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900445	1	2017-12-09 21:06:20.562974	2017-12-09 21:06:20.635062	2017-12-09 21:06:20.635062	\N	\N	\N	\N	\N	\N	\N	0
912548347	elenor_trantow@example.com	$2a$10$w66pSAs5HdP21UUsizz8FOj9CoAFyqKIobRdfgZf.ZB4sPEGkCoca	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170970	1	2017-12-09 21:06:20.653076	2017-12-09 21:06:20.724998	2017-12-09 21:06:20.724998	\N	\N	\N	\N	\N	\N	\N	0
912548348	florida_kling@example.com	$2a$10$zeEfH7TM9MVsyU1PlLEjk.XXVxHCSReg2A8Pmz.WyH1Z/RVqPFOUS	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170971	1	2017-12-09 21:06:20.731994	2017-12-09 21:06:20.803698	2017-12-09 21:06:20.803698	\N	\N	\N	\N	\N	\N	\N	0
912548349	vesta_beer@example.com	$2a$10$n8IHuHrc6uREvzvgkkS/iubowR0DTT.SIcOsk2U2/uOoQv6vHx1x.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170972	1	2017-12-09 21:06:20.810744	2017-12-09 21:06:20.882806	2017-12-09 21:06:20.882806	\N	\N	\N	\N	\N	\N	\N	0
912548350	norene_cartwright@example.com	$2a$10$smQdLEdP8XNwP.bMdX3lCeKtuzuFjwkG00HLwbshS8rgHNitBptkm	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900446	1	2017-12-09 21:06:20.895793	2017-12-09 21:06:20.972896	2017-12-09 21:06:20.972896	\N	\N	\N	\N	\N	\N	\N	0
912548351	brice_schuster@example.com	$2a$10$nxCR9U2ZA0.YJKNY5tPS/OI7uqzj/qo4GxCAajt.beUXg0psqaRJq	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900447	1	2017-12-09 21:06:20.985963	2017-12-09 21:06:21.057627	2017-12-09 21:06:21.057627	\N	\N	\N	\N	\N	\N	\N	0
912548352	otha_swift@example.com	$2a$10$Mq9Iji1z1NswoMFec0JowuNMg5pdGKDKsendDRdm3SFGGHoxPnNa6	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900448	1	2017-12-09 21:06:21.07048	2017-12-09 21:06:21.143434	2017-12-09 21:06:21.143434	\N	\N	\N	\N	\N	\N	\N	0
912548353	hugh_durgan@example.com	$2a$10$jFyaeeZnd39K9Ho/ze2iQeP4obe0Ac2JkK8hoh6gDhc/val7YFRYS	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170973	1	2017-12-09 21:06:21.162152	2017-12-09 21:06:21.235071	2017-12-09 21:06:21.235071	\N	\N	\N	\N	\N	\N	\N	0
912548354	reyna_leannon@example.com	$2a$10$QwX.eH86xvf4zsqR8kqp9OgtqlXaHANR9EC05KX4ZIStpaXF69DMi	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170974	1	2017-12-09 21:06:21.242956	2017-12-09 21:06:21.315246	2017-12-09 21:06:21.315246	\N	\N	\N	\N	\N	\N	\N	0
912548355	esther_zemlak@example.com	$2a$10$m2KJNwv5418Y2V4gsOK7WOlbEltB0uJm9NrIIi64eCzfS.v.b5gGm	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170975	1	2017-12-09 21:06:21.323181	2017-12-09 21:06:21.39447	2017-12-09 21:06:21.39447	\N	\N	\N	\N	\N	\N	\N	0
912548356	hal_wunsch@example.com	$2a$10$nbjTiXyjvkNS1ZhONbf.iOJ64lC2pRI0ybgch4CHyuZCeS/AIcky.	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900449	1	2017-12-09 21:06:21.406923	2017-12-09 21:06:21.477225	2017-12-09 21:06:21.477225	\N	\N	\N	\N	\N	\N	\N	0
912548357	delphine_walker@example.com	$2a$10$aokmcLXz1y7tl3QR3yGSP.G9mhPrLSRFuBwMWM/raLjXUt0gn85TG	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900450	1	2017-12-09 21:06:21.489931	2017-12-09 21:06:21.561708	2017-12-09 21:06:21.561708	\N	\N	\N	\N	\N	\N	\N	0
912548358	phoebe_eichmann@example.com	$2a$10$2tl4OwOFEtcU2geUK6bENefyl8/R7EXtR/kTQ4pEb4Cqll73tn4mK	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900451	1	2017-12-09 21:06:21.573667	2017-12-09 21:06:21.644323	2017-12-09 21:06:21.644323	\N	\N	\N	\N	\N	\N	\N	0
912548359	everett_rutherford@example.com	$2a$10$aGrLOYICKxc7W/SbQBd6CO.fd1LBGz7/xNxFZYgOQlwDI1uUMR5Yu	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170976	1	2017-12-09 21:06:21.661548	2017-12-09 21:06:21.732984	2017-12-09 21:06:21.732984	\N	\N	\N	\N	\N	\N	\N	0
912548360	ettie_mcglynn@example.com	$2a$10$3gpBn6mZmx68.WDZBD.4J..jRPYlMBrHSXruo9roKMYSpnxzVtcVm	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170977	1	2017-12-09 21:06:21.74065	2017-12-09 21:06:21.810654	2017-12-09 21:06:21.810654	\N	\N	\N	\N	\N	\N	\N	0
912548361	chauncey_kuvalis@example.com	$2a$10$PBwe/1s/Ya99rZCKjbUzFe3.jyZJjUuMDsYxn3H75mmHDgR7y1owq	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170978	1	2017-12-09 21:06:21.817976	2017-12-09 21:06:21.889066	2017-12-09 21:06:21.889066	\N	\N	\N	\N	\N	\N	\N	0
912548362	hilario_bode@example.com	$2a$10$IGZoNBnGzp0MB4EMtWz1Tu3tMiprDZiDAhrDWe1OqN1egbmPq9EZ6	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900452	1	2017-12-09 21:06:21.90217	2017-12-09 21:06:21.974173	2017-12-09 21:06:21.974173	\N	\N	\N	\N	\N	\N	\N	0
912548363	arvid_mccullough@example.com	$2a$10$OKMn/1GShMlFRsAch3h0rufv1DpNaMzNIwtZpnuBWxKlBxtwibt4m	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900453	1	2017-12-09 21:06:21.987002	2017-12-09 21:06:22.058103	2017-12-09 21:06:22.058103	\N	\N	\N	\N	\N	\N	\N	0
912548364	audreanne_dicki@example.com	$2a$10$f8IJiiXA0j8aEoqrzkBP4.Fb4h8GkMaCmGQoPrB1w9Pf7mPNsyuBa	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900454	1	2017-12-09 21:06:22.070495	2017-12-09 21:06:22.141524	2017-12-09 21:06:22.141524	\N	\N	\N	\N	\N	\N	\N	0
912548365	johann_predovic@example.com	$2a$10$4Hit9lqSthuxg.jzwopQFuIg1zMCTN5.j4hmNHdGubb1WqHAJkBVm	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170979	1	2017-12-09 21:06:22.159945	2017-12-09 21:06:22.231871	2017-12-09 21:06:22.231871	\N	\N	\N	\N	\N	\N	\N	0
912548366	alek_hegmann@example.com	$2a$10$EVkIUUCtdXgHWIJXTMY7IO.7zc0yCntPhXoQnBSFYEqppxZjhek.O	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170980	1	2017-12-09 21:06:22.23937	2017-12-09 21:06:22.310028	2017-12-09 21:06:22.310028	\N	\N	\N	\N	\N	\N	\N	0
912548367	ardella_stamm@example.com	$2a$10$Z7rZrSwdfGymoaLMWes4geg9ZR3e6zoeSEVSng5TbWFOweYRYepdK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170981	1	2017-12-09 21:06:22.318006	2017-12-09 21:06:22.388262	2017-12-09 21:06:22.388262	\N	\N	\N	\N	\N	\N	\N	0
912548368	amira_conroy@example.com	$2a$10$Tf/3pcSCp7BhEjs/8XCptuCYYyTQDcJXhCmR95cGH5gLuEoCfkMkG	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900455	1	2017-12-09 21:06:22.400269	2017-12-09 21:06:22.470492	2017-12-09 21:06:22.470492	\N	\N	\N	\N	\N	\N	\N	0
135138680	admin@example.com	$2a$10$xC2nttVpUiBb/TeRUVkKEuWCwMcS4wFVoZToMg4uCgfCdo56hV6hS	\N	\N	\N	2	2017-12-13 19:05:29.895818	2017-12-12 06:07:57.017456	209.160.127.58	209.160.127.59	\N	\N	2	\N	2017-12-09 19:45:42.979172	2017-12-13 19:05:29.898842	\N	\N	\N	\N	\N	\N	\N	0
912548369	karelle_senger@example.com	$2a$10$v/dEEBeTEsyw16jkB8M1vOP9AYBqUIzw6KE/.XY1mY/wBdUw1xoOW	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900456	1	2017-12-09 21:06:22.482433	2017-12-09 21:06:22.553079	2017-12-09 21:06:22.553079	\N	\N	\N	\N	\N	\N	\N	0
912548370	preston_wunsch@example.com	$2a$10$fBhdoDZDJQh6.t4W06OIMOULCc4SevaRwdvm5N9tbHpMVVIPVl81K	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900457	1	2017-12-09 21:06:22.565786	2017-12-09 21:06:22.637469	2017-12-09 21:06:22.637469	\N	\N	\N	\N	\N	\N	\N	0
912548371	terrence_koepp@example.com	$2a$10$L3MzYl7OGlnL/BOGakOPEOwiujRMUMPsUv8u.wml1ei0olLenmkku	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170982	1	2017-12-09 21:06:22.655804	2017-12-09 21:06:22.728042	2017-12-09 21:06:22.728042	\N	\N	\N	\N	\N	\N	\N	0
912548372	alisa_glover@example.com	$2a$10$m17/ZG37FavgJ7jr9z4.TevosOVx2wLNFA41chAYwk5jdhJwAoYcG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170983	1	2017-12-09 21:06:22.736127	2017-12-09 21:06:22.807338	2017-12-09 21:06:22.807338	\N	\N	\N	\N	\N	\N	\N	0
912548373	kellen_deckow@example.com	$2a$10$dUg3UqfKps0LFH2SekhEnuzzuw5R7uTNLlhVE2BPleH7tKeVotg32	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170984	1	2017-12-09 21:06:22.815335	2017-12-09 21:06:22.886418	2017-12-09 21:06:22.886418	\N	\N	\N	\N	\N	\N	\N	0
912548374	moses_weimann@example.com	$2a$10$W2PPjCk80.8c/y47vASQ3uk8OtRfzqHv4B17Lmxc.Qn.lh2wO4bza	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900458	1	2017-12-09 21:06:22.899812	2017-12-09 21:06:22.975812	2017-12-09 21:06:22.975812	\N	\N	\N	\N	\N	\N	\N	0
912548375	rosella_toy@example.com	$2a$10$XosEeLiZnrYkgfbTHEz4GeMvfyaFDiCSR76fX4uDbvg9TENV2Z2ou	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900459	1	2017-12-09 21:06:22.988789	2017-12-09 21:06:23.059134	2017-12-09 21:06:23.059134	\N	\N	\N	\N	\N	\N	\N	0
912548376	camden_schinner@example.com	$2a$10$yYLCPN5iCSVcdrQpl0kEguFWiGP1TBKJk46K1lWkSsFrHaA5l7Kla	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900460	1	2017-12-09 21:06:23.071615	2017-12-09 21:06:23.141976	2017-12-09 21:06:23.141976	\N	\N	\N	\N	\N	\N	\N	0
912548377	janiya_muller@example.com	$2a$10$6XyuXZnIGkpXaO2Qo4DxYe5QkGrjLYyevHIah.MY.jAFSzr3w3py.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170985	1	2017-12-09 21:06:23.163682	2017-12-09 21:06:23.234926	2017-12-09 21:06:23.234926	\N	\N	\N	\N	\N	\N	\N	0
912548378	margie_beier@example.com	$2a$10$w25YgmgHTm5Zz2jUn844nO0bGp4r99Rzu9pLIYYqM7PNKJcM4Q43W	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170986	1	2017-12-09 21:06:23.243684	2017-12-09 21:06:23.31381	2017-12-09 21:06:23.31381	\N	\N	\N	\N	\N	\N	\N	0
912548379	kenny_kutch@example.com	$2a$10$u4jSJFn8vSVOJScRl6M8M.E9AcYv23wgWNZ7MpTXzNcAzGjnABFTG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170987	1	2017-12-09 21:06:23.322657	2017-12-09 21:06:23.393574	2017-12-09 21:06:23.393574	\N	\N	\N	\N	\N	\N	\N	0
912548380	leonor_hammes@example.com	$2a$10$44MUQT8jNV5eMUVHRlNuUOzlA3RvMhr6WzrRBa8SI09vDyTyS45iy	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900461	1	2017-12-09 21:06:23.407064	2017-12-09 21:06:23.476854	2017-12-09 21:06:23.476854	\N	\N	\N	\N	\N	\N	\N	0
912548381	velma_vandervort@example.com	$2a$10$C4UMzSn68xYs6kqbICEMd.C15oVpM3bUuWW8P2qMX3HPFZmsF9izq	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900462	1	2017-12-09 21:06:23.490926	2017-12-09 21:06:23.560958	2017-12-09 21:06:23.560958	\N	\N	\N	\N	\N	\N	\N	0
912548382	merl_flatley@example.com	$2a$10$fDOK/LyqOlgxIOlYw1CES.cp5IJdSNkCcHBKLD7GbBE232elzcFAS	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900463	1	2017-12-09 21:06:23.574692	2017-12-09 21:06:23.645122	2017-12-09 21:06:23.645122	\N	\N	\N	\N	\N	\N	\N	0
912548383	jermey_heathcote@example.com	$2a$10$8rvMr8.pX9f5YJOogkM1Neo7.2KMKLanI/LxcEeq6BYXqCNqgFxge	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170988	1	2017-12-09 21:06:23.665258	2017-12-09 21:06:23.735958	2017-12-09 21:06:23.735958	\N	\N	\N	\N	\N	\N	\N	0
912548384	amani_haley@example.com	$2a$10$r871Jtvi/zFISsKdTx0NrOQq.npDVGAmzCP1nvoMJHh.dJDUS.vou	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170989	1	2017-12-09 21:06:23.74613	2017-12-09 21:06:23.818678	2017-12-09 21:06:23.818678	\N	\N	\N	\N	\N	\N	\N	0
912548385	izabella_ondricka@example.com	$2a$10$GP1lrv3fRUE3SO2PkLwQ1.NLPpOemfA2UV5/bFn/v7K//9VdEfyDG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170990	1	2017-12-09 21:06:23.82695	2017-12-09 21:06:23.898577	2017-12-09 21:06:23.898577	\N	\N	\N	\N	\N	\N	\N	0
912548386	nico_kiehn@example.com	$2a$10$rCFwhqwY13IIye1/CH20EuMwYGL6efQvpvL1Tl/WoIwEmnQ8gz/IC	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900464	1	2017-12-09 21:06:23.911264	2017-12-09 21:06:23.985176	2017-12-09 21:06:23.985176	\N	\N	\N	\N	\N	\N	\N	0
912548387	bridgette_schulist@example.com	$2a$10$L29SCzUHKz.p/d2PdHqS5u8e0nilqqNq5vvlNqEnf6eBl4xGIQJn.	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900465	1	2017-12-09 21:06:24.000738	2017-12-09 21:06:24.071497	2017-12-09 21:06:24.071497	\N	\N	\N	\N	\N	\N	\N	0
912548388	federico_goodwin@example.com	$2a$10$u9KksMEodCScLBRHhiwrDuD/YUbdvWXIp11IR7s.LlQzQgrksd8ZC	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900466	1	2017-12-09 21:06:24.085013	2017-12-09 21:06:24.15613	2017-12-09 21:06:24.15613	\N	\N	\N	\N	\N	\N	\N	0
912548389	terrell_olson@example.com	$2a$10$dYcquJfyXJq2FJffbE4cOeVGxQREuAed5/FehgSBRfHr6QV.U47se	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170991	1	2017-12-09 21:06:24.176243	2017-12-09 21:06:24.247732	2017-12-09 21:06:24.247732	\N	\N	\N	\N	\N	\N	\N	0
912548390	monica_cremin@example.com	$2a$10$Kv6i6fXGpLrxdsL4xsaoceW5Y6CyG5fyz8JgV3otw4uWHWApXb4gG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170992	1	2017-12-09 21:06:24.25572	2017-12-09 21:06:24.325785	2017-12-09 21:06:24.325785	\N	\N	\N	\N	\N	\N	\N	0
912548391	emie_hyatt@example.com	$2a$10$JHNsadoR4ZW/no3ubjPAnuIzXcLMd/vuRN2PHIHdWRY7Gw49mb61G	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170993	1	2017-12-09 21:06:24.334133	2017-12-09 21:06:24.405034	2017-12-09 21:06:24.405034	\N	\N	\N	\N	\N	\N	\N	0
912548392	olaf_powlowski@example.com	$2a$10$wZZ789GDQ4ollLJN6zZ1YO36c.nEKmamvoLW5d8FbIbTesYmlRWfe	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900467	1	2017-12-09 21:06:24.418148	2017-12-09 21:06:24.488294	2017-12-09 21:06:24.488294	\N	\N	\N	\N	\N	\N	\N	0
912548393	jimmie_tillman@example.com	$2a$10$R5MNCmhOT/lXC6dbH97NceenNKHpTfN98zvGKy.7RtrkcfNv0Mhz.	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900468	1	2017-12-09 21:06:24.504716	2017-12-09 21:06:24.577216	2017-12-09 21:06:24.577216	\N	\N	\N	\N	\N	\N	\N	0
912548394	neil_abshire@example.com	$2a$10$K7sd9aOD5swoTnThD90f.uwlB.aShkXnfZpzYjJJ13867arBrFfVa	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900469	1	2017-12-09 21:06:24.591586	2017-12-09 21:06:24.663449	2017-12-09 21:06:24.663449	\N	\N	\N	\N	\N	\N	\N	0
912548395	colten_lesch@example.com	$2a$10$Y5fgYGR7SJu0nBAOwD.PF.Z07yzOKNMYgzayMUNbv3.YTh3ww5H/K	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170994	1	2017-12-09 21:06:24.685438	2017-12-09 21:06:24.757987	2017-12-09 21:06:24.757987	\N	\N	\N	\N	\N	\N	\N	0
912548396	marge_schimmel@example.com	$2a$10$Z0CziaJu1FcbDVwiQnxh2O8maYggefvNwbdri/KQo1kZtOCCzXeq6	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170995	1	2017-12-09 21:06:24.768046	2017-12-09 21:06:24.839802	2017-12-09 21:06:24.839802	\N	\N	\N	\N	\N	\N	\N	0
912548397	reyes_sipes@example.com	$2a$10$6H9YxANBdaVhsHxU8rcRh.S71TsJ0Yl8SPN8dtx76ZhV30Ips8N7.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170996	1	2017-12-09 21:06:24.848627	2017-12-09 21:06:24.91919	2017-12-09 21:06:24.91919	\N	\N	\N	\N	\N	\N	\N	0
912548398	ellen_jast@example.com	$2a$10$iUyQDX2ycYEXREcqRZvCQeJdrYWmrAxFEzjVtI1z/0iYL1RBWRIjS	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900470	1	2017-12-09 21:06:24.935419	2017-12-09 21:06:25.008222	2017-12-09 21:06:25.008222	\N	\N	\N	\N	\N	\N	\N	0
912548399	enrique_hane@example.com	$2a$10$7YQ3MHEq2DnUCLkjtt78Fu..0zqf5xHpbB0vI2r0uSYxEV8wdCygK	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900471	1	2017-12-09 21:06:25.021578	2017-12-09 21:06:25.091929	2017-12-09 21:06:25.091929	\N	\N	\N	\N	\N	\N	\N	0
912548400	kyleigh_langosh@example.com	$2a$10$oJ2fgaBWMRyAUqlpR7iQM.HNcwp77LwYxZb4X3e5VefpZzDeyh.aK	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900472	1	2017-12-09 21:06:25.104958	2017-12-09 21:06:25.175727	2017-12-09 21:06:25.175727	\N	\N	\N	\N	\N	\N	\N	0
912548401	javier_terry@example.com	$2a$10$w5WFYKfV9M.EXC3R9aa4Mesme2vPPxrK.0rgsTPchK4vxT10n4kXa	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170997	1	2017-12-09 21:06:25.195952	2017-12-09 21:06:25.267596	2017-12-09 21:06:25.267596	\N	\N	\N	\N	\N	\N	\N	0
912548402	zelma_harber@example.com	$2a$10$b02MVHzkZKwZp8.dy3POXesSIwHmTmTFIVuSadzSFlB0Ep4VwH6Um	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170998	1	2017-12-09 21:06:25.275915	2017-12-09 21:06:25.346087	2017-12-09 21:06:25.346087	\N	\N	\N	\N	\N	\N	\N	0
912548403	sabina_feeney@example.com	$2a$10$VNrKF4NHa6hFtQlWReOCi.1i/XBtO5JeCNUWisW.tlzUd/BBSDWfK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706170999	1	2017-12-09 21:06:25.354723	2017-12-09 21:06:25.42586	2017-12-09 21:06:25.42586	\N	\N	\N	\N	\N	\N	\N	0
912548404	fredy_bashirian@example.com	$2a$10$aLYvYr4R6xERNHLnyy0LcO57Pz43mEp3vnlEPgsnCnrkxV5KYs0dy	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900473	1	2017-12-09 21:06:25.438525	2017-12-09 21:06:25.5095	2017-12-09 21:06:25.5095	\N	\N	\N	\N	\N	\N	\N	0
912548405	francisca_langworth@example.com	$2a$10$4ShBFDrhmgxH2lYIWE5NoOFuIL3vQbRoFz8kjIoo.LVmNzZQKP0Na	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900474	1	2017-12-09 21:06:25.524131	2017-12-09 21:06:25.596506	2017-12-09 21:06:25.596506	\N	\N	\N	\N	\N	\N	\N	0
912548406	neoma_senger@example.com	$2a$10$wGfY39os6vQVX7wgV/Flc.JcwDIJy.EjMTSjvHXegzxBJT5aNPjZO	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900475	1	2017-12-09 21:06:25.611216	2017-12-09 21:06:25.682375	2017-12-09 21:06:25.682375	\N	\N	\N	\N	\N	\N	\N	0
912548407	ken_greenfelder@example.com	$2a$10$fkMgtEwnspPYvhCxQcTUz.dwoCSmzuPab1bTT1r4b24lYq0ENESJq	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171000	1	2017-12-09 21:06:25.701066	2017-12-09 21:06:25.772631	2017-12-09 21:06:25.772631	\N	\N	\N	\N	\N	\N	\N	0
912548408	bennie_streich@example.com	$2a$10$KBv4hyDcnE0jGFU3GSd50u8Wc2NSubXGgqocBc48BvQ8YhXZXX6JK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171001	1	2017-12-09 21:06:25.781653	2017-12-09 21:06:25.852587	2017-12-09 21:06:25.852587	\N	\N	\N	\N	\N	\N	\N	0
912548409	clinton_wolff@example.com	$2a$10$36YasDaJDrv53/Px/toBoeNh2Xtd/Q6HrIoAehs1HQRt/w03rC/tq	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171002	1	2017-12-09 21:06:25.860168	2017-12-09 21:06:25.930808	2017-12-09 21:06:25.930808	\N	\N	\N	\N	\N	\N	\N	0
912548410	buck_hermann@example.com	$2a$10$9xomksLMTK4SyU2tyaZhFOIBeFr86LiuOejEvvYMyHMkse1jKamkW	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900476	1	2017-12-09 21:06:25.944511	2017-12-09 21:06:26.01528	2017-12-09 21:06:26.01528	\N	\N	\N	\N	\N	\N	\N	0
912548411	monique_parisian@example.com	$2a$10$WKEILZ5YyLNaTduLvX59JeYkvJsObEj2kejeTez2gJPhDc0..kwpe	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900477	1	2017-12-09 21:06:26.028225	2017-12-09 21:06:26.098282	2017-12-09 21:06:26.098282	\N	\N	\N	\N	\N	\N	\N	0
912548412	lloyd_morar@example.com	$2a$10$DBAeFWf.3fIWxfLU5qP7MeXraXO7nFnDBF5YVOIZrswMbaghcJSRK	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900478	1	2017-12-09 21:06:26.110253	2017-12-09 21:06:26.180612	2017-12-09 21:06:26.180612	\N	\N	\N	\N	\N	\N	\N	0
912548413	adah_russel@example.com	$2a$10$VWpoldfYr7ZF0UBytbrJ3u0udZKSt0ujP04q1th9Jablh/s5oe/WW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171003	1	2017-12-09 21:06:26.200441	2017-12-09 21:06:26.271713	2017-12-09 21:06:26.271713	\N	\N	\N	\N	\N	\N	\N	0
912548414	rosa_maggio@example.com	$2a$10$afgvAIwvfv5BcnC9W53Sm.W1oF81u2iMcM5uJfQ3fegAuTo4rduQ6	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171004	1	2017-12-09 21:06:26.2808	2017-12-09 21:06:26.351148	2017-12-09 21:06:26.351148	\N	\N	\N	\N	\N	\N	\N	0
912548415	dalton_cummerata@example.com	$2a$10$LcYuIhmS3JZb0ZhqT5bJIewxmv3KV6mr1P54hPPLxHOySVB3aaoAu	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171005	1	2017-12-09 21:06:26.358903	2017-12-09 21:06:26.429092	2017-12-09 21:06:26.429092	\N	\N	\N	\N	\N	\N	\N	0
912548416	dejuan_o'conner@example.com	$2a$10$naqowJ4nyfk6bvrHc9AjGugk/Zt0.4VgSFNxymAdwqfCnGgsC06om	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900479	1	2017-12-09 21:06:26.440932	2017-12-09 21:06:26.512113	2017-12-09 21:06:26.512113	\N	\N	\N	\N	\N	\N	\N	0
912548417	alexandrine_baumbach@example.com	$2a$10$ezdOXMzWMVu7DFhwQFsJwe8Yjn8qpd0I1zRiqG7b0ex.LbmlIov8O	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900480	1	2017-12-09 21:06:26.524412	2017-12-09 21:06:26.595004	2017-12-09 21:06:26.595004	\N	\N	\N	\N	\N	\N	\N	0
912548418	winfield_bahringer@example.com	$2a$10$0pDeRUXqlqyXxU58gkNgLOwTlS37j/KZ9JSRlOLD02MSpYGDuZZxq	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900481	1	2017-12-09 21:06:26.608387	2017-12-09 21:06:26.678716	2017-12-09 21:06:26.678716	\N	\N	\N	\N	\N	\N	\N	0
912548419	larissa_medhurst@example.com	$2a$10$5qPIODarrvUmBYGW4OOpBuuhF7KJHwXSjz.E45GSrXlb5uo65esdy	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171006	1	2017-12-09 21:06:26.697929	2017-12-09 21:06:26.768313	2017-12-09 21:06:26.768313	\N	\N	\N	\N	\N	\N	\N	0
912548420	frances_beatty@example.com	$2a$10$yfnbC/v7HKFBbWWb2zuGwOyEySaIE.gMsdO5PGjzrr2IYGRp2JmX6	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171007	1	2017-12-09 21:06:26.776312	2017-12-09 21:06:26.847238	2017-12-09 21:06:26.847238	\N	\N	\N	\N	\N	\N	\N	0
912548421	desmond_anderson@example.com	$2a$10$rEUJKL85KrNQGsDEefrFfu57NLmKsmG9ZY4P0OWRk2mRc2ZAkr/JC	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171008	1	2017-12-09 21:06:26.854874	2017-12-09 21:06:26.925146	2017-12-09 21:06:26.925146	\N	\N	\N	\N	\N	\N	\N	0
912548422	nelda_gulgowski@example.com	$2a$10$072BJOEKBBezGp5MRLDEWemm/Y9CTU8oLJh06dhKy9043X90wqER.	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900482	1	2017-12-09 21:06:26.938548	2017-12-09 21:06:27.014581	2017-12-09 21:06:27.014581	\N	\N	\N	\N	\N	\N	\N	0
912548423	bruce_lindgren@example.com	$2a$10$rhlFcVNMn8spyPW4tPZTWOvvY52mSBi/9evVw0G.AJo9E43AK3QkS	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900483	1	2017-12-09 21:06:27.027846	2017-12-09 21:06:27.098233	2017-12-09 21:06:27.098233	\N	\N	\N	\N	\N	\N	\N	0
912548424	edmond_veum@example.com	$2a$10$8s9f1xTNYdNuV7r3Wubw9OI89qQe3IwtRxXqIB1lK3wrkN2Ugyr6K	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900484	1	2017-12-09 21:06:27.110056	2017-12-09 21:06:27.180655	2017-12-09 21:06:27.180655	\N	\N	\N	\N	\N	\N	\N	0
912548425	ricardo_senger@example.com	$2a$10$IGn94ovkbOhJxifU.25wWu/ZLff3KtPzhbjymQkmgh8LIcuddwd7S	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171009	1	2017-12-09 21:06:27.199084	2017-12-09 21:06:27.270762	2017-12-09 21:06:27.270762	\N	\N	\N	\N	\N	\N	\N	0
912548426	thaddeus_lynch@example.com	$2a$10$Io8pdXE8ktVZnQktZJu87OmujHix4DwdVHEnkbvbr.ltcPUwGg/3O	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171010	1	2017-12-09 21:06:27.278137	2017-12-09 21:06:27.349058	2017-12-09 21:06:27.349058	\N	\N	\N	\N	\N	\N	\N	0
912548427	bianka_heaney@example.com	$2a$10$adNZKtvSz/9LRSAm9h1wb.dZZXzmHjeLaksBX5tpMryeZ.VL6JEM2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171011	1	2017-12-09 21:06:27.356337	2017-12-09 21:06:27.427472	2017-12-09 21:06:27.427472	\N	\N	\N	\N	\N	\N	\N	0
912548428	darwin_weber@example.com	$2a$10$H.B15BVZKTlOW5Fc8Gz9RO14BPhsu4j2Qp/wgkuXLUPZxlsyRxxfC	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900485	1	2017-12-09 21:06:27.439564	2017-12-09 21:06:27.510603	2017-12-09 21:06:27.510603	\N	\N	\N	\N	\N	\N	\N	0
912548429	lazaro_ullrich@example.com	$2a$10$KOh5zmyaK40wjtEyvyusn.Ixm99M5jgGMtDJFR8VQ4fmuUAlZBvoK	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900486	1	2017-12-09 21:06:27.525251	2017-12-09 21:06:27.597296	2017-12-09 21:06:27.597296	\N	\N	\N	\N	\N	\N	\N	0
912548430	josephine_orn@example.com	$2a$10$/x0N.7S0clV4nNxM75tCCeKO5al9Qjozs8p6judsUP0KqIUzlEVRi	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900487	1	2017-12-09 21:06:27.610522	2017-12-09 21:06:27.682247	2017-12-09 21:06:27.682247	\N	\N	\N	\N	\N	\N	\N	0
912548431	mya_mayert@example.com	$2a$10$YIzYhx.tWDG.8Lq49r2MR.dPOIErkHqPZ7XXgvp8yzAY01q6fdYny	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171012	1	2017-12-09 21:06:27.701481	2017-12-09 21:06:27.773207	2017-12-09 21:06:27.773207	\N	\N	\N	\N	\N	\N	\N	0
912548432	dayne_price@example.com	$2a$10$ARo9SKeWw9Z31qdId3JVUeAHQAbGQJu5DzF0UI0sV5to1gzQIbWAu	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171013	1	2017-12-09 21:06:27.781465	2017-12-09 21:06:27.851996	2017-12-09 21:06:27.851996	\N	\N	\N	\N	\N	\N	\N	0
912548433	idella_pouros@example.com	$2a$10$Hs.1X.1.EhmvCzsAqOayy.5.cj5BJeL3r/YaKMlbLueRUhaksinxG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171014	1	2017-12-09 21:06:27.860095	2017-12-09 21:06:27.930739	2017-12-09 21:06:27.930739	\N	\N	\N	\N	\N	\N	\N	0
912548434	raven_barton@example.com	$2a$10$BYnYq9gM83JUgvgZnuTBO.DMgYn93OAtivBC87i/OeHiLB6AlqgLi	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900488	1	2017-12-09 21:06:27.94384	2017-12-09 21:06:28.019617	2017-12-09 21:06:28.019617	\N	\N	\N	\N	\N	\N	\N	0
912548435	mark_heidenreich@example.com	$2a$10$YIUZiQJEOovGaT6oQg6qe.Zz.PjEgVv9vI9JDQQxEmuZgvGgybbkC	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900489	1	2017-12-09 21:06:28.032261	2017-12-09 21:06:28.103015	2017-12-09 21:06:28.103015	\N	\N	\N	\N	\N	\N	\N	0
912548436	mario_herzog@example.com	$2a$10$t94NRnrx2p2LvlGQjcOe3.cMFBIUBG5NV/Deu8o6g3GfyVuQJskVu	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900490	1	2017-12-09 21:06:28.123289	2017-12-09 21:06:28.193868	2017-12-09 21:06:28.193868	\N	\N	\N	\N	\N	\N	\N	0
912548437	eino_fisher@example.com	$2a$10$otbr.njWlhmUy3JfvZlfhOyGuIg2Gy22KZE69xWUWEgB/aqQrNSLK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171015	1	2017-12-09 21:06:28.210897	2017-12-09 21:06:28.280984	2017-12-09 21:06:28.280984	\N	\N	\N	\N	\N	\N	\N	0
912548438	rolando_schiller@example.com	$2a$10$TcZLDkbhiF4G5Pcl2Otf5eAAlBHQ9sbNgyonPbgrOF6CRJhrjcuuy	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171016	1	2017-12-09 21:06:28.287806	2017-12-09 21:06:28.358779	2017-12-09 21:06:28.358779	\N	\N	\N	\N	\N	\N	\N	0
912548439	vincent_durgan@example.com	$2a$10$eHBMyD8HXrAThRbPFnht9.skgwEXOwjJFuYZxY28xVCj0rCYwf/pW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171017	1	2017-12-09 21:06:28.365904	2017-12-09 21:06:28.436812	2017-12-09 21:06:28.436812	\N	\N	\N	\N	\N	\N	\N	0
912548440	fannie_hermiston@example.com	$2a$10$rl2es9EcB1LmnV79grAHXe1mdxcHf5b7GJU/S97g11JQTVGN/KwQS	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900491	1	2017-12-09 21:06:28.447794	2017-12-09 21:06:28.518447	2017-12-09 21:06:28.518447	\N	\N	\N	\N	\N	\N	\N	0
912548441	nathanael_halvorson@example.com	$2a$10$w7x61ILHQdk9muYKFjLP2uwk2Eec39zyOwPj/MiBRDoLw6grSMd1y	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900492	1	2017-12-09 21:06:28.528798	2017-12-09 21:06:28.599784	2017-12-09 21:06:28.599784	\N	\N	\N	\N	\N	\N	\N	0
912548442	maggie_doyle@example.com	$2a$10$0ubGcvETeGTkSAVCOUTgQuxGVXGva1fQ4TqaEsSvanv4BDcwZS3dW	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900493	1	2017-12-09 21:06:28.610541	2017-12-09 21:06:28.682123	2017-12-09 21:06:28.682123	\N	\N	\N	\N	\N	\N	\N	0
912548443	delfina_macgyver@example.com	$2a$10$jU6zqe43Z/l8u7O6Ib9pf.dphbd1lwg0OoQzParVyFP0gwLpMB9LC	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171018	1	2017-12-09 21:06:28.69849	2017-12-09 21:06:28.76964	2017-12-09 21:06:28.76964	\N	\N	\N	\N	\N	\N	\N	0
912548444	cordia_hartmann@example.com	$2a$10$Ec8bpl3DbBm7EM9lbYDrz.xAPIBwncqI4uOseiKlmsMlNXMJIlgCm	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171019	1	2017-12-09 21:06:28.77675	2017-12-09 21:06:28.848038	2017-12-09 21:06:28.848038	\N	\N	\N	\N	\N	\N	\N	0
912548445	keaton_kessler@example.com	$2a$10$GhL5dlQ3bpTQT9tzre8tFeykYSHjgm4QRv.7qa1I8bc8Y9xTMb.a6	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171020	1	2017-12-09 21:06:28.854727	2017-12-09 21:06:28.930389	2017-12-09 21:06:28.930389	\N	\N	\N	\N	\N	\N	\N	0
912548446	jana_parker@example.com	$2a$10$dPUqe6a3dXqbquww88kARuYEdF7prEyawcHumUmdjF2gQ3d.3y9rG	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900494	1	2017-12-09 21:06:28.942262	2017-12-09 21:06:29.017259	2017-12-09 21:06:29.017259	\N	\N	\N	\N	\N	\N	\N	0
912548447	fleta_cruickshank@example.com	$2a$10$BrGT/kdTcAO8VqGt/ShQrulCa.l3quYq2I0rxoe/5gF0yGxDovxiS	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900495	1	2017-12-09 21:06:29.027928	2017-12-09 21:06:29.097949	2017-12-09 21:06:29.097949	\N	\N	\N	\N	\N	\N	\N	0
912548448	shea_leuschke@example.com	$2a$10$pVEGkjphq95JC4KGxcrr1OOTizF2K6MeRywf7y9CXpd.2Gss0t9Z.	\N	\N	\N	0	\N	\N	\N	\N	Athlete	3900496	1	2017-12-09 21:06:29.108264	2017-12-09 21:06:29.178324	2017-12-09 21:06:29.178324	\N	\N	\N	\N	\N	\N	\N	0
912548449	wallace_schumm@example.com	$2a$10$hkzqLxjXeVbOvaSST8chG.ARHjahvS61eXAnVUt5.iZvsNjL9x8KG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171021	1	2017-12-09 21:06:29.236629	2017-12-09 21:06:29.306953	2017-12-09 21:06:29.306953	\N	\N	\N	\N	\N	\N	\N	0
912548450	winston_hudson@example.com	$2a$10$mVHluenQupejqAftkXT5TeXbokjvQYtRaxAnGY53ASwuHQ1lBpS4K	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171022	1	2017-12-09 21:06:29.314191	2017-12-09 21:06:29.384929	2017-12-09 21:06:29.384929	\N	\N	\N	\N	\N	\N	\N	0
912548451	patience_ortiz@example.com	$2a$10$1GzxdKWokH/EfAeciKXd6eAMn4YtKd0/qDGUaT/uIqCcnOmPmMlFq	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171023	1	2017-12-09 21:06:29.391875	2017-12-09 21:06:29.462412	2017-12-09 21:06:29.462412	\N	\N	\N	\N	\N	\N	\N	0
912548452	daisha_kuphal@example.com	$2a$10$cCNXDeYUwl57GWOHrFXBKOJNPCey4.NJr6zMcW/ALDLeMW3npMAnu	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171024	1	2017-12-09 21:06:29.478475	2017-12-09 21:06:29.548828	2017-12-09 21:06:29.548828	\N	\N	\N	\N	\N	\N	\N	0
912548453	jerel_kertzmann@example.com	$2a$10$4hFZvCdd6oknz9qZ8O8UM.0QHaenoq5gETff93gSe9W6FLij3QIsa	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171025	1	2017-12-09 21:06:29.555844	2017-12-09 21:06:29.626851	2017-12-09 21:06:29.626851	\N	\N	\N	\N	\N	\N	\N	0
912548454	meggie_kreiger@example.com	$2a$10$ZiBybsF838zSU5K/64JUh.zHIIEkmEZrmL69jbVJBhvdzCbGoFMjm	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171026	1	2017-12-09 21:06:29.634036	2017-12-09 21:06:29.705078	2017-12-09 21:06:29.705078	\N	\N	\N	\N	\N	\N	\N	0
912548455	alaina_vonrueden@example.com	$2a$10$RdCgE1P54u90iV4c9vttSujIkox4pYZmczFY0vcFbRWwgEs1wCkTe	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171027	1	2017-12-09 21:06:29.721501	2017-12-09 21:06:29.793075	2017-12-09 21:06:29.793075	\N	\N	\N	\N	\N	\N	\N	0
912548456	jan_satterfield@example.com	$2a$10$6/aKkkmdPVJHx/uX/P76cuCRFkvRBn2vN47rlNMTus0AOLVSXqvoO	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171028	1	2017-12-09 21:06:29.800521	2017-12-09 21:06:29.871436	2017-12-09 21:06:29.871436	\N	\N	\N	\N	\N	\N	\N	0
912548457	skye_ankunding@example.com	$2a$10$ATLc.riZWEgpXKjCVuRURueA2QZifitrkt1jFNP4C7WzdAwVR2JYi	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171029	1	2017-12-09 21:06:29.878597	2017-12-09 21:06:29.949021	2017-12-09 21:06:29.949021	\N	\N	\N	\N	\N	\N	\N	0
912548458	tressa_kovacek@example.com	$2a$10$1mtBUxpaCceJHlFFni64mev9m1qmXL4OjA3AOMF.hJngrHIO/3AC2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171030	1	2017-12-09 21:06:29.965764	2017-12-09 21:06:30.040739	2017-12-09 21:06:30.040739	\N	\N	\N	\N	\N	\N	\N	0
912548459	jacey_jerde@example.com	$2a$10$H2JHZf94svjrFatnCUM3POtG.PK/PWf8c3YvcXzbgEcwJ3e403DA2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171031	1	2017-12-09 21:06:30.048201	2017-12-09 21:06:30.118356	2017-12-09 21:06:30.118356	\N	\N	\N	\N	\N	\N	\N	0
912548460	melba_little@example.com	$2a$10$BnZOVc2qS9rI5q.PiMBz7e6yeJ1uF8del6YLAK1bDXq/r/ND2vv/u	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171032	1	2017-12-09 21:06:30.12608	2017-12-09 21:06:30.196283	2017-12-09 21:06:30.196283	\N	\N	\N	\N	\N	\N	\N	0
912548461	carmen_macgyver@example.com	$2a$10$xQ5W.a5VSOyIQQqy80njtuUr8bEl3UgjurxL/uu5WFyf8mG7NfTPC	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171033	1	2017-12-09 21:06:30.214959	2017-12-09 21:06:30.286811	2017-12-09 21:06:30.286811	\N	\N	\N	\N	\N	\N	\N	0
912548462	lesly_beahan@example.com	$2a$10$6hJ8ZAV.cZLV29msSSiqxerFkEyBNy3GzWV6HGn06xWoPqtDESzL2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171034	1	2017-12-09 21:06:30.294592	2017-12-09 21:06:30.365566	2017-12-09 21:06:30.365566	\N	\N	\N	\N	\N	\N	\N	0
912548463	rosalee_hahn@example.com	$2a$10$LYzqzc7iVIV2H3CzTlEJZelUzA5KmB/IqAwFyfYzxIZOgwssBo9V2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171035	1	2017-12-09 21:06:30.37349	2017-12-09 21:06:30.444248	2017-12-09 21:06:30.444248	\N	\N	\N	\N	\N	\N	\N	0
912548464	keara_parker@example.com	$2a$10$9vlBRoRG0IM2zMjoFfGWsuKcVgI0On0KTjv8I3E.BnQ2OX2mdC30i	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171036	1	2017-12-09 21:06:30.46272	2017-12-09 21:06:30.534047	2017-12-09 21:06:30.534047	\N	\N	\N	\N	\N	\N	\N	0
912548465	jaylen_hermiston@example.com	$2a$10$r4nSqxhFh8cq1WcIV0T9u.Fo3qdBwTtWJ9G8UkT8ZFk1r.yYH0oFG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171037	1	2017-12-09 21:06:30.542179	2017-12-09 21:06:30.613898	2017-12-09 21:06:30.613898	\N	\N	\N	\N	\N	\N	\N	0
912548466	sallie_kemmer@example.com	$2a$10$4YKkvD2Omn8ZBueQaRJ0gOrZ20NE.FEjEBCuxq7dPKPIMopvL7EHa	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171038	1	2017-12-09 21:06:30.622118	2017-12-09 21:06:30.694676	2017-12-09 21:06:30.694676	\N	\N	\N	\N	\N	\N	\N	0
912548467	emanuel_parker@example.com	$2a$10$LIueSWGqA1XioQZZAmASqeqt64.E9wIlca/nEDWl7XLe7ze5EF9i.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171039	1	2017-12-09 21:06:30.71325	2017-12-09 21:06:30.784307	2017-12-09 21:06:30.784307	\N	\N	\N	\N	\N	\N	\N	0
912548468	stephon_franecki@example.com	$2a$10$nIhFkXX.ttM3Q9sTKoIaFury7gTKMcfTPSzm8Wva/sQ0AWHQceg0O	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171040	1	2017-12-09 21:06:30.792383	2017-12-09 21:06:30.863756	2017-12-09 21:06:30.863756	\N	\N	\N	\N	\N	\N	\N	0
912548469	tressa_feil@example.com	$2a$10$X5uaRYn/BysgdHKF43f1O.h/mSjFhA/MwOxr6k.67breI/DKosiCa	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171041	1	2017-12-09 21:06:30.871415	2017-12-09 21:06:30.943019	2017-12-09 21:06:30.943019	\N	\N	\N	\N	\N	\N	\N	0
912548470	alden_haley@example.com	$2a$10$tRDJdjjU2VcMbleE8cGc3Or70YXaqGK3G9QeSGlMKFuI61NEI2Ub2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171042	1	2017-12-09 21:06:30.960784	2017-12-09 21:06:31.032003	2017-12-09 21:06:31.032003	\N	\N	\N	\N	\N	\N	\N	0
912548471	jaylon_howell@example.com	$2a$10$/kQwagO9IdkudIEc8Pb1ke1AAmEJSje8mVKGaHgJo2ahMfuTnHH5S	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171043	1	2017-12-09 21:06:31.039692	2017-12-09 21:06:31.110638	2017-12-09 21:06:31.110638	\N	\N	\N	\N	\N	\N	\N	0
912548472	kay_dibbert@example.com	$2a$10$LEQIwqqH34e/8S11enJ6DuBlqeYdql5MQMFv.0avalOERY2aT6HEC	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171044	1	2017-12-09 21:06:31.118163	2017-12-09 21:06:31.188199	2017-12-09 21:06:31.188199	\N	\N	\N	\N	\N	\N	\N	0
912548473	brock_huels@example.com	$2a$10$YSg4LAsX3r5f39J9uyv8/.PxAYRVi/jZ6LA6Vzzmfu6ZSNXUP1WTG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171045	1	2017-12-09 21:06:31.204759	2017-12-09 21:06:31.274403	2017-12-09 21:06:31.274403	\N	\N	\N	\N	\N	\N	\N	0
912548474	leila_bailey@example.com	$2a$10$/5RtPrZMA775Z/IgtpNxCu8IZGLPd1qpCnvKDbYsw2Zn6xiIUfSCe	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171046	1	2017-12-09 21:06:31.281415	2017-12-09 21:06:31.351147	2017-12-09 21:06:31.351147	\N	\N	\N	\N	\N	\N	\N	0
912548475	carmen_schuppe@example.com	$2a$10$tv9VJj6cHCC714OYnszZuO3nenT6YruaWTLgHACtBSMKRWIF1Ke.W	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171047	1	2017-12-09 21:06:31.358501	2017-12-09 21:06:31.428781	2017-12-09 21:06:31.428781	\N	\N	\N	\N	\N	\N	\N	0
912548476	landen_dach@example.com	$2a$10$Voxofj1RJ.gXLzO.7.3tteT2D1laRhSzY8Quevt9hLLd4MQqujoaW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171048	1	2017-12-09 21:06:31.445605	2017-12-09 21:06:31.51584	2017-12-09 21:06:31.51584	\N	\N	\N	\N	\N	\N	\N	0
912548477	august_crooks@example.com	$2a$10$mmBZXrxrEe7.DcseKaYaQefBn7DZA3v7DlPPUe8/MBBk7XbGIy.Ae	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171049	1	2017-12-09 21:06:31.522687	2017-12-09 21:06:31.593748	2017-12-09 21:06:31.593748	\N	\N	\N	\N	\N	\N	\N	0
912548478	nellie_willms@example.com	$2a$10$4wvgDCdzIMRkirZDGKY6HubPuFI17wtrFFcSysYB/JVEvFcVzhBWC	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171050	1	2017-12-09 21:06:31.600738	2017-12-09 21:06:31.671102	2017-12-09 21:06:31.671102	\N	\N	\N	\N	\N	\N	\N	0
912548479	myrtis_smitham@example.com	$2a$10$7uCWOXzmx2FZbFFfxfEpWeA0x2tBemh30j4HzASwjaKr5dOWS26b.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171051	1	2017-12-09 21:06:31.6885	2017-12-09 21:06:31.76017	2017-12-09 21:06:31.76017	\N	\N	\N	\N	\N	\N	\N	0
912548480	edgardo_gutkowski@example.com	$2a$10$bt5iYBKLg.PJHUjOdjuc8OU5Tv716kqlOKEnCmStit8p4TP4cdvhy	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171052	1	2017-12-09 21:06:31.76722	2017-12-09 21:06:31.837755	2017-12-09 21:06:31.837755	\N	\N	\N	\N	\N	\N	\N	0
912548481	rosetta_goyette@example.com	$2a$10$J9KYliAzMg/lISRRPnNlpux134vTYLnGVowPx9S8tlkFnBSmyck3G	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171053	1	2017-12-09 21:06:31.845212	2017-12-09 21:06:31.916386	2017-12-09 21:06:31.916386	\N	\N	\N	\N	\N	\N	\N	0
912548482	ephraim_kassulke@example.com	$2a$10$8qaNStuuP21ZZMjs0FmTIezilmfzigBwcTuq8xgi8O6sfRRESrNa.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171054	1	2017-12-09 21:06:31.933819	2017-12-09 21:06:32.004776	2017-12-09 21:06:32.004776	\N	\N	\N	\N	\N	\N	\N	0
912548483	rod_fisher@example.com	$2a$10$/HUOytlkn3haUQCaQinoG.oW6gkQj93iBe8qkTYhdwVIG58YgDBy6	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171055	1	2017-12-09 21:06:32.012404	2017-12-09 21:06:32.082764	2017-12-09 21:06:32.082764	\N	\N	\N	\N	\N	\N	\N	0
912548484	holden_lowe@example.com	$2a$10$rsCmmbLSjoEZmqC07evkG.p2o/uCRfIEtcef6l.aD3tSyzSLDGJQW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171056	1	2017-12-09 21:06:32.090421	2017-12-09 21:06:32.161062	2017-12-09 21:06:32.161062	\N	\N	\N	\N	\N	\N	\N	0
912548485	wyatt_kautzer@example.com	$2a$10$FMy4Uee5/Xz1RPAsLWGsw.EBKZuMQeBzVO9W6BmT6SJe0mZK7Sy5K	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171057	1	2017-12-09 21:06:32.177801	2017-12-09 21:06:32.254093	2017-12-09 21:06:32.254093	\N	\N	\N	\N	\N	\N	\N	0
912548486	trinity_kassulke@example.com	$2a$10$45fbb486nnauu5honQ0Ioe//GGJfv6M1W/GOwJcDoa3Bs1aprr/U.	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171058	1	2017-12-09 21:06:32.261495	2017-12-09 21:06:32.33221	2017-12-09 21:06:32.33221	\N	\N	\N	\N	\N	\N	\N	0
912548487	domenic_king@example.com	$2a$10$nIw6rGZgidpmjysgJxyX9ujc09qAFYGOtXXR3XtaCfC4O8zVlcyFO	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171059	1	2017-12-09 21:06:32.339577	2017-12-09 21:06:32.410665	2017-12-09 21:06:32.410665	\N	\N	\N	\N	\N	\N	\N	0
912548488	marco_wisozk@example.com	$2a$10$jXdTI9U87c5zef16v/cJmOblXWBTWOoG2T2LNo0rBRdOOFg6BQq0O	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171060	1	2017-12-09 21:06:32.427529	2017-12-09 21:06:32.498687	2017-12-09 21:06:32.498687	\N	\N	\N	\N	\N	\N	\N	0
912548489	jammie_batz@example.com	$2a$10$POszmN/9FcuTRmxmF4pWaOmd0k6JAtnrz6hOeIZPU06RIpidBPlVa	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171061	1	2017-12-09 21:06:32.506189	2017-12-09 21:06:32.577306	2017-12-09 21:06:32.577306	\N	\N	\N	\N	\N	\N	\N	0
912548490	letha_hills@example.com	$2a$10$CDttE3RQngrcHsVgpyd7x.8O/hrIC9EzSQUs.r/sItqbNkCr2Gkou	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171062	1	2017-12-09 21:06:32.584937	2017-12-09 21:06:32.655876	2017-12-09 21:06:32.655876	\N	\N	\N	\N	\N	\N	\N	0
912548491	tiffany_larson@example.com	$2a$10$CuGZDLyJLiUIWLKDbbFC1ebMViNzcNa3vldNcNqnq7jSQPY6L42fy	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171063	1	2017-12-09 21:06:32.672523	2017-12-09 21:06:32.743998	2017-12-09 21:06:32.743998	\N	\N	\N	\N	\N	\N	\N	0
912548492	dakota_turcotte@example.com	$2a$10$fWEbtIgbyFJ/8LbFE3LWgOGi/LFzalSuoSQaoFtOKT5LJxI09bgq2	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171064	1	2017-12-09 21:06:32.751476	2017-12-09 21:06:32.822391	2017-12-09 21:06:32.822391	\N	\N	\N	\N	\N	\N	\N	0
912548493	dell_schneider@example.com	$2a$10$1k93eQDX0mtp/JpAAl9lO.DJFOuZFoUtrJPEsaGZYYq822wERk/Ea	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171065	1	2017-12-09 21:06:32.829688	2017-12-09 21:06:32.900879	2017-12-09 21:06:32.900879	\N	\N	\N	\N	\N	\N	\N	0
912548494	ladarius_dietrich@example.com	$2a$10$6579ZqgBqxYsQmJFws89Pei1xkUNAj4U6kO08QIdwBqRInsEwvf/i	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171066	1	2017-12-09 21:06:32.917782	2017-12-09 21:06:32.988834	2017-12-09 21:06:32.988834	\N	\N	\N	\N	\N	\N	\N	0
912548495	joy_huels@example.com	$2a$10$aRz/z7sKEqdIlHTPfbDZ7ejwSgpfvPembC2Jtok6GxFnwa0kX8aFK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171067	1	2017-12-09 21:06:32.996411	2017-12-09 21:06:33.066634	2017-12-09 21:06:33.066634	\N	\N	\N	\N	\N	\N	\N	0
912548496	boyd_powlowski@example.com	$2a$10$wtm2G4fcolVXa2XiVng8Du2dI6gfZ/S8lfGepBzYBISH5DoyU./iK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171068	1	2017-12-09 21:06:33.074324	2017-12-09 21:06:33.14431	2017-12-09 21:06:33.14431	\N	\N	\N	\N	\N	\N	\N	0
912548497	twila_powlowski@example.com	$2a$10$RDEGjkVItxRHWBhqXlegnu3yUPZiFnHeHjup8B25TQyKS0CAe7J6S	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171069	1	2017-12-09 21:06:33.162275	2017-12-09 21:06:33.232585	2017-12-09 21:06:33.232585	\N	\N	\N	\N	\N	\N	\N	0
912548498	virgil_haley@example.com	$2a$10$eoXLiPK4c6XR1AjeWqyV7ef4MAhnF7EiEX3MMQ6ehqKXTOouAM5yW	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171070	1	2017-12-09 21:06:33.239959	2017-12-09 21:06:33.309904	2017-12-09 21:06:33.309904	\N	\N	\N	\N	\N	\N	\N	0
912548499	ambrose_dibbert@example.com	$2a$10$Nz0KFE2aBqeCWXzJrgzFWethkkLqVYjATNMIrO3nDN.uxvNb1AKzq	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171071	1	2017-12-09 21:06:33.3177	2017-12-09 21:06:33.388244	2017-12-09 21:06:33.388244	\N	\N	\N	\N	\N	\N	\N	0
912548500	gregorio_vandervort@example.com	$2a$10$mlcqSxqBsMMzcrMW8OTIuOYgaiwVJOgcOr0Sx5kOTrI4R77sZebyq	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171072	1	2017-12-09 21:06:33.40632	2017-12-09 21:06:33.478013	2017-12-09 21:06:33.478013	\N	\N	\N	\N	\N	\N	\N	0
912548501	silas_simonis@example.com	$2a$10$jPNAb6pR7upzR3105VpzGuy9iyEphAsgORKHA6v0enGdVhNxBANVS	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171073	1	2017-12-09 21:06:33.485948	2017-12-09 21:06:33.55728	2017-12-09 21:06:33.55728	\N	\N	\N	\N	\N	\N	\N	0
912548502	mia_wiza@example.com	$2a$10$tg8ZSVDFJ3hUAomcNeE89urmfoHe/iokOhPgo7jaPpiPiFqf4e15a	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171074	1	2017-12-09 21:06:33.564996	2017-12-09 21:06:33.636869	2017-12-09 21:06:33.636869	\N	\N	\N	\N	\N	\N	\N	0
912548503	arvel_weimann@example.com	$2a$10$WXGE20bnZhkvuHaS0TmcbOwpPhv5MjQT8mDWsaT3LsJ1aypJeuSWG	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171075	1	2017-12-09 21:06:33.654526	2017-12-09 21:06:33.726893	2017-12-09 21:06:33.726893	\N	\N	\N	\N	\N	\N	\N	0
912548504	rudolph_mante@example.com	$2a$10$Yjc9eQpQZxiEYn9Qxv7ave9kciPOxsOF7E7xPkwP5vQIbSZUD1J0a	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171076	1	2017-12-09 21:06:33.734131	2017-12-09 21:06:33.80611	2017-12-09 21:06:33.80611	\N	\N	\N	\N	\N	\N	\N	0
912548505	vivien_pfeffer@example.com	$2a$10$sBUFyUDrOQF5RFOCcNBH9OTxilnSeDuglLHQY0qknhpqfacP2B2Be	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171077	1	2017-12-09 21:06:33.813036	2017-12-09 21:06:33.883944	2017-12-09 21:06:33.883944	\N	\N	\N	\N	\N	\N	\N	0
912548506	eva_kohler@example.com	$2a$10$/Lim.4Yy80KQzAzm0gR41uGrILeOMaoNm4b74VfE/Zx4A3eZN4bvC	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171078	1	2017-12-09 21:06:33.900605	2017-12-09 21:06:33.97236	2017-12-09 21:06:33.97236	\N	\N	\N	\N	\N	\N	\N	0
912548507	jacquelyn_altenwerth@example.com	$2a$10$BomvWdu3UiSF.VpJnzP4XOW3fKQD/PtePCcrybAVMLWu6gNo7QEDa	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171079	1	2017-12-09 21:06:33.97997	2017-12-09 21:06:34.050461	2017-12-09 21:06:34.050461	\N	\N	\N	\N	\N	\N	\N	0
912548508	darion_effertz@example.com	$2a$10$PnrrTJH8u/n1u4OtA.0wCeN6p.EH3gB4Ae9bJ6wmLHPts3K9YnbDK	\N	\N	\N	0	\N	\N	\N	\N	Coach	706171080	1	2017-12-09 21:06:34.058167	2017-12-09 21:06:34.127246	2017-12-09 21:06:34.127246	\N	\N	\N	\N	\N	\N	\N	0
809460748	athlete@example.com	$2a$10$pEkWTiCXEODa712Xs2WqnO1fhHc43oLGIc26ZnR.RHU7BOpkOid2m	\N	\N	\N	1	2017-12-09 21:11:15.967593	2017-12-09 21:11:15.967593	69.167.15.239	69.167.15.239	Athlete	3900196	1	\N	2017-12-09 19:45:42.979172	2017-12-09 21:11:15.97229	\N	\N	\N	\N	\N	\N	\N	0
200726649	college_coach@example.com	$2a$10$Klp7PLLjDdBov26rAlQzj.XEmgRCN0BMePNzzoNvkcrT6XFJK1PAy	\N	\N	2018-01-07 20:48:39.478031	16	2018-01-08 16:19:26.514151	2018-01-08 03:11:14.154675	116.102.11.163	119.152.212.226	Coach	644468115	1	\N	2017-12-09 19:45:42.979172	2018-01-08 16:19:26.518524	\N	\N	\N	\N	\N	\N	\N	0
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('users_id_seq', 912548508, true);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('votes_id_seq', 1, false);


--
-- Data for Name: wide_receivers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY wide_receivers (id, season, receiving_yards, receiving_touchdowns, yards_after_catches, catches, created_at, updated_at) FROM stdin;
1	2016	9	179	64	169	2017-12-09 21:07:05.035512	2017-12-09 21:07:05.035512
2	2015	152	46	142	10	2017-12-09 21:07:05.042243	2017-12-09 21:07:05.042243
3	2014	24	86	2	130	2017-12-09 21:07:05.048238	2017-12-09 21:07:05.048238
4	2013	75	176	182	77	2017-12-09 21:07:05.054216	2017-12-09 21:07:05.054216
5	2019	126	63	174	124	2017-12-09 21:07:06.435972	2017-12-09 21:07:06.435972
6	2018	141	22	192	155	2017-12-09 21:07:06.442007	2017-12-09 21:07:06.442007
7	2017	169	187	56	1	2017-12-09 21:07:06.448397	2017-12-09 21:07:06.448397
8	2016	146	148	91	148	2017-12-09 21:07:06.454605	2017-12-09 21:07:06.454605
9	2016	172	169	129	149	2017-12-09 21:07:06.849019	2017-12-09 21:07:06.849019
10	2015	134	18	60	168	2017-12-09 21:07:06.855488	2017-12-09 21:07:06.855488
11	2014	27	65	85	187	2017-12-09 21:07:06.861498	2017-12-09 21:07:06.861498
12	2013	105	153	47	17	2017-12-09 21:07:06.867728	2017-12-09 21:07:06.867728
13	2017	150	1	61	40	2017-12-09 21:07:07.419341	2017-12-09 21:07:07.419341
14	2016	32	181	183	138	2017-12-09 21:07:07.425903	2017-12-09 21:07:07.425903
15	2015	152	37	192	61	2017-12-09 21:07:07.43252	2017-12-09 21:07:07.43252
16	2014	124	40	43	17	2017-12-09 21:07:07.438866	2017-12-09 21:07:07.438866
17	2019	91	153	33	171	2017-12-09 21:07:14.142029	2017-12-09 21:07:14.142029
18	2018	114	102	63	151	2017-12-09 21:07:14.148514	2017-12-09 21:07:14.148514
19	2017	47	0	173	192	2017-12-09 21:07:14.154787	2017-12-09 21:07:14.154787
20	2016	121	62	195	37	2017-12-09 21:07:14.160859	2017-12-09 21:07:14.160859
21	2016	61	3	103	28	2017-12-09 21:07:16.266473	2017-12-09 21:07:16.266473
22	2015	137	173	148	104	2017-12-09 21:07:16.287294	2017-12-09 21:07:16.287294
23	2014	114	139	47	3	2017-12-09 21:07:16.293669	2017-12-09 21:07:16.293669
24	2013	154	41	101	122	2017-12-09 21:07:16.300033	2017-12-09 21:07:16.300033
\.


--
-- Name: wide_receivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('wide_receivers_id_seq', 24, true);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: affiliations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY affiliations
    ADD CONSTRAINT affiliations_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: athletes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY athletes
    ADD CONSTRAINT athletes_pkey PRIMARY KEY (id);


--
-- Name: centers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY centers
    ADD CONSTRAINT centers_pkey PRIMARY KEY (id);


--
-- Name: coaches_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY coaches
    ADD CONSTRAINT coaches_pkey PRIMARY KEY (id);


--
-- Name: colleges_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY colleges
    ADD CONSTRAINT colleges_pkey PRIMARY KEY (id);


--
-- Name: connections_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);


--
-- Name: conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: cornerbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY cornerbacks
    ADD CONSTRAINT cornerbacks_pkey PRIMARY KEY (id);


--
-- Name: defensive_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY defensive_ends
    ADD CONSTRAINT defensive_ends_pkey PRIMARY KEY (id);


--
-- Name: defensive_tackles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY defensive_tackles
    ADD CONSTRAINT defensive_tackles_pkey PRIMARY KEY (id);


--
-- Name: enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- Name: free_safeties_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY free_safeties
    ADD CONSTRAINT free_safeties_pkey PRIMARY KEY (id);


--
-- Name: fullbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY fullbacks
    ADD CONSTRAINT fullbacks_pkey PRIMARY KEY (id);


--
-- Name: guards_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY guards
    ADD CONSTRAINT guards_pkey PRIMARY KEY (id);


--
-- Name: high_schools_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY high_schools
    ADD CONSTRAINT high_schools_pkey PRIMARY KEY (id);


--
-- Name: highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY highlights
    ADD CONSTRAINT highlights_pkey PRIMARY KEY (id);


--
-- Name: inside_linebackers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY inside_linebackers
    ADD CONSTRAINT inside_linebackers_pkey PRIMARY KEY (id);


--
-- Name: kick_returners_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY kick_returners
    ADD CONSTRAINT kick_returners_pkey PRIMARY KEY (id);


--
-- Name: kickers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY kickers
    ADD CONSTRAINT kickers_pkey PRIMARY KEY (id);


--
-- Name: left_guards_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY left_guards
    ADD CONSTRAINT left_guards_pkey PRIMARY KEY (id);


--
-- Name: left_tackles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY left_tackles
    ADD CONSTRAINT left_tackles_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: middle_linebackers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY middle_linebackers
    ADD CONSTRAINT middle_linebackers_pkey PRIMARY KEY (id);


--
-- Name: nose_tackles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY nose_tackles
    ADD CONSTRAINT nose_tackles_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: outside_linebackers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY outside_linebackers
    ADD CONSTRAINT outside_linebackers_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: punt_returners_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY punt_returners
    ADD CONSTRAINT punt_returners_pkey PRIMARY KEY (id);


--
-- Name: punters_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY punters
    ADD CONSTRAINT punters_pkey PRIMARY KEY (id);


--
-- Name: quarterbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY quarterbacks
    ADD CONSTRAINT quarterbacks_pkey PRIMARY KEY (id);


--
-- Name: references_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT references_pkey PRIMARY KEY (id);


--
-- Name: right_guards_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY right_guards
    ADD CONSTRAINT right_guards_pkey PRIMARY KEY (id);


--
-- Name: right_tackles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY right_tackles
    ADD CONSTRAINT right_tackles_pkey PRIMARY KEY (id);


--
-- Name: running_backs_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY running_backs
    ADD CONSTRAINT running_backs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stats_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: strong_safeties_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY strong_safeties
    ADD CONSTRAINT strong_safeties_pkey PRIMARY KEY (id);


--
-- Name: tackles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY tackles
    ADD CONSTRAINT tackles_pkey PRIMARY KEY (id);


--
-- Name: tight_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY tight_ends
    ADD CONSTRAINT tight_ends_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: wide_receivers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY wide_receivers
    ADD CONSTRAINT wide_receivers_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_addresses_on_owner_type_and_owner_id ON addresses USING btree (owner_type, owner_id);


--
-- Name: index_affiliations_on_coach_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_affiliations_on_coach_id ON affiliations USING btree (coach_id);


--
-- Name: index_affiliations_on_organization_type_and_organization_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_affiliations_on_organization_type_and_organization_id ON affiliations USING btree (organization_type, organization_id);


--
-- Name: index_articles_on_athlete_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_articles_on_athlete_id ON articles USING btree (athlete_id);


--
-- Name: index_connections_on_athlete_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_connections_on_athlete_id ON connections USING btree (athlete_id);


--
-- Name: index_connections_on_college_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_connections_on_college_id ON connections USING btree (college_id);


--
-- Name: index_conversations_on_athlete_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_conversations_on_athlete_id ON conversations USING btree (athlete_id);


--
-- Name: index_conversations_on_organization_type_and_organization_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_conversations_on_organization_type_and_organization_id ON conversations USING btree (organization_type, organization_id);


--
-- Name: index_enrollments_on_athlete_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_enrollments_on_athlete_id ON enrollments USING btree (athlete_id);


--
-- Name: index_enrollments_on_high_school_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_enrollments_on_high_school_id ON enrollments USING btree (high_school_id);


--
-- Name: index_highlights_on_cached_votes_down; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_votes_down ON highlights USING btree (cached_votes_down);


--
-- Name: index_highlights_on_cached_votes_score; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_votes_score ON highlights USING btree (cached_votes_score);


--
-- Name: index_highlights_on_cached_votes_total; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_votes_total ON highlights USING btree (cached_votes_total);


--
-- Name: index_highlights_on_cached_votes_up; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_votes_up ON highlights USING btree (cached_votes_up);


--
-- Name: index_highlights_on_cached_weighted_average; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_weighted_average ON highlights USING btree (cached_weighted_average);


--
-- Name: index_highlights_on_cached_weighted_score; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_weighted_score ON highlights USING btree (cached_weighted_score);


--
-- Name: index_highlights_on_cached_weighted_total; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_cached_weighted_total ON highlights USING btree (cached_weighted_total);


--
-- Name: index_highlights_on_highlightable_type_and_highlightable_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_highlights_on_highlightable_type_and_highlightable_id ON highlights USING btree (highlightable_type, highlightable_id);


--
-- Name: index_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_messages_on_conversation_id ON messages USING btree (conversation_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_messages_on_user_id ON messages USING btree (user_id);


--
-- Name: index_phone_numbers_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_phone_numbers_on_owner_type_and_owner_id ON phone_numbers USING btree (owner_type, owner_id);


--
-- Name: index_references_on_athlete_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_references_on_athlete_id ON "references" USING btree (athlete_id);


--
-- Name: index_stats_on_athlete_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_stats_on_athlete_id ON stats USING btree (athlete_id);


--
-- Name: index_stats_on_position_type_and_position_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_stats_on_position_type_and_position_id ON stats USING btree (position_type, position_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON users USING btree (invitation_token);


--
-- Name: index_users_on_invitations_count; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_users_on_invitations_count ON users USING btree (invitations_count);


--
-- Name: index_users_on_invited_by_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_users_on_invited_by_id ON users USING btree (invited_by_id);


--
-- Name: index_users_on_profile_type_and_profile_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_users_on_profile_type_and_profile_id ON users USING btree (profile_type, profile_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: fk_rails_14259ab53e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT fk_rails_14259ab53e FOREIGN KEY (college_id) REFERENCES colleges(id);


--
-- Name: fk_rails_42b777af15; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT fk_rails_42b777af15 FOREIGN KEY (athlete_id) REFERENCES athletes(id);


--
-- Name: fk_rails_4d07551144; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT fk_rails_4d07551144 FOREIGN KEY (athlete_id) REFERENCES athletes(id);


--
-- Name: fk_rails_6712d87d6f; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY conversations
    ADD CONSTRAINT fk_rails_6712d87d6f FOREIGN KEY (athlete_id) REFERENCES athletes(id);


--
-- Name: fk_rails_7f927086d2; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_7f927086d2 FOREIGN KEY (conversation_id) REFERENCES conversations(id);


--
-- Name: fk_rails_810847d2eb; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT fk_rails_810847d2eb FOREIGN KEY (high_school_id) REFERENCES high_schools(id);


--
-- Name: fk_rails_a620381b11; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_rails_a620381b11 FOREIGN KEY (athlete_id) REFERENCES athletes(id);


--
-- Name: fk_rails_b08d9357a9; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY affiliations
    ADD CONSTRAINT fk_rails_b08d9357a9 FOREIGN KEY (coach_id) REFERENCES coaches(id);


--
-- Name: fk_rails_cfb8b1a451; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT fk_rails_cfb8b1a451 FOREIGN KEY (athlete_id) REFERENCES athletes(id);


--
-- Name: fk_rails_e6c74fea21; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT fk_rails_e6c74fea21 FOREIGN KEY (athlete_id) REFERENCES athletes(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

