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
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "api_endpoint_here"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Make sure to replace the dummy key and secret with your API key and secret.

Our APIs use a distinct alpha-numeric identifying key and an api_secret to allow access to the API. Do not share your secret API keys in publicly accessible areas such GitHub, client-side code, and so forth.

It is expected for the API key and API Secret to be included in all API requests to the server in a header that looks like the following:

`DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28`
<br>
`DoSelect-Api-Secret: 385041b7bbc2320471b8551d`

<aside class="notice">
You must replace <code>88d4266fd4e6338d13b845fcf28</code> and <code>385041b7bbc2320471b8551d</code> with your personal API key and secret.
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
All top-level API resources have support for bulk fetches via "list" API methods. These will have a meta key in the response json.

The actual resource data will be associated with the key `objects` in the response dictionary.

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
> Response Format

Parameter | Meaning
---------- | -------
total_count | The total number of objects being returned
previous | The URI of the previous page
next | The URI of the next page
offset | The object offset, as sent in the request
limit | The number of objects returned, as sent in the request


# Core Resources

## Test
This is an object representing a Test which has been/is being/will be conducted.
You can retrieve it to see the information of the test

### Get All Tests

```python
import requests

url = 'https://api.doselect.com/platform/v1/test'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "42"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Make Sure to replace the dummy values with your key and secret.   `
> Response Format:

```json
{
    "objects": [
        {
            "allowed_technologies": {},
            "archived": false,
            "cutoff": 0,
            "duration": 30,
            "end_time": null,
            "instructions": "",
            "level": "EAS",
            "name": "Sample",
            "public_access_password": null,
            "public_access_slug": null,
            "resource_uri": "/platform/v1/test/78z50",
            "sections": [
                {
                    "description": "",
                    "duration": 0,
                    "name": "Section 1",
                    "problems": [],
                    "sample": 0,
                    "shuffle": false,
                    "slug": "section-1"
                }
            ],
            "slug": "78z50",
            "start_time": null,
            "status": "DRA",
            "tags": []
        }
    ]
}
```

This endpoint retrieves all tests of your company.

#### HTTP Request

`GET https://api.doselect.com/platform/v1/test`


### Get a Specific Test

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/4242'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/4242"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 42"
```

> Make Sure to replace the dummy values with your key and secret.   `
> Response Format:

```json
{
    "allowed_technologies": {},
    "archived": true,
    "cutoff": 0,
    "duration": 45,
    "end_time": null,
    "instructions": "<p> Lorem Borem </p>",
    "level": "EAS",
    "name": "Python Scripting",
    "public_access_password": null,
    "public_access_slug": null,
    "resource_uri": "/platform/v1/test/esows",
    "sections": [
        {
            "description": "",
            "duration": 0,
            "name": "Section 1",
            "problems": [
                {
                    "level": "EAS",
                    "name": "Hello World!",
                    "problem_type": "SCR",
                    "score": 50,
                    "slug": "76wv0"
                },
                {
                    "level": "EAS",
                    "name": "The distance problem",
                    "problem_type": "MCQ",
                    "score": 5,
                    "slug": "0ugxs"
                },
                {
                    "level": "EAS",
                    "name": "The socks problem",
                    "problem_type": "MCQ",
                    "score": 5,
                    "slug": "75g30"
                }
            ],
            "sample": 3,
            "shuffle": false,
            "slug": "section-1"
        }
    ],
    "slug": "esows",
    "start_time": null,
    "status": "DRA",
    "tags": []
}
```

This endpoint retrieves a specific Test.

#### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>`

#### URL Parameters

Parameter | Description | Source
--------- | ----------- | ------
slug | Unique identifier of a test |  GET all tests response will have this in each test.


### Get All Candidates of a Test

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/4242/candidates'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/4242/candidates"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Make Sure to replace the dummy values with your key and secret.   `
> Response Format:

```json
{
    "objects": [
        {
            "access_code": "AbUxfgtmNWQGLYFvsfdgdewlXLjVaqD2MPAwO6dm27c",
            "archived": false,
            "email": "donnie@campushash.com",
            "expiry": "2015-05-10T13:23:42.006100",
            "extra_data": "{}",
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
            "test": "/platform/v1/test/esows",
            "times_reset": 0,
            "times_sent": 0
        },
    ]
}
```

This endpoint retrieves all candidates of a test.

#### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/candidates`

#### URL Parameters

Parameter | Description | Source
--------- | ----------- | ------
slug | Unique identifier of a test |  GET all tests response will have this in each test.


### Get Report of a Candidate

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/4242/candidates/ghost@wall.com/report'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/4242/candidates/ghost@wall.com/report"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Make Sure to replace the dummy values with your key and secret.   `
> Response Format:

```json
{
    "accepted": 41,
    "attempted": 76,
    "code_quality_frequency": [
        {
            "labels": "Bug Risk",
            "value": 3
        }
    ],
    "ended_at": "2017-08-17T06:29:06.955499",
    "extra_data": {},
    "is_submitted": true,
    "max_score": 580,
    "need_review": 0,
    "percentile_score": 33,
    "proctored_data": {},
    "rejected": 35,
    "reports_url": "http://doselect.local:8000/reports/test?access_code=kp0MNj5%2BAG1LRSW2wPlcYZ/TX7Hf9VBE9Wz0EE0hHUSmZ2w0FlRD4oebPPBw3lt6",
    "resource_uri": "",
    "sections": [
        {
            "name": "BASH Scripting",
            "problems": [
                "ed9op",
                "br9p9"
            ]
        },
        {
            "name": "MCQ Section",
            "problems": [
                "7gnwp",
                "syhnm",
                "7ygow",
                "7lv90"
            ]
        }
    ],
    "started_at": "2017-08-17T05:14:12.167016",
    "tagwise_proficiency": {
        "languages": [
            "bash"
        ],
        "tags": {
            "labels": [
                "Linux"
            ],
            "values": [
                2.76
            ]
        }
    },
    "test": "/platform/v1/test/2edpq",
    "time_taken": 4494,
    "total_problems": 78,
    "total_score": "263.0",
    "total_solutions": 76,
    "user": {
        "email": "tessyjoseph1992@gmail.com",
        "first_name": "TESSY",
        "id": 31270,
        "is_active": true,
        "last_name": "JOSEPH JOHN",
        "username": "7302e16af6ea4bcb9446fe6542ea4e"
    },
    "verdict": {
        "percentage": 45,
        "quality_score": 4.3,
        "quality_verdict": "ok",
        "verdict": "Not qualified"
    }
}
```

