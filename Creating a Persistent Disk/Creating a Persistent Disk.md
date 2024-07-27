# Creating a Persistent Disk || [GSP004]

## Commands to Run in Cloud Shell

1. **Set the Zone:**
    ```bash
    export ZONE=
    ```

2. **Run the Script:**
    ```bash
    curl -LO raw.githubusercontent.com/AmanJain18/Arcade_Labs_Solutions/main/Creating%20a%20Persistent%20Disk/gsp004.sh

    sudo chmod +x gsp004.sh

    ./gsp004.sh
    ```

### Congratulations on Completing the Lab!

---

## Overview
In this lab, you'll explore **Google Compute Engine**, which allows you to create and run virtual machines (VMs) on Google infrastructure. You can choose from various operating systems, including multiple flavors of Linux (e.g., Debian, Ubuntu, Suse, Red Hat, CoreOS) and Windows Server.

**Compute Engine** provides persistent disks as primary storage for your VMs. These disks function like physical hard drives, existing independently of the VM instance. If an instance is deleted, the attached persistent disk retains its data and can be attached to another instance.

Persistent disks come in two types:
- **Standard Persistent Disk**
- **SSD Persistent Disk**

Each type has different capacity limits and performance characteristics. You can read more about these in the [Persistent Disk documentation](https://cloud.google.com/compute/docs/disks).

In this hands-on lab, you'll learn how to create a persistent disk and attach it to a virtual machine.

## Real-Life Application
Persistent disks are crucial in real-world applications where data durability and reliability are essential. For instance, in web hosting, database management, and cloud storage services, having persistent storage that remains intact even after VM termination ensures data continuity and reliability.

## What This Lab Is About
In this lab, you will:
- Create a new VM instance and attach a persistent disk.
- Format and mount the persistent disk.

These skills are fundamental for managing cloud-based infrastructures, where VMs and persistent storage are frequently used to deploy scalable and reliable applications.