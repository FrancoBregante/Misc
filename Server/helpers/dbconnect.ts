import { init, MongoClient } from "https://deno.land/x/mongo@v0.6.0/mod.ts";

// Intialize the plugin
await init()

// Create client
const client:MongoClient = new MongoClient();

// Connect to mongodb
client.connectWithUri("mongodb://localhost:27017");

// Specifying the database name
const dbname:string = "alexandrina"; 
const db = client.database(dbname);

// Declaring the collections here.
const library = db.collection("library");

export {db, library};