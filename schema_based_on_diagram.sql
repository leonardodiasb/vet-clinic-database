CREATE DATABASE clinic;

CREATE TABLE "medical_histories" (
  "id" int GENERATED ALWAYS AS IDENTITY,
  "admitted_at" timestamp,
  "patient_id" int,
  "status" varchar,
  PRIMARY KEY ("id"),
  CONSTRAINT patients_id_fk
    FOREIGN KEY (patient_id) 
    REFERENCES patients (id)
);

CREATE TABLE "treatments" (
  "id" int GENERATED ALWAYS AS IDENTITY,
  "type" varchar,
  "name" varchar,
  PRIMARY KEY ("id")
);

CREATE TABLE "patients" (
  "id" int GENERATED ALWAYS AS IDENTITY,
  "name" varchar,
  "date_of_birth" date,
  PRIMARY KEY ("id")
);

CREATE TABLE "invoices" (
  "id" int GENERATED ALWAYS AS IDENTITY,
  "total_amount" decimal,
  "generated_at" timestamp,
  "payed_at" timestamp,
  "medical_history_id" int,
  PRIMARY KEY ("id"),
  CONSTRAINT medical_history_id_fk
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
);

CREATE TABLE "invoice_items" (
  "id" int GENERATED ALWAYS AS IDENTITY,
  "unit_price" decimal,
  "quantity" int,
  "total_price" decimal,
  "invoice_id" int,
  "treatment_id" int,
  PRIMARY KEY ("id"),
  CONSTRAINT invoice_id_fk
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id),
  CONSTRAINT treatment_id_fk
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
);

CREATE TABLE "medical_histories_treatments" (
  "treatment_id" int,
  "medical_history_id" int,
  CONSTRAINT treatment_id_fk
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id),
  CONSTRAINT medical_history_id_fk
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
);

CREATE INDEX treatment_id ON invoice_items(treatment_id);
CREATE INDEX patients_id ON medical_histories(patient_id);
CREATE INDEX medical_history_id ON invoices(medical_history_id);
CREATE INDEX invoice_id ON invoice_items(invoice_id);
CREATE INDEX treatment_id ON medical_histories_treatments(treatment_id);
CREATE INDEX medical_history_id ON medical_histories_treatments(medical_histories_id);

