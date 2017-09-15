---
title: DoSelect Platform APIs

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:

search: true
---

# Introduction

Welcome to the DoSelect Platform APIs! These APIs provide you access to various resources and functionalities of the DoSelect platform,
like Tests, Reports, Problems, Submissions and Embeds.

The API is organized around REST. All requests should be made over SSL. All request and response bodies, including errors, are encoded in JSON.

# Authentication

> Example request with authentication:

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
curl "https://api.doselect.com/platform/v1/test"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

Access to the APIs are authenticated using your team account's `API_KEY` and `API_SECRET`. These credentials are available in your team dashbaord.

You must include the `API_KEY` and `API_SECRET` in custom request headers, `DoSelect-Api-Key` and `DoSelect-Api-Secret` respectively.
Because your `API_SECRET` is sensitive information and allows access to your account, we strongly advise you to not expose your `API_SECRET`
in publicly accessible avenues such as GitHub, or in client-side code.

<aside class="notice">
The examples given in this documentation use dummy credentials. You must use your team's actual credentials for these requests to work.
</aside>

# Errors

The APIs return standard HTTP success or error status codes. For errors, extra information about what went wrong will also be sent in the respose,
encoded in JSON. The various HTTP codes we might return are listed below.

Code | Title | Description
---------- | ------- | -----------
200 | OK | The request was successful.
400 | Bad request | The request was malformed or in an unaccepted format.
401 | Unauthorized | Your `API_KEY` and/or `API_SECRET` is wrong or missing.
403 | Forbidden | The requested resource was not accessible to you.
404 | Not found | The specified resource was not be found.
405 | Method not allowed | You were trying to access the resource using an invalid HTTP method.
50X | Internal server error | An error occured with our APIs.


# Pagination

API endpoints that return a collection of results are always paginated, and contain a `meta` object with pagination details. The `objects` object contains the list of
resource objects in such responses.

## Meta

```json
{
    "meta": {
            "limit": 100,
            "next": /platform/v1/test?limit=100&offset=200,
            "offset": 100,
            "previous": /platform/v1/test?limit=100&offset=0,
            "total_count": 217
    },
    "objects":[
        {
            ...
        },
        {
            ...
        }
    ]
}
```

The `meta` object contains the following information:

Parameter | Description
---------- | -------
limit | The page size for this request. This is set to `50` by default.
offset | The offset of the first object sent in this response.
next | The resource URI of the next page in this resource list. This field would be `null` if there's no next page.
previous | The resource URI of the previous page in this resource list. This field would be `null` if there's no previous page.
total_count | The total number of objects in this resource list.


# Test API

The Test API lets you retrieve tests that have been created in your team.

## Get all tests
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
curl "https://api.doselect.com/platform/v1/test"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "candidates_uri": "/platform/v1/test/2edpq/candidates",
            "cutoff": 60,
            "duration": 110,
            "end_time": null,
            "instructions": "Test Instructions HTML",
            "level": "EAS",
            "name": "Site Reliability Engineering Test",
            "public_test_password": "public_test_password",
            "public_test_url": "public_test_url",
            "resource_uri": "/platform/v1/test/2edpq",
            "sections": [{
                "description": "",
                "duration": 0,
                "name": "BASH Scripting",
                "problems": [{
                    "allowed_technologies": [],
                    "level": "EAS",
                    "name": "Print the HTTP status code",
                    "problem_type": "SCR",
                    "score": 50,
                    "slug": "ed9op"
                }],
                "randomization": {
                    "sampling": "2 out of 2",
                    "shuffle": false
                },
                "slug": "section-1"
            }],
            "slug": "2edpq",
            "start_time": null,
            "status": "DRA",
            "tags": ["python", "functions"],
            "usable": true
        }
    ]
}
```

This endpoint retrieves all tests that exist in your team's account.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test`


## Get one test

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/esows'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/esows"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
	"candidates_uri": "/platform/v1/test/2edpq/candidates",
	"cutoff": 60,
	"duration": 110,
	"end_time": null,
	"instructions": "Test Instructions HTML",
	"level": "EAS",
	"name": "Site Reliability Engineering Test",
	"public_test_password": "public_test_password",
	"public_test_url": "public_test_url",
	"resource_uri": "/platform/v1/test/2edpq",
	"sections": [{
		"description": "",
		"duration": 0,
		"name": "BASH Scripting",
		"problems": [{
			"allowed_technologies": [],
			"level": "EAS",
			"name": "Print the HTTP status code",
			"problem_type": "SCR",
			"score": 50,
			"slug": "ed9op"
		}],
		"randomization": {
			"sampling": "2 out of 2",
			"shuffle": false
		},
		"slug": "section-1"
	}],
	"slug": "2edpq",
	"start_time": null,
	"status": "DRA",
	"tags": ["python", "functions"],
	"usable": true
}
```
A test is identified by a unique `slug` that gets generated during creation. This endpoint retrieves a specific test:

### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>`


