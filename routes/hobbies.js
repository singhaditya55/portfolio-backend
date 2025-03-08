const express = require("express");
const router = express.Router();
const db = require("../db");

// Add a new hobby
router.post("/", (req, res) => {
  const { name, description } = req.body;
  const sql = "INSERT INTO hobbies (name, description) VALUES (?, ?)";
  db.query(sql, [name, description], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: "Hobby added successfully", hobbyId: result.insertId });
  });
});

// Get all hobbies
router.get("/", (req, res) => {
  const sql = "SELECT * FROM hobbies ORDER BY created_at DESC";
  db.query(sql, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

module.exports = router;
