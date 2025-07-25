#!/bin/bash

# Variables
INTERFACE="eth0"
STATIC_IP="192.168.1.100"
CIDR="24"
GATEWAY="192.168.1.1"
DNS1="8.8.8.8"
CON_NAME="static-$INTERFACE"

# Function to set a static IP
configure_static_ip() {
    echo "Configuring static IP..."
    sudo nmcli con add type ethernet autoconnect yes con-name "$CON_NAME" ifname "$INTERFACE"
    sudo nmcli con mod "$CON_NAME" ipv4.addresses "$STATIC_IP/$CIDR"
    sudo nmcli con mod "$CON_NAME" ipv4.gateway "$GATEWAY"
    sudo nmcli con mod "$CON_NAME" ipv4.dns "$DNS1"
    sudo nmcli con mod "$CON_NAME" ipv4.method manual
    echo "Static IP configuration done."
}

# Function to restart the network service
restart_network() {
    echo "Restarting network service..."
    sudo nmcli con down "$CON_NAME"
    sudo nmcli con up "$CON_NAME"
    echo "Network service restarted."
}

# Function to display current network configuration
show_network_config() {
    echo "Current network configuration:"
    ip addr show "$INTERFACE"
    echo "current connections:"
    nmcli connection show
}

# Function to automate the whole network configuration
automate_network_config() {
    configure_static_ip
    restart_network
    show_network_config
}

# Execute the automation function
automate_network_config