## Get all candidates of a test

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/esows/candidates'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/esows/candidates"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "access_code": "kp0MNj5dfsPlcYZ/TX7Hf9VBE9Wz0EE0hHUSmZ2w0FlRD4oebPPBw3lt6",
            "candidate_extra_data": {},
            "email": "tesssd2@gmail.com",
            "expiry": "2017-08-31T07:18:50.328659",
            "report": {
                "percentile_score": null,
                "report_uri": "/platform/v1/test/2edpq/candidates/tesssd2@gmail.com/report",
                "time_taken": null,
                "total_problems": 78,
                "total_score": null,
                "total_solutions": null
            },
            "resource_uri": "",
            "status": "accepted",
            "test": "/platform/v1/test/2edpq",
            "times_sent": 1
        },
    ]
}
```

This endpoint retrieves all candidates of a test.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/candidates`


## Get a candidate's report

> Request

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

> Response

```json
{
	"accepted": 41,
	"attempted": 76,
	"candidate_extra_data": {},
	"code_quality_issues": [{
		"labels": "Bug Risk",
		"value": 3
	}],
	"ended_at": "2017-08-17T06:29:06.955499",
	"is_submitted": true,
	"max_score": 580,
	"need_review": 0,
	"proctored_data": {},
	"rejected": 35,
	"resource_uri": "",
	"sections": [{
		"name": "BASH Scripting",
		"problems": [{
			"level": "EAS",
			"name": "Print the HTTP status code",
			"problem_type": "SCR",
			"score": 50,
			"slug": "ed9op",
			"solution": {
				"is_submitted": true,
				"score": "0.0",
				"slug": "w4a9a",
				"status": "REJ"
			}
		}]
	}],
	"started_at": "2017-08-17T05:14:12.167016",
	"stats": {},
	"test": "/platform/v1/test/2edpq",
	"time_taken": 4494,
	"total_problems": 78,
	"total_score": 263,
	"total_solutions": 76,
	"user": {
		"email": "tessyjoseph1992@gmail.com",
		"first_name": "TESSY",
		"id": 31270,
		"is_active": true,
		"last_name": "JOSEPH JOHN",
		"username": "7302e16af6ea4bcb9446fe6542ea4e"
	}
}
```

This endpoint retrieves the reports of one candidate in a test. A candidate is identified by the `email` in a test.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/candidates/<email>/report`

# User API

The User API allows you to retrieve the details of a user on DoSelect.

# Problem API

The Problem API allows you to retrieve one problem on DoSelect. You can also retrieve all submissions made to the problem
within your team, as well as by a particular user identified by email.

## Get one problem

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/esows'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/problem/esows"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
	"attachments": [],
	"description": "\nBuild a chat application which has `Add chatbox` button, which on click adds a chat box to the window. When clicked again, it should add another chat box next to the first one. Maximum of 10 chat boxes are allowed ...",
	"insight_tags": [],
	"level": "EAS",
	"mcq_options": ["options"],
	"name": "Multi chat",
	"penalty": 0,
	"primary_technology": null,
	"problem_type": "UIX",
	"score": 75,
	"slug": "64l05",
	"stubs": {},
	"tags": ["front-end"],
	"technologies": ["vanillajs", "angularjs"],
	"time_limit_secs": 45,
	"total_testcases": 3,
}
```
A problem is identified by a unique `slug` that gets generated during creation. This endpoint retrieves a specific problem:

### HTTP Request

`GET https://api.doselect.com/platform/v1/problem/<slug>`


