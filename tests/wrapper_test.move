module hello_world::wrapper_test;

use hello_world::wrapper::{ Self, Storage};
use std::string::String;

#[test]
public fun test_storage() {
    let vector_list = vector[10u8, 20u8, 30u8];
    let storage_ref: Storage<u8> = wrapper::create_storage_from_vector(vector_list, b"Emmanuel".to_string());

    let owner_ref: &String = storage_ref.owner();
    assert!(owner_ref == &b"Emmanuel".to_string());
    
}

#[test]
public fun test_get_vector_from_storage() {
    let vector_list = vector[10u8, 20u8, 30u8];
    let storage_ref: Storage<u8> = wrapper::create_storage_from_vector(vector_list, b"Emmanuel".to_string());

    let vector_ref: &vector<u8> = storage_ref.vector();
    assert!(vector_ref == &vector[10u8, 20u8, 30u8]);
}