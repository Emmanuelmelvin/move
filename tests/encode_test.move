module hello_world::encode_test;

use hello_world::encode::{Self, Data};

#[test]
fun test_create_encode_and_decode_data(){ 
    let mut data_object: Data = encode::create_data(43u64, b"key".to_string(), true);

    let encoded_data_object = encode::encode_data_struct(data_object);

    let decoded_data_object: Data = encode::decode_data_struct(encoded_data_object);

    assert!(decoded_data_object.get_field_from_data(43u64), 0);
}