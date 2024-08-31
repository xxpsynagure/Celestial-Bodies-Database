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
    galaxy_types_id integer NOT NULL,
    description text NOT NULL,
    estimated_number_of_stars_in_billions integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_spiral_arms boolean DEFAULT false,
    contains_younger_stars boolean DEFAULT false
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    distance_from_its_planet numeric(12,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    radius numeric(5,3),
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    spectral_type character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 'A barred spiral galaxy with a central bulge, spiral arms, and a large disk. Contains a mix of young and old stars.', 400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 1, 'A large spiral galaxy with a similar structure to the Milky Way. It is the nearest spiral galaxy to the Milky Way.', 1000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87 (M87)', 2, 'A giant elliptical galaxy with a massive central black hole. It is a prominent member of the Virgo Cluster.', 1000);
INSERT INTO public.galaxy VALUES (4, 'NGC 1407', 2, 'A large elliptical galaxy in the Fornax Cluster. It has a dense core and a large number of globular clusters.', 1000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud (LMC)', 3, 'A satellite galaxy of the Milky Way with irregular structure and active star formation regions.', 10);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud (SMC)', 3, 'Another satellite galaxy of the Milky Way, known for its irregular shape and ongoing star formation.', 7);
INSERT INTO public.galaxy VALUES (7, 'Messier 1023', 4, 'A lenticular galaxy with a prominent bulge and a disk but lacking significant spiral arms.', 100);
INSERT INTO public.galaxy VALUES (8, 'NGC 5866', 4, 'A lenticular galaxy known for its smooth light distribution and central bulge.', 50);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (2, 'Elliptical Galaxies', 'These galaxies are more rounded or oval in shape and have a smooth, featureless light distribution. They contain older stars and have little interstellar gas or dust.', false, false);
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular Galaxies', 'These galaxies are a sort of intermediate type between spiral and elliptical galaxies. They have a central bulge and a disk but lack the prominent spiral arms of spiral galaxies.', false, false);
INSERT INTO public.galaxy_types VALUES (1, 'Spiral Galaxies', 'These galaxies have a flat, rotating disk containing stars, gas, and dust, along with a central bulge of older stars. They often have spiral arms that extend outward from the center.', true, true);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular Galaxies', 'These galaxies lack a defined shape and do not fit into the spiral or elliptical categories. They often appear chaotic and may have high rates of star formation.', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (29, 'The Moon', 3, 'Earth''s only natural satellite, known for its phases and influence on tides.', 384400.00);
INSERT INTO public.moon VALUES (30, 'Phobos', 4, 'One of Mars'' two moons, known for its irregular shape and rapid orbit.', 9377.00);
INSERT INTO public.moon VALUES (31, 'Deimos', 4, 'The smaller of Mars'' two moons, with a more distant and slower orbit.', 23460.00);
INSERT INTO public.moon VALUES (32, 'Io', 5, 'One of Jupiter''s largest moons, known for its extreme volcanic activity.', 421700.00);
INSERT INTO public.moon VALUES (33, 'Europa', 5, 'A moon of Jupiter with a smooth, icy surface and potential subsurface ocean.', 670900.00);
INSERT INTO public.moon VALUES (34, 'Ganymede', 5, 'The largest moon in the Solar System, larger than Mercury.', 1070400.00);
INSERT INTO public.moon VALUES (35, 'Callisto', 5, 'The outermost of Jupiter''s four largest moons, heavily cratered and ancient.', 1882700.00);
INSERT INTO public.moon VALUES (36, 'Titan', 6, 'Saturn''s largest moon, with a thick atmosphere and lakes of liquid methane.', 1221870.00);
INSERT INTO public.moon VALUES (37, 'Rhea', 6, 'A moon of Saturn known for its icy surface and faint rings.', 527600.00);
INSERT INTO public.moon VALUES (38, 'Iapetus', 6, 'A moon of Saturn with a unique two-tone coloration and a ridge along its equator.', 3561300.00);
INSERT INTO public.moon VALUES (39, 'Miranda', 7, 'One of Uranus'' moons, noted for its extreme surface features and large canyons.', 129600.00);
INSERT INTO public.moon VALUES (40, 'Ariel', 7, 'A moon of Uranus with a relatively young surface and signs of past tectonic activity.', 191020.00);
INSERT INTO public.moon VALUES (41, 'Triton', 8, 'The largest moon of Neptune, known for its retrograde orbit and geysers.', 354800.00);
INSERT INTO public.moon VALUES (42, 'Nereid', 8, 'A small, irregularly shaped moon of Neptune with a highly elliptical orbit.', 1176470.00);
INSERT INTO public.moon VALUES (43, 'Charon', 12, 'The largest moon of Pluto, nearly half the size of its parent planet.', 19500.00);
INSERT INTO public.moon VALUES (44, 'Kerberos', 12, 'A small moon of Pluto, discovered in 2011.', 19500.00);
INSERT INTO public.moon VALUES (45, 'Styx', 12, 'One of Pluto''s moons, discovered in 2012.', 19500.00);
INSERT INTO public.moon VALUES (46, 'Hydra', 12, 'A moon of Pluto, discovered in 2006, with an irregular shape.', 19500.00);
INSERT INTO public.moon VALUES (47, 'Enceladus', 6, 'A moon of Saturn known for its icy surface and plumes of water vapor.', 238000.00);
INSERT INTO public.moon VALUES (48, 'Mimas', 6, 'A small moon of Saturn with a large impact crater, known as the "Death Star" moon.', 185539.00);
INSERT INTO public.moon VALUES (49, 'Janus', 6, 'A moon of Saturn with a highly irregular shape and co-orbital with Epimetheus.', 151472.00);
INSERT INTO public.moon VALUES (50, 'Epimetheus', 6, 'A moon of Saturn that shares its orbit with Janus, known for its irregular shape.', 151472.00);
INSERT INTO public.moon VALUES (51, 'Titania', 7, 'A moon of Uranus, known for its large canyons and potential subsurface ocean.', 436300.00);
INSERT INTO public.moon VALUES (52, 'Oberon', 7, 'The second-largest moon of Uranus, with a heavily cratered surface.', 583520.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 12, 'The closest planet to the Sun, known for its extreme temperature variations and small size.', 0.382, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 12, 'The second planet from the Sun, characterized by its thick, toxic atmosphere and high surface temperatures.', 0.949, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 12, 'The third planet from the Sun, the only known planet to support life, with liquid water on its surface.', 1.000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 12, 'The fourth planet from the Sun, known for its red color due to iron oxide on its surface and its thin atmosphere.', 0.532, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 12, 'The fifth planet from the Sun, the largest in the Solar System, known for its Great Red Spot and many moons.', 11.209, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 12, 'The sixth planet from the Sun, famous for its extensive ring system and large size.', 9.449, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 12, 'The seventh planet from the Sun, noted for its unique tilt and blue-green color due to methane in its atmosphere.', 4.007, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 12, 'The eighth planet from the Sun, known for its strong winds and deep blue color.', 3.883, 14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 5, 'An exoplanet orbiting Proxima Centauri, located in the habitable zone of its star.', 1.100, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 6, 'An exoplanet orbiting Kepler-452, often referred to as Earth’s “cousin” due to its similar size and orbital distance from its star.', 1.600, 0);
INSERT INTO public.planet VALUES (11, 'NGC 5866 Planet 1', 7, 'A hypothetical planet in the NGC 5866 galaxy, characterized by its unique orbit and composition.', 1.200, 0);
INSERT INTO public.planet VALUES (12, 'M87 Planet 1', 8, 'A hypothetical planet in the Messier 87 galaxy, with an unusual orbital path and environmental conditions.', 2.300, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'The brightest star in the night sky, a binary system with a main-sequence star and a white dwarf.', 'A1V (Sirius A)');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'A red supergiant star in the Orion constellation, known for its reddish hue and large size.', 'M1-M2Ia');
INSERT INTO public.star VALUES (3, 'Vega', 1, 'A blue-white main-sequence star, one of the most luminous stars in the sky.', 'A0V');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'The closest star system to the Solar System, a G-type main-sequence star similar to the Sun.', 'G2V');
INSERT INTO public.star VALUES (5, 'Andromeda Star 1', 2, 'A massive blue giant star in the Andromeda Galaxy, known for its high luminosity and blue hue.', 'O5V');
INSERT INTO public.star VALUES (6, 'M87 Star 1', 3, 'A large red giant star in the Messier 87 galaxy, with a prominent red color and high luminosity.', 'M2II');
INSERT INTO public.star VALUES (7, 'SMC Star 1', 4, 'A blue supergiant star in the Small Magellanic Cloud, known for its intense blue color and large size.', 'B0I');
INSERT INTO public.star VALUES (8, 'LMC Star 1', 5, 'A variable star in the Large Magellanic Cloud, known for its variability and significant luminosity changes.', 'F5V');
INSERT INTO public.star VALUES (9, 'NGC 5866 Star 1', 6, 'A yellow giant star in the NGC 5866 galaxy, characterized by its smooth light distribution and moderate luminosity.', 'G8III');
INSERT INTO public.star VALUES (10, 'Messier 1023 Star 1', 7, 'A white dwarf star in Messier 1023, notable for its high surface temperature and faint visibility.', 'DA');
INSERT INTO public.star VALUES (11, 'Small Magellanic Cloud Star 1', 8, 'A red supergiant in the Small Magellanic Cloud, known for its size and reddish appearance.', 'M1Ia');
INSERT INTO public.star VALUES (12, 'Sun', 1, 'The star at the center of the Solar System, providing light and warmth to Earth and the other planets.', 'G2V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 52, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

