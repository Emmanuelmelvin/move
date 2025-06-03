module hello_world::collection;

use sui::bag::{ Self, Bag};

public fun create_bag(ctx: &mut TxContext): Bag {
    bag::new(ctx)
}

public fun add_item_to_bag<Name: copy + drop + store, Value: store>(bag: &mut Bag, name: Name, value: Value): &mut Bag {
    bag.add(name, value);
    bag
}

public fun get_item_from_bag<Name: copy + drop + store, Value: store>(bag: &Bag, name: Name): &Value {
    &bag[name]
}

public fun get_mut_item_from_bag<Name: copy + drop + store, Value: store>(bag: &mut Bag, name: Name): &mut Value {
    &mut bag[name]
}

public fun check_if_bag_is_empty(bag: &Bag): bool {
    bag.is_empty()
}

public fun get_length_of_bag(bag: &Bag): u64 {
    bag.length()
}

public fun remove_item_from_bag<Name: copy + drop + store, Value: store>(bag: &mut Bag, name: Name): Value {
    bag.remove(name)
}

public fun destroy_bag_if_empty(bag: Bag) {
    bag.destroy_empty()
}