const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

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

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
