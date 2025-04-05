const express = require("express");
const router = express.Router();
const db = require("../db");

// Add a new project
router.post("/", (req, res) => {
  const { title, description, tech_stack, project_link, image } = req.body;
  const sql =
    "INSERT INTO projects (title, description, tech_stack, project_link, image) VALUES (?, ?, ?, ?, ?)";
  db.query(sql, [title, description, tech_stack, project_link, image], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: "Project added successfully", projectId: result.insertId });
  });
});

// Get all projects
router.get("/", (req, res) => {
  const sql = "SELECT * FROM projects ORDER BY id DESC";
  db.query(sql, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

module.exports = router;
