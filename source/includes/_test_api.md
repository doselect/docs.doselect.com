# Test API

The Test API lets you retrieve tests that have been created in your team.

The test information which can be accessed from our APIs will contain the following information:

Field Name             | Type       | Description
----------             | ---------  | -----------
resource_uri           | string     | The URI for a particular test
slug                   | string     | The identifier for that test
name                   | string     | The name of the test
is_usable              | boolean    | If true, this test is active and has more than 1 problems in it
archived               | boolean    | If false, this test cannot be taken
instructions           | string     | The instructions for the test taker
duration               | integer    | The duration of the test in seconds
total_problems         | integer    | The total number of problems in the test
total_sections         | integer    | The total number of sections in the test
cutoff                 | integer    | The cutoff marks for a test
level                  | string     | The level of this test
public_access_url      | string     | This will be the publically accessible url for this test
public_access_password | string     | This will be the password if any, for accessing the test on the `public_access_url`
start_time             | string     | This will contain the start time of the test in a date time string
end_time               | string     | This will contain the end time of the test in a date time string
redirection_url        | string     | After the test, the user will be redirected to this URL
tags                   | list       |
sections               | list       | This will contain a list of dictionaries with information about each section of the test
settings               | dictionary |
total_test_score       | integer    | The total score for a test
in_learn_feed          | boolean    | If true, this test is added to the learn feed

The aforementioned `settings` will have the following information:

Field Name             | Type  | Description
----------             | ---------  | -----------
secure_mode            | boolean    | If true, it indicates tha the test has secure mode on
webcam_proctoring      | boolean    | If true, it indicates tha the test has webcam proctoring on
custom_fields          | list       | A list of custom fields
test_administrators    | list       | A list of test administrators
invite_expiry_enabled  | boolean    | If true, indicates that the invites can expire
invite_expiry_days     | integer    | Indicates the number of days for which an invite of this test will be active

<aside class="notice">
The `total_test_score` field will return an `integer` in the following cases, else will return a `null`. 
<li> If the test has problem randomization enabled in sections and all the problems in a section have the same score. </li>
<li> If the test has sections without randomization enabled. </li>
</aside>

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
curl "https://api.doselect.com/platform/v1/test" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "archived": false,
            "cutoff": 40,
            "duration": 120,
            "end_time": null,
            "in_learn_feed": true,
            "instructions": "<ol><li><!--block-->This is an online programming test by Doselect.</li>",
            "is_usable": true,
            "level": "EAS",
            "name": "Sample Test",
            "public_access_password": null,
            "public_access_url": null,
            "resource_uri": "/platform/v1/test/esows",
            "sections": [
                {
                    "description": "",
                    "duration": 0,
                    "name": "Section 1",
                    "num_problems": 1,
                    "problems": [
                        {
                            "allowed_technologies": [],
                            "level": "MED",
                            "name": "Create a decorator",
                            "problem_type": "SCR",
                            "score": 100,
                            "slug": "rra3l"
                        }
                    ],
                    "randomization": {
                        "sampling": "1 out of 1",
                        "shuffle": false
                    },
                    "slug": "section-1"
                }
            ],
            "settings": {
                "custom_fields": [],
                "invite_expiry_days": 15,
                "invite_expiry_enabled": true,
                "secure_mode": true,
                "test_administrators": [],
                "webcam_proctoring": true
            },
            "slug": "esows",
            "start_time": null,
            "tags": [],
            "total_candidates": 1,
            "total_problems": 1,
            "total_sections": 1,
            "redirection_url": "https://www.doselect.com",
            "total_test_score": 100
        },

    ]
}
```

This endpoint retrieves all tests that exist in your team's account.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test`

### Search for tests

The list endpoint enables you to search for tests as well, the constraints of which can be controlled via GET parameters listed below.
The query can contain any combination of these parameters.

Parameter name | Possible values  | Description
---------------|------------------|-------------
in_learn_feed  | true, false      | Filter on learn feed tests
archived       | true, false      | Filter on archived status

### Filter candidates report uri

The list endpoint enables you to filter for all candidates who have given test.
The query can contain any combination of these parameters.

Parameter name | Required | Possible values                | Description
---------------|----------|--------------------------------|-------------
candidates     | Yes      | true, false                    | Allows to filter for candidates reports for given time
from           | Yes      | datetime (`%Y-%m-%d %H:%M:%S`) | Start datetime for reports to fetch (Requires `candidates` parameter to be true) 
to             | Yes      | datetime (`%Y-%m-%d %H:%M:%S`) | End datetime for reports to fetch (Requires `candidates` parameter to be true)

