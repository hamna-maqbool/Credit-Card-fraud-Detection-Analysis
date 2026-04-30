# Credit Card Fraud Detection System

![Python](https://img.shields.io/badge/Python-3.x-blue)
![ML](https://img.shields.io/badge/Machine%20Learning-XGBoost-red)
![SQL](https://img.shields.io/badge/SQL-SQLite-orange)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)

## Business Problem
Credit card fraud costs Canadian banks billions annually.
This project builds an end-to-end fraud detection system
to identify fraudulent transactions automatically.

## Dataset
- 284,807 real credit card transactions
- Only 492 fraud cases (0.17%) — highly imbalanced
- Source: MLG-ULB Kaggle Dataset

## What I built
- Advanced Python EDA and feature engineering
- Handled imbalanced data using SMOTE
- Trained and compared 3 machine learning models
- Advanced SQL analysis with CTEs and window functions
- 4-page Power BI executive dashboard

## Model Results

| Model | Accuracy | Precision | Recall | F1 Score | ROC-AUC |
|-------|----------|-----------|--------|----------|---------|
| Logistic Regression | 97.35% | 5.66% | 91.84% | 10.67% | 94.60% |
| Random Forest | 99.95% | 88.76% | 80.61% | 84.49% | 90.30% |
| XGBoost | 99.93% | 75.22% | 86.73% | 80.57% | 93.34% |

## Winner: XGBoost
XGBoost recommended for production deployment —
highest recall of 86.73% means it catches 87 out
of every 100 fraudulent transactions.

## Key Findings
- Fraud rate is only 0.17% — extreme class imbalance
- SMOTE used to balance training data
- Peak fraud occurs during specific hours of the day
- Average fraud amount differs from normal transactions
- XGBoost outperforms other models on fraud recall

## Tech Stack
- Python — pandas, numpy, scikit-learn, XGBoost, SHAP
- SQL — SQLite with CTEs and window functions
- Power BI — 4-page interactive dashboard
- imbalanced-learn — SMOTE oversampling

## Charts
![Class Distribution](chart1_class_distribution.png)
![Amount Distribution](chart2_amount_distribution.png)
![Fraud by Hour](chart3_fraud_by_hour.png)
![Correlation Matrix](chart4_correlation.png)
![Confusion Matrices](chart5_confusion_matrices.png)
![Feature Importance](chart6_feature_importance.png)

## Project Structure
- notebooks/ — Python ML analysis
- charts/ — all visualizations
- dashboard/ — Power BI files
- sql/ — SQL queries
- data/ — processed dataset

---
*Project by Hamna Maqbool — Data Analyst Portfolio*
*Targeting remote data analyst roles in Canada*
