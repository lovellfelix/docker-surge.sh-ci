#!/bin/sh

#set up surge environment varibales
export SURGE_LOGIN="${SURGE_ACT_EMAIL?Surge account email not found}"
export SURGE_TOKEN="${SURGE_ACT_TOKEN?Surge account token not found}"
export DOMAIN="${SURGE_PROJECT_DOMAIN?SURGE_PROJECT_DOMAIN not found}"

# # Get standard cali USER_ID variable
USER_ID=${HOST_USER_ID:-9001}
GROUP_ID=${HOST_GROUP_ID:-9001}

# Change 'user' uid to host user's uid
if [ ! -z "$USER_ID" ] && [ "$(id -u user)" != "$USER_ID" ]; then
	# Create the user group if it does not exist
	groupadd --non-unique -g "$GROUP_ID" group

	# Set the user's uid and gid
	usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" user
fi
chown -R user: /home/user

echo "$@"
exec /sbin/su-exec user surge --project /usr/src/app --domain "$DOMAIN" "$@"
