import { Body } from "https://deno.land/x/oak/mod.ts";
import { httpBody } from "./index.controller.ts"
import Book from "../models/bookModel.ts";

// PUT updated data in a book by ISBN
export const updateBook = async ( { response, request, params }: httpBody ) => {
    if ( ! request.hasBody ) response.body = { message: "No request body" };
    if ( ! params.isbn ) response.body = { message: "No ISBN provided" };
  
    const foundBook = library.find( (current:Book)=> current.isbn === params.isbn );
  
    if (!foundBook) {
      response.status = 404;
      response.body = { message: "Book not found" }
    }
    else {
      const body:Body = request.body();
      const updadedBook:Book = await body.value;
  
      library = library.map( (cur:Book)=> 
         cur.isbn === params.isbn ? { ...cur, ...updadedBook, id:foundBook.id } : cur
      ) as unknown[] as Book[];
  
      response.status = 200;
      response.body = { message: "Updated", library }
    }
  }