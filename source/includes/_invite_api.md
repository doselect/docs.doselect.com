# Invite API

The Invite API lets you retrieve, create and delete your team's invites.

The invite information which can be accessed from our APIs will contain the following information:

Field Name             | Data Type  | Description
----------             | ---------  | -----------
resource_uri           | string     | The URI for a particular invite
email                  | string     | The email of the candidate
status                 | string     | The status of whether the candidate has accepted the invite or not
expiry                 | string     | An ISO formatted datetime string signifying the expiry date of an invite
test                   | string     | The URI of the test

## Create Invite

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/esows/candidates'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}

payload = {
    "email": "john@example.com",
    "expiry": "2017-10-11T08:16:33.033149"
}

response = requests.post(url, headers=headers, json=payload)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/test/esows/candidates/ \
  -H 'content-type: application/json' \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551d' \
  -d '{
    "email": "john@example.com",
    "expiry": "2017-10-11T08:16:33.033149"
}'
```

> Response

```json
{
    "email": "john@example.com",
    "expiry": "2017-10-11T08:16:33.033149",
    "resource_uri": "/platform/v1/test/esows/candidates/john@example.com",
    "status": "pending",
    "test": "/platform/v1/test/esows"
}
```

This endpoint creates an invite for an email.

### HTTP Request

`POST https://api.doselect.com/platform/v1/test/<slug>/candidates`

Json Payload attributes:

Field  | Required | Data Type | Description
------ | -------- | --------- | -----------
email  | Yes      | string    | The email of the candidate
expiry | No       | string    | The expiry of the invite in an ISO format datetime string

<aside class="notice">
If the expiry is not sent, the default expiry for an invite will be taken from
the test's settings' `invite_expiry_days` field.
</aside>



## Delete an Invite

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/esows/candidates/john@example.com'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}

response = requests.delete(url, headers=headers)
```

```shell
curl -X DELETE \
  http://api.doselect.com/platform/v1/test/esows/candidates/ \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551d'
```

> Response

```json
204 NO CONTENT
```

This endpoint deletes an invite for an email.

### HTTP Request

`DELETE https://api.doselect.com/platform/v1/test/<slug>/candidates/<email>`


<aside class="notice">
The invite can only be deleted if it hasn't been accepted by the candidate.
</aside>
