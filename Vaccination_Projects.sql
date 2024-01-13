create database VaccinationProcess;

use VaccinationProcess;

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(255),
    state VARCHAR(255)
);

CREATE TABLE Vaccination_center (
    center_id INT PRIMARY KEY,
    center_name VARCHAR(255),
    location VARCHAR(255),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE Slot_master (
    slot_id INT PRIMARY KEY,
    time TIME
);

CREATE TABLE User (
    AadharNo VARCHAR(20) PRIMARY KEY,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
    DOB DATE,
    Mobile VARCHAR(15),
    Mail VARCHAR(255)
);

CREATE TABLE Slot_Booking (
    Booking_id INT PRIMARY KEY,
    AadharNo VARCHAR(12),
    Booking_Date DATE,
    Center_id INT,
    slot_id INT,
    Dose int not null default 1,
    FOREIGN KEY (AadharNo) REFERENCES User(AadharNo),
    FOREIGN KEY (Center_id) REFERENCES Vaccination_center(center_id),
    FOREIGN KEY (slot_id) REFERENCES Slot_master(slot_id)
);

INSERT INTO city (city_id, city_name, state) VALUES
(1, 'Mumbai', 'Maharashtra'),
(2, 'Delhi', 'Delhi'),
(3, 'Bangalore', 'Karnataka'),
(4, 'Hyderabad', 'Telangana'),
(5, 'Chennai', 'Tamil Nadu'),
(6, 'Kolkata', 'West Bengal'),
(7, 'Ahmedabad', 'Gujarat'),
(8, 'Pune', 'Maharashtra'),
(9, 'Jaipur', 'Rajasthan'),
(10, 'Lucknow', 'Uttar Pradesh'),
(11, 'Nagpur', 'Maharashtra');
INSERT INTO city (city_id, city_name, state) VALUES
(12, 'Chandigarh', 'Punjab'),
(13, 'Indore', 'Madhya Pradesh'),
(14, 'Bhopal', 'Madhya Pradesh'),
(15, 'Coimbatore', 'Tamil Nadu'),
(16, 'Patna', 'Bihar');


INSERT INTO Vaccination_center (center_id, center_name, location, city_id) VALUES
(101, 'Arogya Kendra 101', 'Sushruta Nagar 1', 1),
(102, 'Swasthya Bhawan 102', 'Ayurveda Enclave 2', 2),
(103, 'Sehat Mandir 103', 'Vaidya Vihar 3', 3),
(104, 'Ayushman Center 104', 'Charaka Chowk 4', 4),
(105, 'Pragathi Hospital 105', 'Vishwa Vaidya Vihar 5', 5),
(106, 'HealHub 106', 'Siddha Street 6', 6),
(107, 'Vidyut Arogya 107', 'Ayur Avenue 7', 7),
(108, 'Sarve Bhavantu 108', 'Gujarat Grih 8', 8),
(109, 'Sahyadri Wellness 109', 'Panchakarma Park 9', 9),
(110, 'Jeevan Jyoti 110', 'Raj Vihar 10', 12),
(111, 'AyurSanjeevani 111', 'Nirvana Nagar 11', 2),
(112, 'Kaya Kalp 112', 'Purvodaya Prangan 12', 1),
(113, 'Divya Aarogya 113', 'Uttar Vihar 13', 12),
(114, 'AyuCare 114', 'Vayu Valley 14', 13),
(115, 'SarvaRog Nivaran 115', 'Panch Tatva Park 15', 14),
(116, 'Chirayu Kendra 116', 'Arka Ashram 16', 5),
(117, 'AyurVeda Sagar 117', 'Samriddhi Sadan 17', 6),
(118, 'Dhanvantari Dham 118', 'Vikas Vihar 18', 7),
(119, 'Ayush Nivas 119', 'Aarogyam Avenue 19', 8),
(120, 'Vaidya Kutir 120', 'Sneha Sankul 20', 9),
(121, 'Prana Aashram 121', 'Sarva Sukh Colony 21', 10),
(122, 'Aarogya Point 122', 'Nirvana Nivas 22', 11),
(123, 'Svastika Health Hub 123', 'AyurVihar Enclave 23', 13),
(124, 'Divine Wellness Center 124', 'SarvaSukh Society 24', 4),
(125, 'AyurCare Solutions 125', 'Vedic Nagar 25', 5),
(126, 'ShantiSadan Health Center 126', 'Ayush Arogya 26', 16),
(127, 'Vaidya Vihar 127', 'Swasthya Sadan 27', 7),
(128, 'AyuVeda Bliss 128', 'AyurSadhana Enclave 28', 8),
(129, 'Health Haven 129', 'VedaVruksha Avenue 29', 9),
(130, 'AyurSankalp Wellness 130', 'Nirvana Nivas 30', 10),
(131, 'Shanti Kunj Healthcare 131', 'Swasthya Sadan 31', 11),
(132, 'AyurSankalp Wellness 132', 'Swasthya Sadan 32', 3),
(133, 'SarvaSukh Solutions 133', 'AyurSadhana Enclave 33', 4),
(134, 'AyurCare Bliss 134', 'SarvaSukh Society 34', 15),
(135, 'Sukh Sagar Healthcare 135', 'Swasthya Sadan 35', 16),
(136, 'AyurSankalp Solutions 136', 'Nirvana Nivas 36', 7),
(137, 'AyurVidya Wellness 137', 'AyurSadhana Enclave 37', 8),
(138, 'Sampurna Swasthya 138', 'VedaVruksha Avenue 38', 9),
(139, 'Health Harmony 139', 'AyurVihar Enclave 39', 10),
(140, 'SarvaSukh Society 140', 'Swasthya Sadan 40', 11),
(141, 'AyurSankalp Wellness 141', 'Swasthya Sadan 41', 3),
(142, 'SarvaSukh Solutions 142', 'AyurSadhana Enclave 42', 14),
(143, 'AyurCare Bliss 143', 'SarvaSukh Society 43', 5),
(144, 'Sukh Sagar Healthcare 144', 'Swasthya Sadan 44', 6),
(145, 'AyurSankalp Solutions 145', 'Nirvana Nivas 45', 7),
(146, 'AyurVidya Wellness 146', 'AyurSadhana Enclave 46', 8),
(147, 'Sampurna Swasthya 147', 'VedaVruksha Avenue 47', 9),
(148, 'Health Harmony 148', 'AyurVihar Enclave 48', 10),
(149, 'SarvaSukh Society 149', 'Swasthya Sadan 49', 11),
(150, 'AyurSankalp Wellness 150', 'Swasthya Sadan 50', 3),
(151, 'SarvaSukh Solutions 151', 'AyurSadhana Enclave 51', 4),
(152, 'AyurCare Bliss 152', 'SarvaSukh Society 52', 5),
(153, 'Sukh Sagar Healthcare 153', 'Swasthya Sadan 53', 6),
(154, 'AyurSankalp Solutions 154', 'Nirvana Nivas 54', 7),
(155, 'AyurVidya Wellness 155', 'AyurSadhana Enclave 55', 8),
(156, 'Sampurna Swasthya 156', 'VedaVruksha Avenue 56', 9),
(157, 'Health Harmony 157', 'AyurVihar Enclave 57', 10),
(158, 'SarvaSukh Society 158', 'Swasthya Sadan 58', 11),
(159, 'AyurSankalp Wellness 159', 'Swasthya Sadan 59', 3),
(160, 'SarvaSukh Solutions 160', 'AyurSadhana Enclave 60', 4),
(161, 'AyurCare Bliss 161', 'SarvaSukh Society 61', 2),
(162, 'Sukh Sagar Healthcare 162', 'Swasthya Sadan 62', 6),
(163, 'AyurSankalp Solutions 163', 'Nirvana Nivas 63', 7),
(164, 'AyurVidya Wellness 164', 'AyurSadhana Enclave 64', 8),
(165, 'Sampurna Swasthya 165', 'VedaVruksha Avenue 65', 9),
(166, 'Health Harmony 166', 'AyurVihar Enclave 66', 10),
(167, 'SarvaSukh Society 167', 'Swasthya Sadan 67', 11);


-- Inserting data into the "Slot_master" table
INSERT INTO Slot_master (slot_id, time) VALUES
(1, '09:00:00'),
(2, '09:15:00'),
(3, '09:30:00'),
(4, '09:45:00'),
(5, '10:00:00'),
(6, '10:15:00'),
(7, '10:30:00'),
(8, '10:45:00'),
(9, '11:00:00'),
(10, '11:15:00'),
(11, '11:30:00'),
(12, '11:45:00'),
(13, '12:00:00'),
(14, '12:15:00'),
(15, '12:30:00'),
(16, '12:45:00'),
(17, '13:00:00'),
(18, '13:15:00'),
(19, '13:30:00'),
(20, '13:45:00'),
(21, '14:00:00'),
(22, '14:15:00'),
(23, '14:30:00'),
(24, '14:45:00'),
(25, '15:00:00'),
(26, '15:15:00'),
(27, '15:30:00'),
(28, '15:45:00'),
(29, '16:00:00'),
(30, '16:15:00'),
(31, '16:30:00'),
(32, '16:45:00');


CREATE TABLE Holiday (
    holiday_date DATE PRIMARY KEY
);

call InsertWeekendHolidays('2024-01-01','2024-12-31');

insert into holiday values 
('2024-01-26'),
('2024-03-08'),
('2024-03-25'),
('2024-03-29'),
('2024-04-11'),
('2024-08-15'),
('2024-10-02'),
('2024-10-29'),
('2024-10-31'),
('2024-11-01'),
('2024-12-25');


use vaccinationprocess;
-- • A user will select a city (Can add 10-15 Test cities to DB)
Select * from city;

-- • Based on selected city vaccination centers will be displayed (To be populated from DB)
select * from vaccination_center 
where city_id = 4;

-- • Based on selection of Vaccination center you will display available 15 mins slots from 9am to 5pm.
select * from slot_master
where slot_id not in (select slot_id from slot_booking);

-- • A user can only take one 2 vaccines with a gap of 2 months.
-- create a trigger on slot_booking table and check before insert a data 


-- • Vaccination center remains closed on weekends and public holidays (Can be populated from DB)
select * from holiday 
where holiday_date in(select booking_date from slot_booking);

select holiday_date from holiday,slot_booking
where booking_date = '2024-01-24';

select count(*)as cnt from holiday
 where holiday_date = '2024-01-24';-- and holiday_date is not null;
 
 -- checking trigger for holiday 
 desc slot_booking;
insert into slot_booking (booking_id,AadharNo,Booking_date,center_id,slot_id,Dose) values
 (103,'AAA','2024-01-24',102,12,1);
 
 Alter table holiday 
 modify holiday_date date not null;

desc holiday;

delete from slot_booking where booking_id=1;

-- no need to dose column
Alter table slot_booking
drop column Dose;

-- cheking trigger when we add two conditions in same trigger
insert into slot_booking (booking_id,AadharNo,Booking_date,center_id,slot_id) values
 (105,'AAA','2024-06-14',102,12);
 
delete from slot_booking where booking_id=105;

delete from user where AAdharNO='AAA';

-- to check slots for a particular date
 SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select slot_id,time from slot_master 
left join slot_booking using (slot_id)
where slot_id not in(select slot_id from slot_booking
					  where booking_date= '2024-01-15' and center_id=102);

desc slot_booking;

Alter table slot_booking 
modify Booking_id int auto_increment;

