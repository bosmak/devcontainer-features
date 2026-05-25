#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

check "pi binary is installed" bash -c "command -v pi"
check "pi version command works" bash -c "pi --version"
check "PI_CODING_AGENT_DIR is set" bash -c "test -n \"${PI_CODING_AGENT_DIR}\""
check "PI_CODING_AGENT_DIR points to shared config mount" bash -c "test \"${PI_CODING_AGENT_DIR}\" = \"/usr/local/share/pi-agent-config\""

reportResults
