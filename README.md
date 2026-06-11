# pgBackRest Guide
## **Rationale**
Backup and restore capabilities are essential for reliable database operations. However, traditional or native database backup methods often rely on full database backups.
As database size grows, backup storage, transfer time, and infrastructure costs also increase.
Native backup approaches may also lack operationally important capabilities such as Point-in-Time Recovery (PITR) and incremental backups, which are critical for restoring databases to a specific state efficiently.
This R&D evaluates the use of `pgBackRest`, an open-source backup and restore tool for PostgreSQL that supports full, differential, incremental backups, and PITR.

## **Core**
### Setup
#### Requirements:
- [Docker/Docker Desktop](https://docs.docker.com/manuals/)
- [PostgreSQL17 Image](https://hub.docker.com/_/postgres)
- [Object Storage (MinIO)](github.com/minio/docs)
- [pgBackRest](https://pgbackrest.org/)

### Commands

## Architecture

## Features

## References 
