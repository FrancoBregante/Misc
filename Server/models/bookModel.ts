// Book Model
export default interface Book {
  id: string,
  isbn: string,
  firstTitle: string,
  secondTitle?: string,
  author: string,
  publisher: string,
  collection?: string,
  price: number,
  image?: string,
  pages?: string,
  publishDate?: string,
  format?: string,
  language?: string,
  description?: string
}
