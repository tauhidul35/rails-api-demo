# Overview

This is a tiny RESTful API to index a page's content. "Index the content" means to parse the page content and store its content -
in this case to store the content that is found inside the tags h1, h2 and h3 and the links.

# Project Setup

* Ruby version - 2.3.1

* Rails version - 5.0.0

* Database creation - I have used Sqlite database in this project. Run `rails db:setup` in console from your project path

* Test code - I have used rspec to test code. Run `rspec` to run all test code.

# API Documentation

**Save content of a url :**

*Request:*
`POST /web_pages` with parameter `web_page[url]=https://example.com`

*Response:*
```json
{
  "id": 2,
  "url": "https://example.com",
  "content": "[{:tag=>\"h1\", :text=>\"Example Domain\"}]",
  "updated_at": "2016-07-04T20:15:27.312Z"
}
```

**Update previous saved content :**

*Request:*
`PATCH/PUT /web_pages/2` with parameter `web_page[url]=https://example.com`

*Response:*
```json
{
  "id": 2,
  "url": "https://example.com",
  "content": "[{:tag=>\"h1\", :text=>\"Example Domain\"}, {:tag=>\"a\", :text=>\"More information...\"}]",
  "updated_at": "2016-08-04T16:36:19.335Z"
}
```

**Get all saved contents :**

*Request:*
`GET /web_pages` with no parameter

*Response:*
```json
[
  {
    "id": 1,
    "url": "https://github.com/tauhidul35/rails-api-demo",
    "content": "[{:tag=>\"h1\", :text=>\"tauhidul35/rails-api-demo\"}, {:tag=>\"h1\", :text=>\"README\"}, {:tag=>\"h3\", :text=>\"README.md\"}, {:tag=>\"a\", :text=>\"Skip to content\"}, {:tag=>\"a\", :text=>\"\"}, {:tag=>\"a\", :text=>\"Personal\"}, {:tag=>\"a\", :text=>\"Open source\"}, {:tag=>\"a\", :text=>\"Business\"}, {:tag=>\"a\", :text=>\"Explore\"}, {:tag=>\"a\", :text=>\"Sign up\"}, {:tag=>\"a\", :text=>\"Sign in\"}, {:tag=>\"a\", :text=>\"Pricing\"}, {:tag=>\"a\", :text=>\"Blog\"}, {:tag=>\"a\", :text=>\"Support\"}, {:tag=>\"a\", :text=>\"Search GitHub\"}, {:tag=>\"a\", :text=>\"Watch\"}]",
    "updated_at": "2016-08-04T16:13:29.169Z"
  },
  {
    "id": 2,
    "url": "https://example.com",
    "content": "[{:tag=>\"h1\", :text=>\"Example Domain\"}, {:tag=>\"a\", :text=>\"More information...\"}]",
    "updated_at": "2016-08-04T16:36:19.335Z"
  }
]
```

**Get a specific url content :**

*Request:*
`GET /web_pages/2` with no parameter

*Response:*
```json
{
  "id": 2,
  "url": "https://example.com",
  "content": "[{:tag=>\"h1\", :text=>\"Example Domain\"}, {:tag=>\"a\", :text=>\"More information...\"}]",
  "updated_at": "2016-08-04T16:36:19.335Z"
}
```

**Remove a specific url content :**

*Request:*
`DELETE /web_pages/2` with no parameter

*Response:*
```json
{
  "status": "deleted"
}
```

**All requests at glance :**

| Request url    | Request method | Request Params | Response                      |
|----------------|----------------|----------------|-------------------------------|
| /web_pages     | GET            | None           | Get all saved contents        |
| /web_pages/:id | GET            | None           | Get a specific url content    |
| /web_pages     | POST           | web_page[url]  | Save content of a url         |
| /web_pages/:id | PATCH/PUT      | web_page[url]  | Update previous saved content |
| /web_pages/:id | DELETE         | None           | Remove a specific url content |
