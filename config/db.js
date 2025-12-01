import pg from 'pg';
import dotenv from 'dotenv';
dotenv.config();

const { Pool } = pg;

const pool = new Pool({
  host: process.env.PG_HOST,
  port: Number(process.env.PG_PORT),
  user: process.env.PG_USER,
  password: process.env.PG_PASSWORD,
  database: process.env.PG_DATABASE,
  // ssl: true,
});

export default pool;

PORT=5000
# PG_HOST=dpg-d1fn917fte5s73fnfg80-a.oregon-postgres.render.com
# PG_PORT=5432
# PG_USER=user
# PG_PASSWORD=qh6gtvzikUAchIoIIpYnxCYIMizXdQQm
# PG_DATABASE=text2sql_dvjw
PG_HOST=localhost
PG_PORT=5432
PG_USER=postgres
PG_PASSWORD=Jadhav1608
PG_DATABASE=postgres

GEMINI_API_KEY=AIzaSyAMYbs3aLJNrgmmOD-YQTxGdnQa8IwN9ac
# MILVUS_URL=localhost:19530

# MILVUS_URL=https://in03-213b565105162fe.serverless.gcp-us-west1.cloud.zilliz.com
# MILVUS_USERNAME=db_213b565105162fe
# MILVUS_PASSWORD=At2^52JP?xofMGZU
MILVUS_DB_NAME=default

MILVUS_USERNAME=db_cbdb10e3eaf676f
MILVUS_PASSWORD="Fh0?0et7EEYFfT0R"
MILVUS_URL=https://in03-cbdb10e3eaf676f.serverless.gcp-us-west1.cloud.zilliz.com

