const { expressjwt } = require("express-jwt");
const secret = require("../config/secret");

module.exports = expressjwt({
  secret: secret.key,
  algorithms: ["HS256"],
});

const JWT = require("jsonwebtoken");

module.exports = (req, res, next) => {
  const { authorization } = req.headers;
  if (!authorization) {
    return res.status(401).json({ message: "Token não especificado" });
  }  ("Bearer token");

  const partsToken = authorization.split(" ")
  if (partsToken.length !== 2) {
    return res.status(401).json({ message: "Token mal formatado" });
  }

  const [key, token] = partsToken;
  if (key.indexOf("Bearer") < 0) {
    return res.status(401).json({ message: "Token mal formatado" });
  }

  try {
    const data = JWT.verify(token, secret.key);
    req.psicologos = data;
    next();
  } catch (e) {
    return res.status(401).json({ message: "Token inválido! Faça login novamente!" });
  }
};