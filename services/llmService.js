import { GoogleGenerativeAI } from "@google/generative-ai";
import dotenv from "dotenv";
dotenv.config();

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
const model = genAI.getGenerativeModel({ model: "gemini-2.5-flash" });

export const callLLM = async (question, context) => {
    const prompt = `
    You are an intelligent AI assistant that converts natural language questions into SQL queries.
    
    Carefully read the provided database schema and generate a correct SQL query using only the given tables and columns.
    
    ⚠️ IMPORTANT:
    - Use only the column and table names mentioned in the schema.
    - Do not guess columns or tables that are not provided.
    - Return only the SQL query — no explanation or comments.
    
    📘 Schema:
    ${context}
    
    📝 Question:
    "${question}"
    
    💡 Output:
    SQL query only, no extra text.
    `;
    

  const result = await model.generateContent(prompt);
  const response = await result.response;
  const text = response.text();
  return text.trim();
};