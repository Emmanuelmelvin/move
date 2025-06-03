module hello_world::collection_test;

use hello_world::collection;
use sui::bag::Bag;
use sui::tx_context::{Self, TxContext};
use std::string::String;

#[test]
fun test_create_bag() {
    let ctx = &mut tx_context::dummy();

    let bag_ref: Bag = collection::create_bag(ctx);
    collection::destroy_bag_if_empty(bag_ref);
}

#[test_only]
public struct Shoe has store, copy {
    name: String,
    size: u8,
    color: u64,
    maker: String,
}

#[test]
#[ext(expected_failure)]
fun test_add_item_to_bag() {
    let ctx = &mut tx_context::dummy();
    let mut bag: Bag = collection::create_bag(ctx);

    collection::add_item_to_bag(
        &mut bag,
        b"shoe_key".to_string(),
        Shoe {
            name: b"nike_air_5".to_string(),
            size: 45u8,
            color: 0xFF000,
            maker: b"nike".to_string()
        }
    );
    
    collection::destroy_bag_if_empty(bag);
}
