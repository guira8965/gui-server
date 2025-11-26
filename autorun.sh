if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Attempting to re-run with sudo..."
    exec sudo bash "$0" "$@"
    exit $? # Exit if sudo fails
fi

echo "Script is running with root previleges."

read -p "Press ENTER to continue..."

echo "Moving gui.sh to /usr/local/bin/"
mv gui.sh /usr/local/bin

echo "Moving gui.service to /etc/systemd/system/gui.service"
mv gui.service /etc/systemd/system/gui.service

echo "Reloading systemd."
systemctl daemon-reload
echo "Enabling and starting gui.service"
systemctl enable --now gui.service

read -p "Press ENTER to exit."
echo "Autorun script complete."