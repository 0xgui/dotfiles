# Notes:

## MDADM:
- Add PROGRAM at /etc/mdadm.conf for the pop up notifications for the RAID array


## NUT:
    ```
-   sudo apt-get update && sudo apt-get install nut nut-cgi fcgiwrap nginx
    ```

-   Copy the nginx folder to the NGINX configuration to /etc/nginx/

-   Copy the nut folder to the NUT config to /etc/nut

    ```
-   sudo chown www-data:www-data /usr/lib/cgi-bin/nut/*.cgi
-   reboot
    ```

 -   Then, visit your stats page at http://your_IP/nut 
