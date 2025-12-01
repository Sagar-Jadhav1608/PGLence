import { getRelevantSchema } from '../services/milvusService.js';
import { callLLM } from '../services/llmService.js';
import { runSQL } from '../services/dbService.js';

export const handleQuery = async (req, res) => {
    try {
      const { question } = req.body;
      if (!question) return res.status(400).json({ error: 'Question is required' });
  
      const context = await getRelevantSchema(question);
      const sqlRaw = await callLLM(question, context);
      console.log("🔍 Retrieved Context from Milvus:\n", context);
      console.log(sqlRaw)
      // 🔥 Clean up possible markdown backticks
      const sql = sqlRaw
        .replace(/^```sql\s*/i, '')
        .replace(/^```\s*/i, '')
        .replace(/```$/g, '')
        .trim();
  
      const result = await runSQL(sql);
  
      res.json({ sql, result });
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: err.message || 'Something went wrong' });
    }
  };
  