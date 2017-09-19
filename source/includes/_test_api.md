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