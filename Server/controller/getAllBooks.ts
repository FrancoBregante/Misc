import { httpBody } from "./index.controller.ts"

// GET every Book
export const getAllBooks = ( { response }: httpBody ) => {
    response.body = library ;
}