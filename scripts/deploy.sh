#! /bin/bash
set -e

git restore . && git clean -f -d


echo "🗳️ Rebase branch"
git fetch && git rebase

echo "🔍 Checking golang version"
go version

echo "🗂️ Install go dependencies"
go mod tidy -v


echo "🛠️ Building idomatic"
go build -o bin/idomatic cmd/main.go
sudo chmod +x bin/idomatic

echo "Restart idomatic service"
sudo systemctl restart idomatic-api.service
sudo systemctl status idomatic-api.service

echo "Restart Idomatic Worker service"
sudo systemctl restart idomatic-worker.service
sudo systemctl status idomatic-worker.service

echo "🎉 Deployed Idomatic successfully"