# urserver-monitor

This is a simple workaround script for an issue with Unified Remote where urserver crashes on Linux systems when sending text from an OS keyboard in the Android app.

urserver-monitor.sh continually monitors the urserver process and restarts it if it has crashed after a short delay. 

The script should be set to run at login.

## Usage

You need bash and pidof on your system. You also need to know the path to the server start command, which is `/opt/urserver/urserver-start` by default.

Run the script with:

```bash
chmod +x urserver-monitor.sh
./urserver-monitor.sh
