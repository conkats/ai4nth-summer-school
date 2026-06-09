#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------
# AI for NTH Summer School - Linux/WSL launcher
# Assumes this script lives in: AI_NTH_Bundle/scripts/
# ------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

ENV_ARCHIVE="${BUNDLE_DIR}/env/ai-nth-summerschool_linux.tar.gz"
ENV_DIR="${BUNDLE_DIR}/portable_env"
PYTHON_EXE="${ENV_DIR}/bin/python"
CONDA_UNPACK="${ENV_DIR}/bin/conda-unpack"
UNPACK_MARKER="${ENV_DIR}/.conda_unpacked_done"

VERIFY_NOTEBOOK="${BUNDLE_DIR}/verify/00_verify_environment.ipynb"
NOTEBOOKS_DIR="${BUNDLE_DIR}/notebooks"

echo
echo "============================================"
echo "AI for NTH Summer School - Jupyter Launcher"
echo "============================================"
echo "Bundle directory: ${BUNDLE_DIR}"
echo

# OS check: this archive is Linux-only
case "$(uname -s)" in
  Linux*) ;;
  *)
    echo "ERROR: This launcher is for Linux/WSL only."
    echo "A separate conda-pack archive must be built on macOS for macOS users."
    exit 1
    ;;
esac

# Basic checks
if [[ ! -f "${ENV_ARCHIVE}" ]]; then
  echo "ERROR: Environment archive not found:"
  echo "  ${ENV_ARCHIVE}"
  echo
  echo "Please check that the bundle was copied correctly."
  exit 1
fi

if [[ ! -d "${NOTEBOOKS_DIR}" ]]; then
  echo "WARNING: notebooks directory not found:"
  echo "  ${NOTEBOOKS_DIR}"
  echo
fi

# First-run unpack
if [[ ! -x "${PYTHON_EXE}" || ! -f "${UNPACK_MARKER}" ]]; then
  echo "First launch detected. Extracting the portable environment..."
  echo "This may take a few minutes."
  echo

  rm -rf "${ENV_DIR}"
  mkdir -p "${ENV_DIR}"

  tar -xzf "${ENV_ARCHIVE}" -C "${ENV_DIR}"

  if [[ -x "${CONDA_UNPACK}" ]]; then
    echo "Running conda-unpack to fix environment paths..."
    "${CONDA_UNPACK}"
    touch "${UNPACK_MARKER}"
  else
    echo "ERROR: conda-unpack not found:"
    echo "  ${CONDA_UNPACK}"
    echo "The packed environment may be incomplete."
    exit 1
  fi
fi

cd "${BUNDLE_DIR}"

echo
echo "Launching JupyterLab..."
echo

if [[ -f "${VERIFY_NOTEBOOK}" ]]; then
  exec "${PYTHON_EXE}" -m jupyter lab \
    --ServerApp.root_dir="${BUNDLE_DIR}" \
    "${VERIFY_NOTEBOOK}"
else
  exec "${PYTHON_EXE}" -m jupyter lab \
    --ServerApp.root_dir="${BUNDLE_DIR}" \
    "${NOTEBOOKS_DIR}"
fi
