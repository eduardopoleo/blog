get "/posts"
```json
{
"data": [
  {
    "type": "article",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!",
      "text": "The shortest article. Ever."
    },
    "links": {
      "self": "https://epoleo.me/articles/1"
    },
    "relationships": {
      "category": {
        "data": {"id": "42", "type": "category"}
      },
      "comments": {
        "data": [
          {"type": "comments", "id": 4}
        ]
      }
    }
  },
  {
    "type": "article",
    "id": "1",
    "attributes": {
      "title": "JSON API paints my bikeshed!",
      "text": "The shortest article. Ever."
    },
    "relationships": {
      "category": {
        "data": {"id": "43", "type": "category"}
      },
      "comments": {
        "data": [
          {"type": "comments", "id": 5}
        ]
      }
    }
  }
],
"included": [
    {
      "type": "category",
      "id": "42",
      "attributes": {
        "name": "javascript"
      }
    },
    {
      "type": "comments",
      "id": "4",
      "attributes": {
        "title": "Small comment",
        "text": " A very small comment"
      }
    },
    {
      "type": "category",
      "id": "42",
      "attributes": {
        "name": "ruby"
      }
    },
    {
      "type": "comments",
      "id": "6",
      "attributes": {
        "title": "Small comment",
        "text": " A very small comment"
      }
    }
  ],
  "links": {
    "self": "https://epoleo.me/articles?page=3",
    "next": "https://epoleo.me/articles?page=4",
    "prev": "https://epoleo.me/articles?page=2"
  }
}
```
