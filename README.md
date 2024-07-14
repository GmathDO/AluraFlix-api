# Aluraflix API

Esta es una API para gestionar películas utilizando Cloudflare Workers y Cloudflare D1 como base de datos. 

## Endpoints

### Obtener todas las películas

**GET** `/api/peliculas`

Devuelve una lista de todas las películas.

**Respuesta:**
```json
[
    {
        "id": 1,
        "titulo": "Deadpool and wolverine",
        "categoria": "accion",
        "imagen": "https://www.lahiguera.net/cinemania/pelicula/11086/deadpool_y_lobezno-cartel-11876.jpg",
        "video": "https://www.youtube.com/embed/BRGBYU7iW1g?si=9RlCPcFMNJ-yldIE",
        "descripcion": "Lobezno se recupera de sus heridas cuando se cruza con el bocazas, Deadpool, que ha viajado en el tiempo para curarlo con la esperanza de hacerse amigos y formar un equipo para acabar con un enemigo común."
    },
    ...
]
```

### Obtener una película por ID

**GET** `/api/peliculas/:id`

Devuelve una película específica por su ID.

**Respuesta:**
```json
{
    "id": 1,
    "titulo": "Deadpool and wolverine",
    "categoria": "accion",
    "imagen": "https://www.lahiguera.net/cinemania/pelicula/11086/deadpool_y_lobezno-cartel-11876.jpg",
    "video": "https://www.youtube.com/embed/BRGBYU7iW1g?si=9RlCPcFMNJ-yldIE",
    "descripcion": "Lobezno se recupera de sus heridas cuando se cruza con el bocazas, Deadpool, que ha viajado en el tiempo para curarlo con la esperanza de hacerse amigos y formar un equipo para acabar con un enemigo común."
}
```

### Crear una nueva película

**POST** `/api/peliculas`

Crea una nueva película.

**Cuerpo de la solicitud:**
```json
{
    "titulo": "New Movie",
    "categoria": "comedy",
    "imagen": "https://example.com/image.jpg",
    "video": "https://example.com/video.mp4",
    "descripcion": "Description of the new movie."
}
```

**Respuesta:**
```json
{
    "success": true
}
```

### Actualizar una película por ID

**PUT** `/api/peliculas/:id`

Actualiza una película específica por su ID.

**Cuerpo de la solicitud:**
```json
{
    "titulo": "Updated Movie",
    "categoria": "comedy",
    "imagen": "https://example.com/image.jpg",
    "video": "https://example.com/video.mp4",
    "descripcion": "Updated description of the movie."
}
```

**Respuesta:**
```json
{
    "success": true
}
```

### Eliminar una película por ID

**DELETE** `/api/peliculas/:id`

Elimina una película específica por su ID.

**Respuesta:**
```json
{
    "success": true
}
```

## Configuración y Creación de la Base de Datos

### Crear la Base de Datos

1. **Instala Wrangler**:
    ```bash
    npm install -g wrangler
    ```

2. **Inicia sesión en tu cuenta de Cloudflare**:
    ```bash
    wrangler login
    ```

3. **Crea la base de datos**:
    ```bash
    wrangler d1 create my_movie_db
    ```

### Configurar la Base de Datos
1. **Ejecuta el archivo `init.sql` para inicializar la base de datos**:
    ```bash
    npx wrangler d1 execute my_movie_db --file=init.sql
    npx wrangler d1 execute my_movie_db --file=init.sql --remote
    ```

### Configuración de Wrangler

1. **Edita tu archivo `wrangler.toml`** y añade la configuración de la base de datos:

    ```toml
    name = "aluraflix-api"
    main = "src/index.js"
    compatibility_date = "2024-07-13"

    [[d1_databases]]
    binding = "DB"
    database_name = "my_movie_db"
    database_id = "9bed8510-544b-4c4c-8b7e-3b381b27933c"
    ```

2. **Desarrolla localmente**:
    ```bash
    npx wrangler dev
    ```

### Despliegue

1. **Despliega tu Worker**:
    ```bash
    npx wrangler publish
    ```