<aside class="notice">
Maximum difference between from and to datetime can be 86400 seconds. 
</aside>


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
curl "https://api.doselect.com/platform/v1/test/esows" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "archived": false,
    "cutoff": 40,
    "duration": 120,
    "end_time": null,
    "instructions": "<ol><li><!--block-->This is an online programming test by Doselect.</li>",
    "is_usable": true,
    "level": "EAS",
    "name": "Sample Test",
    "public_access_password": null,
    "public_access_url": null,
    "resource_uri": "/platform/v1/test/esows",
    "sections": [
        {
            "description": "",
            "duration": 0,
            "name": "Section 1",
            "num_problems": 1,
            "problems": [
                {
                    "allowed_technologies": [],
                    "level": "MED",
                    "name": "Create a decorator",
                    "problem_type": "SCR",
                    "score": 100,
                    "slug": "rra3l"
                }
            ],
            "randomization": {
                "sampling": "1 out of 1",
                "shuffle": false
            },
            "slug": "section-1"
        }
    ],
    "settings": {
        "custom_fields": [],
        "invite_expiry_days": 15,
        "invite_expiry_enabled": true,
        "secure_mode": true,
        "test_administrators": [],
        "webcam_proctoring": true
    },
    "slug": "esows",
    "start_time": null,
    "tags": [],
    "total_candidates": 1,
    "total_problems": 1,
    "total_sections": 1,
    "redirection_url": "https://www.doselect.com",
    "total_test_score": 100
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
curl "https://api.doselect.com/platform/v1/test/esows/candidates" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "email": "donnie@campushash.com",
            "expiry": "2015-06-22T08:01:50.960070",
            "report": {
                "report_uri": "/platform/v1/test/esows/candidates/donnie@campushash.com/report",
                "time_taken": null,
                "total_problems": 2,
                "total_score": null,
                "total_solutions": null
            },
            "resource_uri": "",
            "status": "accepted",
            "test": "/platform/v1/test/esows"
        },

    ]
}
```

This endpoint retrieves all candidates of a test.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/candidates`


The candidate information which can be accessed from our APIs will contain the following information:

Field Name           | Type  | Description
-------------------- | ---------  | -----------
resource_uri         | string     | The URI for a particular candidate
email                | string     | The email of the candidate
expiry               | string     | The datetime string about the expiry date of this candidate's invite
status               | string     | It indicates whether the candidate has accepted/rejected/not responded to the invite
test                 | string     | The URI of the test
candidate_access_url | string     | The public access URL of the test for the candidate
report               | dictionary | The information about the report of this candidate

The aforementioned `report` dictionary will contain the following information:

Field Name      | Type  | Description
----------      | ---------  | -----------
report_uri      | string     | The URI of the report of the candidate for this test, if it exists
time_taken      | integer    | The time taken by this candidate for the test in seconds
total_score     | float      | The total score of this candidate
total_solutions | integer    | The number of solutions submitted by the candidate
total_problems  | integer    | The number of problems in the test


## Get a candidate's report

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/4242/candidates/donnie@campushash.com/report'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/4242/candidates/donnie@campushash.com/report" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "accepted": 0,
    "attempted": 1,
    "email": "donnie@campushash.com",
    "ended_at": "2016-07-08T07:26:03.549447",
    "insights": {
        "technologies_used": [
            "julia"
        ],
        "tags": []
    },
    "test_name": "Python Development Test", 
    "is_submitted": true,
    "status": "PAS",
    "max_score": 100,
    "quality_analysis": [
        {
            "labels": "Bug Risk",
            "value": 3
        },

    ],
    "rejected": 0,
    "resource_uri": "",
    "sections": [
        {
            "name": "Section 1",
            "duration": 0,
            "slug": "bb0bf780046a4c96bc0fdef5ba219cf0",
            "problem_ids": [166800, 218600, 218519, 218612, 218510],
            "problems": [
                {
                    "insights": [
                        "Exceptions"
                    ],
                    "level": "EAS",
                    "name": "Whois Search Tool",
                    "problem_type": "SCR",
                    "score": 50,
                    "slug": "shjx7",
                    "penalty": 0,
                    "is_multi_correct": false,
                    "solution": {
                        "is_submitted": true,
                        "score": "0.0",
                        "slug": "2pda3",
                        "status": "NRE",
                        "worst_score": 0.0,
                        "best_score": 10.0,
                        "is_manual_reviewed": false,
                    },
                    "tags": [
                        "Exceptions",
                        "Python Exceptions"
                    ]
                },
            ]
        }
    ],
    "started_at": "2016-07-08T07:25:21.937355",
    "time_taken": 41,
    "total_problems": 1,
    "total_score": 0,
    "total_solutions": 1,
    "verdict": {
        "percentage": 0,
        "quality_score": null,
        "quality_verdict": "bad",
        "verdict": "Qualified",
        "rating": 0.8
    },
    "plagiarism_data": {
        "y9x31": [
            {
                "email": "iliyas@doselect.com",
                "first_name": "Iliyas",
                "last_name": "Shirol",
                "similarity_score": "93.0",
                "submitted_at": "2018-05-20T13:07:53.693251"
                }
        ]
    },
    "proctored_data": {
        "navigator": {
            "fingerprint": {
                "count": 1,
                "flagged": false
            },
            "navigation": {
                "count": 0,
                "flagged": false
            }
        },
        "webcam": {
            "flagged": false
        },
        "verdict": "NOT_SUSPICIOUS"
    },
    "public_access_url": "https://doselect.com/reports/test?access_code=23iuerdn-092JZh/jAPHLEIZu6lLT4rfdjfmePn2mf"
}
```

This endpoint retrieves the reports of one candidate in a test. A candidate is identified by the `email` in a test.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/
candidates/<email>/report`


