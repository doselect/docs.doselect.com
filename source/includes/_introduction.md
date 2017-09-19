# Introduction

Welcome to the DoSelect API documentation! These APIs provide you access to various resources and functionalities of the DoSelect platform.

The Platform APIs are organized around REST, and can be accessed at `api.doselect.com`.
All request and response bodies, including errors, are encoded in JSON. These APIs include resources like [Tests](#test-api),
[Problems](#problem-api), [Submissions](#submission-api) and [Users](#user-api).

The [Embed API](#embed-api) gives you a simple JavaScript interface to embed resources like tests and problems on your front-end application directly -- without
you having to store any kind of state data.

Using these APIs, you can leverage the DoSelect platform to augment your application, or build useful tools and integrations to
enhance your workflows.

<aside class="notice">
The API Platform is in limited release at the moment.
You must have developer options enabled for your DoSelect team in order to be able to use these APIs.
Please contact your account manager or write to <a href="mailto:support@doselect.com">support@doselect.com</a> for help.
</aside>

<aside class="notice">
The dev sandbox for the APIs can be accessed at <code>api.dev.doselect.in</code>. Please note that all requests should be made over HTTPS.
</aside>