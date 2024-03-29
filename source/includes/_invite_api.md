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


## Get all invites of a user


> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/invite/"

querystring = {"email":"hemil@doselect.com"}

headers = {
    'Doselect-Api-Key': "88d4266fd4e6338d13b845fcf28",
    'Doselect-Api-Secret': "385041b7bbc2320471b8551d",
    'Cache-Control': "no-cache"
    }

response = requests.request("GET", url, headers=headers, params=querystring)
```

```shell
curl -X GET \
  'https://api.doselect.com/platform/v1/invite/?email=hemil@doselect.com' \
  -H 'Doselect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'Doselect-Api-Secret: 385041b7bbc2320471b8551d'
```

> Response

```json
{
    "meta": {
        "limit": 1,
        "next": null,
        "offset": 0,
        "previous": null,
        "total_count": 1
    },
    "objects": [
        {
            "candidate_access_url": "https://doselect.com/gateways/test?access_code=f4nldRcHaVw6W2VcNk9ExrMWa6htLUaVF4G28HRCmgO342n",
            "email": "hemil@doselect.com",
            "expiry": "2017-12-29T09:47:35+00:00",
            "report": {
                "report_uri": "/platform/v1/test/2xmrr/candidates/hemil@doselect.com/report",
                "time_taken": 4,
                "total_problems": 2,
                "total_score": 0,
                "total_solutions": 0
            },
            "resource_uri": "/platform/v1/test/2xmrr/candidates/hemil@doselect.com",
            "start_time": "2017-11-29T09:45:35+00:00",
            "status": "accepted",
            "test": "/platform/v1/test/2xmrr",
            "test_name": "DoSelect Demo Test for Backend Engineer"
        }
    ]
}
```

This API will fetch all the invites of a particular user which are associated with your account.
If the user has been invited for tests from multiple accounts, then this API will return only
those which are associated with the account whose credentials you send.

The user email needs to be sent in the GET params as shown in the sample request with the key `email`.

Optionally, You can filter the invites based on start_time and/or expiry by providing
start_time and/or expiry in GET params with suffix `__lte` or `__gte` e.g start_time__gte, expiry__lte which stands for less than or equal to and greater than or equal to.

For example, to fetch all the invites with `start_time` greater than or equal to `2018-07-01` and `expiry` less than or equal to `2018-07-25` send `start_time__gte=2018-07-01T00:00:00Z` and `expiry__lte=2018-07-25T00:00:00Z` in GET params.

NOTE:
`start_time` and `expiry` accepts ISO 8601 format string, for example `2018-01-29T15:15:35+05:30`

<aside class="notice">
If the email is not sent in the params, the API will return all the invites of your account.
</aside>


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
    "expiry": "2018-05-29T15:17:35+05:30",
    "start_time": "2018-05-10T15:17:35+05:30"
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
    "expiry": "2018-05-29T15:17:35+05:30",
    "start_time": "2018-05-10T15:17:35+05:30"
}'
```

> Response

```json
{
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=U2DsXUOgvXe2yUXiSPMHglkd/ORMykzTvw8jqmQrj6d1OL8N6MBqUqtu2nxSLz2E5BAuG5T8C9l%2BXYmjUPA0akTATBJB47bU9Yc8CQmwC8s%3D",
    "email": "john@example.com",
    "expiry": "2018-05-29T15:17:35+05:30",
    "start_time": "2018-05-10T15:17:35+05:30",
    "resource_uri": "/platform/v1/test/esows/candidates/john@example.com",
    "status": "pending",
    "test": "/platform/v1/test/esows"
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


## Bulk creation of invites

> Request

```python
import requests
import json

url = "https://api.doselect.com/platform/v1/test/esows/candidates/bulk/"

payload = {
	"objects": [
		{
			"email": "hemil+bulk+1@doselect.com",
		    "expiry": "2018-05-29T15:17:35+05:30",
    		"start_time": "2018-04-29T15:15:35+05:30"
		},
		{
			"email": "hemil+bulk+2@doselect.com",
		    "expiry": "2018-12-29T15:17:35+05:30",
    		"start_time": "2018-01-29T15:15:35+05:30"
		}
	]
}
headers = {
    'Doselect-Api-Key': "88d4266fd4e6338d13b845fcf28",
    'Doselect-Api-Secret': "385041b7bbc2320471b8551d",
    'Content-Type': "application/json",
    }

response = requests.request("POST", url, data=json.dumps(payload), headers=headers)

