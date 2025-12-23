# Sendspin Client

Sendspin / Resonate audio client packaged as:

- Home Assistant Local Add-on
- Docker / Portainer container

## Features
- Headless Sendspin playback
- Multi-architecture (amd64, armv7, aarch64)
- Audio output via ALSA
- Works with Home Assistant or standalone Docker

## Home Assistant
Add this repository to **Add-ons → Add-on Store → Repositories**

## Docker / Portainer
Use the included `docker-compose.yml`

## Environment Variables
| Variable | Description |
|--------|------------|
| SENDSPIN_NAME | Player name |
| SENDSPIN_SERVER_IP | Sendspin server IP |
| SENDSPIN_PORT | Server port |

