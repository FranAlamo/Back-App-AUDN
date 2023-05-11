const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cors = require("cors");
require("dotenv").config();
const cancionesRoutes = require("./routes/cancionesRoutes")
const usuarioRoutes = require("./routes/usuarioRoutes");

const app = express();

app.use(morgan("dev"));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(cors());

app.use("/api", cancionesRoutes);
app.use("/api", usuarioRoutes);


const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log("Servidor levantado en el puerto 8000");
});