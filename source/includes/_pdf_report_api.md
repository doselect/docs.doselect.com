# PDF report API

The PDF report API lets you send request to generate candidate's PDF report and get the same as a http response. 

## Generate candidate's PDF report

### HTTP Request

`GET https://doselect.com/reports/test?access_code=<access_code>&generate_pdf=True`



```python
import requests

url = 'https://doselect.com/reports/test?access_code=MLAl5bGMyUjPlsE2etUQZ5xlF/COjZUEhLHvNPd99x%2Bc38xWxxyA%2B62W4TQAf8VqG6WvwzMtJRswQzA9evgAqqlA/hA3KOWmFnENlefQuEA%3D&generate_pdf=True'
headers = {
    "DoSelect-Api-Key": "88d4266fd4e6338d13b845fcf28",
    "DoSelect-Api-Secret": "385041b7bbc2320471b8551d"
}
response = requests.get(url, headers=headers)
```

```shell
curl "https://doselect.com/reports/test?access_code=MLAl5bGMyUjPlsE2etUQZ5xlF/COjZUEhLHvNPd99x%2Bc38xWxxyA%2B62W4TQAf8VqG6WvwzMtJRswQzA9evgAqqlA/hA3KOWmFnENlefQuEA%3D&generate_pdf=True" \
  -H "DoSelect-Api-Key: 88d4266fd4e6338d13b845fcf28" \
  -H "DoSelect-Api-Secret: 385041b7bbc2320471b8551d"
```

> Response 

```json

JsonResponse with status 200 "If request accepted"
{
  "status":"SUCCESS",
  "description":"PDF report generation in process."
}

JsonResponse with status 400 "If candidate is in currently taking status"
{
  "status":"ERROR",
  "description":"Cannot generate the report. The user is currently taking the test."
}

JsonResponse with status 400 "If report doesn't exists for candidate"
{
  "status":"ERROR",
  "description":"Cannot generate the report. The user hasn't attempted the test."
}

JsonResponse with status 400 "If access code doesn't exists"
{
  "status":"ERROR",
  "description":"No existing test session with provided access key"
}

HttpResponseUnauthorized (message: "Invalid auth key.", status: 401) "If incorrect DoSelect auth credentials provided"


```

Generate candidate's PDF report api needs to call with query string "access_code AND generate_pdf". Where the value of access_code is an unique identifier of a candidate's test session and the value of generate_pdf should pass as True (Case sensitive). This endpoint initiate a request to generate candidate's PDF report for particular assessment/assignment:

NOTE: Add DoSelect-Api-Key, DoSelect-Api-Secret in request headers for authentication.

## Get a candidate's PDF report

`GET https://doselect.com/reports/test?access_code=<access_code>&format=pdf`


```python
import requests

url = 'https://doselect.com/reports/test?access_code=MLAl5bGMyUjPlsE2etUQZ5xlF/COjZUEhLHvNPd99x%2Bc38xWxxyA%2B62W4TQAf8VqG6WvwzMtJRswQzA9evgAqqlA/hA3KOWmFnENlefQuEA%3D&format=pdf'
response = requests.get(url)

```

```shell

curl "https://doselect.com/reports/test?access_code=MLAl5bGMyUjPlsE2etUQZ5xlF/COjZUEhLHvNPd99x%2Bc38xWxxyA%2B62W4TQAf8VqG6WvwzMtJRswQzA9evgAqqlA/hA3KOWmFnENlefQuEA%3D&format=pdf"

```

> Response 

```json

Http Response 200 with pdf report as an attachment "If request accepted and if pdf exists"
Http Response 200 with html report "If request accepted and pdf doesn't exists"

JsonResponse with status 400 "If candidate is in currently taking status"
{
  "status":"ERROR",
  "description":"Cannot get the report. The user is currently taking the test."
}

JsonResponse with status 400 "If report doesn't exists for candidate"
{
  "status":"ERROR",
  "description":"Cannot get the report. The user hasn't attempted the test."
}

JsonResponse with status 400 "If access code doesn't exists"
{
  "status":"ERROR",
  "description":"No existing test session with provided access key"
}

```

Get a candidate's PDF report api needs to call with query string "access_code AND format". Where the value of access_code is an unique identifier of a candidate's test session and the value of format should pass as pdf (Case sensitive). This endpoint gets PDF report of a candidate or return error if report doesn't exists for particular candidate.
 