-- concatenate two JSON objects
CREATE OR REPLACE FUNCTION plv8_concat_json(a JSON, b JSON) RETURNS JSON AS
$$
  let b_keys = Object.keys(b);

  for (let i = 0; i < b_keys.length; i++) {
    a[b_keys[i]] = b[b_keys[i]];
  }

  return a;
$$ LANGUAGE plv8;

-- concatenate two JSONB objects
CREATE OR REPLACE FUNCTION plv8_concat_jsonb(a JSONB, b JSONB) RETURNS JSONB AS
$$
  let b_keys = Object.keys(b);

  for (let i = 0; i < b_keys.length; i++) {
    a[b_keys[i]] = b[b_keys[i]];
  }

  return a;
$$ LANGUAGE plv8;
