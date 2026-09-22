# pythons requests library

**The Requests library is the go-to package for making HTTP requests in Python.**

## 📋 Table of Contents

1. [مقدمه | Introduction](#introduction)
2. [نصب کتابخانه requests | Install Requests](#install-requests)
3. [استفاده از کتابخانه | Use Library](#use-library)
4. [متدهای HTTP | HTTP Methods](#http-methods)
5. [متدهای Response | Response Methods](#response-methods)
6. [درخواست GET | GET Request](#get-request)
7. [پارامترهای کوئری | Query Parameters](#query-parameters)
8. [درخواست POST | POST Request](#post-request)
9. [درخواست PUT | PUT Request](#put-request)
10. [درخواست PATCH | PATCH Request](#patch-request)
11. [درخواست DELETE | DELETE Request](#delete-request)
12. [هدرها | Headers](#headers)
13. [احراز هویت | Authentication](#authentication)
    - [روش ۱: Basic Auth](#method-1-basic-auth)
    - [روش ۲: Bearer Token](#method-2-bearer-token--the-most-common-method-in-modern-apis)
14. [کار با Session | Working with Session](#working-with-session)
15. [مدیریت خطا | Error Handling](#error-handling)
16. [تایم‌اوت | Timeout](#timeout)
17. [آپلود و دانلود فایل | Uploading and Downloading Files](#uploading-and-downloading-files)
    - [آپلود فایل | Uploading a File](#uploading-a-file)
    - [دانلود فایل (تصویر) | Downloading a File (Image)](#downloading-a-file-eg-an-image)
    - [دانلود فایل کوچک | Downloading a File (Small)](#downloading-a-file-file-not-big)
18. [کوکی‌ها | Cookies](#cookies)
19. [جدول کدهای وضعیت HTTP | HTTP Status Code Table](#http-status-code-table)
20. [بهترین شیوه‌ها | Best Practices](#best-practices)
21. [منابع بیشتر | Further Resources](#further-resources)
22. [مثال‌ها | EXAMPLE](#example)

---
---


## Introduction

```bash
#Checking if Python is installed
python3 --version

#Checking if pip is installed
python3 -m pip --version

#if not installed
sudo apt install python3-pip

#create project
mkdir myproject
cd myproject
python3 -m venv .venv
source .venv/bin/activate
```
> for exit from venv `deactivate`

## install requests

```bash
#without venv
python -m pip install requests
#with venv
pip install requests
```

## Use library

```python
import requests
```
---
---
## HTTP Methods

| Method | Description |
|--------|-------------|
| `GET` | Retrieve information from the server |
| `POST` | Send data to the server to create/update resources |
| `PUT` | Replace the target resource with new data |
| `DELETE` | Delete the specified resource |
| `HEAD` | Retrieve headers only (no body) |
| `PATCH` | Apply partial modifications to a resource |

---
---

## Response Methods

| Property/Method | Description |
|---|---|
| `response.status_code` | Returns a number that indicates the status (200 is OK, 404 is Not Found) |
| `response.ok` | Returns `True` if the status code is less than 400 and greater than or equal to 200; otherwise `False` |
| `response.reason` | Returns a text corresponding to the status code |
| `response.text` | Returns the content of the response, in unicode |
| `response.content` | Returns the content of the response, in bytes |
| `response.json()` | Returns a JSON object of the result (if the result was written in JSON format; if not, it raises an error) |
| `response.headers` | Returns a dictionary of response headers |
| `response.encoding` | Returns the encoding used to decode `response.content` |
| `response.url` | Returns the URL of the response |
| `response.cookies` | Returns a `CookieJar` object with the cookies sent back from the server |
| `response.elapsed` | Returns a `timedelta` object with the time elapsed from sending the request to the arrival of the response |
| `response.history` | Returns a list of response objects holding the history of request (url) |
| `response.is_redirect` | Returns `True` if the response was redirected, otherwise `False` |
| `response.is_permanent_redirect` | Returns `True` if the response is the permanent redirected URL, otherwise `False` |
| `response.links` | Returns the header links |
| `response.request` | Returns the request object that requested this response |
| `response.raise_for_status()` | Returns an `HTTPError` object if an error has occurred during the process |
| `response.iter_content()` | Iterates over the `response.content` |
| `response.close()` | Closes the connection to the server |

---
---

## GET Request
 
Used to **retrieve** data from a server.
 
```python
import requests
 
response = requests.get("https://api.github.com/users/octocat")
print(response.status_code)
print(response.json())
``` 

> when we have json in API answer and we use this for use value.

### Real output:
 
```
200
{
  "login": "octocat",
  "id": 583231,
  "name": "The Octocat",
  "company": "@github",
  "blog": "https://github.blog",
  "location": "San Francisco",
  "public_repos": 8,
  "followers": 18000,
  "following": 9
}
```
 
---
 
## Query Parameters 

Anywhere the user is viewing or searching for something, rather than modifying anything.

```python
import requests
 
params = {"q": "language:python", "sort": "stars", "order": "desc"}
response = requests.get("https://api.github.com/search/repositories", params=params)
 
print(response.url)
data = response.json()
print("Total results:", data["total_count"])
print("First repository name:", data["items"][0]["full_name"])
```

 > is that mean go to "https://api.github.com/search/repositories?q=language=python&sort=stars&order=desc"

### Real output:
 
```
https://api.github.com/search/repositories?q=language%3Apython&sort=stars&order=desc
Total results: 15234789
First repository name: public-apis/public-apis
```
 
---
 
## POST Request
 
Used to **create new data** or submit a form.
 
```python
import requests
 
payload = {"name": "Amir", "job": "Python Developer"}
response = requests.post("https://reqres.in/api/users", json=payload)
 
print(response.status_code)
print(response.json())
```
 
### Real output:
 
```
201
{
  "name": "Amir",
  "job": "Python Developer",
  "id": "123",
  "createdAt": "2026-09-20T10:15:32.123Z"
}
```
 
---
 
## PUT Request
 
Used to **fully replace** an existing resource (all fields must be sent).
 
```python
import requests
 
payload = {"name": "Amir Rezaei", "job": "Senior Python Developer"}
response = requests.put("https://reqres.in/api/users/2", json=payload)
 
print(response.status_code)
print(response.json())
```
 
### Real output:
 
```
200
{
  "name": "Amir Rezaei",
  "job": "Senior Python Developer",
  "updatedAt": "2026-09-20T10:16:03.456Z"
}
```
 
---
 
## PATCH Request
 
Used for a **partial update** of an existing resource (only the changed fields are sent).
 
```python
import requests
 
payload = {"job": "Team Lead"}
response = requests.patch("https://reqres.in/api/users/2", json=payload)
 
print(response.status_code)
print(response.json())
```
 
### Real output:
 
```
200
{
  "job": "Team Lead",
  "updatedAt": "2026-09-20T10:17:11.789Z"
}
```
 
---
 
## DELETE Request
 
Used to **delete** a resource.
 
```python
import requests
 
response = requests.delete("https://reqres.in/api/users/2")
print(response.status_code)
```
 
### Real output:
 
```
204
```
 
(Status code 204 means success with no content returned.)
 
---
 
## Headers
 
```python
import requests
 
headers = {
    "User-Agent": "my-python-app/1.0",
    "Accept": "application/json"
}
 
response = requests.get("https://api.github.com/users/octocat", headers=headers)
print(response.request.headers)
```
 
### Real output:
 
```
{'User-Agent': 'my-python-app/1.0', 'Accept': 'application/json', 'Accept-Encoding': 'gzip, deflate', 'Connection': 'keep-alive'}
```
 
---
 
## Authentication
 
### Method 1: Basic Auth
 
```python
import requests
 
response = requests.get("https://httpbin.org/basic-auth/amir/mypassword",
                         auth=("amir", "mypassword"))
print(response.status_code)
print(response.json())
```
 
### Real output:
 
```
200
{"authenticated": true, "user": "amir"}
```
 
### Method 2: Bearer Token — the most common method in modern APIs
 
```python
import requests
 
# Step 1: Log in and get the token
login_response = requests.post("https://reqres.in/api/login", json={
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
})
token = login_response.json()["token"]
print("Received token:", token)
 
# Step 2: Use the token in subsequent requests
headers = {"Authorization": f"Bearer {token}"}
profile = requests.get("https://reqres.in/api/users/2", headers=headers)
print(profile.json())
```
 
### Real output:
 
```
Received token: QpwL5tke4Pnpja7X4
{
  "data": {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "first_name": "Janet",
    "last_name": "Weaver"
  }
}
```
 
---
 
## Working with Session
 
If you have several consecutive requests that need to share cookies/login state, use `Session` instead of `requests.get/post` — it's more efficient and manages cookies automatically.
 
```python
import requests
 
session = requests.Session()
 
# Default header for all requests in this session
session.headers.update({"User-Agent": "my-app/1.0"})
 
# Login - cookie is stored inside the session automatically
session.post("https://httpbin.org/cookies/set", params={"session_id": "abc123"})
 
# Next request automatically sends the cookie
response = session.get("https://httpbin.org/cookies")
print(response.json())
 
session.close()
```
 
### Real output:
 
```
{"cookies": {"session_id": "abc123"}}
```
 
---
 
## Error Handling
 
```python
import requests
 
try:
    response = requests.get("https://api.github.com/users/a-user-that-does-not-exist-xyz123", timeout=5)
    response.raise_for_status()
    print(response.json())
 
except requests.exceptions.HTTPError as err:
    print(f"HTTP error: {err}")
except requests.exceptions.ConnectionError:
    print("Internet connection problem")
except requests.exceptions.Timeout:
    print("Request timed out")
except requests.exceptions.RequestException as err:
    print(f"General error: {err}")
```
 
### Real output:
 
```
HTTP error: 404 Client Error: Not Found for url: https://api.github.com/users/a-user-that-does-not-exist-xyz123
```
 
---
 
## Timeout
 
Always set a timeout so your program doesn't hang because of a slow server:
 
```python
import requests
 
try:
    response = requests.get("https://httpbin.org/delay/10", timeout=3)
except requests.exceptions.Timeout:
    print("Request took more than 3 seconds and was cancelled")
```
 
### Real output:
 
```
Request took more than 3 seconds and was cancelled
```
 
You can also set connect and read timeouts separately: `timeout=(3, 10)` means 3 seconds to establish a connection, 10 seconds to receive the response.
 
---
 
## Uploading and Downloading Files
 
### Uploading a file
 
```python
import requests
 
files = {"file": ("report.txt", open("report.txt", "rb"), "text/plain")}
response = requests.post("https://httpbin.org/post", files=files)
print(response.json()["files"])
```
 
### Real output:
 
```
{"file": "the content of your report.txt file..."}
```
 
### Downloading a file (e.g. an image)
 
```python
import requests
 
response = requests.get("https://httpbin.org/image/png", stream=True)
 
with open("downloaded_image.png", "wb") as f:
    for chunk in response.iter_content(chunk_size=8192):
        f.write(chunk)
 
print("Download complete ✅")
```
 
Using `stream=True` lets you download large files in chunks so the entire file isn't loaded into memory at once.
 
### Downloading a file (file not big)

```python
r = requests.get('https://example.com/file.pdf')
with open('file.pdf', 'wb') as f:
    f.write(r.content)
```
> It creates a file named "file.pdf" in the current folder.

> w means write, b means binary

> f mens The object is a file


---
 
## Cookies
 
```python
import requests
 
# Sending a cookie manually
cookies = {"user_token": "abc123xyz"}
response = requests.get("https://httpbin.org/cookies", cookies=cookies)
print(response.json())
 
# Reading cookies returned by the server
response2 = requests.get("https://httpbin.org/cookies/set/theme/dark")
print(response2.cookies.get_dict())
```
 
### Real output:
 
```
{"cookies": {"user_token": "abc123xyz"}}
{'theme': 'dark'}
```
 
---
---
 
## HTTP Status Code Table
 
| Code | Meaning | Description |
|---|---|---|
| `200` | OK | Request succeeded |
| `201` | Created | New resource created successfully |
| `204` | No Content | Succeeded but returned no content (e.g. after a delete) |
| `301/302` | Redirect | The address has moved |
| `400` | Bad Request | Your request is malformed |
| `401` | Unauthorized | Authentication required |
| `403` | Forbidden | You don't have access |
| `404` | Not Found | Address/resource not found |
| `429` | Too Many Requests | You've exceeded the allowed request rate |
| `500` | Internal Server Error | Server-side error |
| `503` | Service Unavailable | Server is temporarily unavailable |
 
---
---
 
## Best Practices
 
- ✔️ Always set a `timeout` so your program doesn't hang.
- ✔️ Use `response.raise_for_status()` to catch HTTP errors.
- ✔️ For several consecutive requests to the same server, use `Session()` (faster and more efficient).
- ✔️ Don't send passwords or sensitive data via `params` (in the URL); use `json`/body instead.
- ✔️ Use `stream=True` for large files.
- ✔️ Never hardcode tokens or API keys directly in your code; use environment variables instead:
```python
import os
import requests
 
api_key = os.environ.get("MY_API_KEY")
headers = {"Authorization": f"Bearer {api_key}"}
response = requests.get("https://api.example.com/data", headers=headers)
```
 
- ✔️ Always make sure a response is actually JSON before calling `.json()`.
- ✔️ For APIs with rate limits, add `time.sleep()` between requests.

---
---

## Further Resources
 
- [Official Requests Documentation](https://requests.readthedocs.io/en/latest/)
- [httpbin.org](https://httpbin.org) — free service for testing and learning HTTP
- [reqres.in](https://reqres.in) — free test API with fake data for practicing CRUD operations 

---
---

# EXAMPLE

Getting real-time prices for the dollar and gold

```python
import requests

response = requests.get("https://api.navasan.tech/latest/", 
                         params={"api_key": "YOUR_API_KEY"})
data = response.json()
print("dolar price:", data["usd_sell"]["value"])
```

Checking a website's status (Is it online?)

```python
import requests

sites = ["https://google.com", "https://github.com", "https://a-fake-site-xyz.com"]

for site in sites:
    try:
        r = requests.get(site, timeout=5)
        print(f"✅ {site} -> online (code {r.status_code})")
    except requests.exceptions.RequestException:
        print(f"❌ {site} -> unavalable")
```

Download multiple photos at once

```python
import requests

image_urls = [
    "https://picsum.photos/id/1/200",
    "https://picsum.photos/id/2/200",
    "https://picsum.photos/id/3/200"
]

for i, url in enumerate(image_urls):
    response = requests.get(url)
    with open(f"image_{i}.jpg", "wb") as f:
        f.write(response.content)
    print(f"photo {i+1} is download")
```

Getting weather information for multiple cities at once

```python
import requests

cities = ["Tehran", "Isfahan", "Shiraz"]
api_key = "YOUR_OPENWEATHER_KEY"

for city in cities:
    response = requests.get(
        "https://api.openweathermap.org/data/2.5/weather",
        params={"q": city, "appid": api_key, "units": "metric", "lang": "fa"}
    )
    data = response.json()
    print(f"{city}: {data['main']['temp']}°C - {data['weather'][0]['description']}")
```
---
---
