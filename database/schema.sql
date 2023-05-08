-- Table: public.genero

-- DROP TABLE IF EXISTS public.genero;

CREATE TABLE IF NOT EXISTS public.genero
(
    id integer NOT NULL DEFAULT nextval('genero_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    CONSTRAINT genero_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genero
    OWNER to postgres;



-- Table: public.musica

-- DROP TABLE IF EXISTS public.musica;

CREATE TABLE IF NOT EXISTS public.musica
(
    id integer NOT NULL DEFAULT nextval('musica_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    duracion character varying COLLATE pg_catalog."default",
    foto bytea,
    artista character varying COLLATE pg_catalog."default",
    id_genero integer,
    CONSTRAINT pk_musica PRIMARY KEY (id),
    CONSTRAINT id_genero FOREIGN KEY (id_genero)
        REFERENCES public.genero (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.musica
    OWNER to postgres;



-- Table: public.musica_playlist

-- DROP TABLE IF EXISTS public.musica_playlist;

CREATE TABLE IF NOT EXISTS public.musica_playlist
(
    id integer NOT NULL DEFAULT nextval('musica_playlist_id_seq'::regclass),
    id_musica integer,
    id_playlist integer,
    CONSTRAINT musica_playlist_pkey PRIMARY KEY (id),
    CONSTRAINT fk_musica FOREIGN KEY (id_musica)
        REFERENCES public.musica (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_playlist FOREIGN KEY (id_playlist)
        REFERENCES public.playlist (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.musica_playlist
    OWNER to postgres;



-- Table: public.playlist

-- DROP TABLE IF EXISTS public.playlist;

CREATE TABLE IF NOT EXISTS public.playlist
(
    id integer NOT NULL DEFAULT nextval('playlist_id_seq'::regclass),
    id_usuario integer,
    CONSTRAINT pk_playlist PRIMARY KEY (id),
    CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
        REFERENCES public.usuario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.playlist
    OWNER to postgres;



-- Table: public.usuario

-- DROP TABLE IF EXISTS public.usuario;

CREATE TABLE IF NOT EXISTS public.usuario
(
    id integer NOT NULL DEFAULT nextval('usuario_id_seq'::regclass),
    nombre_usuario character varying COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    password character varying COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.usuario
    OWNER to postgres;


-- Insertar datos en tabla genero

INSERT INTO public.genero(
	id, nombre)
	VALUES (1, 'Cumbia'),
	(2, 'Reggaeton'),
	(3, 'Floklore'),
	(4, 'Jazz'),
	(5, 'Rock');

-- Insert datos en tabla musica

INSERT INTO public.musica(
	id, nombre, duracion, artista, id_genero)
	VALUES (1, 'Latidos', '3:25', 'Matias Valdez', 1),
	(2, 'Hechicera', '3:45', 'Lucas Sugo', 1),
	(3, 'Universo paralelo', '2:50', 'La Conga', 1),
	(4, 'Bombon asesino', '2:37', 'Los Palmeras', 1),
	(5, 'Que tiene la noche', '3:15', 'Cacho Ramos', 1),
	(6, 'Mayores', '2:45', 'Becky G', 2),
	(7, '100', '3:10', 'Ozuna', 2),
	(8, 'Mi cama', '3:00', 'J Balvin', 2),
	(9, 'Soltera', '3:30', 'Daddy Yanquee', 2),
	(10, 'Felices los 4', '2:55', 'Maluma', 2),
	(11, 'Isla patrulla', '3:10', 'Braulio Lopez', 3),
	(12, 'Morir en la capital', '4:20', 'Pablo Estramín', 3),
	(13, 'Donde yace mi corazón', '4:10', 'Larbanois & Carrero', 3),
	(14, 'Bendito', '2:55', 'Maciegas', 3),
	(15, 'Doña soledad', '2:50', 'Alfredo Sitarroza', 3),
	(16, 'Back to Black', '3:35', 'Amy Winehouse', 4),
	(17, 'What a Wonderful World', '3:00', 'Louis Armstrong', 4),
	(18, 'Respect', '2:25', 'Aretha Franklin', 4),
	(19, 'Dont know Why', '3:40', 'Norah Jones', 4),
	(20, 'Feeling Good', '3:55', 'Nina Simone', 4),
	(21, 'Sweet Child O Mine', '4:45', 'Guns N Roses', 5),
	(22, '(I Cant get No) Satisfaction', '4:00', 'The Rolling Stones', 5),
	(23, 'Hotel California', '3:15', 'Eagles', 5),
	(24, 'Light My Fire', '2:55', 'The Doors', 5),
	(25, 'Losing My Religion', '3:30', 'R.E.M.', 5);