CREATE TABLE musical_genres (
	genre_id serial primary key,
	type varchar(50) not null
);

CREATE TABLE artist (
	artist_id serial primary key,
	name varchar(50) not null
);

CREATE TABLE genres_artist (
	genre_id integer references musical_genres(genre_id),
	artist_id integer references artist(artist_id),
	constraint pk_genres_artist primary key(genre_id, artist_id)
	);

CREATE TABLE album (
	album_id serial primary key,
	title varchar(50) not null,
	release_year int
);

CREATE TABLE artist_album (
	artist_id integer references artist(artist_id),
	album_id integer references album(album_id),
	constraint pk_artist_album primary key(artist_id, album_id)
	);

CREATE TABLE track (
	track_id serial primary key,
	name varchar(50) not null,
	duration int2 not null,
	album_id integer not null references album(album_id)
);

CREATE TABLE playlist (
	playlist_id serial primary key,
	title varchar(50) not null,
	release_year int
);

CREATE TABLE playlist_track (
	playlist_id integer references playlist(playlist_id),
	track_id integer references track(track_id),
	constraint pk_playlist_track primary key(playlist_id, track_id)
	);
