# Errors

The Partner API uses the following error codes:


Error Code | Meaning | Description
---------- | ------- | -----------
400 | Bad Request | Your request is not in an accepted format.
401 | Unauthorized | Your API key and secret is wrong/missing.
403 | Forbidden | The resource requested is not associated with you.
404 | Not Found | The specified resource could not be found.
405 | Method Not Allowed | You tried to access a resource with an invalid method.
500 | Internal Server Error | We had a problem with our server. Try again later.
503 | Service Unavailable | We're temporarily offline for maintenance. Please try again later.
