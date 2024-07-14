CREATE TABLE peliculas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    categoria TEXT NOT NULL,
    imagen TEXT,
    video TEXT,
    descripcion TEXT
);

INSERT INTO peliculas (titulo, categoria, imagen, video, descripcion) VALUES
('Deadpool and Wolverine', 'accion', 'https://www.lahiguera.net/cinemania/pelicula/11086/deadpool_y_lobezno-cartel-11876.jpg', 'https://www.youtube.com/embed/BRGBYU7iW1g?si=9RlCPcFMNJ-yldIE', 'Lobezno se recupera de sus heridas cuando se cruza con el bocazas, Deadpool, que ha viajado en el tiempo para curarlo con la esperanza de hacerse amigos y formar un equipo para acabar con un enemigo común.'),
('Alien Romulus', 'terror', 'https://www.lahiguera.net/cinemania/pelicula/10619/alien_romulus-cartel-11830.jpg', 'https://www.youtube.com/embed/kTpc5SoBVu0?si=fH1B_Fmbch6H1Gzr', 'En el espacio nadie puede oirte gritar'),
('Challengers', 'drama', 'https://www.lahiguera.net/cinemania/pelicula/10932/rivales-cartel-11707.jpg', 'https://www.youtube.com/embed/dtSZbtlhxjg?si=UJNIYQjuK-J6WdSJ', 'Tashi, entrenadora de tenis, ha convertido a Art, su esposo, en una de las grandes estrellas del circuito. Art, quien atraviesa una mala época, acepta jugar un torneo sin importancia, donde se enfrenta al exnovio de Tashi, su antiguo mejor amigo.'),
('Little Women', 'drama', 'https://images.squarespace-cdn.com/content/v1/5bbcad0f2727be3646b9fee1/1572374741965-V8XF0L9IGW8UQE64SKT4/68k4td19chv31.jpg', 'https://www.youtube.com/embed/-AN01Vnmt3U?si=CMf4TkSSrFkwH0i1', 'En los primeros años que prosiguen a la guerra civil estadounidense, la vida de una familia se ve alterada para siempre luego de que Beth, una de las hermanas, revela que padece una terrible enfermedad.');
