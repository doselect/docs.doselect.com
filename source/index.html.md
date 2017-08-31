---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - Contact us for the API Key.
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to the Doselect Partner API! You can use our API to access our partner API endpoints, which can get information on tests associated with your company, the candidates for each test and the report of the candidates.

# Authentication

> To authenticate, use this code:

```python
import requests

url = 'api_endpoint_here'
headers = {
    "Doselect-Api-Key": "Rosetta-Key",
    "Doselect-Api-Secret": "42"
}
response = requests.get(url, headers=headers)
```

```shell
curl "api_endpoint_here"
  -H "Doselect-Api-Key: Rosetta-Key" \
  -H "Doselect-Api-Secret: 42"
```

> Make sure to replace `Rosetta-Key` and `42` with your API key and secret.

Our APIs use a distinct identifying key and an ai_secret to allow access to the API. Do not share your secret API keys in publicly accessible areas such GitHub, client-side code, and so forth.

It is expected for the API key and API Secret to be included in all API requests to the server in a header that looks like the following:

`Doselect-Api-Key: Rosetta-Key`
`Doselect-Api-Secret: 42`

<aside class="notice">
You must replace <code>Rosetta-Key</code> and <code>42</code> with your personal API key and secret.
</aside>

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


# Pagination
All top-level API resources have support for bulk fetches via "list" API methods. These list API methods share a common structure, taking at least these two parameters: `limit` and `offset`.

We use limit-offset based pagination with a default page size of 100.


# Metadata
All top-level API resources have support for bulk fetches via "list" API methods. These will have a meta key in the response json
>
```json
{
    "meta": {
            "limit": 100,
            "next": null,
            "offset": 0,
            "previous": null,
            "total_count": 1
    },
    "objects":[]
}
```
>

Parameter | Meaning
---------- | -------
total_count | The total number of objects being returned
previous | The URI of the previous page
next | The URI of the next page
offset | The object offset, as sent in the request
limit | The number of objects returned, as sent in the request


# Core Resources

## Test
This is an object representing a Test which has been/is being/will be conducted. You can retrieve it to see the information of the test

### Get All Tests

```python
import requests

url = 'https://api.doselect.com/tardis/api/v1/test'
headers = {
    "Doselect-Api-Key": "Rosetta-Key",
    "Doselect-Api-Secret": "42"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/tardis/api/v1/test"
  -H "Doselect-Api-Key: Rosetta-Key" \
  -H "Doselect-Api-Secret: 42"
```

> Make sure to replace `Rosetta-Key` and `42` with your API key and secret.
> The above command returns JSON structured like this:

```json
{
    "meta": {
        "limit": 1,
        "next": "/tardis/api/v1/test?limit=1&offset=1",
        "offset": 0,
        "previous": null,
        "total_count": 2
    },
    "objects": [
        {
            "allowed_technologies": {},
            "archived": true,
            "cutoff": 42,
            "duration": 42,
            "end_time": null,
            "id": 42,
            "instructions": "",
            "is_activated": true,
            "is_live": true,
            "level": "EAS",
            "meta": {
                "description": "",
                "title": ""
            },
            "name": "Python Scripting",
            "public_access_password": null,
            "public_access_slug": null,
            "resource_uri": "/tardis/api/v1/test/4242",
            "sections": [
                {
                    "description": "",
                    "duration": 0,
                    "name": "Section 42",
                    "problems": [
                        {
                            "level": "EAS",
                            "name": "Hello World!",
                            "problem_type": "SCR",
                            "score": 42,
                            "slug": "42"
                        },
                        {
                            "level": "EAS",
                            "name": "The distance problem",
                            "problem_type": "MCQ",
                            "score": 42,
                            "slug": "42-1"
                        },
                        {
                            "level": "EAS",
                            "name": "The socks problem",
                            "problem_type": "MCQ",
                            "score": 42,
                            "slug": "42-2"
                        }
                    ],
                    "sample": 3,
                    "shuffle": false,
                    "slug": "section-42"
                }
            ],
            "settings": {
                "hacker_extra_data": {
                    "custom_data": {
                        "enabled": false,
                        "fields": []
                    },
                    "profile_data": false
                },
                "invites": {
                    "expiry": {
                        "date": "",
                        "days": 15,
                        "enabled": true
                    },
                    "message": ""
                },
                "proctor": {
                    "compare": {
                        "fingerprint": {
                            "flag": 1,
                            "max": 0
                        },
                        "navigation": {
                            "flag": 3,
                            "max": 10
                        }
                    },
                    "enabled": false,
                    "snapshot": false
                },
                "reminders": {
                    "days_after_creation": 3,
                    "days_before_expiry": 1,
                    "enabled": false
                },
                "reports": {
                    "admin_emails": [],
                    "confirmation": {
                        "enabled": false,
                        "message": ""
                    },
                    "send_to_candidate": false
                },
                "support": {
                    "email": "hello@doselect.com",
                    "phone": ""
                }
            },
            "slug": "4242",
            "start_time": null,
            "status": "DRA",
            "tags": []
        }
    ]
}
```

