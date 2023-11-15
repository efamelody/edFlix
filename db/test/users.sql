CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT,
    passwordHash TEXT,
    fullName TEXT,
    role TEXT,
    admin INTEGER,
    degree TEXT,
    institutionCode INTEGER,
    suspended INTEGER,
    reason TEXT
);
