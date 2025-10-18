# ASAP Initiative Development Stack

This project provides a Docker Compose setup for building and running containers for the ASAP Initiative development stack. 

This development stack includes :
* asap-api
* asap-cli
* asap-web
* linux distributions:
  * Debian
  * Fedora
  * Ubuntu

## Project Structure

- **[docker-compose.yml](docker-compose.yml)**: Defines the services for each operating system using the respective Dockerfiles.
- **[os/](os/)**: Contains subdirectories for each operating system with their respective Dockerfiles.
  - **[debian/](os/debian/)**: Dockerfiles for Debian LTS versions (9, 10, 11, 12).
  - **[fedora/](os/fedora/)**: Dockerfiles for Fedora versions (37, 38, 39, 40).
  - **[ubuntu/](os/ubuntu/)**: Dockerfiles for Ubuntu LTS versions (18.04, 20.04, 22.04, 24.04).
- **[README.md](README.md)**: Documentation for the project.

## Getting Started

1. **Clone the Repository**: 

   ```bash
   git clone https://github.com/ASAP-Initiative/asap-dev-stack
   cd asap-dev-stack
   ```

2. **Build the Docker Images**:

   ```bash
   docker compose build
   ```

3. **Run the Stack**: 

   ```bash
   docker compose up -d
   ```

## Contributing

Feel free to submit issues or pull requests for improvements or additional features. 

## License

This project is licensed under the [MIT License](LICENSE).
