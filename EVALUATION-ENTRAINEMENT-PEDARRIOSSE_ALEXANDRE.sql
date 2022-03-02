/*DATABASE AND TABLES CREATION*/

CREATE DATABASE cinema_booking;
USE cinema_booking;

CREATE TABLE ADMIN_RIGHTS (
  right_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  right_status VARCHAR(255)
);

CREATE TABLE ADMIN_USER (
    admin_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    admin_firstname VARCHAR(255) NOT NULL,
    admin_famillyname VARCHAR(255) NOT NULL,
    admin_email VARCHAR(255) NOT NULL,
    admin_phone VARCHAR(10),
    right_id INT NOT NULL,

    FOREIGN KEY (right_id)
      REFERENCES ADMIN_RIGHTS(right_id)
);


CREATE TABLE COMPLEX (
    complex_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    complex_name VARCHAR(255) NOT NULL,
    complex_adress VARCHAR(255) NOT NULL,
    complex_post_code VARCHAR(255) NOT NULL,
    complex_city VARCHAR(255) NOT NULL,
    complex_country VARCHAR(255) NOT NULL,
    complex_email VARCHAR(255) NOT NULL,
    complex_phone VARCHAR(10) NOT NULL
);

CREATE TABLE MOVIE_ROOM (
    room_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    room_number INT NOT NULL,
    room_seats_quantity INT NOT NULL,
    complex_id INT NOT NULL,

    FOREIGN KEY (complex_id)
      REFERENCES COMPLEX(complex_id)
);

CREATE TABLE MOVIE (
    movie_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    movie_title VARCHAR(255) NOT NULL,
    movie_duration INT NOT NULL,
    movie_producer VARCHAR(255) NOT NULL,
    movie_realisator VARCHAR(255) NOT NULL,
    movie_synopsis VARCHAR(255) NOT NULL,
    movie_restriction VARCHAR(10) NOT NULL
);

CREATE TABLE SCEANCE (
    sceance_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    seance_date DATE NOT NULL,
    seance_start_time TIME NOT NULL,
    movie_id INT NOT NULL,
    room_id INT NOT NULL,

    FOREIGN KEY (movie_id)
      REFERENCES MOVIE(movie_id),

    FOREIGN KEY (room_id)
      REFERENCES MOVIE_ROOM(room_id)
);

CREATE TABLE FARE (
    fare_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fare_applicable VARCHAR(255) NOT NULL,
    fare FLOAT NOT NULL
);

CREATE TABLE CUSTOMER (
    cust_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cust_firstname VARCHAR(255) NOT NULL,
    cust_famillyname VARCHAR(255) NOT NULL,
    cust_email VARCHAR(255) NOT NULL,
    cust_phone VARCHAR(255) NOT NULL,
    cust_birthday DATE NOT NULL,
    cust_fare_id INT NOT NULL,

    FOREIGN KEY (cust_fare_id)
      REFERENCES FARE(fare_id)
);

CREATE TABLE PAYMENT_METHOD (
    payment_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    payment_method VARCHAR(255)
);

CREATE TABLE BOOKING (
    booking_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sceance_id INT NOT NULL,
    cust_id INT NOT NULL,    
    payment_id INT NOT NULL,

    FOREIGN KEY (sceance_id)
      REFERENCES SCEANCE(sceance_id),

    FOREIGN KEY (cust_id)
      REFERENCES CUSTOMER(cust_id),

    FOREIGN KEY (payment_id)
      REFERENCES PAYMENT_METHOD(payment_id)
);


/*NEW ENTRIES*/

INSERT INTO ADMIN_RIGHTS(right_status) VALUES ('Super Admin');
INSERT INTO ADMIN_RIGHTS(right_status) VALUES ('Complex Admin');

INSERT INTO ADMIN_USER(admin_firstname, admin_famillyname, admin_email, admin_phone, right_id) 
VALUES ('Manu', 'Plisson', 'mplisson@ugk.com', '0606060008',1);
INSERT INTO ADMIN_USER(admin_firstname, admin_famillyname, admin_email, admin_phone, right_id) 
VALUES ('Jacques', 'Troudic', 'jtroudic@ugk.com', '0612450056',2);
INSERT INTO ADMIN_USER(admin_firstname, admin_famillyname, admin_email, admin_phone, right_id) 
VALUES ('Alain', 'Terrieur', 'aterrieur@ugk.com', '0634567858',2);
INSERT INTO ADMIN_USER(admin_firstname, admin_famillyname, admin_email, admin_phone, right_id) 
VALUES ('François', 'Pignon', 'fpignon@ugk.com', '0623135624',2);
INSERT INTO ADMIN_USER(admin_firstname, admin_famillyname, admin_email, admin_phone, right_id) 
VALUES ('Maryvone', 'Guilin', 'mguilin@ugk.com', '0756842846',2);

