# LearnFeed Item API

The LearnFeed Item API allows you to add problems to your teams's learnfeed on DoSelect.


## Add problem to learn feed

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/learnfeeditem/"

payload = {
    "problem": "/platform/v1/problem/y9or8"
}

headers = {
    'DoSelect-Api-Key': "88d4266fd4e6338d13b845fcf28",
    'DoSelect-Api-Secret': "385041b7bbc2320471b8551d",
    'Content-Type': "application/json"
    }

response = requests.request("POST", url, data=payload, headers=headers)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/learnfeeditem/ \
  -H 'Content-Type: application/json' \
  -H 'DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'DoSelect-Api-Secret: 385041b7bbc2320471b8551d' \
  -d '{
    "problem": "/platform/v1/problem/y9or8"
}'
```

> Response

```
{
    "id": 22,
    "resource_uri": "/platform/v1/learnfeeditem/22",
    "slug": "e2yp2"
}
```
This endpoint adds a specific problem, identified by a `slug` to the company's learn feed.
The company is identified using the API Key and secret which is used in authenticating a request.


### HTTP Request

`POST https://api.doselect.com/platform/v1/learnfeeditem/`


### Payload Params
Parameter    | Description
----------   | ---------------
problem      | The `resource_uri` of the problem to be added

The URI of the problem will be in the format of `/platform/v1/problem/<slug>`
