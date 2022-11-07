CREATE SCHEMA hw_jc;

CREATE TABLE hw_jc.providers
(
    id serial primary key NOT NULL,
    name character varying NOT NULL,
    address character varying,
    city character varying,
    phone_number character varying(10)
);

CREATE TABLE hw_jc.ingredients
(
    id serial primary key NOT NULL,
    name character varying NOT NULL,
    available numeric DEFAULT 0
);

CREATE TABLE hw_jc.types_of_dishes
(
    id serial primary key NOT NULL,
    type character varying NOT NULL,
    description character varying
);

CREATE TABLE hw_jc.units_of_measurement
(
    id serial primary key NOT NULL,
    name character varying NOT NULL,
    description character varying,
    kg numeric not null
);

CREATE TABLE hw_jc.dishes
(
    id serial primary key NOT NULL,
    name character varying NOT NULL,
    description character varying,
    picture character varying,
    cost numeric NOT NULL
);

CREATE TABLE hw_jc.dishes_types
(
    id serial primary key NOT NULL,
    dish_id integer references hw_jc.dishes(id) NOT NULL,
    type_id integer references hw_jc.types_of_dishes(id) NOT NULL
);

CREATE TABLE hw_jc.recipe_steps
(
    id serial primary key NOT NULL,
    dish_id integer references hw_jc.dishes(id) NOT NULL,
    action character varying NOT NULL,
    action_id integer NOT NULL
);

CREATE TABLE hw_jc.dish_components
(
    id serial primary key NOT NULL,
    dish_id integer references hw_jc.dishes(id) NOT NULL,
    ingredient_id integer references hw_jc.ingredients(id) NOT NULL,
    amount numeric,
    units_id integer references hw_jc.units_of_measurement(id) NOT NULL
);