INSERT INTO COMPLEX(complex_name, complex_adress, complex_post_code, complex_city, complex_country, complex_email, complex_phone)
VALUES ('UGK Odeon', '36 rue des Muffles', '75004', 'Paris', 'France','ugkodeon@ugk.com', '0134789056');
INSERT INTO COMPLEX(complex_name, complex_adress, complex_post_code, complex_city, complex_country, complex_email, complex_phone)
VALUES ('UGK Halles', '78 Place des Erables', '75001', 'Paris', 'France','ugkhalles@ugk.com', '0134789067');
INSERT INTO COMPLEX(complex_name, complex_adress, complex_post_code, complex_city, complex_country, complex_email, complex_phone)
VALUES ('UGK Nation', '1 place de la Nation', '75020', 'Paris', 'France','ugknation@ugk.com', '0134789012');
INSERT INTO COMPLEX(complex_name, complex_adress, complex_post_code, complex_city, complex_country, complex_email, complex_phone)
VALUES ('UGK Bayonne', '36 place des fêtes', '64000', 'Bayonne', 'France','ugkbayonne@ugk.com', '0134789089');

INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 120, 1);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 80, 1);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 50, 1);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 150, 2);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 80, 2);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 150, 3);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 95, 3);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 50, 3);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 300, 4);
INSERT INTO MOVIE_ROOM (room_number, room_seats_quantity, complex_id) VALUE(1, 250, 4);

INSERT INTO MOVIE(movie_title, movie_duration, movie_producer, movie_realisator, movie_synopsis, movie_restriction) 
VALUE ('Massacre à la petite cuillère',183, 'Yvette Horreur', 'Jacqueline Balcon', '1984 dans un village perdu, lorem ipsum', '-16 ans');
INSERT INTO MOVIE(movie_title, movie_duration, movie_producer, movie_realisator, movie_synopsis, movie_restriction) 
VALUE ('Amélie Cheval',120, 'Pierrette Ginette', 'Jack Chirak', 'La vie passionnante lorem ipsum','');
INSERT INTO MOVIE(movie_title, movie_duration, movie_producer, movie_realisator, movie_synopsis, movie_restriction) 
VALUE ('Les 3 soeurs',125, 'Arnaud Notaire', 'Rosa Bonheur', 'Histoire de 3 soeurs en galère lorem ipsum','');
INSERT INTO MOVIE(movie_title, movie_duration, movie_producer, movie_realisator, movie_synopsis, movie_restriction) 
VALUE ('Nos jours malheureux',257, 'Hypolite De la Fresinyere', 'Rosa Bonheur', 'Film retraçant lorem ipsum','');
INSERT INTO MOVIE(movie_title, movie_duration, movie_producer, movie_realisator, movie_synopsis, movie_restriction) 
VALUE ('Rocky 12',94, 'Bruce William', 'Tom Vlanks', 'Film auteur Américain  lorem ipsum','');
INSERT INTO MOVIE(movie_title, movie_duration, movie_producer, movie_realisator, movie_synopsis, movie_restriction) 
VALUE ('Star Ship Troooopers 8',98, 'Bruce William', 'Gabriella Vlanks', 'Des Insectes, des insectes...  lorem ipsum', '-12 ans');

INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',1,1);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',1,1);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',3,2);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',3,2);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',5,3);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',5,3);

INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',1,4);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',1,4);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',2,5);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',2,5);

INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',1,6);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',1,6);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',4,7);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',4,7);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',6,8);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',6,8);

INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',1,9);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',1,9);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '18:30:00',6,10);
INSERT INTO SCEANCE (seance_date, seance_start_time, movie_id, room_id) VALUE('2022-03-02', '21:30:00',4,10);

INSERT INTO FARE (fare_applicable, fare) VALUE ('Plein tarif', 9.20);
INSERT INTO FARE (fare_applicable, fare) VALUE ('Etudiant', 7.60);
INSERT INTO FARE (fare_applicable, fare) VALUE ('Moins de 14 ans', 5.90);

INSERT INTO PAYMENT_METHOD (payment_method) VALUE ('Sur place');
INSERT INTO PAYMENT_METHOD (payment_method) VALUE ('En ligne');

INSERT INTO CUSTOMER (cust_firstname, cust_famillyname, cust_email, cust_phone, cust_birthday, cust_fare_id) VALUE('John', 'Doe', 'johndoe@coldmail.fr', '0670183959','2012-09-30',3);
INSERT INTO CUSTOMER (cust_firstname, cust_famillyname, cust_email, cust_phone, cust_birthday, cust_fare_id) VALUE('Prune', 'Delage', 'prunette@jmail.com', '0634471899','2000-12-25',2);
INSERT INTO CUSTOMER (cust_firstname, cust_famillyname, cust_email, cust_phone, cust_birthday, cust_fare_id) VALUE('Alex', 'Williams', 'a.williams@jmail.com', '0635477892','1985-01-15',1);
INSERT INTO CUSTOMER (cust_firstname, cust_famillyname, cust_email, cust_phone, cust_birthday, cust_fare_id) VALUE('Marie', 'Stitch', 'marieloo@jmail.com', '0632542322','1988-06-07',1);

INSERT INTO BOOKING (sceance_id, cust_id, payment_id) VALUE (1,1,2);
INSERT INTO BOOKING (sceance_id, cust_id, payment_id) VALUE (1,2,1);
INSERT INTO BOOKING (sceance_id, cust_id, payment_id) VALUE (1,4,2);
INSERT INTO BOOKING (sceance_id, cust_id, payment_id) VALUE (1,1,2);
INSERT INTO BOOKING (sceance_id, cust_id, payment_id) VALUE (4,1,1);
INSERT INTO BOOKING (sceance_id, cust_id, payment_id) VALUE (4,2,1)