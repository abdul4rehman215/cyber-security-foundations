#!/usr/bin/env python3
import pandas as pd
from sklearn.ensemble import IsolationForest, RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
import pickle

class MLThreatDetector:
    def __init__(self, log_file):
        self.log_file = log_file

    def load_and_preprocess_data(self):
        df = pd.read_csv(self.log_file, sep=" \\| ", engine="python",
                         names=["timestamp","level","ip","user","activity"])
        df["timestamp"] = pd.to_datetime(df["timestamp"])
        return self.extract_features(df)

    def extract_features(self, df):
        df["hour"] = df["timestamp"].dt.hour
        df["day_of_week"] = df["timestamp"].dt.dayofweek
        df["is_weekend"] = df["day_of_week"].isin([5,6]).astype(int)
        df["is_business_hours"] = df["hour"].between(9,17).astype(int)
        df["is_private_ip"] = df["ip"].str.startswith(("10.","192.168")).astype(int)
        df["activity_length"] = df["activity"].str.len()
        df["has_failed"] = df["activity"].str.contains("failed",case=False).astype(int)
        df["has_unauthorized"] = df["activity"].str.contains("unauthorized",case=False).astype(int)
        df["has_injection"] = df["activity"].str.contains("injection",case=False).astype(int)
        df["is_threat"] = (df["level"]=="WARNING").astype(int)
        return df

    def prepare_ml_features(self, df):
        features = ["hour","day_of_week","is_weekend","is_business_hours",
                    "is_private_ip","activity_length","has_failed",
                    "has_unauthorized","has_injection"]
        X = df[features]
        y = df["is_threat"]
        return X, y, features

    def train_models(self, X, y):
        iso = IsolationForest(contamination=0.1, random_state=42)
        iso.fit(X)

        X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.3,random_state=42)
        rf = RandomForestClassifier(n_estimators=100, random_state=42)
        rf.fit(X_train,y_train)

        preds = rf.predict(X_test)
        print(classification_report(y_test,preds))
        return iso, rf

    def save_models(self, iso, rf, features):
        pickle.dump(iso, open("../models/isolation_forest.pkl","wb"))
        pickle.dump(rf, open("../models/random_forest.pkl","wb"))
        pickle.dump(features, open("../models/feature_names.pkl","wb"))

def main():
    detector = MLThreatDetector("../logs/system.log")
    df = detector.load_and_preprocess_data()
    X,y,features = detector.prepare_ml_features(df)
    iso,rf = detector.train_models(X,y)
    detector.save_models(iso,rf,features)

if __name__ == "__main__":
    main()
