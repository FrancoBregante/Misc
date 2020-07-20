import Book from "../models/bookModel.ts";
import { httpBody } from "./index.controller.ts"

// DELETE book by ISBN
export const deleteBook = async ( { response, params }: httpBody ) => {
    if ( ! params.isbn ) response.body = { message: "No ISBN provided" };
  
    if ( library.some( (current:Book)=> current.isbn === params.isbn ) ){
      library = library.filter( (current:Book)=> current.isbn !== params.isbn );
      response.body = { message: "Book deleted" };
    }
    else {
      response.body = { message: "That book doesn't exist" };
    }
  }