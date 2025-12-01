import dotenv from 'dotenv';
dotenv.config();
import { MilvusClient } from '@zilliz/milvus2-sdk-node';
import { pipeline } from '@xenova/transformers';

// const client = new MilvusClient({ address: process.env.MILVUS_URL }); // when using docker 
const client = new MilvusClient({
  address: "https://in03-cbdb10e3eaf676f.serverless.gcp-us-west1.cloud.zilliz.com",
  token: "72c17a9f1958e6a603a80cc1beb2c84c5ba0b22b6d7f2b061505a092d31284faca9474c4c4233a457fd2c81ce45c0176b73163c4",
  username: "db_cbdb10e3eaf676f",
  password: "Fh0?0et7EEYFfT0R",
  database: process.env.MILVUS_DB_NAME || 'default' 
});
const COLLECTION_NAME = 'schema_embeddings';

export const getRelevantSchema = async (question) => {
  const embedding = await getEmbedding(question);
  await client.flushSync({ collection_names: [COLLECTION_NAME] });


await client.createIndex({
  collection_name: COLLECTION_NAME,
  field_name: 'embedding',
  index_name: 'embedding_index',
  index_type: 'IVF_FLAT',
  metric_type: 'L2',
  params: { nlist: 1024 }
});
  await client.loadCollectionSync({ collection_name: COLLECTION_NAME });
  const searchResults = await client.search({
    collection_name: COLLECTION_NAME,
    vector: embedding,
    anns_field: 'embedding', // This must match field name in schema
    topk: 5,
    metric_type: 'L2',
    params: { nprobe: 10 }, // Required to be JSON string
    output_fields: ['value']
  });

  const hits = searchResults.results.map(hit => hit.value);
  console.log('🔎 Milvus search results:', searchResults);
  return hits.join('\n');
};

let embedder;
async function getEmbedding(text) {
  if (!embedder) {
    embedder = await pipeline('feature-extraction', 'Xenova/all-MiniLM-L6-v2');
  }
  const output = await embedder(text, { pooling: 'mean', normalize: true });
  return Array.from(output.data);
}
