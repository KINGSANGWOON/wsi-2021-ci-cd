#!/bin/bash
cd /webapp/
nohup .venv/bin/python3 app.py > nohup_script.out 2>&1 & echo $! > app.pid