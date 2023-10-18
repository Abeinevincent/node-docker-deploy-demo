import express from "express";
const app = express();

import cors from "cors";

app.use(cors());

app.get("/", async (req, res) => {
  try {
    return res
      .status(200)
      .json(
        "Welcome to updated NodeJS with Docker! By the way all is running well in the container body"
      );
  } catch (err) {
    return res.status(200).json(err);
  }
});

const PORT = process.env.PORT || 8000;

app.listen(PORT, () => {
  console.log(`Backend server is listening at port ${PORT}!`);
});
