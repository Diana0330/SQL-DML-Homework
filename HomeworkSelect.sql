--Part 1.
--1.Название и продолжительность самого длительного трека.


select track_id, name
from track t 
order by duration desc
limit 1;


--2.Название треков, продолжительность которых не менее 3,5 минут.


select track_id, name, duration
from track t 
where duration >=3.5; 


--3.Названия сборников, вышедших в период с 2018 по 2020 год включительно.


select *
from playlist p 
where release_year between 2018 and 2020;

--4.Исполнители, чьё имя состоит из одного слова.


select *
from artist a 
where name not like '% %';


--5.Название треков, которые содержат слово «мой» или «my».


select track_id, name
from track t 
where name ilike '%My%' or name ilike '%мой%'
order by track_id;

--Part 2.
--1.Количество исполнителей в каждом жанре.


select count(a.artist_id) as NumberOfArtists, mg.genre_id, mg.type
from artist a
join genres_artist ga on a.artist_id = ga.artist_id 
join musical_genres mg on ga.genre_id = mg.genre_id 
group by mg.genre_id;


--2.Количество треков, вошедших в альбомы 2019–2020 годов.


select t.track_id, count(*)
from track t 
join album a on t.album_id = a.album_id 
where a.release_year between 2019 and 2020
group by t.track_id;


--3.Средняя продолжительность треков по каждому альбому.


select a.title, a.album_id , avg(t.duration) as AverageDuration
from track t 
join album a on t.album_id = a.album_id 
group by a.album_id
order by a.album_id;


--4.Все исполнители, которые не выпустили альбомы в 2020 году.


select a.artist_id, a.name
from artist a 
where a.artist_id not in ( 
 select a.artist_id
 from artist a 
 join artist_album aa on a.artist_id = aa.artist_id 
 join album a2 on aa.album_id = a2.album_id 
 where a2.release_year = 2020
 group by a.artist_id);


--5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).


select distinct p.title as PlayList
from playlist p 
join playlist_track pt on p.playlist_id = pt.playlist_id 
join track t on pt.track_id = t.track_id 
join artist_album aa on t.album_id = aa.album_id 
join artist a on aa.artist_id = a.artist_id 
where a.name = 'Beyonce';

--Part 3.
--1.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.


select distinct a.title, a.album_id 
from album a 
join artist_album aa on a.album_id = aa.album_id 
join artist a2 on aa.artist_id = a2.artist_id 
join genres_artist ga on a2.artist_id = ga.artist_id 
where a2.artist_id in
 (select a.artist_id 
  from artist a
  join genres_artist ga on a.artist_id = ga.artist_id
  group by a.artist_id
  having count(*) > 1)


2.Наименования треков, которые не входят в сборники.


select t.name, t.track_id
from track t 
left join playlist_track pt on t.track_id = pt.track_id 
where pt.playlist_id is null;


-- 3.Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков 
--может быть несколько.


select a.name, a.artist_id
from artist a 
join artist_album aa on a.artist_id = aa.artist_id 
join album a2 on aa.album_id = a2.album_id 
join track t on a2.album_id = t.album_id 
where t.duration = (select min(duration) from track)
group by a.artist_id


-- 4.Названия альбомов, содержащих наименьшее количество треков.


select a.title, count(t.track_id) as NumberOfTracks
from album a 
join track t on a.album_id = t.album_id 
group by a.album_id
having count(t.track_id) = 
 (select count(t.track_id) as NumberOfTracks
  from album a 
  join track t on a.album_id = t.album_id 
  group by a.album_id
  order by NumberOfTracks asc
  limit 1);

