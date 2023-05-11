const knex = require("../config/knexfile");


exports.listaCanciones = async (req, res) => {
    try {
        const resultado = await knex.select("*").from("musica");
        res.status(200).json({ musica: resultado });
    } catch (error) {
        res.status(400).json({ error: error.message })
    }
}