## Get all submissions of one problem

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/esows/solution'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/problem/esows/solution"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            {
                "code": "",
                "analysis_details": {
                    "quality": {
                        "analysis_ended": "2017-04-30T10:26:25Z",
                        "score": "4.3",
                        "analysis_started": "2017-04-30T10:26:12Z",
                        "issues": [{
                            "description": "Remove this useless assignment to local variable DoSelectHack",
                            "engine_name": "checks",
                            "check_name": "javascript:S1854",
                            "location": {
                                "path": "source.js",
                                "lines": {
                                    "begin": 4,
                                    "end": 4
                                }
                            },
                            "type": "issue",
                            "categories": ["Bug Risk"],
                            "remediation_points": 0
                        }, {
                            "description": "Remove this logging statement.",
                            "engine_name": "checks",
                            "check_name": "javascript:S2228",
                            "location": {
                                "path": "source.js",
                                "lines": {
                                    "begin": 6,
                                    "end": 6
                                }
                            },
                            "type": "issue",
                            "categories": ["Security"],
                            "remediation_points": 0
                        }, {
                            "description": "Remove this logging statement.",
                            "engine_name": "checks",
                            "check_name": "javascript:S2228",
                            "location": {
                                "path": "source.js",
                                "lines": {
                                    "begin": 8,
                                    "end": 8
                                }
                            },
                            "type": "issue",
                            "categories": ["Security"],
                            "remediation_points": 0
                        }],
                        "sid": "f770685b-c969-4d39-b9db-71377e7d5881"
                    }
                },
                "technology": "angularjs",
                "status": "ACC",
                "resubmissions": 0,
                "solution_type": "UIX",
                "total_score": "45.0",
                "choice": null,
                "answer": "",
                "is_submitted": true,
                "slug": "75ee0",
                "submitted_at": "2017-05-14T09:10:22.558Z",
                "run_details": null,
                "attachments": "[]",
                "creator": {
                    "email": "john@example.com"
                }
            }
        },
    ]
}
```
The problem is identified by a unique `slug` that gets generated during creation. This endpoint retrieves all submission of a specific problem:


### HTTP Request

`GET https://api.doselect.com/platform/v1/problem/<slug>/submissions`


## Get submission by a user

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/esows/solution/tessyjosseph@gmail.com/'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/problem/esows/solution/tessyjosseph@gmail.com/"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "code": "",
    "analysis_details": {
        "quality": {
            "analysis_ended": "2017-04-30T10:26:25Z",
            "score": "4.3",
            "analysis_started": "2017-04-30T10:26:12Z",
            "issues": [{
                "description": "Remove this useless assignment to local variable DoSelectHack",
                "engine_name": "checks",
                "check_name": "javascript:S1854",
                "location": {
                    "path": "source.js",
                    "lines": {
                        "begin": 4,
                        "end": 4
                    }
                },
                "type": "issue",
                "categories": ["Bug Risk"],
                "remediation_points": 0
            }, {
                "description": "Remove this logging statement.",
                "engine_name": "checks",
                "check_name": "javascript:S2228",
                "location": {
                    "path": "source.js",
                    "lines": {
                        "begin": 6,
                        "end": 6
                    }
                },
                "type": "issue",
                "categories": ["Security"],
                "remediation_points": 0
            }, {
                "description": "Remove this logging statement.",
                "engine_name": "checks",
                "check_name": "javascript:S2228",
                "location": {
                    "path": "source.js",
                    "lines": {
                        "begin": 8,
                        "end": 8
                    }
                },
                "type": "issue",
                "categories": ["Security"],
                "remediation_points": 0
            }],
            "sid": "f770685b-c969-4d39-b9db-71377e7d5881"
        }
    },
    "technology": "angularjs",
    "status": "ACC",
    "resubmissions": 0,
    "solution_type": "UIX",
    "total_score": "45.0",
    "choice": null,
    "answer": "",
    "is_submitted": true,
    "slug": "75ee0",
    "submitted_at": "2017-05-14T09:10:22.558Z",
    "run_details": null,
    "attachments": "[]",
    "creator": {
        "email": "john@example.com"
    }
}
```
This endpoint retrieves the submission of a specific problem, identified by a `slug` submitted by a user who is identified by the `email`.


### HTTP Request

`GET https://api.doselect.com/platform/v1/problem/<slug>/submission/<email>/`


# Submission API

The Submission API allows you to create a submission for a problem. After creating a submission, you will get notified via webhooks
when the result becomes available.

## Create a new submission

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/submission/"

