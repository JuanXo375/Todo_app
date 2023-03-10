CREATE DATABASE todo_app_server;
USE todo_app_server;

CREATE TABLE user(
	id INT auto_increment primary key,
    name varchar(255),
    email varchar(255) unique not null,
    password varchar(255)
);

CREATE TABLE todos(
	id INT auto_increment primary key,
    title varchar(255),
    completed boolean default false,
    user_id INT not null,
    foreign key (user_id) references user(id) on delete cascade
);

CREATE TABLE shared_todos(
	id INT auto_increment primary key,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    foreign key (todo_id) references todos(id) on delete cascade,
    foreign key (user_id) references user(id) on delete cascade,
    foreign key (shared_with_id) references user(id) on delete cascade
);


INSERT INTO user(name, email, password) values ('Juan','user1@example.com', 'password1');
INSERT INTO user(name, email, password) values ('Andres','user2@example.com', 'password2');

INSERT INTO todos(title, user_id) values 
("ðââï¸ Ejercicio", 1),
("ð hacer la cama", 1),
("ðµ programa el cafÃ© o el tÃ©", 1),
("ð cuidado del cutis", 1),
("ð preparar la ropa del dÃ­a siguiente", 1);