```

```shell
curl -X POST \
  'https://api.doselect.com/platform/v1/test/esows/candidates/bulk/' \
  -H 'Content-Type: application/json' \
  -H 'Doselect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'Doselect-Api-Secret: 385041b7bbc2320471b8551d' \
  -d '{
	"objects": [
		{
			"email": "hemil+bulk+1@doselect.com",
		    "expiry": "2018-05-29T15:17:35+05:30",
    		"start_time": "2018-04-29T15:15:35+05:30"
		},
		{
			"email": "hemil+bulk+2@doselect.com",
		    "expiry": "2018-12-29T15:17:35+05:30",
    		"start_time": "2018-01-29T15:15:35+05:30"
		}
	]
}'
```

> Response

```json
{
    "errors": [
        {
            "email": "hemil+bulk+1@doselect.com",
            "error": "Unable to save invite. Error: This candidate has already been invited for this test."
        }
    ],
    "invites": [
        {
            "status": "pending",
            "test": "/platform/v1/test/2edpq",
            "candidate_access_url": "http://doselect.com/gateways/test?access_code=B8lhneCES5yNCqTMmJxKLfMhyWoHZV2/Cr5vKnHmg1VtpLvrp1cI5asvYWndxNlE6opZbKfY2/NPCdVtVQX0YfqroK8JjEU%2BKT5u5/H0hyY%3D",
            "test_name": "Site Reliability Engineering Test",
            "report": null,
            "start_time": "2017-11-29T15:15:35+05:30",
            "resource_uri": "/platform/v1/test/2edpq/candidates/hemil+bulk+01@doselect.com",
            "email": "hemil+bulk+2@doselect.com",
            "expiry": "2017-12-29T15:17:35+05:30"
        }
    ]
}
```

This API will allow you to create multiple invites in bulk using a single http call.

Optionally, you can add a `suppress_email=True` GET parameter to the URL if you do not want
the candidate to receive an invitation email from DoSelect.

If you need to schedule a test, it can be done by setting the `start_time` and `expiry` of the invite accordingly in ISO 8601 format.

A sample ISO 8601 format string: `2018-01-29T15:15:35+05:30`


### JSON payload attributes:

Field      | Required | Type | Description
------     | -------- | --------- | -----------
email      | Yes      | string    | The email of the candidate
expiry     | No       | string    | The expiry of the invite in an ISO format datetime string
start_time | No       | string    | The scheduled start time of an ISO format datetime string


If there are any errors in the creation of any of the invites, they'll be mentioned in the `errors` key in the response with the reason for failure.


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

Optionally, you can add a `suppress_email=True` GET parameter to the URL if you do not want
the candidate to receive an invitation email from DoSelect.

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
This will reset existing data of the user from that test. The user's previous test report will be retained in our database.
</aside>


## Update an invite

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/test/2edq1/candidates/hemil@doselect.com"

payload = {
	"expiry": "2018-01-31T15:17:35+05:30",
    "start_time": "2017-12-15T15:15:35+05:30"
}

headers = {
    'Doselect-Api-Key': "88d4266fd4e6338d13b845fcf28",
    'Doselect-Api-Secret': "385041b7bbc2320471b8551d",
    'Content-Type': "application/json",
    }

response = requests.request("PATCH", url, data=payload, headers=headers)

```

```shell
curl -X PATCH \
  'https://api.doselect.com/platform/v1/test/2edq1/candidates/hemil@doselect.com' \
  -H 'Doselect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'Doselect-Api-Secret: 385041b7bbc2320471b8551d' \
  -d '{
	"expiry": "2018-01-31T15:17:35+05:30",
    "start_time": "2017-12-15T15:15:35+05:30"
}'
```

> Response

```json
{
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=7HEdD1C7cis6RA46k214h0GbJB7ZupX3xxuhdH1/znaPCr4x453nCICbR",
    "email": "hemil@doselect.com",
    "expiry": "2018-01-31T15:17:35+05:30",
    "report": null,
    "resource_uri": "/platform/v1/test/2edq1/candidates/hemil@doselect.com",
    "start_time": "2017-12-15T15:15:35+05:30",
    "status": "pending",
    "test": "/platform/v1/test/2edq1"
}
```

This endpoint updates the invite for an user.

The request takes two params in the request body:

Title      | Type   | Description
---------- | ------ | -----------
start_time | string | A ISO 8601 datetime string denoting the new invite start time
expiry     | string | A ISO 8601 datetime string denoting the new invite expiry

This API will only work for the aforementioned fields and will throw an `400 BAD REQUEST` if any other field is sent in the payload.

### HTTP Request

`PATCH https://api.doselect.com/platform/v1/test/<slug>/candidates/<email>/`

