-- source table for a simple text version of the document
CREATE TABLE source_document (doc TEXT);

-- storage for JSON type
CREATE TABLE test_json (id INT, doc JSON);

-- storage for JSONB type
CREATE TABLE test_jsonb (id INT, doc JSONB);

-- storage for TEXT type
CREATE TABLE test_text (id INT, doc TEXT);
