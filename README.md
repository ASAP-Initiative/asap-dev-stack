# ASAP Initiative Development Stack

This project provides a Docker Compose setup for building and running containers for the [ASAP Initiative](https://github.com/ASAP-Initiative) development stack. 

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
  - **[debian/](os/debian/)**: Dockerfiles for Debian  versions (11, 12, 13).
  - **[fedora/](os/fedora/)**: Dockerfiles for Fedora versions (39, 40, 41, 42).
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

4. **Play with the stack**: 

   ```bash
   docker exec -it asap-cli bash -c 'ansible --version && ansible all -m ping'
   ansible [core 2.16.14]
      config file = None
      configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
      ansible python module location = /usr/local/lib/python3.12/site-packages/ansible
      ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
      executable location = /usr/local/bin/ansible
      python version = 3.12.12 (main, Oct  9 2025, 22:40:55) [GCC 14.2.0] (/usr/local/bin/python)
      jinja version = 3.1.6
      libyaml = True
   debian12 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   debian11 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   fedora39 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   fedora40 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   debian13 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   ubuntu1804 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   fedora41 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   ubuntu2004 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   fedora42 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   ubuntu2204 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   }
   ubuntu2404 | SUCCESS => {
        "changed": false,
        "ping": "pong"
   } 
   ```


## Note about Ansible version

In order to work with **Ubuntu 18.04 (with Python 3.6)**, we cannot install `ansible-core > 2.16` ([ansible-core support matrix](https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html#ansible-core-support-matrix)), so we use `ansible==9.13` ([Ansible community chnagelogs](https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html#ansible-core-support-matrix)).

## Contributing

Feel free to submit issues or pull requests for improvements or additional features. 

## License

This project is licensed under the [MIT License](LICENSE).
