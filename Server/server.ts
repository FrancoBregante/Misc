import { Application, Context } from "https://deno.land/x/oak/mod.ts";
import router from "./routes/index.routes.ts";

// Environments Variables
const PORT = 8000;

// Oak Instantiation
const app = new Application();

// Console Logger
app.use( async ( ctx:Context, next )=> {
  await next();
  const rt = ctx.response.headers.get("X-Response-Time");
  console.log(`${ctx.request.method} ${ctx.request.url} - ${rt}`);
} );

// Middlewares
app.use(router.routes());
app.use(router.allowedMethods());

// Log & Run
console.log( `Server running on port ${PORT}`);
await app.listen( { port: PORT } );
