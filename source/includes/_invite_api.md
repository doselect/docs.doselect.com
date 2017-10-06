# Invite API

Using the Invite API, you can invite a candidate to take a test in your team via their email address. The resources contains the
following fields:

Field Name             | Data Type  | Description
----------             | ---------  | -----------
resource_uri           | string     | URI that can be used to access this invite
email                  | string     | Email address of the candidate
status                 | string     | Status of this invite. Possible values are *accepted*, *rejected* and *pending*
expiry                 | string     | Optional, denotes the expiry of this invite
test                   | string     | URI of the test resource for this invite
candidate_access_uri   | string     | Access link for the candidate to take the test for this invite
report                 | object     | Optional. If the test has been attempted, this would contain the gist of the result

## Create a new invite

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
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=U2DsXUOgvXe2yUXiSPMHglkd/ORMykzTvw8jqmQrj6d1OL8N6MBqUqtu2nxSLz2E5BAuG5T8C9l%2BXYmjUPA0akTATBJB47bU9Yc8CQmwC8s%3D",
    "email": "john@example.com",
    "expiry": "2017-10-11T08:16:33.033149",
    "resource_uri": "/platform/v1/test/esows/candidates/john@example.com",
    "status": "pending",
    "test": "/platform/v1/test/esows"
}
```

### HTTP Request

`POST https://api.doselect.com/platform/v1/test/<slug>/candidates`

Optionally, you can add a `suppress_email=True` GET parameter to the URL if you do not want
the candidate to receive an invitation email from DoSelect.

JSON payload attributes:

Field  | Required | Data Type | Description
------ | -------- | --------- | -----------
email  | Yes      | string    | The email of the candidate
expiry | No       | string    | The expiry of the invite in an ISO format datetime string

<aside class="notice">
If the expiry is not sent, the default expiry for an invite will be taken from
the `invite_expiry_days` field in the test's settings.
</aside>



## Delete an invite

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