const knex = require("../config/knexfile");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

exports.registroUsuario = async (req, res) => {
  const { name, email, password } = req.body;
  const salt = await bcrypt.genSalt(10);
  const passwordEncrypt = await bcrypt.hash(password, salt);
  knex("usuario")
    .where({ email: email })
    .then((resultado) => {
      if (resultado.length) {
        res
          .status(400)
          .json({ error: "El usuario ya se encuentra registrado" });
        return;
      }
      knex("usuario")
        .insert({
          nombre_usuario: name,
          email: email,
          password: passwordEncrypt,
        })
        .then((resultado) => {
          res.status(201).json({
            mensaje: "El usuario se ha registrado correctamente",
            usuario: { name: name, email: email, }
          });
        });
    })
    .catch((error) => {
      res.status(400).json({ error: error.message });
    });
};

exports.loginUsuario = async (req, res) => {
  const { email, password } = req.body;

  knex("usuario")
    .where({ email: email }).orWhere({ nombre_usuario: email })
    .then(async (resultado) => {
      if (!resultado.length) {
        res
          .status(404)
          .json({ error: "El usuario no se encuentra registrado" });
        return;
      }
      const validatePassword = await bcrypt.compare(
        password,
        resultado[0].password
      );
      if (!validatePassword) {
        res.status(400).json({
          error: "Email y/o contraseña inválido",
        });
        return;
      }
      const usuario = {
        name: resultado[0].nombre_usuario,
        email: resultado[0].email,
        id: resultado[0].id,
      }
      const token = jwt.sign(
        usuario,
        process.env.TOKEN_SECRET
      );
      res.status(200).json({
        mensaje: "El usuario se ha logeado correctamente",
        token: token,
        usuario
      });
    })
    .catch((error) => {
      res.status(400).json({ error: error.message });
    });
};