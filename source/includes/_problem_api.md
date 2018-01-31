# Problem API

The Problem API allows you to retrieve one problem on DoSelect. You can also retrieve all submissions made to the problem
within your team, as well as by a particular user identified by email.

## Get all problems

You can get all problems in your team account using the list endpoint:

### HTTP Request

`GET https://api.doselect.com/platform/v1/problem`

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/problem"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "archived": false,
            "name": "Create a decorator",
            "level": "MED",
            "created": "2017-07-21T16:10:53",
            "is_active": true,
            "penalty": 0,
            "score": 100,
            "resource_uri": "/platform/v1/problem/rra3l",
            "problem_type": "SCR",
            "slug": "rra3l",
            "tags": [
                "decorators",
                "file handling",
                "Python"
            ],
            "description": "Implement a Python decorator that should take whatever the decorated function returns, and writes it to a file in a new line.For the sake of this problem, let us assume that the decorated functions always return a string. Constraints:The decorator should ..."
        }
    ],
    "meta": {
        "total_count": 1,
        "next": null,
        "offset": 0,
        "limit": 10,
        "previous": null
    }
}
```

### Search for problems

The list endpoint enables you to search for problems as well, the constraints of which can be controlled via GET parameters listed below.
The query can contain any combination of these parameters.

Parameter name | Possible values  | Description
---------------|------------------|-------------
q              | Any string       | Generic query parameter that does a full text search
is_active      | true, false      | Filter only active problems that are usable
tags           | Comma separated tags | Searches on discovery tags of problems
problem_type   | Allowed problem type codes | Filter on problem types
archived       | true, false | Filter on archived status

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


## Create a Problem

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d",
    "Content-Type": "application/json"
}
payload = {
	"name": "Doselect API Problem",
	"problem_type": "PRJ",
	"time_limit_secs": 100,
	"tags": [
		"Regex"
	],
	"insight_tags": [
		"Python2"
	],
	"description": "This is not the problem you are looking for",
	"max_submissions": 5,
	"score": 75,
	"penalty": 1,
	"stubs": {
	    "python2": "print 'hello world'",
        "java7": "System.out.println('hello world')",
        "java": "System.out.println('hello world')"
	},
	"sample_solutions": {
        "python2": "def add(a,b): return a + b"
    },
    "technologies": [
        "python2",
        "java7",
        "lua"
    ]
}
response = requests.post(url, headers=headers, data=payload)
```

```shell
curl -X POST "https://api.doselect.com/platform/v1/problem/"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d" \
  -d '{
	"name": "Doselect API Problem",
	"problem_type": "PRJ",
	"time_limit_secs": 100,
	"tags": [
		"Regex"
	],
	"insight_tags": [
		"Python2"
	],
	"description": "This is not the problem you are looking for",
	"max_submissions": 5,
	"score": 75,
	"penalty": 1,
	"stubs": {
	    "python2": "print 'hello world'",
        "java7": "System.out.println('hello world')",
        "java": "System.out.println('hello world')"
	},
	"sample_solutions": {
        "python2": "def add(a,b): return a + b"
    },
    "technologies": [
        "python2",
        "java7",
        "lua"
    ]
}'
```

> Response

```json
{
    "attachments": [],
    "created": "2017-10-25T10:13:09.561690",
    "description": "This is not the problem you are looking for",
    "eval_mode": "ATF",
    "insight_tags": [
        "Python2"
    ],
    "is_active": true,
    "level": "EAS",
    "max_submissions": 5,
    "modified": "2017-10-25T10:13:09.568721",
    "name": "Doselect API Problem",
    "penalty": 1,
    "problem_type": "SCR",
    "resource_uri": "/platform/v1/problem/nq4yq",
    "sample_solutions": "{}",
    "score": 75,
    "slug": "nq4yq",
    "tags": [
        "Regex"
    ],
    "technologies": [
        "python2",
        "java7",
        "lua"
    ],
    "testcases": [],
    "time_limit_secs": "42",
    "stubs": {
	    "python2": "print 'hello world'",
        "java7": "System.out.println('hello world')",
        "java": "System.out.println('hello world')"
	}
}
```
This API partially creates problem, which can then be edited on the DoSelect platform.

The fields accepted in the body of this request are:

Field Name          | Type       | Description
----------          | ---------  | -----------
name                | string     | The name of the problem
problem_type        | string     | The type of the problem (`PRJ`, `UIX`, `SCR`, `MOB`, `MCQ`, `DSC` or `MLI`)
description         | string     | The description of the problem
max_submissions     | integer    | The maximum number of submissions allowed
score               | integer    | The score of the problem
mcq_options         | array      | A list of possible mcq options
mcq_options_correct | string     | The correct mcq option
penalty             | integer    | The penalty for the problem
time_limit_secs     | integer    | The time limit for this problem in seconds (Between 0-99)
eval_mode           | string     | Evaluation mode for this problem (`TXT` IO Based or `ATF` Script Based)
tags                | array      | A list of strings of discovery tags
insight_tags        | array      | A list of strings of insight tags
stubs               | dictionary | A dictionary containing the stubs of the problem
sample_solutions    | dictionary | A dictionary containing the sample solutions of the problem
technologies        | array      | A list of strings containing the slugs of allowed technologies

