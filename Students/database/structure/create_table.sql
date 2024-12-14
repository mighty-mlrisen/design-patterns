
CREATE TABLE student (
	id serial PRIMARY KEY, 
	surname varchar(100) NOT NULL,
	name varchar(100) NOT NULL,
	patronymic varchar(100) NOT NULL,
	telegram varchar(50),
	email varchar(255),
	phone varchar(15),
	git varchar(255),
    birthdate date NOT NULL
);

ALTER TABLE student
ADD CONSTRAINT unique_telegram UNIQUE (telegram),
ADD CONSTRAINT unique_email UNIQUE (email),
ADD CONSTRAINT unique_git UNIQUE (git),
ADD CONSTRAINT unique_phone UNIQUE (phone);