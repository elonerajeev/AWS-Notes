# 🌐 **Network Setup Guide** 🚀

Welcome to the **Network Setup Guide**! This guide will help you understand the basics of **IP addresses**, classes, public and private IPs, and how to configure them for different environments. 🛠️

---

## 📖 **Understanding IP Addresses**

In any network setup, devices communicate with each other using **IP addresses**. There are two main types of IP addresses:  
1. **IPv4:** Shorter addresses, like phone numbers for devices. 📞  
2. **IPv6:** Longer addresses, similar to phone numbers but with more digits. 🔢

---

## 🔍 **IP Address Ranges**

IPv4 addresses range from `0.0.0.0` to `255.255.255.255` and are divided into five classes: **A, B, C, D, and E**.

- 🅰️ **Class A:** `1.0.0.0` to `126.255.255.255`
- 🅱️ **Class B:** `128.0.0.0` to `191.255.255.255`
- 🅲 **Class C:** `192.0.0.0` to `223.255.255.255`

💡 **Note:** Classes **D** and **E** are reserved for specific purposes and are not commonly used.

---

## 🔁 **Loopback Address**

You might wonder why `127` is skipped. 🤔  
`127.0.0.1` is reserved for **loopback**, meaning a device pings itself. This is often used for testing and troubleshooting purposes. ✅

---

## 🌐 **Public and Private IPs**

As IP addresses are limited, there is a concept of **public** and **private** IPs:  
- **Public IPs:** 🌎 Used for communication over external networks.  
- **Private IPs:** 🔒 Used internally within closed infrastructures or office environments.  

---

### 🏡 **Private IP Ranges**

Private IPs are reserved within specific ranges:  
- 🏠 `10.0.0.0` to `10.255.255.255` (`10/8 prefix`)  
- 🏠 `172.16.0.0` to `172.31.255.255` (`172.16/12 prefix`)  
- 🏠 `192.168.0.0` to `192.168.255.255` (`192.168/16 prefix`)  

💡 **These addresses are for internal use only** and should not be accessible from outside the network.

---

## 🛠️ **Configuring IP Addresses**

### 💻 **Example**

To demonstrate:  
1. Open CMD and type `ipconfig` to view your **IPv4 private address**.  
2. Search "my public IP" on Google to find your **public IP address**.

---



In the diagram above, you can see how **public** and **private** IPs are used in different environments. 🌍✨

---

🎉 **Now you have a basic understanding of IP addresses, classes, and how to use public and private IPs effectively.**  
Happy networking! 🌟
