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
    "problem_type": "SCR",
    "email": "john@example.com",
    "learn_feed_item_id": 5
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
    "problem_type": "SCR",
    "code": "print '\''Hello World'\''",
    "email": "john@example.com",
    "problem_slug": "esows",
    "code_url": "https://s3.amazon.com/zygon.zip",
    "learn_feed_item_id": 5
}'
```

> Response

```json
{
    "status": "UNE",
    "resubmissions": 0,
    "learn_feed_item_id": 5,
    "created": "2018-04-11T05:26:53.233Z",
    "total_score": "0.0",
    "run_details": {},
    "modified": "2018-04-11T05:26:53.740Z",
    "problem_slug": "esows",
    "email": "john@example.com",
    "code": "print 'Hello World'",
    "analysis_details": {},
    "submitted_at": "2018-04-11T05:26:53.464Z",
    "slug": "rd3g0l",
    "solution_type": "SCR",
    "max_score": 150
}
```
This endpoint accepts a new submission for a specific problem, identified by a `slug` submitted by a user who is identified by the `email`.


### HTTP Request

`POST https://api.doselect.com/platform/v1/submission/`


### Payload Params
Parameter          | Description
----------         | ---------------
technology         | The `slug` which identifies the technology used for this submission
problem_type       | The code for type of the problem
code               | If the submission is a coding-type problem, the code of the submission
code_url           | If the submission is a project-type problem, the publicly accessible url of the ZIP of the project
problem_slug       | The `slug` which identifies the problem
email              | Email of the user
learn_feed_item_id | Optional. The ID of the learn feed item related to the problem.
choice             | Required for MCQ. Submitted option in a list
solution_type	   | Required for MCQ with default value "MCQ"

The allowed problem types are:

Problem type      | Slug
------------      | ----
Database          | DBA
Project-based     | PRJ
Front-end project | UIX
Coding            | SCR
Multiple-choice   | MCQ


The allowed technologies for each problem type are:

Problem type      | Slug reference
------------      | ----------------------
Database          | mysql (MySQL)
Project-based     | java7 (Java 7), python3 (Python 3), python2 (Python 2), java8 (Java 8)
Front-end project | angularjs (AngularJS), jquery (jQuery), reactjs (React), backbonejs (Backbone), vanillajs (Vanilla JS)
Coding            | julia (Julia), haskell (Haskell), csharp (C#), go (Go), javascript (JavaScript (NodeJS)), scala (Scala), swift (Swift), perl (Perl), lua (Lua), clisp (Clisp), objectivec (ObjectiveC), php (PHP), ruby (Ruby), bash (Bash), clojure (Clojure), rust (Rust), c (C), cpp (C++), java7 (Java 7), python3 (Python 3), python2 (Python 2), java8 (Java 8), r (R), fsharp (F#), cpp14 (C++14), kotlin (Kotlin)





<aside class="notice">
If it is a project based or a frontend submission, there will be a
`code_repo_uri` field in the response which will enable you to download the
code which was uploaded by the user.
</aside>

## Get one submission

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/submission/mmoe0'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/submission/mmoe0" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "analysis_details": {
        "quality": {
            "analysis_ended": "2017-03-27T07:10:03Z",
            "analysis_started": "2017-03-27T07:09:58Z",
            "issues": [{
                "check_name": "global-require",
                "remediation_points": 50000,
                "description": "Unexpected require().",
                "type": "issue",
                "location": {
                    "path": "source.js",
                    "lines": {
                        "begin": 4,
                        "end": 4
                    }
                },
                "categories": ["Clarity"]
            }, {
                "check_name": "no-process-exit",
                "remediation_points": 50000,
                "description": "Don't use process.exit(); throw an error instead.",
                "type": "issue",
                "location": {
                    "path": "source.js",
                    "lines": {
                        "begin": 19,
                        "end": 19
                    }
                },
                "categories": ["Bug Risk"]
            }],
            "score": "4.5",
            "sid": "ee2cfee4-94f2-4917-88cd-288ce9cc61f7",
            "status": "AC"
        }
    },
    "attachments": [],
    "code": "var a;\nvar fs=require(\"fs\");\nprocess.exit(1)",
    "created": "2017-09-25T08:14:41.304029",
    "creator": {
        "email": "john@example.com",
        "first_name": "John",
        "last_name": "Doe",
        "username": "johndoe"
    },
    "evaluated_at": null,
    "is_accepted": false,
    "modified": "2017-09-25T08:14:41.362048",
    "problem_slug": "7f3p0",
    "resource_uri": "/platform/v1/problem/7f3p0/submission/john@example.com",
    "resubmissions": 0,
    "run_details": {},
    "slug": "mmoe0",
    "solution_type": "SCR",
    "status": "NRE",
    "submitted_at": "2017-09-25T08:14:41.342872",
    "technology": "javascript",
    "total_score": "0.0",
    "max_score": 150

}
```
This endpoint retrieves a specific submission from the unique `slug` which is generated during creation:

### HTTP Request

`GET https://api.doselect.com/platform/v1/submission/<slug>`

The submission object returned contains a number of attributes. A few of them with their possible values and explanations are
are described below:

#### `status`

Value | Full-form | Explanation
------|-----------|------------
`UNE` | Unevaluated | The submission has not been evaluated yet. This happens when it hasn't been submitted yet, or the evaluation is queued.
`ACC` | Accepted | The submission has passed all test cases in the problem.
`PAC` | Partially correct | The submission has passed some test cases, while failed the others.
`REJ` | Rejected | The submission failed to pass any test cases in the problem.
`NRE` | Needs review | If the problem must have at least one non-sample test case for the submission to get automatically evaluated. Otherwise, this status is set, which means the solution must be evaluated manually.


<aside class="notice">
If it is a project based or a frontend submission, there will be a
`code_repo_uri` field in the response which will enable you to download the
code which was uploaded by the user.
</aside>


## Download code zip

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/submission/mmoe0/code-repo'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)

with open("code-repo.zip", "w+") as f:
    f.write(response.content)
```

```shell
curl "https://api.doselect.com/platform/v1/submission/mmoe0/code-repo" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
  > code-repo.zip
```

> Response

```
A zip file
```

This endpoint retrieves the zip file of the code submitted identified by the
unique `slug` which is generated during creation.

### HTTP Request

`GET https://api.doselect.com/platform/v1/submission/<slug>/code-repo`


Currently, this API will only support the downloading of code for `PRJ` and
`UIX` submissions.


## Submit an existing submission

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/submission/28g9a/submit/"

headers = {
    'DoSelect-Api-Key': "88d4266fd4e6338d13b845fcf28",
    'DoSelect-Api-Secret': "385041b7bbc2320471b8551d",
    'Content-Type': "application/json"
    }

response = requests.request("POST", url, headers=headers)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/submission/28g9a/submit \
  -H 'Content-Type: application/json' \
  -H 'DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28' \
  -H 'DoSelect-Api-Secret: 385041b7bbc2320471b8551d'
```

> Response

```
{
    "status": "SUCCESS",
    "message": "A new submission has been triggered for this solution."
}
```
This endpoint submits an existing submission for a specific problem, identified by the submission's `slug`.
