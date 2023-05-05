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