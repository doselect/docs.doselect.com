# Pagination

API endpoints that return a collection of results are always paginated, and contain a `meta` object with pagination details. The `objects` object contains the list of
resource objects in such responses.

## Meta

```json
{
    "meta": {
            "limit": 100,
            "next": "/platform/v1/test?limit=100&offset=200",
            "offset": 100,
            "previous": "/platform/v1/test?limit=100&offset=0",
            "total_count": 217
    },
    "objects":[
        {
            ...
        },
        {
            ...
        }
    ]
}
```

The `meta` object contains the following information:

Parameter | Description
---------- | -------
limit | The page size for this request. This is set to `10` by default.
offset | The offset of the first object sent in this response.
next | The resource URI of the next page in this resource list. This field would be `null` if there's no next page.
previous | The resource URI of the previous page in this resource list. This field would be `null` if there's no previous page.
total_count | The total number of objects in this resource list.
