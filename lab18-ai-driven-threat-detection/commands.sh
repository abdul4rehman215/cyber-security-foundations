#!/bin/bash

# Install dependencies
pip3 install --user pandas numpy scikit-learn matplotlib

# Generate logs
python3 scripts/generate_logs.py

# Statistical analysis
python3 scripts/log_analyzer.py

# Real-time monitoring
python3 scripts/real_time_monitor.py

# Machine learning training
python3 scripts/ml_threat_detector.py
