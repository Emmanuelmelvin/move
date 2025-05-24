#[test_only]
module hello_world::check_test;

use hello_world::check::{Self, Storage};
use std::string::String;

#[test]
fun test_create_special_storage(){
    let content = vector[1,2,3];
    let encoding = 0;

    let storage  =  check::create_special_storage( content, encoding);
    let _ : Storage = storage;
}

#[test]
fun test_check_if_string(){
    let storage = check::create_string_storage(b"Hello world!".to_string());

    assert!(check::check_if_string(storage) , 0);

}

#[test]
fun test_return_storage_value_as_string(){
    let storage = check::create_special_storage(
        vector[1,2,3],
        0
    );

    let storage_as_string = check::return_storage_values_as_string(storage);

   let _: String = storage_as_string;
}

#[test]

fun test_check_if_empty(){
    let empty_storage = check::create_empty_storage();

    assert!(check::check_if_empty(empty_storage) , 0);

}