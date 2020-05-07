# Errors

The APIs return standard HTTP success or error status codes. For errors, extra information about what went wrong will also be sent in the respose,
encoded in JSON. The various HTTP codes we might return are listed below.

Code | Title | Description
---------- | ------- | -----------
200 | OK | The request was successful.
400 | Bad request | The request was malformed or in an unaccepted format.
401 | Unauthorized | Your `API_KEY` and/or `API_SECRET` is wrong or missing.
403 | Forbidden | The requested resource was not accessible to you.
404 | Not found | The specified resource was not be found.
405 | Method not allowed | You were trying to access the resource using an invalid HTTP method.
50X | Internal server error | An error occured with our APIs.

Error messages in embed. 

Code | Error Message | State
---------- | ------------- | -----------
E101 | Invalid request body. | INIT
E102 | The API Key is invalid. | INIT
E103 | The user cannot be verified.Please check the user_hash corresponding to given email. | INIT
E104 | You’re trying to open the embed with the email example@doselect.com which belongs to a team admin user account on DoSelect. | INIT
E105 | `data-slug` attribute not found for this embed. | INIT
E106 | Invalid referrer host. | INIT
E107 | Please Provide API key. | INIT
E108 | Token Invalid. | INIT
E109 | Email address invalid. | INIT
E201 | Permission denied to this resource. Please add this test to your learn feed. | Test Embed
E202 | Error creating the invite: Invalid invite email provided. | Test Embed
E203 | Error creating the invite: Atleast one problem required in test to send an invite. | Test Embed
E204 | Error creating the invite: Cannot invite candidates for an archived test. | Test Embed
E205 | Error creating the invite: Expiry can't be lesser than current time. | Test Embed
E206 | Error loading test embed: The test invite has expired. Please contact your test administrator. | Test Embed
E301 | You don't seem to have access to this Code Lab, or it's not published yet. | CodeLab Embed
E302 | Error creating the invite: Cannot create CodeLabInvite for a recruiter. | CodeLab Embed
E303 | Error creating the invite: CodeLabInvite - empty 'email' field not allowed. | CodeLab Embed
E304 | Error creating the invite: CodeLabInvite - empty 'codelab' field not allowed. | CodeLab Embed
E305 | Error creating the invite: Invite for email ex@doselect.com and codelab java_test already exists. | CodeLab Embed
E401 | Permission denied to this resource. Please add this problem to your learn feed. | Problem Embed
