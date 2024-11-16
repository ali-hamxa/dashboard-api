# Users API

This API is designed to manage user data and filter users based on specific criteria such as continent, country, state, or city. It also provides endpoints to retrieve available filter options and authenticate requests using an API key.

## Authentication

All API requests must include an Authorization header with a valid API key. The key is validated against the ApiKey model.

### Notes

- Ensure you generate an API key by creating an ApiKey entry in the database or through the Rails console:
  ApiKey.create
- Use the generated key in the Authorization header for all API requests.

Example Header:

Authorization: YOUR_API_KEY

### Error Response for Unauthorized Requests

- Status: 401 Unauthorized
- Response Body:
  {
    "message": "Unauthorised"
  }


## Endpoints

### 1. Get All Users

Endpoint: GET /users

Description: Returns a list of all users in the database.

Request:

- Headers:
  - Authorization: Valid API key

Response:

- Status: 200 OK
- Body:
  {
    "users": [
      {
        "id": 1,
        "name": "John Doe",
        "email": "john.doe@example.com",
        "continent": "Europe",
        "country": "Germany",
        "state": "Bavaria",
        "city": "Munich"
      }
    ]
  }

Error Response:

- Status: 500 Internal Server Error
- Body:
  {
    "error": "Unable to fetch users"
  }

---

### 2. Populate Filter Options

Endpoint: GET /users/populate_filter_options

Description: Retrieves the distinct options available for filtering users.

Request:

- Headers:
  - Authorization: Valid API key

Response:

- Status: 200 OK
- Body:
  {
    "continents": ["Europe", "Asia"],
    "countries": ["Germany", "India"],
    "states": ["Bavaria", "Maharashtra"],
    "cities": ["Munich", "Mumbai"],
    "status": "ok"
  }

Error Response:

- Status: 500 Internal Server Error
- Body:
  {
    "error": "Unable to populate the filters"
  }

---

### 3. Filter Users

Endpoint: POST /users/filter_users

Description: Filters users based on the provided criteria.

Request:

- Headers:
  - Authorization: Valid API key
- Body:
  {
    "user": {
      "continents": ["Europe"],
      "countries": ["Germany"],
      "states": ["Bavaria"],
      "cities": ["Munich"]
    }
  }

Response:

- Status: 200 OK
- Body:
  {
    "filtered_users": [
      {
        "id": 1,
        "name": "John Doe",
        "email": "john.doe@example.com",
        "continent": "Europe",
        "country": "Germany",
        "state": "Bavaria",
        "city": "Munich"
      }
    ]
  }

Error Responses:

1. Invalid Request:

   - Status: 422 Unprocessable Entity
   - Body:
     {
       "message": "Unprocessable Request"
     }

2. Internal Server Error:

   - Status: 500 Internal Server Error
   - Body:
     {
       "error": "Unable to filter the users"
     }

---

## Models

### 1. User Model

- Attributes:

  - id: Integer
  - name: String
  - email: String
  - continent: String
  - country: String
  - state: String
  - city: String

- Validations:

  - email: Must be unique and present.
  - name, continent, country, state, city: Must be present.

### 2. ApiKey Model

- Attributes:

  - id: Integer
  - key: String (unique)

- Callbacks:

  - Generates a secure random key before creation.

---

## Services

### UserFilterService

- Purpose: Filters users based on the provided parameters.

- Parameters:

  - continents: Array of strings
  - countries: Array of strings
  - states: Array of strings
  - cities: Array of strings

- Logic:

  - Applies WHERE clauses dynamically based on the presence of parameters.

---

## Development Setup

1. Clone the repository

2. Install dependencies:

   bundle install

3. Set up the database:

   rails db:create db:migrate

4. Seed the database (optional):

   rails db:seed

5. Start the server:

   rails s