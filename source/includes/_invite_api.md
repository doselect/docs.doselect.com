# Invite API

Using the Invite API, you can invite a candidate to take a test in your team via their email address. The resources contains the
following fields:

Field Name             | Type  | Description
----------             | ---------  | -----------
resource_uri           | string     | URI that can be used to access this invite
email                  | string     | Email address of the candidate
status                 | string     | Status of this invite. Possible values are *accepted*, *rejected* and *pending*
expiry                 | string     | Optional, denotes the expiry of this invite
start_time             | string     | Optional, denotes the time when the test becomes active for this invite
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
    "expiry": "2017-12-11T08:16:33.033149",
    "start_time": "2017-11-27T16:30:35"
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
    "expiry": "2017-12-11T08:16:33.033149",
    "start_time": "2017-11-27T16:30:35"
}'
```

> Response

```json
{
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=U2DsXUOgvXe2yUXiSPMHglkd/ORMykzTvw8jqmQrj6d1OL8N6MBqUqtu2nxSLz2E5BAuG5T8C9l%2BXYmjUPA0akTATBJB47bU9Yc8CQmwC8s%3D",
    "email": "john@example.com",
    "expiry": "2017-12-11T08:16:33.033149",
    "resource_uri": "/platform/v1/test/esows/candidates/john@example.com",
    "status": "pending",
    "test": "/platform/v1/test/esows",
    "start_time": "2017-11-27T16:30:35"
}
```

### HTTP Request

`POST https://api.doselect.com/platform/v1/test/<slug>/candidates`

Optionally, you can add a `suppress_email=True` GET parameter to the URL if you do not want
the candidate to receive an invitation email from DoSelect.

If you need to schedule a test, it can be done by setting the `start_time` and `expiry` of the invite accordingly.

JSON payload attributes:

Field      | Required | Type | Description
------     | -------- | --------- | -----------
email      | Yes      | string    | The email of the candidate
expiry     | No       | string    | The expiry of the invite in an ISO format datetime string
start_time | No       | string    | The scheduled start time of an ISO format datetime string

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


## Reset an invite

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/esows/candidates/john@example.com/reset/'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}

payload = {
	"start_time": "2017-11-30T15:15:35+05:30",
	"expiry": "2017-12-30T15:15:35+05:30"
}

response = requests.post(url, payload=payload, headers=headers)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/test/esows/candidates/john@example.com/reset/ \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551d' \
  -d {
	"start_time": "2017-11-30T15:15:35+05:30",
	"expiry": "2017-12-30T15:15:35+05:30"
}
```

> Response

```json
{
    "start_time": "2017-11-30T15:15:35+05:30",
    "email": "john@example.com",
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=lYDMH0%2BnjSiS2NoYej",
    "expiry": "2017-12-30T15:15:35+05:30"
}
```

This endpoint resets the invite for an user. This will work only if the user has already taken the test, else it will throw a `400 BAD REQUEST`.

Once an invite has been reset, a user can take the test again.

The request takes two params in the request body:

Title      | Type   | Description
---------- | ------ | -----------
start_time | string | A ISO 8601 datetime string denoting the new invite start time
expiry     | string | A ISO 8601 datetime string denoting the new invite expiry

### HTTP Request

`POST https://api.doselect.com/platform/v1/test/<slug>/
candidates/<email>/reset`

<aside class="notice">
This will delete all existing data about the user's test report in our system and will not be recoverable.
</aside>