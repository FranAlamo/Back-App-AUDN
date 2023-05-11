const express = require("express");
const { listaCanciones, top20, perfil, filtroGenero } = require("../controllers/cancionesController");
const { verifyToken } = require("../middlewares/auth/auth");
const routes = express.Router();

routes.get("/canciones", verifyToken, /* runValidation, validarUsuarioCliente, */ listaCanciones);
routes.get("/top20", verifyToken, /* runValidation, validarUsuarioCliente, */ top20);
routes.get("/perfil", verifyToken, /* runValidation, validarUsuarioCliente, */ perfil);
routes.get("/porGenero", verifyToken, /* runValidation, validarUsuarioCliente, */ filtroGenero);



module.exports = routes;