<aside class="notice">
The fields `name` and `problem_type` are compulsory for the problem creation.
If any field other than the ones mentioned above is sent then the API will throw a 400 Bad Request
</aside>

The possible problem types are:

Abbreviation | Description
------------ | -----------
PRJ | Project based problem
UIX | UI/UX problem
SCR | Coding problem
MOB | Mobile problem
MCQ | Multiple choice question
DSC | Data science problem
MLI | Machine learning problem


The `stubs` dictionary should have the technology slug as the key and the stub string as the value.

The `sample_solutions` dictionary should have the technology slug as the key and the solution string as the value.


The possible values of technology slugs are:

Technology Slug | Technology
--------------- | ---------------
julia | Julia
haskell | Haskell
csharp | C#
go | Go
javascript | JavaScript (NodeJS)
scala | Scala
swift | Swift
perl | Perl
lua | Lua
clisp | Clisp
objectivec | ObjectiveC
php | PHP
ruby | Ruby
bash | Bash
clojure | Clojure
rust | Rust
c | C
cpp | C++
java7 | Java 7
python3 | Python 3
python2 | Python 2
java8 | Java 8
r | R
fsharp | F#
cpp14 | C++14
kotlin | Kotlin


## Clone a problem

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/481bo/clone'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d",
    "Content-Type": "application/json"
}

response = requests.post(url, headers=headers)
```

```shell
curl -X POST "https://api.doselect.com/platform/v1/problem/481bo/clone"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "attachments": [],
    "created": "2017-11-24T09:11:12.103398",
    "description": "<div><!--block-->Jim is very health conscious. Determine whether he is.</div>",
    "eval_mode": "TXT",
    "insight_tags": [],
    "is_active": true,
    "is_locked": false,
    "level": "MED",
    "max_submissions": 0,
    "modified": "2017-11-24T09:11:12.230166",
    "name": "Nutrition calculator",
    "penalty": 0,
    "problem_type": "SCR",
    "resource_uri": "/platform/v1/problem/q3w8q",
    "sample_solutions": {},
    "score": 100,
    "slug": "q3w8q",
    "stubs": {},
    "tags": [
        "CPP"
    ],
    "technologies": [],
    "testcases": [
        {
            "id": 20873,
            "input": "duck egg\n",
            "is_sample": false,
            "name": "Testcase #1",
            "output": "12.81g\n",
            "weight": 1
        }
    ],
    "time_limit_secs": null
}
```
This API clones a problem identified by the `slug`. The response will contain the data of the new problem.


## Update a problem

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/problem/q3w8q/'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d",
    "Content-Type": "application/json"
}

payload = {
  "name": "Updated Problem Name",
  "tags": [
    "Java"
  ],
  "description": "A new description of the problem"
}


response = requests.patch(url, data=payload, headers=headers)
```

```shell
curl -X PATCH "https://api.doselect.com/platform/v1/problem/q3w8q"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d" \
  -d '{
  "name": "Updated Problem Name",
  "tags": [
    "Java"
  ],
  "description": "A new description of the problem"
}'
```

> Response

```json
{
    "attachments": [],
    "created": "2017-11-24T09:11:12.103398",
    "description": "A new description of the problem",
    "eval_mode": "TXT",
    "insight_tags": [],
    "is_active": true,
    "is_locked": false,
    "level": "MED",
    "max_submissions": 0,
    "modified": "2017-11-24T09:36:19.239739",
    "name": "Updated Problem Name",
    "penalty": 0,
    "problem_type": "SCR",
    "resource_uri": "/platform/v1/problem/q3w8q",
    "sample_solutions": {},
    "score": 100,
    "slug": "q3w8q",
    "stubs": {},
    "tags": [
        "Java"
    ],
    "technologies": [],
    "testcases": [
        {
            "id": 20873,
            "input": "duck egg\n",
            "is_sample": false,
            "name": "Testcase #1",
            "output": "12.81g\n",
            "weight": 1
        }
    ],
    "time_limit_secs": null
}
```
This API updates a problem identified by it's `slug`.
The allowed update fields are:

Field Name          | Type       | Description
----------          | ---------  | -----------
name                | string     | The name of the problem
description         | string     | The description of the problem
tags                | array      | A list of strings of discovery tags