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
