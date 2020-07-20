import { Response, Request } from "https://deno.land/x/oak/mod.ts";

// HTTP Interface
export interface httpBody {
  response: Response,
  request: Request,
  params: any
}