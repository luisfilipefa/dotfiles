#!/bin/bash

if [ -d "~/.ssh" ]; then
    chmod 700 -R ~/.ssh
    chmod 600 ~/.ssh/*
    chmod 644 ~/.ssh/*.pub
fi
