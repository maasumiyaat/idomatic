.PHONY: all check test fmt vet lint vulncheck build clean install-tools install-git-hooks prepare-dev

# === Default target ===
all: check

# === Testing ===
test:
	@echo "🧪 Running tests..."
	go test -v -parallel 4 ./...

# === Formatting ===
fmt:
	@echo "✨ Formatting code..."
	gofmt -s -w .
	goimports -w .

fmt-check:
	@echo "🔍 Checking code formatting..."
	@if ! goimports -l . | grep -v vendor | head -1 | read; then \
		echo "✅ Code formatting is clean"; \
	else \
		echo "❌ Code not formatted correctly"; \
		goimports -l . | grep -v vendor; \
		exit 1; \
	fi

# === Vet & Lint ===
vet:
	@echo "🔍 Running go vet..."
	go vet ./...

lint:
	@echo "🧹 Running golangci-lint..."
	golangci-lint run --timeout 5m

lint-fast:
	golangci-lint run --fast --timeout=90s

# === Security ===
vulncheck:
	@echo "🔒 Running govulncheck..."
	govulncheck ./...

# === Optimization ===
fieldalignment:
	fieldalignment ./...

# === Build & Clean ===
build:
	@echo "🏗️ Building project..."
	go build -o bin/app ./...

clean:
	@echo "🧼 Cleaning build artifacts..."
	go clean ./...
	rm -rf bin coverage.out coverage.html

# === Combined Commands ===
check: fmt-check vet lint test vulncheck
	@echo "✅ All checks passed!"

prepare-dev: install-tools install-git-hooks
	@echo "🚀 Dev environment ready!"

# === Setup Tools ===
install-tools:
	@echo "⬇️ Installing developer tools..."
	go install golang.org/x/tools/cmd/goimports@latest
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install golang.org/x/tools/go/analysis/passes/fieldalignment/cmd/fieldalignment@latest
	go install golang.org/x/vuln/cmd/govulncheck@latest

# === Git Hooks ===
install-git-hooks:
	@echo "🔧 Installing git hooks..."
	@mkdir -p .git/hooks
	@chmod +x scripts/git-hooks/commit-msg scripts/git-hooks/pre-commit
	@cp scripts/git-hooks/commit-msg .git/hooks/commit-msg
	@cp scripts/git-hooks/pre-commit .git/hooks/pre-commit
	@echo "✅ Installed git hooks: commit-msg, pre-commit"
