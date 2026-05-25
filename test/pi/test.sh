#!/usr/bin/env bash
set -e

echo "==> Verifying pi is installed..."

# Check that the pi binary exists on PATH
if ! command -v pi >/dev/null 2>&1; then
	echo "FAIL: pi binary not found on PATH"
	exit 1
fi

PI_VERSION=$(pi --version 2>&1 || echo "unknown")
echo "pi version: ${PI_VERSION}"

# Check that the config mount env var is set
if [ -z "${PI_CODING_AGENT_DIR}" ]; then
	echo "FAIL: PI_CODING_AGENT_DIR is not set"
	exit 1
fi

echo "PI_CODING_AGENT_DIR=${PI_CODING_AGENT_DIR}"

# Verify the node dependency was pulled in
if ! command -v node >/dev/null 2>&1; then
	echo "FAIL: node not found (dependency check)"
	exit 1
fi

echo "node version: $(node --version)"

echo "==> All checks passed!"
