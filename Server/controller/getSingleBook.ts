import { httpBody } from "./index.controller.ts"
import Book from "../models/bookModel.ts";

// GET Book by ISBN
export const getSingleBook = ( { response, params }: httpBody ) => {
    if (params.isbn && library.some((book:Book)=> book.isbn === params.isbn)) {
      response.body = library.find( (book:Book)=> book.isbn === params.isbn );
    }
    else response.body = { message: `No book with ISBN = ${params.isbn}` }
};