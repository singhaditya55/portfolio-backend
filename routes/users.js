const express = require("express");
const router = express.Router();
const db = require("../db");

// Add a new user
router.post("/", (req, res) => {
  const { name, bio, profile_image } = req.body;
  const sql = "INSERT INTO users (name, bio, profile_image) VALUES (?, ?, ?)";
  db.query(sql, [name, bio, profile_image], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: "User added successfully", userId: result.insertId });
  });
});

// Get user details
router.get("/", (req, res) => {
  const sql = "SELECT * FROM users LIMIT 1";
  db.query(sql, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(result[0]);
  });
});

module.exports = router;
