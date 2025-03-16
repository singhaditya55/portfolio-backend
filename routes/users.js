const express = require("express");
const router = express.Router();
const db = require("../db");
const multer = require("multer");
const path = require("path");

// Configure multer for file uploads
const storage = multer.diskStorage({
  destination: "./public/uploads/", // Save images in public/uploads
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Unique filename
  },
});

const upload = multer({ storage });

// Add a new user with image upload
router.post("/", upload.single("profile_image"), (req, res) => {
  const { name, bio, objective, skills, experience, education, certifications, projects } = req.body;

  const profileImagePath = req.file ? `/uploads/${req.file.filename}` : null; // Save image path

  const sql = `
    INSERT INTO users (name, bio, profile_image, objective, skills, experience, education, certifications, projects)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(
    sql,
    [
      name,
      bio,
      profileImagePath, // Store image path in database
      objective,
      JSON.stringify(skills || []),
      JSON.stringify(experience || []),
      JSON.stringify(education || []),
      JSON.stringify(certifications || []),
      JSON.stringify(projects || []),
    ],
    (err, result) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json({ message: "User added successfully", userId: result.insertId });
    }
  );
});

// Get user details
router.get("/", (req, res) => {
  const sql = "SELECT * FROM users LIMIT 1";
  db.query(sql, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });

    if (result.length > 0) {
      const user = result[0];

      // Parse JSON fields
      user.skills = JSON.parse(user.skills || "[]");
      user.experience = JSON.parse(user.experience || "[]");
      user.education = JSON.parse(user.education || "[]");
      user.certifications = JSON.parse(user.certifications || "[]");
      user.projects = JSON.parse(user.projects || "[]");

      res.json([user]);
    } else {
      res.status(404).json([]);
    }
  });
});

module.exports = router;
