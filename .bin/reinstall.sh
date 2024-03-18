find . -name "node_modules" -type d -prune -exec rm -rf '{}' + && rm yarn.lock

yarn

echo "RWS reinstall finished!"