# Rate Limits
The overview documentation describes the rate limit rules. This will help us prevent a Denial-of-Service (DoS) attack by a malicious user in case of our clients' API key or embeds becoming exposed publicly.

## Platform API limits
> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```
> Response

```
HTTP/1.1 200 OK
Date: Thu, 31 May 2018 17:27:06 IST
Status: 200 OK

<Data>

X-RateLimit-Limit: 10000
X-RateLimit-Remaining: 9999
X-RateLimit-Reset: 1527750919

```

The platform APIs will have a per-hour limit based on the request type.
These APIs will also have a per-second rate limit of 200. If a request fails due to the per second limit, then it will not be counted against the hourly limit.
While calculating the rate-limit, if an API call has returned a 4xx response, it will be counted.

These limits will be based on your unique API key.

The per hour rate limits are:

Request Method | Limit per hour
-------------- | --------------
GET            | 15,000
POST           | 10,000
PUT            | 2,000
PATCH          | 4,000
DELETE         | 2,000

The platform APIs will have the following headers which will contain information regarding the rate-limit.

Header                  | Description
----------------------- | --------------
`X-RateLimit-Limit`     | An integer denoting the limit for the request method type.
`X-RateLimit-Remaining` | An integer denoting the number of requests remaining.
`X-RateLimit-Reset`     | An integer denoting the epoch time of the next reset of limits.


## Embed API limits

The embed APIs will be rate limited to 200 requests per second.
These limits will be calculated based on the unique session ID to prevent a single malicious user from affecting the services.
