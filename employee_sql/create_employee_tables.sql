-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/LYi9a3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_id" INT   NOT NULL,
    "title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "titles_" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles_" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salary_" (
    "emp_id" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "departments_" (
    "dept_id" INT   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments_" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_employees_" (
    "emp_id" INT   NOT NULL,
    "dept_id" INT   NOT NULL
);

CREATE TABLE "dept_managers_" (
    "dept_id" INT   NOT NULL,
    "emp_id" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles_" ("title_id");

ALTER TABLE "salary_" ADD CONSTRAINT "fk_salary__emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_employees_" ADD CONSTRAINT "fk_dept_employees__emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_employees_" ADD CONSTRAINT "fk_dept_employees__dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments_" ("dept_id");

ALTER TABLE "dept_managers_" ADD CONSTRAINT "fk_dept_managers__dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments_" ("dept_id");

ALTER TABLE "dept_managers_" ADD CONSTRAINT "fk_dept_managers__emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

