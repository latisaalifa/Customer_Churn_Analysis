SELECT * FROM eda_project_lats.churn_modelling;

-- Preprocessing and  Cleaning Data -- 
SELECT COUNT(*) FROM eda_project_lats.churn_modelling WHERE Balance IS NULL OR EstimatedSalary IS NULL;
SELECT CustomerID, COUNT(*) FROM eda_project_lats.churn_modelling GROUP BY CustomerID HAVING  COUNT(*)>1;

-- KPI Customer Churn --
SELECT COUNT(*) AS Total_Customer FROM eda_project_lats.churn_modelling;
SELECT COUNT(*) AS Exited_Customer FROM eda_project_lats.churn_modelling WHERE Exited='1';
SELECT SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS Churn_Rate FROM eda_project_lats.Churn_Modelling;
SELECT SUM(EstimatedSalary) FROM eda_project_lats.churn_modelling;
SELECT SUM(EstimatedSalary) FROM eda_project_lats.churn_modelling WHERE Exited = 1;

-- Analysis Data Churn --

SELECT Geography, COUNT(*) AS Churned_Customers FROM eda_project_lats.Churn_Modelling
WHERE Exited = 1 GROUP BY Geography  ORDER BY Churned_Customers DESC;
SELECT IsActiveMember, COUNT(*) AS Churned_Customers FROM eda_project_lats.Churn_Modelling
WHERE Exited = 1 GROUP BY IsActiveMember ORDER BY Churned_Customers DESC;
SELECT NumOfProducts, COUNT(*) AS Churned_Customers FROM eda_project_lats.Churn_Modelling
WHERE Exited = 1 GROUP BY NumOfProducts ORDER BY Churned_Customers DESC;
SELECT Gender, COUNT(*) AS Churned_Customers FROM eda_project_lats.Churn_Modelling
WHERE Exited = 1 GROUP BY Gender ORDER BY Churned_Customers DESC;
SELECT Tenure, COUNT(*) AS Churned_Customers FROM eda_project_lats.Churn_Modelling
WHERE Exited = 1 GROUP BY Tenure ORDER BY Tenure ASC;


