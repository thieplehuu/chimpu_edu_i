# Arent Healthy API

A test Java backend api project.

## 1 Getting Started

### 1.1 Folder Struct:
 - docs: database diagram and Postman json file
 - h2: H2 database file
 - src: project source

### 1.2 Run application:
#### - visual studio code:
Click run Java
#### - maven apache:
mvn spring-boot:run

### 1.2 Accept api document url
http://localhost:8080/swagger-ui/index.html
### Default account:
username: admin
password: Admin@123

### 1.3 Authentication  
- Login API  
http://localhost:8080/auth/login  
payload:  
{  
 "username": "admin",  
"password": "Admin@123"  
}  
responsive:   
{   
 "accessToken":"xxxx"   
}
- Add accept token into Authorization header
Authoriztion Bear xxxxx
### 1.4 Api for homepage  
- http://localhost:8080/meal-type/all
- http://localhost:8080/user/meals
- http://localhost:8080/user/meals-by-type?meal-type-id=1
- http://localhost:8080/user/meals-by-date?date=2025-01-07
### 1.5 Api for body log graph  
- http://localhost:8080/user/body-logs
### 1.6 Api for workout history log
- http://localhost:8080/user/workouts  

