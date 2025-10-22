# Contributing

Thanks for your interest in contributing. This document explains how to propose changes, report issues, and add services.

## Table of contents

- [How to ask questions](#how-to-ask-questions)
- [Reporting bugs and requesting features](#reporting-bugs-and-requesting-features)
- [Code style and conventions](#code-style-and-conventions)
- [Commit messages and branches](#commit-messages-and-branches)
- [Pull request process](#pull-request-process)
- [Adding a new Linux distribution image](#adding-a-new-linux-distribution-image)
- [Adding or updating services](#adding-or-updating-services)
- [Documentation updates](#documentation-updates)
- [Security and responsible disclosure](#security-and-responsible-disclosure)
- [License](#license)

## How to ask questions

- Open an Issue with the label `question`.
- Be clear, include logs, commands, and environment info (OS, Docker version).

## Reporting bugs and requesting features

- Use GitHub Issues.
- Include steps to reproduce, expected vs actual behavior, logs, and docker-compose.yml changes if relevant.

## Code style and conventions

- YAML: 2 spaces, lowercase service keys.
- Dockerfiles: filenames follow no-hyphen convention, e.g.:
  - Dockerfile.debian11, Dockerfile.fedora39, Dockerfile.ubuntu2204
- Service names in docker-compose.yml:
  - Distro services: debian11, ubuntu2204, fedora39
  - App services: asap-cli, asap-kafka-consumer, asap-db, kafka-broker
- README service table must match docker-compose.yml (names, images, ports, Dockerfile links).

## Commit messages and branches

- Use feature branches: feature/<short-name>, fix/<short-name>, docs/<short-name>.
- Use Conventional Commits:
  - feat: add new capability
  - fix: bug fix
  - docs: documentation only
  - chore: tooling/infra
  - refactor: no API change
- Keep subject <= 72 chars; add body when needed.

## Pull request process

1. Fork and create a branch.
2. Make focused changes with clear commits.
3. Update docs (README tables, diagrams) if behavior changes.
4. Ensure docker compose builds: docker compose build.
5. Ensure stack starts: `docker compose up -d` and basic health checks.
6. Open PR with:
   - Motivation and context
   - Checklist:
     - [ ] docker compose builds
     - [ ] README updated
     - [ ] New files documented
     - [ ] Service names and Dockerfile names follow conventions

## Adding a new Linux distribution image

1. Create Dockerfile in the appropriate directory:
   - os/debian/Dockerfile.debianXX
   - os/ubuntu/Dockerfile.ubuntuYYMM
   - os/fedora/Dockerfile.fedoraNN

2. Add a service to dev-stack/docker-compose.yml:
   - Use matching dockerfile name and service key (e.g., debian12).

3. Update dev-stack/README.md “The Stack” table with a link to the Dockerfile.

4. Build and run:
   - docker compose build <service>
   - docker compose up -d <service>

## Adding or updating services

- Define the service in dev-stack/docker-compose.yml.
- For application services, add context and dockerfile paths explicitly.
- Expose ports only when needed.
- Persist data via volumes (e.g., asap-db-data for Postgres).
- Keep environment variables minimal and documented.

## Documentation updates

- Update dev-stack/README.md service table when services or Dockerfiles change.
- Keep links to Dockerfiles correct relative to dev-stack/.
- If you add diagrams (Mermaid), include a short explanation.

## Security and responsible disclosure

- Do not include secrets in the repo or docker-compose.yml.
- Report security issues privately. Open a confidential issue or contact maintainers directly. Do not post exploits publicly.

## License

- By contributing, you agree your contributions are licensed under the project’s license.
- See [LICENSE](LICENSE) file for details.
