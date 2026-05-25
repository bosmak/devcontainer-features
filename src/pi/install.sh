#!/usr/bin/env bash
set -e

echo "Activating feature 'pi'"

VERSION=${VERSION:-latest}

# Ensure npm global bin directory exists and is on PATH
NPM_GLOBAL_PREFIX="/usr/local/share/npm-global"
mkdir -p "${NPM_GLOBAL_PREFIX}/bin"
npm config set prefix "${NPM_GLOBAL_PREFIX}" 2>/dev/null || true
export PATH="${NPM_GLOBAL_PREFIX}/bin:${PATH}"

# Determine the package specifier
if [ "${VERSION}" = "latest" ]; then
	PACKAGE="@earendil-works/pi-coding-agent"
else
	PACKAGE="@earendil-works/pi-coding-agent@${VERSION}"
fi

echo "Installing pi (${PACKAGE})..."

npm install -g --ignore-scripts "${PACKAGE}"

echo "Verifying installation..."
if command -v pi >/dev/null 2>&1; then
	PI_VERSION=$(pi --version 2>&1 || echo "unknown")
	echo "pi ${PI_VERSION} installed successfully to $(command -v pi)"
else
	echo "Warning: pi binary not found on PATH after install"
fi

# Set up convenience: expose pi binary location as a well-known env var
echo "export PI_CODING_AGENT_DIR=\"\${PI_CODING_AGENT_DIR:-${_REMOTE_USER_HOME}/.pi/agent}\"" >>/etc/profile.d/pi.sh 2>/dev/null || true

echo "Done."
