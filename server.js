const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

// Root endpoint
app.get("/", (req, res) => {
   res.send("🚀 Node App Running Successfully!");
});

// Health check (important for Kubernetes)
app.get("/health", (req, res) => {
   res.json({ status: "UP" });
});

// Simple API
app.get("/api/message", (req, res) => {
   res.json({ message: "Hello from Node.js DevOps App 🎯" });
});

app.listen(PORT, () => {
   console.log(`Server running on port ${PORT}`);
});