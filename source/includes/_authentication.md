# Authentication

> Example request with authentication:

```python
import requests

url = 'https://api.doselect.com/platform/v1/test'

headers = {
    "DoSelect-API-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-API-Secret": "385041b7bbc2320471b8551d"
}

response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test"
  -H "DoSelect-API-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-API-Secret: 385041b7bbc2320471b8551d"
```

Access to the Platform APIs are authenticated using your team account's `API_KEY` and `API_SECRET`.
These credentials are available in your team dashbaord under the path `Team Settings > Integrations`.

You must include the `API_KEY` and `API_SECRET` in custom request headers, `DoSelect-API-Key` and `DoSelect-API-Secret` respectively.
Because your `API_SECRET` is sensitive information and allows access to your account, we strongly advise you to not expose your `API_SECRET`
in publicly accessible avenues such as GitHub, or in client-side code.

<aside class="notice">
The examples given in this documentation use dummy credentials. You must use your team's actual credentials for these requests to work.
If you are using the dev sandbox, make sure you replace the API host accordingly.
</aside>