The report which can be accessed from our APIs will contain the following information:


Field Name        | Type  | Description
----------        | ---------  | -----------
resource_uri      | string     | The URI for a particular candidate
email             | string     | The email of the candidate
total_solutions   | integer    | The number of solutions submitted by the candidate
attempted         | integer    | The number of problems attempted
rejected          | integer    | The number of problems rejected
accepted          | integer    | The number of problems accepted
total_score       | float      | The total score of this candidate
max_score         | float      | The maximum score of a candidate can get in this test
started_at        | string     | A datetime string indicating when the candidate began taking the test
ended_at          | string     | A datetime string indicating when the candidate stopped the test
time_taken        | integer    | The time taken to give this test in seconds
is_submitted      | boolean    | If true, the candidate has made the final submission
sections          | list       | A list of sections of the test
insights          | list       | A list of
quality_analysis  | list       | A list of dictionaries containing analysis details
public_access_url | string     | A publicaly accessible URL of the report
expiry            | string     | The datetime string about the expiry date of this candidate's invite
status            | string     | The status of candidate's test
test              | string     | The URI of the test
verdict           | dictionary | The verdict on this report
proctored_data    | dictionary | A dictionary containing suspicious activity data
plagiarism_data   | dictionary | A dictionary containing plagiarized problem slugs 
test_name         | string     | The name of the test taken by candidate

The aforementioned `verdict` dictionary will contain the following information:

Field Name      | Type  | Possible Values | Description
----------      | ---------  | --------------- | -----------
percentage      | float      | N.A | The percentage of marks scored by the candidate
quality_score   | string     | N.A | The average code quality score in this test
quality_verdict | string     | `good`, `ok`, `bad`| The verdict based on the code written by the candidate
verdict         | string     | `Not qualified`, `Qualified`, `Outstanding`| The verdict on the candidate

The aforementioned `proctored_data` dictionary will contain the following information:

Field Name      | Type  |  Description
----------      | ------| ------------
navigator       | dictionary | A Dictionary containing browser activity. Contains `fingerprint` and `navigation` data. 
fingerprint       | dictionary | Record for test opened in multiple browsers. `count` contains the number of browser/tab in which the test was opened by the canidate and `flagged` is a `boolean` for suspicion. 
navigation       | dictionary | Record for candidate moving out of test window. `count` contains the number of times candidate has moved out of the window while giving the test and `flagged` is a `boolean` for suspicion. 
webcam       | dictionary | Record for candidate's suspicious activity on camera. `flagged` is a `boolean` for suspicion.
verdict         | string     | The proctor verdict. Possible values: `NOT_ENABLED`, `IN_PROGRESS`, `SUSPICIOUS`, `NOT_SUSPICIOUS`

The aforementioned `plagiarism_data` dictionary will contain the following information in a list:

Field Name       | Type   | Description
----------       | ------ | -----------
email            | string | The matching candidate's email address
first_name       | string | The matching candidate's first name
last_name        | string | The matching candidate's last name
similarity_score | string | Percentage of code match
submitted_at     | string | The matching candidate's submission time

The aforementioned `status` string might contain one of the following code:

Code      | Description  
--------- | ------
CTK       | Currently Taking
CMP       | Completed
NRE       | Needs Review
PAS       | Passed
FAL       | Failed

## Get a candidate's previous attempts

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/test/4242/candidates/donnie@campushash.com/past_reports'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/test/4242/candidates/donnie@campushash.com/past_reports" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "reports": [{
        "time_taken": 1202, # in seconds
        "total_problems": 10,
        "total_score": 120,
        "total_solutions": 9,
        "report_uri": "/platform/v1/past_report/23498"
    }]
}
```

This endpoint retrieves the past reports of one candidate in a test. For example, if a candidate's test has been reset,
or the candidate retakes a test, this is visible in the endpoint.

### HTTP Request

`GET https://api.doselect.com/platform/v1/test/<slug>/
candidates/<email>/past_reports`


The report which can be accessed from our APIs will contain the following information:


Field Name        | Type  | Description
----------        | ---------  | -----------
report_uri        | string     | The URI for a particular attempt
total_solutions   | integer    | The number of solutions submitted by the candidate
total_score       | float      | The total score of this candidate
total_problems    | integer    | Total problems that had to be solved
time_taken        | float      | Total time taken by the candidate in seconds



