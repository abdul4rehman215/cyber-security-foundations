#!/usr/bin/env python3
import pandas as pd
import numpy as np

class LogAnalyzer:
    def __init__(self, log_file_path):
        self.log_file_path = log_file_path
        self.parsed_logs = None

    def parse_logs(self):
        rows = []
        with open(self.log_file_path) as f:
            for line in f:
                parts = line.strip().split(" | ")
                if len(parts) == 5:
                    rows.append(parts)

        df = pd.DataFrame(rows, columns=["timestamp","level","ip","user","activity"])
        df["timestamp"] = pd.to_datetime(df["timestamp"])
        self.parsed_logs = df

    def detect_failed_login_anomalies(self, threshold=5):
        failed = self.parsed_logs[self.parsed_logs["activity"].str.contains("failed", case=False)]
        return failed["user"].value_counts()[lambda x: x > threshold]

    def detect_ip_anomalies(self):
        counts = self.parsed_logs["ip"].value_counts()
        mean = counts.mean()
        std = counts.std()
        threshold = mean + 2 * std
        return counts[counts > threshold]

    def detect_time_based_anomalies(self):
        self.parsed_logs["hour"] = self.parsed_logs["timestamp"].dt.hour
        after_hours = self.parsed_logs[(self.parsed_logs["hour"] < 9) | (self.parsed_logs["hour"] > 17)]
        return after_hours["user"].value_counts()

    def detect_keyword_anomalies(self):
        keywords = ["injection","malware","unauthorized","escalation","scanning"]
        mask = self.parsed_logs["activity"].str.contains("|".join(keywords), case=False)
        return self.parsed_logs[mask]

    def generate_summary_report(self):
        print("=== Summary ===")
        print("Total entries:", len(self.parsed_logs))
        print("Warnings:", len(self.parsed_logs[self.parsed_logs["level"] == "WARNING"]))
        print("Unique users:", self.parsed_logs["user"].nunique())
        print("Unique IPs:", self.parsed_logs["ip"].nunique())
        print("Time range:", self.parsed_logs["timestamp"].min(), "->", self.parsed_logs["timestamp"].max())

def main():
    analyzer = LogAnalyzer("../logs/system.log")
    analyzer.parse_logs()

    print("Failed login anomalies:")
    print(analyzer.detect_failed_login_anomalies())

    print("\nSuspicious IPs:")
    print(analyzer.detect_ip_anomalies())

    print("\nAfter-hours activity:")
    print(analyzer.detect_time_based_anomalies())

    print("\nKeyword-based anomalies:")
    print(analyzer.detect_keyword_anomalies()[["timestamp","user","activity"]])

    analyzer.generate_summary_report()

if __name__ == "__main__":
    main()
