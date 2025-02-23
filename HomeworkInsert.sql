insert into  musical_genres(type)
values 
('pop music'),
('hip-hop'), 
('rock');

insert into artist(name)
values 
('Jennifer Lopez'),
('Elton John'), 
('Beyonce'),
('Kanye West'),
('Drake'),
('The Rolling Stones');


insert into genres_artist(genre_id, artist_id)
values 
(1,1),
(1,2), 
(1,3),
(2,3),
(2,4),
(2,5),
(3,2),
(3,6);


insert into album(title, release_year)
values 
('Some Girls', 1978),
('Love?', 2011), 
('Elton John', 1970),
('For All the Dogs', 2023),
('Cowboy Carter', 2024),
('The Life of Pablo', 2016);

insert into album(title, release_year)
values 
('Exile on Main Street', 2019);

insert into artist_album(artist_id, album_id)
values 
(1,2),
(2,3),
(3,5),
(4,6),
(5,4),
(6,1);

insert into track(name, duration, album_id)
values 
('Paint It Black', 3.46, 1),
('Lets Get Loud', 3.55, 2), 
('Rocket Man', 4.35, 3),
('Gods Plan', 5.23, 4 ),
('Drunk In Love', 3.65,5),
('Your song', 3.50, 3),
('On the Floor', 3.53, 2),
('My Carnival', 4.10, 6),
('If I were a Boy', 3.47, 5),
('Ice Melts', 4.11, 4 );

insert into track(name, duration, album_id)
values 
('Paint It Black', 3.46, 1);

insert into track(name, duration, album_id)
values 
('I Cant Get No Satisfaction', 3.75, 7);

insert into track(name, duration, album_id)
values 
('One Dance', 4.46, 4);

insert into playlist(title, release_year)
values 
('Positive', 2011),
('Feeling Alive', 2022), 
('Fresh Finds', 2020),
('New Moon', 2018),
('Mellow Vibes', 1990),
('Comfort Zone', 2022);


insert into playlist_track(playlist_id, track_id)
values 
(1,2),
(1,6),
(1,4),
(2,3),
(2,5),
(3,3),
(3,8),
(3,10),
(3,5),
(4,2),
(4,7),
(5,1),
(5,9),
(5,8);
