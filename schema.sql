Patients
-
patient_id PK int
full_name text
age int
gender text
diagnosis text

Drugs
-
drug_id PK int
trade_name text
inn_substance text
pharm_group text

Interactions
-
interaction_id PK int
substance_1 text
substance_2 text
severity text
clinical_effect text

Prescriptions
-
prescription_id PK int
patient_id int FK >- Patients.patient_id
drug_id int FK >- Drugs.drug_id
start_date text
end_date text
therapy_outcome text
