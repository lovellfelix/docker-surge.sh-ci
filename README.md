# Surge CI Docker Image

Docker image for running surge to deploy static websites to surge.sh 

Usage:

```bash
docker run -ti --rm -v ./data:/usr/src/app \
    -e SURGE_ACT_EMAIL="your-email-address@email.com" \
    -e SURGE_ACT_TOKEN="yoru-surge-account-token" \
    -e SURGE_PROJECT_DOMAIN="your-domain.surge.sh" \
    lovellfelix/surge.sh-ci
```
