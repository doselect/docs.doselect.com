# Problem Testcase API

The Problem testcase API allows you to retrieve all testcases of one problem on DoSelect.
You can also create and delete the testcases of a problem.


## Get all testcases of a problem

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/problem/nq4yq/testcase"
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d",
    "Content-Type": "application/json"
}
response = requests.get(url, headers=headers)
```

```shell
curl -X GET \
  https://api.doselect.com/platform/v1/problem/nq4yq/testcase \
  -H 'content-type: application/json' \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551dg'
```

> Response

```json
"objects": [
        {
            "code": "",
            "id": 20869,
            "input": "1",
            "is_sample": false,
            "level": "EAS",
            "name": "test case API 1",
            "negative_annotation": "If this test case passes, the code does not handles null values properly",
            "output": "3",
            "penalty": 5,
            "positive_annotation": "If this test case passes, the code handles null values properly",
            "problem": "/tardis/problem/nq4yq",
            "score": 50,
            "weight": 2
        },
]
```
This API retrieves all testcases of a problem.

The fields in the response body of this request are:

Field Name          | Type       | Description
----------          | ---------  | -----------
code                | string     | The code for automatic problem evaluation
weight              | integer    | The weight of the testcase's result
negative_annotation | string     | What it means if the testcase fails
input               | string     | The input to be given
name                | string     | The name of the testcase
penalty             | integer    | The penalty if the testcase is wrong
score               | integer    | The score if the testcase passes
is_sample           | boolean    | `True` if it's a sample testcase, `False` otherwise
positive_annotation | string     | What it means if the testcase passes
output              | string     | The expected output
id                  | integer    | The identifier of this testcase
level               | string     | The level of the problem


## Create a testcase

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/problem/nq4yq/testcase"
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d",
    "Content-Type": "application/json"
}
payload = {
    "name": "test case API 3",
    "input": "",
    "output": "3",
    "technology": "python2",
    "is_sample": false,
    "weight": 2,
    "positive_annotation": "If this test case passes, the code handles null values properly",
    "negative_annotation": "If this test case passes, the code does not handles null values properly",
    "code": "",
    "score": 50,
    "penalty": 5

}
response = requests.post(url, headers=headers, data=payload)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/problem/nq4yq/testcase \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d" \
  -d '{
    "name": "test case API 3",
    "input": "",
    "output": "3",
    "is_sample": false,
    "weight": 2,
    "positive_annotation": "If this test case passes, the code handles null values properly",
    "negative_annotation": "If this test case passes, the code does not handles null values properly",
    "code": "",
    "score": 50,
    "penalty": 5

}'
```

> Response

```json
{
    "code": "",
    "id": 21784,
    "input": "",
    "is_sample": false,
    "level": "EAS",
    "name": "test case API 3",
    "negative_annotation": "If this test case passes, the code does not handles null values properly",
    "output": "3",
    "penalty": 5,
    "positive_annotation": "If this test case passes, the code handles null values properly",
    "problem": "/tardis/problem/nq4yq",
    "score": 50,
    "weight": 2
}
```
This API creates a testcase for a problem.

The fields accepted in the body of this request are:

Field Name          | Type       | Description
----------          | ---------  | -----------
code                | string     | The code for automatic problem evaluation
weight              | integer    | The weight of the testcase's result
negative_annotation | string     | What it means if the testcase fails
input               | string     | The input to be given
name                | string     | The name of the testcase
penalty             | integer    | The penalty if the testcase is wrong
score               | integer    | The score if the testcase passes
is_sample           | boolean    | `True` if it's a sample testcase, `False` otherwise
positive_annotation | string     | What it means if the testcase passes
output              | string     | The expected output


## Delete a testcase

> Request

```python
import requests

url = "https://api.doselect.com/platform/v1/problem/nq4yq/testcase/21782"
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d",
}
response = requests.delete(url, headers=headers)
```

```shell
curl -X DELETE \
  https://api.doselect.com/platform/v1/problem/nq4yq/testcase/21782 \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28=' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551d'
```

> Response

```json
204
```
This API deletes a testcase of a problem. You need to identify the testcase by its `id`.

This request will throw a `403 Forbidden` and won't delete the testcase if anyone has already submitted solutions for this problem.
