# Errors

The APIs return standard HTTP success or error status codes. For errors, extra information about what went wrong will also be sent in the respose,
encoded in JSON. The various HTTP codes we might return are listed below.

Code | Title | Description
---------- | ------- | -----------
200 | OK | The request was successful.
400 | Bad request | The request was malformed or in an unaccepted format.
401 | Unauthorized | Your `API_KEY` and/or `API_SECRET` is wrong or missing.
403 | Forbidden | The requested resource was not accessible to you.
404 | Not found | The specified resource was not be found.
405 | Method not allowed | You were trying to access the resource using an invalid HTTP method.
50X | Internal server error | An error occured with our APIs.