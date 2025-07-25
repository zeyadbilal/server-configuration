# 🌐 Server Network Configurator (Bash)

A lightweight Bash script to automate static IP setup on a Linux server using `nmcli`.  
Ideal for system admins, VM setups, and anyone needing consistent and fast IP configuration.

---

## 🧠 Overview

This project provides a ready-to-use Bash script that:
- Configures a static IP address for a given network interface.
- Sets gateway and DNS settings.
- Brings the new connection up and displays current network status.

It’s especially useful for system administrators or developers managing servers or virtual machines with manual IP setup needs.

---

## 📁 Project Structure

```bash
network_config.sh    # Main Bash script to configure static network settings
```

---

## ⚙️ Features

- 🌐 Sets a **static IP address** to a specific interface
- 🚪 Configures **gateway**
- 🌍 Sets **DNS server**
- 🔁 Restarts the network connection automatically
- 📡 Displays **current IP & connection info**

---

## 🧠 How It Works

The script uses `nmcli` to define and apply a manual network profile.

```bash
INTERFACE="eth0"
STATIC_IP="192.168.1.100"
CIDR="24"
GATEWAY="192.168.1.1"
DNS1="8.8.8.8"
CON_NAME="static-$INTERFACE"
```

---

### 🔧 Static IP Configuration

```bash
sudo nmcli con add type ethernet autoconnect yes con-name "$CON_NAME" ifname "$INTERFACE"
sudo nmcli con mod "$CON_NAME" ipv4.addresses "$STATIC_IP/$CIDR"
sudo nmcli con mod "$CON_NAME" ipv4.gateway "$GATEWAY"
sudo nmcli con mod "$CON_NAME" ipv4.dns "$DNS1"
sudo nmcli con mod "$CON_NAME" ipv4.method manual
```

---

### 🔁 Restarting Network

```bash
sudo nmcli con down "$CON_NAME"
sudo nmcli con up "$CON_NAME"
```

---

### 📡 Display Network Info

```bash
ip addr show "$INTERFACE"
nmcli connection show
```

---

### 🤖 Automate All Steps

```bash
automate_network_config() {
    configure_static_ip
    restart_network
    show_network_config
}
```

Main function is triggered at the end of the script:

```bash
automate_network_config
```

---

## 🚀 Usage

1. **Make the script executable:**

```bash
chmod +x network_config.sh
```

2. **Run the script:**

```bash
./network_config.sh
```

🛡️ You'll need `sudo` privileges since the script modifies network settings.

---

## 🧪 Example Output

```txt
Configuring static IP...
Static IP configuration done.
Restarting network service...
Network service restarted.
Current network configuration:
...
current connections:
...
```

---

## 🛠️ Requirements

- Linux system with `nmcli` (comes with NetworkManager)
- `sudo` access

---

## 📌 Author

**Zeyad Bilal**  
Server Automation Scripts | GitHub: [zeyadbilal]
