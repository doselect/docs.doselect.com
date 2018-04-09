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
window.doselect = {
    "api_key": "88d4266fd4e6338d13b845fcf28",
    "email": "john@example.com",
    "full_name": "John Doe",
    "timezone": "Asia/Kolkata",
    "user_hash": "CLjME03fz+Jr36VaDwv2MbNeemtfA57IgWhwcR3GfdI="
}

<script src="https://assets.doselect.com/doselect-embed.min.js" async></script>
```

To display embed problems and tests with respect to user, update `window.doselect` object with user metadata and place it above the embed code snippet.

The following details are needed for configuration. Please note that **all** parameters are required for the embed to work.

Parameter | Description
----------|------------
api_key | Your team account's `API_KEY`
email | Email of the current user in your application for which you want the embed objects
full_name | Full name of the current user
timezone | Timezone of the current user. This value should be a valid timezone string. You can refer to the full list of timezone strings [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).
user_hash | The verification hash for this user, which must be generated on your server-side

##### Generating `user_hash`

The `user_hash` must be a server-side generated [HMAC (hash based message authentication code)](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code),
using **SHA256**, with the current user's `email` as the message and your `API_SECRET` as the key.

The embed requests will fail if the `user_hash` is incorrect.


## Host authentication

This is an optional feature which will enable you to add whitelisted hosts which will be able to open the embed. The host is identified using the `Referer` header of the request.
The white-listed hosts can be added in your company's [integrations settings](https://doselect.com/settings/team/integrations) in the `Allowed Hosts` section.

By default, no hosts will be allowed to open the embed. You will have to add atleast one allowed host in the team settings.

The hosts can be an restricted using an exact string match as well as through the wildcards `*` for all characters and `?` for one character.

The matching will convert `https://api.doselect:8080/embed/problem/yo3kd` to `api.doselect:8080` and try to match that to the white-listed hosts.


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

Please note that the problem must be added to your Learn team's feed before it can be used in an embed.

## Test embed

You can embed a test on your platform using the test's `slug`, which uniquely identifies a test on
DoSelect. Add this HTML code where you want a test to show up:

```html
<div class="doselect-embed" data-category="test" data-slug="es6ts"></div>
```

Please note that the test must be added to your Learn team's feed before it can be used in an embed.

## Snippet runner embed

The snippet runner embed provides a context-free code execution environment that you can embed on your platform to enable your users
create arbitrary code snippets, and execute them. This component is especially useful in a learning environment where the users are being
taught programming and need a place to play around with different technologies without any set-up.

The snippet runner supports all programming languages available on DoSelect. Each code runner is tied to a user email as specified in the user settings.
All code snippets created by a user are saved on DoSelect platform and loaded whenever the snippet runner loads for the user. If you wish to group snippets
on the basis of an entity, say course, you can pass an arbitrary string as the `collection_id`.

```html
<!-- Runner with all languages allowed and no collection. -->
<div class="doselect-embed" data-category="snippet-runner"></div>
```

```html
<!-- Runner with Python 2, Python 3 and R allowed, for a collection called `data-science-lab`. -->
<div class="doselect-embed" data-category="snippet-runner"
    data-config='{"allowed_technologies": "python2,python3,r", "collection_id": "data-science-lab"}'></div>
```

In the configuration object, the following attributes are allowed:

Attribute | Type | Description
----------|------| -----------
allowed_technologies | string | Comma-separated values representing the programming languages allowed in this runner. This attribute is optional. If not provided, all programming languages on DoSelect will be allowed in the runner.
collection_id | string | An arbitrary string to classify the collection of the snippets created under using this embed. If this is empty, all snippets created by the user will be loaded in the runner.

The following programming languages are supported in the runner at the moment:

The possible values of technology slugs are:

Slug | Programming language
--------------- | ---------------
julia | Julia
haskell | Haskell
csharp | C#
go | Go
javascript | JavaScript (NodeJS)
scala | Scala
swift | Swift
perl | Perl
lua | Lua
clisp | Clisp
objectivec | ObjectiveC
php | PHP
ruby | Ruby
bash | Bash
clojure | Clojure
rust | Rust
c | C
cpp | C++
java7 | Java 7
python3 | Python 3
python2 | Python 2
java8 | Java 8
r | R
fsharp | F#
cpp14 | C++14
kotlin | Kotlin

## Actions

The `doselect` global object provides methods to take various actions on the embed objects on your
app.

### Loading embeds
Call `doselect.loadFrame()` to load all the embed objects on a page.

### Destroying an embed

To close an embed, call `doselect.closeFrame(category, slug)`. If the embed element is available in the current page, it will be destroyed.

### Fetch report

To fetch the report for an embed, call `doselect.fetchReport(category, slug)`.

## FAQ

### I've configured the `doselect` object properly, but the embed isn't loading. Why?

There can be multiple reasons for this. Here's are a few things you should check for troubleshooting.

 - Make sure the host domain where the embed is getting served at is added to the _Allowed hosts_ field in your team's
 [integration settings](https://doselect.com/settings/team/integrations).

 - Verify that 3rd-party cookies are allowed on your browser -- since the embed sets cookies on your browser to make things work. Some external
 software, like anti-virus software, automatically disallow 3rd party cookies on browsers. This will cause the embed loading to fail. [This](https://www.whatismybrowser.com/detect/are-third-party-cookies-enabled)
 handy tool will help you troubleshoot.
