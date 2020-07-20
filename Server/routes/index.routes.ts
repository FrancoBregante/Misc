import { Router, Response } from "https://deno.land/x/oak/mod.ts";
import { createBook } from "../controller/createBook.ts";
import { updateBook } from "../controller/updateBook.ts";
import { deleteBook } from "../controller/deleteBook.ts";
import { getAllBooks } from "../controller/getAllBooks.ts";
import { getSingleBook } from "../controller/getSingleBook.ts";

// Instantiation
const router:Router = new Router();

// Root Endpoint
router.get("/", ({ response }: { response: Response }) => {
    response.body = "Welcome to my API";
  });

// CRUD Endpoints
router
    .get("/books", getAllBooks)
    .get("/books/:isbn", getSingleBook)
    .post("/books/:isbn", createBook)
    .put("/books/:isbn", updateBook)
    .delete("/books/:isbn", deleteBook);

export default router;
