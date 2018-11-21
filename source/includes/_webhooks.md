# Webhooks

The webhooks framework notifies you about various actions that have happened related to the resources on your team. You can add a
`webhook_url` in your team settings. Whenever a new event occurs, we will make a `POST` request to this URL with a JSON payload in body.

If you return anything other than an HTTP 2XX status to the webhook POST then we’ll try to deliver the webhook up to 5 times with a backoff.

**Tip:** You can use a service like [RequestBin](https://requestb.in/) to test webhook delivery.


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

## Webhook Security

In using a webhook, there is a possibility that an attacker might be able to forge webhook notifications which
might result in unwanted actions being taken.

To prevent that, in each webhook delivery from DoSelect, the `POST` request will contain a `DoSelect-Webhook-Signature` header.

For verification, on your server side, you need to generate a [HMAC (hash based message authentication code)](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code),
using **SHA256**, with the current request's `delivery_id` as the message and your `API_SECRET` as the key.

The calculated and the request hashes should match, indicating that the message is authentic and was indeed sent by DoSelect.


## Solution

The actions sent by solution are listed below.
These actions are only sent for solutions whose problems have been added to your account's learnfeed.

Sender     | Action    | Description
------     | --------- | --------
submission | create    | Solution is created (saved for the first time)
submission | submit    | Solution is submitted by the user
submission | evaluated | Solution is evaluated and the scores are ready.

The Solution webhooks will have the following fields:

Field Name             | Type       | Description
----------             | ---------  | -----------
submission_slug        | string     | The identifier for that submission
submission_uri         | string     | The URI for a particular submission
problem_slug           | string     | The identifier for the problem
problem_uri            | string     | The URI of the problem
email                  | string     | The email of the user
code                   | string     | The latest submitted code of the user
code_repo_uri          | string     | URI pointing to the latest saved UIX-PRJ code

<aside class="notice">
The `code_repo_uri` will be sent only for `UIX` and `PRJ` submissions.
</aside>

> Example payload

```json
{
    "meta":{
        "sender": "submission",
        "action": "submit",
        "timestamp": "2017-10-07T10:41:31.846531+00:00",
        "delivery_id": "441cd01e-d82d-485c-95d8-c8c498417649"
    },
    "object":{
        "submission_slug": "7yt6ss",
        "submission_uri": "https://api.doselect.com/platform/v1/submission/7yt6ss",
        "problem_uri": "https://api.doselect.com/platform/v1/problem/rra3l",
        "problem_slug":"rra3l",
        "email": "mibukuyij@storj99.com",
        "code": "print 'Hello world test.' "
    }
}
```


## Test Session

The actions sent by a test session are listed below.
These actions are sent for all tests associated with your account on DoSelect.

Sender       | Action | Description
------------ |------- | --------
test-session | begin  | The candidate has started taking the test
test-session | end    | The candidate has submitted the test, or the test was auto-submitted
test-session | report | The candidate's test report has been generated


The test webhooks will have the following fields:

Field Name | Type   | Description
---------- | ------ | -----------
report_uri | string | The URI of the test report
test_uri   | string | The URI of the test
test_slug  | string | The identifier for the test
email      | string | The email of the user taking the test


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

## Problem

The actions sent by a problem are listed below.
These actions are sent for all private problems on DoSelect.

Sender  | Action | Description
------- | ------ | --------
problem | create | A new problem has been created
problem | edit   | The problem has been edited

The Problem webhooks will have the following fields:

Field Name    | Type   | Description
------------- | ------ | -----------
problem_uri   | string | The URI of the problem
problem_slug  | string | The identifier for the problem
creator_email | string | The email of the user who made the problem

> Example payload

```json
{
	"meta": {
		"action": "create",
		"timestamp": "2017-10-30T07:08:18.457736+00:00",
		"delivery_id": "faa8f070-9644-4112-8a4b-40865afdd5bf",
		"sender": "problem"
	},
	"object": {
		"creator_email": "",
		"problem_slug": "o94yw",
		"problem_uri": "http://api.doselect.com/platform/v1/problem/o94yw"
	}
}
```