This endpoint retrieves all candidates of a test.

#### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/candidates/<email>/report`

### URL Parameters

#### URL Parameters

Parameter | Description | Source
--------- | ----------- | ------
slug | Unique identifier of a test | GET all tests response will have this in each test.
email | The email of the candidate | GET all candidates response will have this in each candidate.


# Embed client library

The embed client library powers interactions with DoSelect embed partner APIs

## Setup

### Step 1: Install the DoSelect Embed JS library

To initiate the DoSelect embed, simply copy and paste the snippet below before the </body> tag on every page where you want the embed to appear.

```
<DoSelect embed script goes here>
```

### Step 2: Configure user metadata

To display embed problems and tests with respect to user, update `window.doselectSettings` object with user metadata and place it above the minifed library.

```
window.doselectSettings = {
	"api_key": API_KEY,
	"email": USER_EMAIL,
	"full_name": USER_FULL_NAME,
	"timezone": USER_TIMEZONE,
	"user_hash": HMAC(SHA256(API_SECRET, USER_EMAIL))
}
```

Example:

```
window.doselectSettings = {
	"api_key": "abc",
	"email": "donnie@campushash.com",
	"full_name": "Donnie Caan",
	"timezone": "GMT",
	"user_hash": "CLjME03fz+Jr36VaDwv2MbNeemtfA57IgWhwcR3GfdI="
}

<DoSelect embed script goes here>
```


## Actions

### Load frame

- To load problem/test frame, copy the following to respective places where the frame has to be loaded.

```
<div id="doselct-embed" category="FRAME_TYPE" slug="CATEGORY_SLUG"></div>
```
```json
Webhook Begin/End Test/Problem Payload:
{
    "category": "`problem` or `test`",
    "event_type": "`begin` or `end`",
    "data": {
        "This will have": "the report data if it exists"
    }
}
```
- Call `doselect.loadFrame()` to load all the frames in the page.

#### Webhook
A call will be made to your webhook-url when the user begins the test with the payload.


Example:

```
..
..
<div id="doselect-embed" category="problem" slug="2ytr6">
..
..
..
<div id="doselect-embed" category="problem" slug="3myr6">
..
..
..

doselect.loadFrame()

```

### Close frame

To close a frame, call `doselect.closeFrame(category, slug)`. If the frame element is available in the current page, it will be closed.

#### Webhook
A call will be made to your webhook-url when the user ends the test/problem with the payload.


### Fetch report

To fetch report, call `doselect.fetchReport(category, slug)`.

Sample request/response:

```
var testReport = doselect.fetchReport('problem', 'yr64t')

// testReport
{
    "status": "OK",
    "test_report": {
        "percentile_score": 50,
        "tagwise_proficiency": {
            "languages_used": [
                "ubuntu-1404"
            ],
            "tags": []
        },
        "accepted": 0,
        "stats": {},
        "proctored_data": {},
        "total_problems": 3,
        "sections": [
            {
                "problems": [
                    {
                        "slug": "7hge0",
                        "score": 50,
                        "problem_type": "SCR",
                        "name": "Sum of all digits",
                        "level": "EAS"
                    },
                    {
                        "slug": "sz3i7",
                        "score": 50,
                        "problem_type": "SCR",
                        "name": "Print number in reverse order",
                        "level": "EAS"
                    },
                    {
                        "slug": "78z50",
                        "score": 5,
                        "problem_type": "SUB",
                        "name": "DoSelect Mailserver",
                        "level": "EAS"
                    }
                ],
                "name": "Section 1"
            }
        ],
        "invite": 594,
        "attempted": 1,
        "rejected": 0,
        "code_quality_issues": null,
        "candidate_extra_data": {
            "something": "else"
        },
        "ended_at": "2015-06-25T08:21:31.141Z",
        "max_score": 105,
        "time_taken": 78073,
        "need_review": 1,
        "verdict": {
            "percentage": 0,
            "verdict": "Qualified",
            "quality_score": null,
            "quality_verdict": "bad"
        }
    }
}

// problemReport
{
    "code": "",
    "analysis_details": {},
    "expunge_time": "2014-11-12T20:00:13.703Z",
    "technology": 15,
    "evaluator": null,
    "test": null,
    "extra_data": "{}",
    "ide_status": null,
    "status": "NRE",
    "resubmissions": 0,
    "solution_type": "APP",
    "total_score": "0.0",
    "container_id": "9c3594e5d825",
    "expunged": false,
    "choice": null,
    "answer": "",
    "test_solution_set": null,
    "is_submitted": true,
    "solution_set": null,
    "slug": "75ee0",
    "stage": 26,
    "submitted_at": "2017-05-14T09:10:22.558Z",
    "run_details": null,
    "attachments": "[]",
    "problem": 6
}
```
