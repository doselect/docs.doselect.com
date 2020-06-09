# PDF report API

The PDF report API lets you send request to generate candidate's PDF report and get the same as a http response. 

## Generate candidate's PDF report

### HTTP Request

`GET https://doselect.com/reports/test?access_code=<access_code>&generate_pdf=True`


```shell
curl "GET https://doselect.com/reports/test?access_code=<access_code>generate_pdf=True"
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

```

Generate candidate's PDF report api needs to call with query string "access_code AND generate_pdf". Where the value of access_code is an unique identifier of a candidate's test session and the value of generate_pdf should pass as True (Case sensitive). This endpoint initiate a request to generate candidate's PDF report for particular assessment/assignment:

## Get a candidate's PDF report

`GET https://doselect.com/reports/test?access_code=<access_code>&format=pdf`


```shell
curl "https://doselect.com/reports/test?access_code=<access_code>&format=pdf"
```

> Response 

```json

Http response 200 with report as an attachment "If request accepted"

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
 