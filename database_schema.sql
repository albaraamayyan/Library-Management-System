-- جدول المؤلفين
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    biography TEXT
);

-- جدول الكتب
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    publish_year INT,
    category VARCHAR(50),
    author_id INT REFERENCES authors(author_id) ON DELETE SET NULL
);

-- جدول الأعضاء
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100)
);

-- جدول الاستعارات
CREATE TABLE borrowings (
    borrow_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    borrow_date DATE NOT NULL,
    return_date DATE
);

-- إضافة فهارس لتحسين أداء البحث
CREATE INDEX idx_book_title ON books(title);
CREATE INDEX idx_member_name ON members(name);
