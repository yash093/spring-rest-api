# Course Management REST API
This project is a Spring Boot REST API for managing course information.

## Usage
- Pull  the docker image

  ```shell
  docker pull yash0903/first-image:latest
  ```
- Create container to run the application inside it

  ```shell
  docker create --name my-container -p 8080:8080 yash0903/first-image
  ```
- Start the container
  ```shell
  docker start my-container
  ```
- Check the app in browser
  ```shell
  http://localhost:8080/home
  ```
