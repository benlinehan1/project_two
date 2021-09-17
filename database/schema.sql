CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    image_url TEXT,
    username TEXT
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    comment TEXT,
    username TEXT,
    post_id INTEGER
);