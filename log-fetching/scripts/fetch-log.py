import os
from re import match


BASE_DIR = "/var/log/apache2/"


def get_access_log_files(base_dir: str) -> list:
    files = os.listdir(base_dir)
    access_log = []
    for log_file in files:
        if "access" in log_file and "gz" not in log_file:
            access_log.append(log_file)
    return access_log


def fetch_logs(file_name: str) -> dict:
    ips = {}
    pattern = "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
    for log_file in file_name:
        content = open(log_file, "r")
        for line in content:
            ip = line.split(" ")[0]
            if match(pattern, ip):
                ips[ip] = ips.get(ip, 0) + 1
    return ips


def calculate_total_hits(ip_hits_dictionnary: dict):
    total = 0
    for ip in ip_hits_dictionnary:
        print(ip, ip_hits_dictionnary[ip])
        total += ip_hits_dictionnary[ip]
    return f"Total hits : {total}"


fetch_logs(get_access_log_files())
