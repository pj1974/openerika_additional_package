#!/bin/bash

# Stop immediately if any executed command has exit status different from 0.
set -eux

usage() {
  echo "Usage: analyze.sh ANALYSIS" 1>&2
  echo "  where ANALYSIS is the basename of an ECL configuration file" 1>&2
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

ANALYSIS=$1

# Directory where this script resides: usually in a directory named "ECLAIR".
SCRIPT_DIR="$(
  cd "$(dirname "$0")"
  echo "${PWD}"
)"

source "${SCRIPT_DIR}/parameters.sh"

# Absolute path of the ECLAIR bin directory.
ECLAIR_PATH="${ECLAIR_PATH:-/opt/bugseng/eclair/bin}"

TOP="${SCRIPT_DIR%sca/ECLAIR}"
# Directory where to put all ECLAIR output and temporary files.
ECLAIR_OUTPUT_DIR="${PWD}/out"

# ECLAIR binary data directory and workspace.
export ECLAIR_DATA_DIR="${ECLAIR_OUTPUT_DIR}/.data"
# ECLAIR workspace.
export ECLAIR_WORKSPACE="${ECLAIR_DATA_DIR}/eclair_workspace"
# Destination file for the ECLAIR diagnostics.
export ECLAIR_DIAGNOSTICS_OUTPUT="${ECLAIR_OUTPUT_DIR}/DIAGNOSTICS.txt"

# Identifies the particular build of the project.
export ECLAIR_PROJECT_NAME="your-project"
# All paths mentioned in ECLAIR reports that are below this directory
# will be presented as relative to ECLAIR_PROJECT_ROOT.
export ECLAIR_PROJECT_ROOT="${PWD}"

# Erase and recreate the output directory and the data directory.
rm -rf "${ECLAIR_OUTPUT_DIR}"
mkdir -p "${ECLAIR_DATA_DIR}"

(
  cd "${TOP}"
  cmake --build obj --target clean --parallel 4
  # Perform the build (from scratch) in an ECLAIR environment.
  "${ECLAIR_PATH}/eclair_env" "-eval_file='${SCRIPT_DIR}/${ANALYSIS}.ecl'" \
    -- cmake --build obj --target all --parallel 4
)

# Create the project database.
PROJECT_ECD="${ECLAIR_OUTPUT_DIR}/PROJECT.ecd"
"${ECLAIR_PATH}/eclair_report" "-create_db='${PROJECT_ECD}'" \
  "${ECLAIR_DATA_DIR}"/FRAME.*.ecb \
  -load

