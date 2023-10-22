class StatusCodes {
  StatusCodes._();

  /// 200 OK
  ///
  /// GET: The resource has been fetched and transmitted in the message body.
  /// HEAD: The representation headers are included in the response without any
  /// message body.
  /// PUT or POST: The resource describing the result of the action is
  /// transmitted in the message body.
  /// TRACE: The message body contains the request message as
  /// received by the server.
  static const ok = 200;
  static const good = 201;

  /// 202 Accepted
  ///
  /// The request has been received but not yet acted upon. It is noncommittal,
  /// since there is no way in HTTP to later send an asynchronous response
  /// indicating the outcome of the request. It is intended for cases where
  /// another process or server handles the request, or for batch processing
  static const accepted = 202;

  /// 400 Bad Request
  ///
  /// The server could not understand the request due to invalid syntax.
  static const badRequest = 400;

  /// 401 Unauthorized
  ///
  /// Although the HTTP standard specifies "unauthorized", semantically this
  /// response means "unauthenticated". That is, the client must authenticate
  /// itself to get the requested response.
  static const unathorized = 401;

  /// 404 Not Found
  ///
  /// The server can not find the requested resource. In the browser, this means
  /// the URL is not recognized. In an API, this can also mean that the endpoint
  /// is valid but the resource itself does not exist. Servers may also send this
  /// response instead of 403 Forbidden to hide the existence of a resource from
  /// an unauthorized client. This response code is probably the most well known
  /// due to its frequent occurrence on the web.
  static const notFound = 404;

  /// 409 alreadyTaken
  ///
  /// The server can not find the requested resource. In the browser, this means
  /// the URL is not recognized. In an API, this can also mean that the endpoint
  /// is valid but the resource itself does not exist. Servers may also send this
  /// response instead of 403 Forbidden to hide the existence of a resource from
  /// an unauthorized client. This response code is probably the most well known
  /// due to its frequent occurrence on the web.
  static const alreadyTaken = 409;

  /// 502 Bad Gateway
  ///
  /// The server has encountered a situation it does not know how to handle.
  /// 
  static const intervalServerError = 500;

  /// 502 Bad Gateway
  ///
  /// This error response means that the server, while working as a gateway to get
  /// a response needed to handle the request, got an invalid response.
  static const badGateway = 502;
}
