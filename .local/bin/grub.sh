#!/bin/sh
VERSION="$(sudo strings /sys/firmware/acpi/tables/DSDT | grep -i 'windows ' | sort | tail -1)"
echo 'Linux kernel command-line options required: acpi_osi=! "acpi_osi='$VERSION'"'
read -p "Do you want to add this setting (y/n) ? " answer
if [ x$answer != xY -a x$answer != xy ]; then
  exit 1
fi
echo "Existing Command Line: ` sed -n '/.*linux[[:space:]].*root=\(.*\)/{s//BOOT_IMAGE=\1/ p;q;}' /boot/grub/grub.cfg `"
if grep -m 1 'acpi_osi=Windows' -q /etc/default/grub; then
  echo "There is already an entry; please remove it from /etc/default/grub and redo 'sudo update-grub' then re-run this script"
  exit 2
fi
sudo sed -i "s/^\(GRUB_CMDLINE_LINUX=.*\)\"$/\1 acpi_osi=! \\\\\"acpi_osi=$VERSION\\\\\"\"/" /etc/default/grub
echo "Modified Command Line: ` sed -n '/.*linux[[:space:]].*root=\(.*\)/{s//BOOT_IMAGE=\1/ p;q;}' /boot/grub/grub.cfg `"
sudo update-grub
