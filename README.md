GET / POST
companies
--
fields: default nil
q: default nil
pageToken: default nil
maxResult: default 100

{
	"companies": [{"id": "id", "slug": "slug"},{"id": "id", "slug": "slug"}],
	"nextPageToken": "token"
	"resultSizeEstimate": "count"
}

GET / POST
companies/:id
--
id: compulsory
fields: default nil
q: default nil

{
  "id": 762,
  "name": "PT. Lazada Indonesia",
  "website": "http://www.lazada.com",
  "email_domain": "lazada.com",
  "created_at": "2015-10-31T12:24:17.709+07:00",
  "updated_at": "2015-12-16T20:36:17.177+07:00"
}
--
{error: { errors: { "domain": "", "reason": "", "message": ""}, code: 400, message: "" }}