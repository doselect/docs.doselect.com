# Webhooks

The webhooks framework notifies you about various actions that have happened related to the resources on your team. You can add a
`webhook_url` in your team settings. Whenever a new event occurs, we will make a `POST` request to this URL with a JSON payload in body.

If you return anything other than an HTTP 2XX status to the webhook POST then we’ll try to deliver the webhook up to 5 times with a backoff.

## Payload

For each webhook delivery on a URL, the `POST` request contains a JSON payload in the body with information about the action.

The `meta` object contains metadata about the current webhook delivery, like the `sender`, `action`, `timestamp` and `delivery_id`.

The `object` attribute contains a contextual object.


> Payload body

```json
{
    "meta": {
        "sender": "test-session",
        "action": "end",
        "timestamp": "2017-10-07T10:41:31.846531+00:00",
        "delivery_id": "441cd01e-d82d-485c-95d8-c8c498417649"
    },
    "object": {  
        "report_uri": "https://api.doselect.com/platform/v1/test/k716y/candidates/mibukuyij@storj99.com/report",
        "test_uri": "https://api.doselect.com/platform/v1/test/k716y",
        "email": "mibukuyij@storj99.com",
        "test_slug": "k016y"
    }
}
```

## Solution

The following actions are sent by solution are listed below. These actions are only sent for solutions created via Embed API.

Sender | Action  | Description
------ |-------- | -------- 
solution | create | Solution is created (saved for the first time)
solution | submit | Solution is submitted by the user

> Example payload

```json
{
    "meta":{
        "sender": u"solution",
        "action": u"submit",
        "timestamp": u"2017-10-07T10:41:31.846531+00:00",
        "delivery_id": u"441cd01e-d82d-485c-95d8-c8c498417649"
    },
    "object":{  
        "submission_slug": u"7yt6ss",
        "submission_uri": u"https://api.doselect.com/platform/v1/submission/7yt6ss",
        "problem_uri": u"https://api.doselect.com/platform/v1/problem/rra3l",
        "problem_slug":u"rra3l",
        "email": u"mibukuyij@storj99.com"
    }
}
```


## Test Session

The following actions are sent by a test session are listed below. These actions are sent for all tests on DoSelect.

Sender | Action  | Description
------ |-------- | -------- 
test-session | begin | The candidate has started taking the test
test-session | end | The candidate has submitted the test, or the test was auto-submitted

> Example payload

```json
{
    "meta": {
        "sender": "test-session",
        "action": "end",
        "timestamp": "2017-10-07T10:41:31.846531+00:00",
        "delivery_id": "441cd01e-d82d-485c-95d8-c8c498417649"
    },
    "object": {  
        "report_uri": "https://api.doselect.com/platform/v1/test/k716y/candidates/mibukuyij@storj99.com/report",
        "test_uri": "https://api.doselect.com/platform/v1/test/k716y",
        "email": "mibukuyij@storj99.com",
        "test_slug": "k016y"
    }
}
```