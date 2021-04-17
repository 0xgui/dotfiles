# Notes:

## MDADM:
- Copy script to ~/.config
- Copy mdadm.conf to /etc/mdadm.conf for the pop up notifications for the RAID array
- Don't forget to change UUID and location of script
- Test notification using mdadm --monitor --test --scan

## NUT:
```
   sudo apt-get update && sudo apt-get install nut nut-cgi fcgiwrap nginx
```
-   Copy the nginx folder to the NGINX configuration to /etc/nginx/

-   Copy the nut folder to the NUT config to /etc/nut

```
   sudo chown www-data:www-data /usr/lib/cgi-bin/nut/*.cgi
   reboot
```
-   Stats page at http://your_IP:8080/nut 