Optionally, you can add a `suppress_email=True` GET parameter to the URL if you do not want
the candidate to receive an invitation email from DoSelect.

## Extend an invite's test duration

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/test/2edq1/candidates/hemil@doselect.com/extend_duration"

payload = {
	"minutes": 15,
}

headers = {
    'Doselect-Api-Key': "88d4266fd4e6338d13b845fcf28",
    'Doselect-Api-Secret': "385041b7bbc2320471b8551d",
    'Content-Type': "application/json",
}

response = requests.request("POST", url, data=payload, headers=headers)

```

```shell
curl -X PATCH \
  'https://api.doselect.com/platform/v1/test/2edq1/candidates/hemil@doselect.com/extend_duration' \
  -H 'Doselect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'Doselect-Api-Secret: 385041b7bbc2320471b8551d' \
  -d '{
	"minutes": 10,
}'
```

> Response

```json
{
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=7HEdD1C7cis6RA46k214h0GbJB7ZupX3xxuhdH1/znaPCr4x453nCICbR",
    "email": "hemil@doselect.com",
    "expiry": "2018-01-31T15:17:35+05:30"
}
```

This endpoint updates the end time for a test invite.

The request takes one param in the request body:

Title      | Type   | Description
---------- | ------ | -----------
minutes    | string | Number of minutes by which to extend the test's duration

The API works only if the candidate has started the test. If not, `Bad Request` (400) is returned.
The test extension is supposed to be synchronous. It means that if the test is supposed to end at 20:00 UTC, and
extended by 20 minutes, the test will now end at 20:20 UTC. If the candidate is offline at this period, they will
not be able to use this extended time.

### HTTP Request

`POST https://api.doselect.com/platform/v1/test/<slug>/ candidates/<email>/extend_duration`


## Extend an invite's test retake

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/esows/candidates/john@example.com/retake'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}

payload = {
    "max_retakes": 3,
    "suppress_email": False,
    "expiry": "2018-05-29T15:17:35+05:30"
}

response = requests.post(url, headers=headers, json=payload)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/test/esows/candidates/john@example.com/retake \
  -H 'content-type: application/json' \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551d' \
  -d '{
    "max_retakes": 3,
    "suppress_email": false,
    "expiry": "2018-05-29T15:17:35+05:30"
}'
```

> Response

```json
{
    "candidate_access_url": "https://doselect.com/gateways/test?access_code=U2DsXUOgvXe2yUXiSPMHglkd/ORMykzTvw8jqmQrj6d1OL8N6MBqUqtu2nxSLz2E5BAuG5T8C9l%2BXYmjUPA0akTATBJB47bU9Yc8CQmwC8s%3D",
    "email": "john@example.com",
    "expiry": "2018-05-29T15:17:35+05:30",
    "start_time": "2018-05-10T15:17:35+05:30",
    "resource_uri": "/platform/v1/test/esows/candidates/john@example.com",
    "status": "pending",
    "test": "/platform/v1/test/esows"
}
```

The endpoint adds a retake attempt for the user to a particular test. This will work even if the user hasn’t attempted the test yet. 

Once a retake has been added, our platform will trigger an email to the user with the access URL to attempt the test.
Optionally, you can add a `suppress_email=False` to the request body if you want
the candidate to receive an retake email from DoSelect.

### HTTP Request

`POST https://api.doselect.com/platform/v1/test/<slug>/ candidates/<email>/retake`

- If you are trying to access this endpoint with invalid request body. It will return `400 BAD REQUEST` with relevant message.
- If there are fewer or no credits left in your account. It will return `400 BAD REQUEST` with relevant message.
- If the test of a particular invite is not live for which you are trying to add retake. It will return `400 BAD REQUEST` with relevant message.
- If you are trying to access this endpoint with invalid `DoSelect-Api-Key` or `DoSelect-Api-Secret`. It will return `401 UNAUTHORIZE` with relevant message.
- If you are trying to access an invite of different company. It will return `403 FORBIDDEN` with relevant message.
- If an invite does not exist with the email to a particular test. It will return `404 NOT FOUND` with relevant message.
- If you are trying to access this endpoint with valid data. It will return `201 CREATED` with success response.

### JSON payload attributes:

Field          | Required | Type      | Description
----------     | -------- | --------- | -----------
max_retakes    | Yes      | integer   | Number of retakes to be add. By default, the value will be `0`.
suppress_email | No       | boolean   | If `True` don’t trigger an email from the platform, return the access_url as the response. By default, the value will be `True`.
expiry         | No       | string    | A ISO 8601 datetime string denoting the new invite expiry.
