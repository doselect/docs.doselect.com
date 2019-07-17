# Changelog

Date         | Description
------------ | -----------
Jul 17, 2019 | Added `author_logs` filter and `author_email` parameter in Problem API.
May 10, 2019 | Increased the platform API ratelimits.
Apr 26, 2019 | Added `in_learn_feed` and `archived` filters in Test API. Added `in_learn_feed` in Problem API.
Mar 26, 2019 | Added `allow_test_retake` field in the Test embed configuration object and enabled versioning of doselect-embed.js library.
Jan 21, 2019 | Added `total_test_score` field in the Test API.
Aug 6, 2018  | Added ability to [lock and unlock a problem](#locking-unlocking-a-problem), enable updating `score` and `penalty` in [Problem API](#update-a-problem)
Jul 16, 2018 | Added [Code Lab embed](#code-lab-embed) and [REST](#code-lab-api) APIs
Jun 18, 2018 | Added `custom_body_class` attribute on `data-config` object for [problem / test embed](#problem-embed) and [snippet runner embed](#snippet-runner-embed)
Jun 01, 2018 | Added [rate limits](#rate-limits) for our client APIs
May 29, 2018 | Added an API for [bulk creation of invites](#bulk-creation-of-invites)
May 22, 2018 | Added an [API for downloading the code zip](#download-code-zip) and added `code_repo_uri` to the submission response
May 15, 2018 | Added `DSC` (data science type) in [snippet runner embed](#snippet-runner-embed)
May 11, 2018 | Added [conditions](#problem-embed) governing sample solutions behaviour in problem embed.
May 02, 2018 | Added `test_name` to the [user invite API response](#get-all-invites-of-a-user) and updated the [allowed embed problem types](#problem-embed)
Apr 25, 2018 | Added docs for the [user invite API](#get-all-invites-of-a-user)
Apr 18, 2018 | Updated the [solution webhook docs](#solution) and added email restriction in [embed](#client-library) and added `max_score` field to [submission API response](#get-one-submission)
Apr 12, 2018 | Added allowed problem types in [problem embed](#problem-embed)
Apr 11, 2018 | Added the response to the create submission API and updates the docs for when webhook is triggered and added docs for [host authentication](#host-authentication)
Apr 06, 2018 | Added [Solution Revision API](#get-solution-revision).
Apr 03, 2018 | Added [update invite API](#update-an-invite)
Mar 15, 2018 | Added [Snippet Runner embed](#snippet-runner-embed).
Mar 12, 2018 | Added a webhook triggered on solution evaluation.
Jan 31, 2018 | Added Data science and Machine learning to allowed problem types in [problem creation](#create-a-problem).
Jan 19, 2018 | Added support for controlling visibility of solution revisions in [problem embed](#problem-embed).
Dec 04, 2017 | Added `public_access_url` to the [test report](#get-a-candidate-39-s-report).
Nov 30, 2017 | Update `start_time` and `expiry` in [invite reset API](#reset-an-invite).
Nov 28, 2017 | Added `learn_feed_item_id` to the [create submission API](#create-a-new-submission).
Nov 27, 2017 | Added API to [reset an invite](#reset-an-invite) and added `start_time` to the [create invite api](#create-a-new-invite).
Nov 24, 2017 | Added API to [clone a problem](#clone-a-problem), [update a problem](#update-a-problem) and [add problem to learnfeed](#add-problem-to-learn-feed) APIs.
Nov 15, 2017 | `sample_solutions` and `technologies` can be added while [creating a new problem](#create-a-problem).
Nov 01, 2017 | Added [problem testcase API](#problem-testcase-api).
Oct 30, 2017 | Added [problem creation and edit webhooks](#problem) and [code in submit webhook](#solution).
Oct 26, 2017 | Added [problem creation API](#create-a-problem).
Oct 25, 2017 | Added `DoSelect-Webhook-Signature` header in [Webhooks](#webhook-security).
Oct 18, 2017 | Added `data-config` attribute in [problem embed](#problem-embed).
Oct 16, 2017 | Added webhook senders for [test session report](#test-session).
Oct 9, 2017  | Added webhook senders for [test session](#test-session) and [solution](#solution).
