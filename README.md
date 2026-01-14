# HTW Rails API Debugging Challenge

## Overview

This is a Ruby on Rails API coding challenge designed to test your debugging skills. The application contains **5 intentional bugs** that you need to find and fix to complete the challenge.

## Application Description

The API manages Users and Products with the following relationships:
- Users can have many Products
- Products belong to a User
- External weather service integration

## API Endpoints

### 1. Users Endpoints (Database operations)
- `GET /api/v1/users` - List all users with product counts
- `GET /api/v1/users/:id` - Get specific user
- `GET /api/v1/users/:id/products` - Get user's products

### 2. Products Endpoint (Database operations)
- `GET /api/v1/products` - List all products with user information

### 3. Weather Endpoint (External service)
- `GET /api/v1/weather/:city` - Get weather for a city

## Setup Instructions

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Set up database:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

3. **Start the server:**
   ```bash
   rails server
   ```

4. **Test the endpoints:**
   ```bash
   # Test users
   curl http://localhost:3000/api/v1/users
   curl http://localhost:3000/api/v1/users/1
   curl http://localhost:3000/api/v1/users/1/products
   
   # Test products
   curl http://localhost:3000/api/v1/products
   
   # Test weather (try different cities)
   curl http://localhost:3000/api/v1/weather/london
   curl http://localhost:3000/api/v1/weather/new-york
   ```

## The Challenge: Find and Fix 5 Bugs

### Possible Bug Categories
Your task is to identify and fix bugs. The 5 bugs may come from any of these areas:

1. **Data Type Issues** - Wrong data types being used in database queries
2. **Performance Problems** - Inefficient collection operations  
3. **Database Query Issues** - Rails-specific query optimization problems
4. **External API Handling** - Incorrect assumptions about external service responses
5. **ActiveRecord Association Problems** - Inefficient association loading
6. **Input Validation Issues** - Missing or improper validation of user inputs
7. **Error Handling Problems** - Inadequate exception handling or error responses
8. **Authentication/Authorization Flaws** - Security vulnerabilities in access control
9. **Data Exposure Issues** - Unintended information disclosure in API responses
10. **Resource Management Problems** - Memory leaks, connection issues, or resource cleanup

### Security Note
Keep an eye out for potential **OWASP Top 10** security vulnerabilities as you debug. Common issues like injection attacks, broken authentication, sensitive data exposure, or insecure direct object references might appear in Rails applications. If you spot any security vulnerabilities during your debugging, make sure to document and fix them as they could be among the 5 bugs you're hunting for.

### Debugging Tips

- Pay attention to database queries in the Rails logs
- Test with different data scenarios (US vs European cities for weather)
- Monitor performance with larger datasets
- Check for N+1 query problems
- Verify data type consistency

### Expected Behavior (After Fixes)

1. **Users endpoint** should load efficiently without N+1 queries
2. **Products endpoint** should use optimized collection operations and proper association loading
3. **Weather endpoint** should handle temperature units correctly for different cities
4. **Database queries** should use appropriate data types
5. **Overall performance** should be optimized for larger datasets

## Success Criteria

- [ ] All 5 bugs identified and fixed
- [ ] API responses are correct and consistent
- [ ] No N+1 query problems
- [ ] Efficient collection operations
- [ ] Proper external API response handling
- [ ] All endpoints return expected data format

## Submission

When you've found and fixed all bugs:
1. Document each bug you found and how you fixed it
2. Test all endpoints to ensure they work correctly
3. Verify performance improvements

## Database Schema

### Users Table
- `id` (Primary Key)
- `name` (String, required)
- `email` (String, required, unique)
- `age` (Integer)
- `city` (String)
- `created_at`, `updated_at` (Timestamps)

### Products Table
- `id` (Primary Key)
- `name` (String, required)
- `description` (Text)
- `price` (Decimal, precision: 8, scale: 2)
- `user_id` (Foreign Key to Users)
- `created_at`, `updated_at` (Timestamps)

## Sample Data

The application includes seed data with:
- 5 Users from different cities (New York, London, Chicago, Paris, Berlin)
- 10 Products with varying prices
- Mock weather service responses

Good luck with the debugging challenge! 🐛🔍