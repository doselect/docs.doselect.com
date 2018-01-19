# Embed API

The Embed API allows you to embed a `Test` or a `Problem` on DoSelect on your platform. This API is designed keeping in mind that
the platform which using the embed need not store any state data on their end -- all state data is stored by DoSelect and can be retrieved using
the REST Platform APIs.

## Client library

The Embed API can be accessed using the embed client library, `doselect-embed.js`. This library provides a simple JavaScript interface
for authentication, creating embed objects on your application, and retrieving general information related to the embedded objects.

### Setup

#### Step 1: Install the `doselect-embed.js` library

To use the Embed API, simply copy and paste the snippet below before the `</body>` tag on every page where you want the embed to appear.

`<script src="https://assets.doselect.com/doselect-embed.min.js" async></script>`

#### Step 2: Configure user settings

```javascript
window.doselectSettings = {
    "api_key": "88d4266fd4e6338d13b845fcf28",
    "email": "john@example.com",
    "full_name": "John Doe",
    "timezone": "Asia/Kolkata",
    "user_hash": "CLjME03fz+Jr36VaDwv2MbNeemtfA57IgWhwcR3GfdI="
}

<script src="https://assets.doselect.com/doselect-embed.min.js" async></script>
```

To display embed problems and tests with respect to user, update `window.doselectSettings` object with user metadata and place it above the embed code snippet.

The following details are needed for configuration:

Parameter | Description
----------|------------
api_key | Your team account's `API_KEY`
email | Email of the current user in your application for which you want the embed objects
full_name | Full name of the current user
timezone | Timezone of the current user
user_hash | The verification hash for this user, which must be generated on your server-side

##### Generating `user_hash`

The `user_hash` must be a server-side generated [HMAC (hash based message authentication code)](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code),
using **SHA256**, with the current user's `email` as the message and your `API_SECRET` as the key.

The embed requests will fail if the `user_hash` is incorrect.

## Problem embed

You can embed a problem on your platform using the problem's `slug`, which uniquely identifies a problem on
DoSelect. Add this HTML code where you want a problem to show up:

```html
<div class="doselect-embed" data-category="problem" data-slug="3myr6"
     data-config='{"allow_submission": true}'></div>
```

Attribute | Description
----------|------------
data-category | Required. Defines the kind of embed. Should be either `test` or `problem`
data-slug | Required. Identification slug of the object being embedded
data-config | Optional. Specify optional config parameters for this embed. This value must be a valid JSON string.

The following attributes are supported in the configuration object at the moment.

Attribute | Type | Description
----------|------| ------
allow_submission | boolean | Dynamically control if the submissions are allowed for a problem at the moment. This is only available in a problem embed.
show_solution_revisions | boolean | Control if solution revisions should be visible.


## Test embed

You can embed a test on your platform using the test's `slug`, which uniquely identifies a test on
DoSelect. Add this HTML code where you want a test to show up:

```html
<div class="doselect-embed" data-category="test" data-slug="es6ts"></div>
```

*Please note that the test embed is in an alpha release at the moment, and the API is subject to change without notice.*

## Actions

The `doselect` global object provides methods to take various actions on the embed objects on your
app.

### Loading embeds
Call `doselect.loadFrame()` to load all the embed objects on a page.

### Destroying an embed

To close an embed, call `doselect.closeFrame(category, slug)`. If the embed element is available in the current page, it will be destroyed.

### Fetch report

To fetch the report for an embed, call `doselect.fetchReport(category, slug)`.
