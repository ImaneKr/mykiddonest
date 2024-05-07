const jwt = require("jsonwebtoken");
const createError = require("../utils/error");

const verifyToken = (req, res, next) => {
  const secret = process.env.JWT_SECRET_KEY;
  let token;

  // Extract token from different sources
  if (req.cookies && req.cookies.token) {
    token = req.cookies.token;
  } else if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
    token = req.headers.authorization.split(' ')[1];
  } else {
    return next(createError(401, "No token provided"));
  }

  try {
    const payload = jwt.verify(token, secret);
    return payload;
  } catch (e) {
    return next(createError(401, "Invalid token"));
  }
};

const verifyRole = (role) => (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) {
    return next(createError(401, "No token provided"));
  }

  const token = authHeader.split(" ")[1];
  const payload = verifyToken(req, res, next);

  if (payload.role !== role) {
    return next(createError(403, "Forbidden"));
  }

  req.user = payload;
  next();
};

const verifyAdmin = verifyRole("admin");
const verifySecretary = verifyRole("secretary");
const verifyTeacher = verifyRole("teacher");

module.exports = { verifyToken, verifyAdmin, verifySecretary, verifyTeacher };
