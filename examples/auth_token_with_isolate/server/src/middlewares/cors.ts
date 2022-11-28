/**
 * Adds CORS headers to the response. If type of the request is OPTIONS,
 * it will return it immediately and will not continue processing the request.
 * @see https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
 * @see https://en.wikipedia.org/wiki/Cross-origin_resource_sharing
 * @param req
 * @param res
 * @param next
 */
export default function cors(req, res, next): void {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
  res.header("Access-Control-Allow-Headers", "Content-Type, Authorization");
  if (req.method === "OPTIONS") {
    res.sendStatus(200);
  } else {
    next();
  }
}
