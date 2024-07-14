import { Hono } from "hono";

const app = new Hono();

app.get("/api/peliculas", async (c) => {
  const { results } = await c.env.DB.prepare("SELECT * FROM peliculas").all();
  return c.json(results);
});

app.get("/api/peliculas/:id", async (c) => {
  const { results } = await c.env.DB.prepare(
    "SELECT * FROM peliculas WHERE id = ?"
  )
    .bind(c.req.param("id"))
    .all();

  if (results.length !== 0) {
    return c.json(results);
  } else {
    return c.json({ error: "No Encontrado" }, { status: 404 });
  }
});

app.post("/api/peliculas", async (c) => {
  const { titulo, categoria, imagen, video, descripcion } = await c.req.json();

  const { success, error } = await c.env.DB.prepare(
    "INSERT INTO peliculas (titulo, categoria, imagen, video, descripcion) VALUES (?, ?, ?, ?, ?)"
  )
    .bind(titulo, categoria, imagen, video, descripcion)
    .run();

  if (success) {
    return c.json({ success: true }, { status: 201 });
  } else {
    return c.json({ error: "Error al crear: " + error }, { status: 400 });
  }
});

app.put("/api/peliculas/:id", async (c) => {
  const { titulo, categoria, imagen, video, descripcion } = await c.req.json();

  const { success, error } = await c.env.DB.prepare(
    "UPDATE peliculas SET titulo = ?, categoria = ?, imagen = ?, video = ?, descripcion = ? WHERE id = ?"
  )
    .bind(titulo, categoria, imagen, video, descripcion, c.req.param("id"))
    .run();

  if (success) {
    return c.json({ success: true }, { status: 200 });
  } else {
    return c.json({ error: "Error al actualizar: " + error }, { status: 400 });
  }
});

app.delete("/api/peliculas/:id", async (c) => {
  const { success, error } = await c.env.DB.prepare(
    "DELETE FROM peliculas WHERE id = ?"
  )
    .bind(c.req.param("id"))
    .run();

  if (success) {
    return c.json({ success: true });
  } else {
    return c.json({ error: "Error al eliminar: " + error }, { status: 400 });
  }
});

export default app;
