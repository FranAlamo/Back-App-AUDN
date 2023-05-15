const express = require("express");
const {
  listaCanciones,
  top20,
  perfil,
  filtroGenero,
  listaGeneros,
  filtroArtista,
} = require("../controllers/cancionesController");
const { verifyToken } = require("../middlewares/auth/auth");
const { runValidation } = require("../middlewares/validator");
const routes = express.Router();

routes.get("/canciones", verifyToken, runValidation, listaCanciones);
routes.get("/top20", verifyToken, runValidation, top20);
routes.get("/perfil", verifyToken, runValidation, perfil);
routes.get(
  "/porGenero/",
  verifyToken,
  runValidation,
  filtroGenero
);
routes.get(
  "/porArtista/",
  verifyToken,
  runValidation,
  filtroArtista
);

routes.get("/generos", verifyToken, runValidation, listaGeneros);

module.exports = routes;