This endpoint retrieves all tests of your company.

#### HTTP Request

`GET https://api.doselect.com/tardis/api/v1/test`

<aside class="success">
Remember to send authentication Headers
</aside>

### Get a Specific Test

```python
import requests

url = 'https://api.doselect.com/tardis/api/v1/test/4242'
headers = {
    "Doselect-Api-Key": "Rosetta-Key",
    "Doselect-Api-Secret": "42"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/tardis/api/v1/test/4242"
  -H "Doselect-Api-Key: Rosetta-Key" \
  -H "Doselect-Api-Secret: 42"
```

> Make sure to replace `Rosetta-Key` and `42` with your API key and secret.
> The above command returns JSON structured like this:

```json
{
    "allowed_technologies": {},
    "archived": true,
    "cutoff": 42,
    "duration": 42,
    "end_time": null,
    "id": 42,
    "instructions": "",
    "is_activated": true,
    "is_live": true,
    "level": "EAS",
    "meta": {
        "description": "",
        "title": ""
    },
    "name": "Python Scripting",
    "public_access_password": null,
    "public_access_slug": null,
    "resource_uri": "/tardis/api/v1/test/4242",
    "sections": [
        {
            "description": "",
            "duration": 0,
            "name": "Section 42",
            "problems": [
                {
                    "level": "EAS",
                    "name": "Hello World!",
                    "problem_type": "SCR",
                    "score": 42,
                    "slug": "42"
                },
                {
                    "level": "EAS",
                    "name": "The distance problem",
                    "problem_type": "MCQ",
                    "score": 42,
                    "slug": "42-1"
                },
                {
                    "level": "EAS",
                    "name": "The socks problem",
                    "problem_type": "MCQ",
                    "score": 42,
                    "slug": "42-2"
                }
            ],
            "sample": 3,
            "shuffle": false,
            "slug": "section-42"
        }
    ],
    "settings": {
        "hacker_extra_data": {
            "custom_data": {
                "enabled": false,
                "fields": []
            },
            "profile_data": false
        },
        "invites": {
            "expiry": {
                "date": "",
                "days": 15,
                "enabled": true
            },
            "message": ""
        },
        "proctor": {
            "compare": {
                "fingerprint": {
                    "flag": 1,
                    "max": 0
                },
                "navigation": {
                    "flag": 3,
                    "max": 10
                }
            },
            "enabled": false,
            "snapshot": false
        },
        "reminders": {
            "days_after_creation": 3,
            "days_before_expiry": 1,
            "enabled": false
        },
        "reports": {
            "admin_emails": [],
            "confirmation": {
                "enabled": false,
                "message": ""
            },
            "send_to_candidate": false
        },
        "support": {
            "email": "hello@doselect.com",
            "phone": ""
        }
    },
    "slug": "4242",
    "start_time": null,
    "status": "DRA",
    "tags": []
}
```

This endpoint retrieves a specific Test.

#### HTTP Request

`GET https://api.doselect.com/tardis/api/v1/test/<slug>`

#### URL Parameters

Parameter | Description
--------- | -----------
slug | The slug of the test to retrieve

<aside class="success">
Remember to send authentication Headers
</aside>


