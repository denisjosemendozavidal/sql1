CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "user_courses_id" uuid,
  "users_level_id" int8,
  "user_role_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level_id" int8,
  "teacher" varchar,
  "course_video_id" uuid
);

CREATE TABLE "courses_users" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "user_id" uuid,
  "user_specific_info" varchar,
  "course_progress_percentage" int8,
  "previous_courses_review" varchar,
  "course_video_id" uuid
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "level_number" serial,
  "level_name" varchar
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "video_category_id" uuid
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "clearance_type" uuid
);

insert into users (id, name, email, "password", age) values ('bbdcf518-ed23-4f8b-85f8-1c72f5a2fc30', 'Denis Mendoza', 'denis@gmail.com', '1234567', '31');
insert into users (id, name, email, "password", age) values ('8d0e88c0-e5a2-45a1-8ba7-c837fa28757f', 'Matias Mendoza', 'Matias@gmail.com', '12345678', '2');

insert into courses (id, title, description, teacher) values ('7614f711-26ae-4ffe-8847-31e5b6c53032', 'Node js', 'Master backend Dev with Node js', 'Sahid Kick');
insert into courses (id, title, description, teacher) values ('24fbe01d-39e0-4f1d-a96b-fed13b018ebe', 'Front end Dev with React', 'React.js how to use it to complete your front end training', 'Benjamin Flores');

insert into levels (id, level_number, level_name) values ('1', '1', 'React.js');
insert into levels (id, level_number, level_name) values ('2', '2', 'Node');

insert into course_videos (id, title, url) values ('c7a6a0cb-8f45-4717-8dba-0d0abfe19155', 'Introduction to Node', 'https://us02web.zoom.us/rec/share/zvFjpoqCVfiJCe_aBU6wQMGLN3Ei52Tm_vECOxgStg9hqSccYx7JS3MZlh_398Y.OMPpB617c0rrxhpB');
insert into course_videos (id, title, url) values ('d03b2f4b-034e-494a-80d7-614bfdeaca84', 'Introduction to React', 'https://us02web.zoom.us/rec/share/nEBUB2F_Jnn2I2Z6U-XigroI7d_uwmWC8u7rnm_2OfNQ0IX1xYcuHuGOz_OZRnT6.ZRXbZDH5-YkX18ZK');

insert into categories (id, name) values ('db724801-0bb7-432c-8f61-0db35fd8328c', 'Begginer');
insert into categories (id, name) values ('90739317-051f-4e88-b8d0-edf88398f4a7', 'Advanced');

insert into roles (id, name, clearance_type) values ('1fb2d62f-945e-4f56-8739-d203657b42d2', 'Student', 'dcd5c927-144f-43b1-9b41-111eddf2512d');
insert into roles (id, name, clearance_type) values ('72b4af3b-0ef7-4c04-816d-d7821eb94dfb', 'Teacher', '30078f37-fa47-4980-9063-6beab7f8eba5');

ALTER TABLE "courses_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses_users" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("user_role_id") REFERENCES "roles" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("users_level_id") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("video_category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_users" ADD FOREIGN KEY ("course_video_id") REFERENCES "course_videos" ("id");