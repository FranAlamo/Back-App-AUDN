const knex = require("../config/knexfile");

//cupido musical
exports.listaCanciones = async (req, res) => {
  try {
    console.log(req.user);
    const resultado = await knex.select("artista", "imagen").from("musica");
    res.status(200).json({ musica: resultado });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

//top 20
exports.top20 = async (req, res) => {
  try {
    const resultado = await knex
      .select("nombre", "artista", "imagen")
      .from("musica")
      .limit(20);
    res.status(200).json({ musica: resultado });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
exports.listaCanciones = async (req, res) => {
    try {
        const resultado = await knex
            .select("nombre", "artista", "imagen")
            .from("musica")
            .limit(5);
        res.status(200).json({ musica: resultado });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};
//perfil
exports.perfil = async (req, res) => {
  const id = +req.params.id;
  try {
    const usuario = await knex
      .select("nombre_usuario", "email")
      .from("usuario")
      .where({ id });
    res.status(200).json({ usuario: usuario });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
//buscar por genero
exports.filtroGenero = async (req, res) => {
  const nombre_genero = req.params.nombre_genero;
  try {
    const resultado = await knex
      .select("nombre", "artista", "imagen")
      .from("musica")
      .join("genero", "musica.id_genero", "=", "genero.id")
      .where({ nombre_genero });
    res.status(200).json({ musica: resultado });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// lista todos los generos que existen
exports.listaGeneros = async (req, res) => {
  try {
    const resultado = await knex.select("id", "nombre_genero").from("genero");
    res.status(200).json({ generos: resultado });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
