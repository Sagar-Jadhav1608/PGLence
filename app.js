import express from 'express';
import dotenv from 'dotenv';
import queryRoutes from './routes/queryRoutes.js';

dotenv.config();
const app = express();
app.use(express.json());
app.use('/api/query', queryRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
