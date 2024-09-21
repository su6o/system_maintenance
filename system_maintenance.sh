#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Banner
echo -e "${RED}############################################################"
echo -e "#   System Maintenance & Security Check Automation Script   #"
echo -e "#             Instagram: https://www.instagram.com/su6o.in  #"
echo -e "############################################################${NC}\n"

# Function for system update and upgrade
update_system() {
    echo -e "${GREEN}Updating and upgrading the system...${NC}"
    sudo apt update && sudo apt full-upgrade -y
}

# Function for disk cleanup
clean_system() {
    echo -e "${GREEN}Cleaning up system logs and cache...${NC}"
    sudo apt autoremove -y
    sudo apt autoclean -y
    sudo rm -rf /var/log/*
    sudo rm -rf /var/cache/*
    echo -e "${GREEN}System cleanup complete.${NC}"
}

# Function for running security audits
run_security_checks() {
    echo -e "${GREEN}Running security audits...${NC}"
    sudo chkrootkit
    sudo lynis audit system
    sudo freshclam
    sudo clamscan -r /home
    echo -e "${GREEN}Security checks complete.${NC}"
}

# Function to check firewall status
check_firewall() {
    echo -e "${GREEN}Checking firewall status...${NC}"
    sudo ufw status || sudo iptables -L
}

# Function to scan for open ports using nmap
network_scan() {
    echo -e "${GREEN}Running a quick network scan...${NC}"
    sudo nmap -T4 -F localhost
}

# Function to check users with sudo privileges
check_sudo_users() {
    echo -e "${GREEN}Listing users with sudo privileges...${NC}"
    getent group sudo | cut -d: -f4
}

# Function to check SSH configuration
check_ssh_config() {
    echo -e "${GREEN}Checking SSH configuration...${NC}"
    sudo grep -i "permitrootlogin" /etc/ssh/sshd_config
    sudo grep -i "passwordauthentication" /etc/ssh/sshd_config
}

# Function to reboot or shutdown
system_reboot_shutdown() {
    echo -e "${RED}Select an option:${NC}"
    echo "1) Reboot"
    echo "2) Shutdown"
    echo "3) Exit"

    echo -e "\n${RED}Enter your choice:${NC}"
    read choice
    case $choice in
        1)
            echo -e "${GREEN}Rebooting...${NC}"
            sudo reboot
            ;;
        2)
            echo -e "${GREEN}Shutting down...${NC}"
            sudo shutdown now
            ;;
        3)
            echo -e "${GREEN}Exiting...${NC}"
            ;;
        *)
            echo -e "${RED}Invalid choice, exiting.${NC}"
            ;;
    esac
}

# Main Menu
while true; do
    echo -e "\n${RED}Select a task:${NC}"
    echo "1) Update and Upgrade System"
    echo "2) Clean System Logs and Cache"
    echo "3) Run Security Audits"
    echo "4) Check Firewall Status"
    echo "5) Perform Network Scan"
    echo "6) Check Sudo Privileged Users"
    echo "7) Check SSH Configuration"
    echo "8) Reboot/Shutdown Options"
    echo "9) Exit"

    echo -e "\n${RED}Enter your choice:${NC}"
    read option
    case $option in
        1) update_system ;;
        2) clean_system ;;
        3) run_security_checks ;;
        4) check_firewall ;;
        5) network_scan ;;
        6) check_sudo_users ;;
        7) check_ssh_config ;;
        8) system_reboot_shutdown ;;
        9) break ;;
        *) echo -e "${RED}Invalid option! Please try again.${NC}" ;;
    esac
done
