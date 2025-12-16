-- Создание таблиц
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_number VARCHAR(10) NOT NULL UNIQUE,
    specialization VARCHAR(100) NOT NULL,
    graduation_year INTEGER NOT NULL
);

CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_id INTEGER NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    gender VARCHAR(1) NOT NULL CHECK(gender IN ('M', 'F')),
    birth_date DATE NOT NULL,
    student_id VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

-- Вставка тестовых данных
INSERT INTO groups (group_number, specialization, graduation_year) VALUES
('CS-101', 'Computer Science', 2025),
('CS-102', 'Computer Science', 2025),
('MATH-201', 'Mathematics', 2024),
('PHYS-301', 'Physics', 2023);

INSERT INTO students (group_id, last_name, first_name, middle_name, gender, birth_date, student_id) VALUES
(1, 'Ivanov', 'Ivan', 'Ivanovich', 'M', '2000-05-15', 'CS101001'),
(1, 'Petrova', 'Anna', 'Sergeevna', 'F', '2001-03-22', 'CS101002'),
(1, 'Sidorov', 'Alexey', 'Petrovich', 'M', '2000-11-30', 'CS101003'),
(2, 'Kuznetsova', 'Maria', 'Dmitrievna', 'F', '2001-07-18', 'CS102001'),
(2, 'Smirnov', 'Dmitry', 'Alexandrovich', 'M', '2000-09-25', 'CS102002'),
(3, 'Popov', 'Sergey', 'Vladimirovich', 'M', '1999-12-10', 'MATH201001');