if [ -z "${PUB_ACCESS_TOKEN}" ]; then
  echo "Missing PUB_ACCESS_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_REFRESH_TOKEN}" ]; then
  echo "Missing PUB_REFRESH_TOKEN environment variable"
  exit 1
fi

cat <<EOF > ~/.pub-cache/credentials.json
{
  "accessToken":"${PUB_ACCESS_TOKEN}",
  "refreshToken":"${PUB_REFRESH_TOKEN}",
  "tokenEndpoint":"https://accounts.google.com/o/oauth2/token",
  "scopes":["https://www.googleapis.com/auth/userinfo.email","openid"],
  "expiration":1630507080060
}
EOF
