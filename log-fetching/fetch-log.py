import os
from re import match


def fetch_logs(file_name):
    ips = {}
    pattern = "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
    for log_file in file_name:
        content = open(log_file, "r")
        for line in content:
            ip = line.split(" ")[0]
            if match(pattern, ip):
                ips[ip] = ips.get(ip, 0) + 1

    return ips


def calculate_total_hits(ip_hits_dictionnary):
    total = 0
    for ip in ip_hits_dictionnary:
        total += ip_hits_dictionnary[ip]
    return f"Total hits : {total}"


calculate_total_hits(
    fetch_logs(["/var/log/apache2/access.log", "/var/log/apache2/access.log.1"])
)
