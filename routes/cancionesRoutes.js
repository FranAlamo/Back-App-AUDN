const express = require("express");
const { listaCanciones } = require("../controllers/cancionesController");
const { verifyToken } = require("../middlewares/auth/auth");
const routes = express.Router();

routes.get("/canciones", verifyToken, /* runValidation, validarUsuarioCliente, */ listaCanciones);



module.exports = routes;