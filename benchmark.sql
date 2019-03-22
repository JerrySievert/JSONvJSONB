-- turn on timing
\timing on

-- a simple benchmark
CREATE OR REPLACE FUNCTION plbench(query TEXT, n INT) RETURNS VOID AS $$
BEGIN
        FOR i IN 1 .. n LOOP
                EXECUTE query;
        END LOOP;
END;
$$ LANGUAGE plpgsql;

-- insert data into the JSON table
CREATE OR REPLACE FUNCTION test_json_insert(n INT, obj JSON) RETURNS VOID AS $$
BEGIN
        FOR i IN 1 .. n LOOP
                INSERT INTO test_json (id, doc) VALUES (i, obj);
        END LOOP;
END;
$$ LANGUAGE plpgsql;

-- insert data into the JSONB table
CREATE OR REPLACE FUNCTION test_jsonb_insert(n INT, obj JSONB) RETURNS VOID AS $$
BEGIN
        FOR i IN 1 .. n LOOP
                INSERT INTO test_jsonb (id, doc) VALUES (i, obj);
        END LOOP;
END;
$$ LANGUAGE plpgsql;

-- JSON insertion
SELECT test_json_insert(10000, doc::JSON) FROM source_document;

-- JSONB insertion
SELECT test_jsonb_insert(10000, doc::JSONB) FROM source_document;

-- JSON full document
SELECT plbench('SELECT doc::TEXT FROM test_json', 20);

-- JSONB full document
SELECT plbench('SELECT doc::TEXT FROM test_jsonb', 20);

-- JSON key search
SELECT plbench('SELECT doc -> ''_id'' FROM test_json', 20);

-- JSONB key search
SELECT plbench('SELECT doc -> ''_id'' FROM test_jsonb', 20);
