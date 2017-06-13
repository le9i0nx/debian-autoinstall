#!/bin/sh
mkdir /root/.ssh
chmod 0700 /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC753PqNZfK44HWt5QyrOSVZi3/mgqTKeEoXmS7Ej0nXPWqRhRnm+SQg+hbNEAgomB7VhLPrZP5mlXWfyKebB/QRZ3CZoKdfqEZKVaqfoYoC6P/f5sQ8X7NqMKc+ecozQtIR3IaCfjBpT3Nm+3NCOXF9dOHhY8I6GucoHOmGD3swCqLpYQO9PoCRCdWZicHIgnUVqXjbCUR+fTVWeXSkthF+afCBx3jwOunzDm6FiiLezsduKyvWTNv/J1eHaFQjJF/YCVTtEKK21XI/VSuoN6eUJdduEKC7rtiKW4eaAXNWPzPRuPhxzbMys66EefpLxAISPA/eu3AzMZWGz/lgA8j root@local" >> /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys
