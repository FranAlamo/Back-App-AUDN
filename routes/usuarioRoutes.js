const express = require("express");
const routes = express.Router();
const {
  registroUsuario,
  loginUsuario,
} = require("../controllers/usuarioController");

routes.post("/register", registroUsuario);
routes.post("/login", loginUsuario);

module.exports = routes;