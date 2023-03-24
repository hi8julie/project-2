-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS subcategory;

CREATE TABLE "category" (
    "category_id" VARCHAR(30) NOT NULL,
    "category" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" name   NOT NULL,
    "last_name" name   NOT NULL,
    "email" VARCHAR(80)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(80) NOT NULL,
    "goal" decimal   NOT NULL,
    "pledged" decimal   NOT NULL,
    "outcome" VARCHAR(30)   NOT NULL,
    "backers_count" int NOT NULL,
    "country" VARCHAR(30)   NOT NULL,
    "currency" VARCHAR(30)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" VARCHAR(30)  NOT NULL,
    "category" VARCHAR(30)   NOT NULL,
    "subcategory_id" VARCHAR(30) NOT NULL,
    "sub-category" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);


CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(30) NOT NULL,
    "sub-category" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

