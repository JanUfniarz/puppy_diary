CREATE TABLE dogs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    full_name TEXT NOT NULL,
    birthday TEXT NOT NULL,
);

CREATE TABLE weight_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    time TEXT NOT NULL,
    weight REAL NOT NULL,
    individual_id INTEGER NOT NULL,
    FOREIGN KEY (individual_id) REFERENCES individuals (id) ON DELETE CASCADE
);

CREATE TABLE event_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    time TEXT NOT NULL,
    done BOOLEAN NOT NULL,
    type TEXT NOT NULL,
    individual_id INTEGER NOT NULL,
    FOREIGN KEY (individual_id) REFERENCES individuals (id) ON DELETE CASCADE
);