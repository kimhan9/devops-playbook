#!/bin/bash
set -euo pipefail

dnf update -y
dnf install -y httpd
systemctl enable --now httpd
