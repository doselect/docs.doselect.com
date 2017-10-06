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

`GET https://api.doselect.com/platform/v1/problem/<slug>/submission`


## Get submission by a user

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/esows/solution/john@example.com/'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/problem/esows/solution/john@example.com/"
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
