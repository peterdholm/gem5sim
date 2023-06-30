#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git
sudo apt-get install -y build-essential
sudo apt-get install -y python3 python3-dev python3-pip
sudo apt-get install -y scons swig zlib1g-dev protobuf-compiler libprotobuf-dev libgoogle-perftools-dev
sudo apt-get install -y python-is-python3

# Installing necessary Python packages
pip3 install six wrapt decorator protobuf

