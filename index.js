const express = require("express");
const cors = require("cors");
const path = require("path");
require("dotenv").config();
const cron = require("node-cron"); // Import node-cron
const axios = require("axios"); // Import axios for pinging

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*"); // Allow all origins
  res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
  next();
});

// Serve static files from public/uploads
app.use("/uploads", express.static(path.join(__dirname, "public/uploads")));

// Import routes
const userRoutes = require("./routes/users");
const projectRoutes = require("./routes/projects");
const hobbyRoutes = require("./routes/hobbies");

// Use routes
app.use("/api/users", userRoutes);
app.use("/api/projects", projectRoutes);
app.use("/api/hobbies", hobbyRoutes);

app.get("/", (req, res) => {
  res.send("Portfolio Backend is Running");
});

// 🔄 Keep the server awake with a cron job (runs every 10 minutes)
cron.schedule("*/10 * * * *", async () => {
  try {
    await axios.get("https://portfolio-backend-7y0o.onrender.com/api/users");
    console.log("🔄 Pinged self to stay awake at", new Date().toLocaleString());
  } catch (error) {
    console.error("❌ Error pinging self:", error.message);
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
