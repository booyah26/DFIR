#!/bin/bash

# Made to retrieve PCAPs from SO Forward Nodes
# Written by booyah26
# Version 0.3
# 29 Sep 20

# Use a linux or kali machine for this script

# Steps for 1st time use if not taken from github:
# 1. sudo chmod +x pcapRetrieval.sh		-set execution rights
# 2. sudo vi pcapRetrieval.sh
# 3. :e ++ff=dos						-read file as dos format
# 4. :set ff=unix						-converts to unix format
# 5. :wq								-saves the file
	

#############Edit this only####################

# Declare date variable

#dateFolder= date +'%Y-%m-%d'	# Not currently working. Adds a fwd slash to the variable (//2020-09-28) when used. Solution could use ${dateFolder:1} in variable...
dateFolder=2020-09-29			# Comment out if using the above.

###############################################

# PCAPs are loaded into home/[user]/Scratch/....

localFolder1=Scratch/node1
localFolder2=Scratch/node2
localFolder3=Scratch/node3
localFolder4=Scratch/node4
localFolder5=Scratch/node5

cd ~
#Make Scratch & node directories
mkdir -p ~/Scratch/{node1,node2,node3,node4,node5}

#Make directories for Node 1 interfaces
mkdir $localFolder1/{ens161,ens224,ens256}
#Make directories for Node 2 interfaces
mkdir $localFolder2/{ens161,ens193,ens224,ens225,ens256,ens257}
#Make directories for Node 3 interfaces
mkdir $localFolder3/{ens161,ens224,ens256}
#Make directories for Node 4 interfaces
mkdir $localFolder4/{ens161,ens193,ens224,ens256}
#Make directories for Node 5 interfaces
mkdir $localFolder5/{ens161,ens193,ens224,ens225,ens256}

# There are ways to hardcode an ssh password, but for security & best-practice I have avoided it here because the password is simple anyway
# Possible to retrieve multiple files/directories in one command, but can only drop them into a single folder.
# scp seconion@[ip]:'[file] [file] [file]' [destination]
# Could implement a loop solution.

# Can skip machines with ctrl+c

# PCAPS from Forward Node 1
echo "Retrieving from SO-Forward Node 1..."
scp seconion@192.168.1.93:/nsm/sensor_data/seconion-virtual-machine-ens161/dailylogs/$dateFolder/* $localFolder1/ens161/
scp seconion@192.168.1.93:/nsm/sensor_data/seconion-virtual-machine-ens224/dailylogs/$dateFolder/* $localFolder1/ens224/
scp seconion@192.168.1.93:/nsm/sensor_data/seconion-virtual-machine-ens256/dailylogs/$dateFolder/* $localFolder1/ens256/

# PCAPS from Forward Node 2
echo "Retrieving from SO-Forward Node 2..."
scp seconion@192.168.1.94:/nsm/sensor_data/seconion-virtual-machine-ens161/dailylogs/$dateFolder/* $localFolder2/ens161/
scp seconion@192.168.1.94:/nsm/sensor_data/seconion-virtual-machine-ens193/dailylogs/$dateFolder/* $localFolder2/ens193/
scp seconion@192.168.1.94:/nsm/sensor_data/seconion-virtual-machine-ens224/dailylogs/$dateFolder/* $localFolder2/ens224/
scp seconion@192.168.1.94:/nsm/sensor_data/seconion-virtual-machine-ens225/dailylogs/$dateFolder/* $localFolder2/ens225/
scp seconion@192.168.1.94:/nsm/sensor_data/seconion-virtual-machine-ens256/dailylogs/$dateFolder/* $localFolder2/ens256/
scp seconion@192.168.1.94:/nsm/sensor_data/seconion-virtual-machine-ens257/dailylogs/$dateFolder/* $localFolder2/ens257/

# PCAPS from Forward Node 3
echo "Retrieving from SO-Forward Node 3..."
scp seconion@192.168.1.95:/nsm/sensor_data/seconion-virtual-machine-ens161/dailylogs/$dateFolder/* $localFolder3/ens161/
scp seconion@192.168.1.95:/nsm/sensor_data/seconion-virtual-machine-ens224/dailylogs/$dateFolder/* $localFolder3/ens224/
scp seconion@192.168.1.95:/nsm/sensor_data/seconion-virtual-machine-ens256/dailylogs/$dateFolder/* $localFolder3/ens256/

# PCAPS from Forward Node 4
echo "Retrieving from SO-Forward Node 4..."
scp seconion@192.168.1.97:/nsm/sensor_data/so-forward-node-4-ens161/dailylogs/$dateFolder/* $localFolder4/ens161/
scp seconion@192.168.1.97:/nsm/sensor_data/so-forward-node-4-ens193/dailylogs/$dateFolder/* $localFolder4/ens193/
scp seconion@192.168.1.97:/nsm/sensor_data/so-forward-node-4-ens224/dailylogs/$dateFolder/* $localFolder4/ens224/
scp seconion@192.168.1.97:/nsm/sensor_data/so-forward-node-4-ens256/dailylogs/$dateFolder/* $localFolder4/ens256/

# PCAPS from Forward Node 5
echo "Retrieving from SO-Forward Node 5..."
scp seconion@192.168.1.96:/nsm/sensor_data/so-forward-node-5-ens161/dailylogs/$dateFolder/* $localFolder5/ens161/
scp seconion@192.168.1.96:/nsm/sensor_data/so-forward-node-5-ens193/dailylogs/$dateFolder/* $localFolder5/ens193/
scp seconion@192.168.1.96:/nsm/sensor_data/so-forward-node-5-ens224/dailylogs/$dateFolder/* $localFolder5/ens224/
scp seconion@192.168.1.96:/nsm/sensor_data/so-forward-node-5-ens225/dailylogs/$dateFolder/* $localFolder5/ens225/
scp seconion@192.168.1.96:/nsm/sensor_data/so-forward-node-5-ens256/dailylogs/$dateFolder/* $localFolder5/ens256/
