# Calendar

# Get Started

- Start services in detached mode => `docker-compose up -d`
- Open pgAdmin in browser at `localhost:8000`
- Enter credentials:
  - email: 1234@admin.com
  - password: 1234
- Obtain postgres IPV4 => `docker network inspect calendar_default`
- Setup postgres in pgAdmin:
  - user: me
  - password: 1234
  - db: calendar
  - host: IPV4

# Useful Commands

```bash
# start services in detached mode
docker-compose up -d

# stop all the services
docker-compose stop

# start the services
docker-compose start

# delete services
docker-compose down
```
