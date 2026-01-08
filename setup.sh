#!/bin/bash

#variables
USER_BARU="turing_runner"
PACKAGES=("git" "curl" "docker-ce" "psmisc")

echo "--- [Mulai Setup Otomatis] ---"

# 1. Check User
if id "$USER_BARU" &>/dev/null; then
  echo "[SKIP] User $USER_BARU sudah ada!"
else
  sudo useradd -m -s /bin/bash "$USER_BARU"
  echo "[OK] User $USER_BARU berhasil dibuat!"
fi


# 2. Update dan Install 
sudo apt update -y

for pkg in "${PACKAGES[@]}"; do
  if dpkg -l | grep -q "^ii  $pkg "; then
    echo "[SKIP] $pkg sudah terinstall."
  else
    echo "[INSTALL] memasang $pkg..."
    sudo apt install -y "$pkg"
  fi
done

echo "--- [SETUP Berhasil] ---"
