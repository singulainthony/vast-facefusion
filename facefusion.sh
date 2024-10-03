#!/bin/bash

echo "Launching FaceFusion... Reload webpage in browser in 10-15 seconds"

python3 -m webbrowser "http://127.0.0.1:7860/"

python3 /root/vast-facefusion/facefusion.py run