### Get All Candidates of a Test

```python
import requests

url = 'https://api.doselect.com/tardis/api/v1/test/4242/candidates'
headers = {
    "Doselect-Api-Key": "Rosetta-Key",
    "Doselect-Api-Secret": "42"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/tardis/api/v1/test/4242/candidates"
  -H "Doselect-Api-Key: Rosetta-Key" \
  -H "Doselect-Api-Secret: 42"
```

> Make sure to replace `Rosetta-Key` and `42` with your API key and secret.
> The above command returns JSON structured like this:

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
            "access_code": "4242",
            "archived": false,
            "email": "ghost@wall.com",
            "expiry": "2015-06-26T10:39:49.124792",
            "extra_data": "{}",
            "id": 424,
            "is_demo": false,
            "is_onboarded": false,
            "is_team_invite": false,
            "member_type": null,
            "report": {
                "percentile_score": null,
                "time_taken": null,
                "total_problems": 3,
                "total_score": null,
                "total_solutions": null
            },
            "resource_uri": "",
            "status": "accepted",
            "test": "/tardis/api/v1/test/4242",
            "times_reset": 0,
            "times_sent": 0
        }
    ]
}
```

This endpoint retrieves all candidates of a test.

#### HTTP Request

`GET https://api.doselect.com/tardis/api/v1/test/<slug>/candidates`

#### URL Parameters

Parameter | Description
--------- | -----------
slug | The slug of the test, whose candidates are to retrieve

<aside class="success">
Remember to send authentication Headers
</aside>


### Get Report of a Candidate

```python
import requests

url = 'https://api.doselect.com/tardis/api/v1/test/4242/candidates/ghost@wall.com/report'
headers = {
    "Doselect-Api-Key": "Rosetta-Key",
    "Doselect-Api-Secret": "42"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/tardis/api/v1/test/4242/candidates/ghost@wall.com/report"
  -H "Doselect-Api-Key: Rosetta-Key" \
  -H "Doselect-Api-Secret: 42"
```

> Make sure to replace `Rosetta-Key` and `42` with your API key and secret.
> The above command returns JSON structured like this:

```json
{
    "_test": {
        "name": "Sample",
        "slug": "4242"
    },
    "accepted": 0,
    "attempted": 1,
    "code_quality_frequency": null,
    "ended_at": "2017-06-25T08:21:31.141877",
    "extra_data": {},
    "has_access": false,
    "id": 424,
    "is_expired": true,
    "is_submitted": true,
    "max_score": 105,
    "need_review": 1,
    "percentile_score": 50,
    "proctored_data": {},
    "rejected": 0,
    "reports_url": "reports_url",
    "resource_uri": "",
    "sections": [
        {
            "name": "Section 1",
            "problems": [
                "problem_slug_1",
                "problem_slug_2",
                "problem_slug_3"
            ]
        }
    ],
    "settings": {
        "proctor": {
            "enabled": false,
            "snapshot": false
        }
    },
    "started_at": "2017-06-19T10:40:17.657687",
    "tagwise_proficiency": {
        "languages": [
            "ubuntu-1404"
        ],
        "tags": {
            "labels": [],
            "values": []
        }
    },
    "test": "/tardis/api/v1/test/4242",
    "time_taken": 78073,
    "total_problems": 3,
    "total_score": "0.0",
    "total_solutions": 1,
    "user": {
        "email": "ghost@wall.com",
        "first_name": "Agnes",
        "id": 30,
        "is_active": true,
        "last_name": "Gru",
        "username": "ghost"
    },
    "verdict": {
        "percentage": 0,
        "quality_score": null,
        "quality_verdict": "bad",
        "verdict": "Qualified"
    }
}
```

This endpoint retrieves all candidates of a test.

#### HTTP Request

`GET https://api.doselect.com/tardis/api/v1/test/<slug>/candidates/<email>/report`

### URL Parameters

Parameter | Description
--------- | -----------
slug | The slug of the test, whose report is to be retrieved
email | The email of the candidate, whose report is to be retrieved

<aside class="success">
Remember to send authentication Headers
</aside>