import { Body } from "https://deno.land/x/oak/mod.ts";
import { v4  } from "https://deno.land/std/uuid/mod.ts";
import Book from "../models/bookModel.ts";
import { httpBody } from "./index.controller.ts"

// POST New Book
export const createBook = async ( { response, request, params }: httpBody ) => {
    if ( ! request.hasBody ) response.body = { message: "No request body" };
    if ( ! params.isbn ) response.body = { message: "No ISBN provided" };
  
    const body: Body = request.body();
    const newBook: Book = await body.value;
  
    newBook.id = v4.generate();
    newBook.isbn = params.isbn;
  
    library.push( newBook );
  
    response.status = 201;
    response.body = {
      message: `${newBook.firstTitle} registered in the Database`,
      newBook
    }
  }