# Code Lab API

The Code Lab API allows you to retrieve Code Labs that have been created from your
Learn account. This is a read-only API.

## Get all code labs

You can get all code labs created in your Learn team account using the list endpoint:

### HTTP request

`GET https://api.doselect.com/platform/v1/codelab`

```python
import requests

url = 'https://api.doselect.com/platform/v1/codelab'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/codelab"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "archived": false,
            "created": "2018-06-14T10:14:51.225572",
            "expiry_period": 30,
            "name": "Django Lab",
            "resource_uri": "/platform/v1/codelab/ykb92",
            "slug": "ykb92",
            "status": "PUB",
            "tasks": [],
            "workspace_specs": {
                "cpu_intensive": false,
                "memory": "1024"
            },
            "workspace_template_config": "build_steps:\n- command: cmd1 to run\n  name: cmd1 name\ncommands:\n  build: some build command\n  test: some test command\n",
            "workspace_template_status": "PUB"
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


## Get one code lab

You can use the detail end point with the code lab's slug.

### HTTP Request

`GET https://api.doselect.com/platform/v1/codelab/<code_lab_slug>`

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/codelab/ykb92'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/codelab/ykb92"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "archived": false,
    "created": "2018-06-14T10:14:51.225572",
    "expiry_period": 30,
    "name": "Django Lab",
    "resource_uri": "/platform/v1/codelab/ykb92",
    "slug": "ykb92",
    "status": "PUB",
    "tasks": [],
    "workspace_specs": {
        "cpu_intensive": false,
        "memory": "1024"
    },
    "workspace_template_config": "build_steps:\n- command: cmd1 to run\n  name: cmd1 name\ncommands:\n  build: some build command\n  test: some test command\n",
    "workspace_template_status": "PUB"
}
```

## Get all invites

You can use the participants endpoint to retrieve all the invites created in a code lab.

### HTTP Request

`GET https://api.doselect.com/platform/v1/codelab/<slug>/participants`

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/codelab/e2mlk/participants'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://api.doselect.com/platform/v1/codelab/e2mlk/participants"
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response

```json
{
    "objects": [
        {
            "codelab": "/platform/v1/codelab/e2mlk",
            "created": "2018-06-19T10:29:03.655146",
            "email": "dymmuser@example.com",
            "expiry": null,
            "id": 1,
            "is_accepted": false,
            "participant_access_url": "https://doselect.com/gateways/codelab/?access_code=EtjakDPoTOteT7KSINLrOXTKJ6KQPzMN6B%2FD1ou0ibq2IxcsMRNMyAQxaUN4Bml3",
            "resource_uri": "/platform/v1/codelabinvite/1",
            "status": null
        }
    ],
    "meta": {
        "limit": 10,
        "next": null,
        "offset": 0,
        "previous": null,
        "total_count": 1
    },
}
```

## Create a new Code Lab invite

New invites can be created by POSTing data to the participants endpoint. Please note that bulk
invites are not allowed at the moment.

### HTTP Request

`POST https://api.doselect.com/platform/v1/codelab/<slug>/participants`

> Request

```python
import requests

url = 'https://api.doselect.com/platform/v1/codelab/e2mlk/participants'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}

payload = {
    "email": "john@example.com"
}

response = requests.post(url, headers=headers, json=payload)
```

```shell
curl -X POST \
  https://api.doselect.com/platform/v1/codelab/e2mlk/participants/ \
  -H 'content-type: application/json' \
  -H 'doselect-api-key: 88d4266fd4e6338d13b845fcf28' \
  -H 'doselect-api-secret: 385041b7bbc2320471b8551d' \
  -d '{
    "email": "john@example.com"
}'
```

> Response

```json
{
    "codelab": "/platform/v1/codelab/e2mlk",
    "created": "2018-07-16T12:35:37.444250",
    "email": "john@example.com",
    "expiry": null,
    "id": 12,
    "is_accepted": false,
    "participant_access_url": "https://doselect.com/gateways/codelab/?access_code=nbysIEgzjEnRATE%2Fdcs3ZDLKZeoy3A3rO1tswlR7z7wxgNuwtPkSM62EvIdUj1QVTv3UsxebSq8rXFGM7N7OF%2FzWfjLsnAunSUpmh35h0BI%253D",
    "resource_uri": "/platform/v1/codelabinvite/12",
    "status": null
}
```
