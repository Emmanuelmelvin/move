/// Module: todo_list
module hello_world::todo_list;

use std::string::String;

//let y: u64 = 0; // immutable variable  
//let y = 42u64; // immutable variable 

//let z: u16 = (x as u16) + ((y as u16) + 1); // type casting

//move does not support overflow and underflow
//let x = 255u8;
//let y = 1u8;



/// List of todos. Can be managed by the owner and shared with others.
public struct TodoList has key, store {
    id: UID,
    items: vector<String>
}

/// Create a new todo list.
public fun new(ctx: &mut TxContext): TodoList {
    let list = TodoList {
        id: object::new(ctx),
        items: vector[]
    };

    (list)
}

/// Add a new todo item to the list.
public fun add(list: &mut TodoList, item: String) {
    list.items.push_back(item);
}

/// Remove a todo item from the list by index.
public fun remove(list: &mut TodoList, index: u64): String {
    list.items.remove(index)
}

/// Delete the list and the capability to manage it.
public fun delete(list: TodoList) {
    let TodoList { id, items: _ } = list;
    id.delete();
}

/// Get the number of items in the list.
public fun length(list: &TodoList): u64 {
    list.items.length()
}