payload = {
	"code": "print 'Hello World'",
	"technology": "technology_slug",
	"code_url": "https://s3.amazon.com/zygon.zip",
	"problem_slug": "esows",
	"problem_type": "problem_type",
	"email": "tessyjosseph@gmail.com"
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
  https://api.doselect.com/platform/v1/submission/ \
  -H 'Content-Type: application/json' \
  -H 'DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'DoSelect-Api-Secret: 385041b7bbc2320471b8551d' \
  -d '{
	"technology": "technology_slug",
	"problem_type": "problem_type",
	"code": "print '\''Hello World'\''",
	"email": "tessyjosseph@gmail.com",
	"problem_slug": "esows",
	"code_url": "https://s3.amazon.com/zygon.zip"
}'
```

> Response

```
```
This endpoint accepts a new submission for a specific problem, identified by a `slug` submitted by a user who is identified by the `email`.


### HTTP Request

`POST https://api.doselect.com/platform/v1/submission/`


### Payload Params
Parameter    | Description
----------   | ---------------
technology   | The `slug` which identifies the technology used for this submission
problem_type | The code for type of the problem
code         | If the submission is a coding-type problem, the code of the submission
code_url     | If the submission is a project-type problem, the publicly accessible url of the ZIP of the project
problem_slug | The `slug` which identifies the problem
email        | Email of the user


The allowed problem types are:

Problem type  | Slug
------------  | ----
Project-based | PRJ
Front-end project | UIX
Coding     | SCR
Mobile        | MOB


The allowed technologies for each problem type are:

Problem type | Slug reference
------------ | ----------------------
Project-based| java7 (Java 7), python3 (Python 3), python2 (Python 2), java8 (Java 8)
Front-end project| angularjs (AngularJS), jquery (jQuery), reactjs (React), backbonejs (Backbone), vanillajs (Vanilla JS)
Coding    | julia (Julia), haskell (Haskell), csharp (C#), go (Go), javascript (JavaScript (NodeJS)), scala (Scala), swift (Swift), perl (Perl), lua (Lua), clisp (Clisp), objectivec (ObjectiveC), php (PHP), ruby (Ruby), bash (Bash), clojure (Clojure), rust (Rust), c (C), cpp (C++), java7 (Java 7), python3 (Python 3), python2 (Python 2), java8 (Java 8), r (R), fsharp (F#), cpp14 (C++14), kotlin (Kotlin)
Mobile      | android (Android)


# Embed API

The Embed API allows you to embed a `Test` or a `Problem` on DoSelect on your platform. This API is designed keeping in mind that
the platform which using the embed need not store any state data on their end -- all state data is stored by DoSelect and can be retrieved using
the REST Platform APIs.

## Client library

The Embed API can be accessed using the embed client library, `doselect-embed.js`. This library provides a simple JavaScript interface
for authentication, creating embed objects on your application, and retrieving general information related to the embedded objects. 

### Setup

#### Step 1: Install the `doselect-embed.js` library

To use the Embed API, simply copy and paste the snippet below before the `</body>` tag on every page where you want the embed to appear.

`<script>[DOSELECT EMBED CODE SNIPPET]</script>`

#### Step 2: Configure user settings

```javascript
window.doselectSettings = {
    "api_key": "88d4266fd4e6338d13b845fcf28",
    "email": "john@example.com",
    "full_name": "John Doe",
    "timezone": "Asia/Kolkata",
    "user_hash": "CLjME03fz+Jr36VaDwv2MbNeemtfA57IgWhwcR3GfdI="
}

<script>[DOSELECT EMBED CODE SNIPPET]</script>
```

To display embed problems and tests with respect to user, update `window.doselectSettings` object with user metadata and place it above the embed code snippet.

The following details are needed for configuration:

Parameter | Description
----------|------------
api_key | Your team account's `API_KEY`
email | Email of the current user in your application for which you want the embed objects
full_name | Full name of the current user
timezone | Timezone of the current user
user_hash | The verification hash for this user, which must be generated on your server-side

##### Generating `user_hash`

The `user_hash` must be a server-side generated [HMAC (hash based message authentication code)](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code),
using **SHA256**, with the current user's `email` as the message and your `API_SECRET` as the key.

The embed requests will fail if the `user_hash` is incorrect.

## Problem embed

You can embed a problem on your platform using the problem's `slug`, which uniquely identifies a problem on
DoSelect. Add this HTML code where you want a problem to show up:

`<div class="doselect-embed" data-category="problem" data-slug="3myr6">`

## Test embed

You can embed a test on your platform using the test's `slug`, which uniquely identifies a test on
DoSelect. Add this HTML code where you want a test to show up:

`<div class="doselect-embed" data-category="test" data-slug="es6ts">`

## Actions

The `doselect` global object provides methods to take various actions on the embed objects on your
app.

### Loading embeds
Call `doselect.loadFrame()` to load all the embed objects on a page.

### Destroying an embed

To close an embed, call `doselect.closeFrame(category, slug)`. If the embed element is available in the current page, it will be destroyed.

### Fetch report

To fetch the report for an embed, call `doselect.fetchReport(category, slug)`.

# Webhooks

The webhooks framework notifies you about various events that have happened related to the resources on your team. You can add a
`webhook_url` in your team settings. Whenever a new event occurs, we will make a `POST` request to this URL with a JSON payload in body.

If you return anything other than a HTTP 200 status to the webhook POST then we’ll try to deliver the webhook up to 5 times with a backoff.

The following events are currently sent:

* Test started by a candidate
* Test submitted by a candidate