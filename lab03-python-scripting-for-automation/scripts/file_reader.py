import csv

print("Network Device Inventory:")
print("----------------------------------------")
print("Device Name | IP Address   | Status")
print("----------------------------------------")

with open("../data/network_devices.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        print(f"{row[0]:<12} | {row[1]:<13} | {row[2]}")
