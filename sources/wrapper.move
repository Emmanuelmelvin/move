module hello_world::wrapper;

use std::string::String;

public struct Storage<T> has drop {
    vector: vector<T>,
    owner: String,
}

public fun create_storage_from_vector<T>(obj: vector<T>, owner: String): Storage<T> {
    Storage {
        vector: obj,
        owner,
    }
}

public use fun get_owner_of_storage as Storage.owner;
public use fun get_vector_from_storage as Storage.vector;

public fun get_vector_from_storage<T>(storage: &Storage<T>): &vector<T> {
    &storage.vector
}

public fun get_owner_of_storage<T>(storage: &Storage<T>): &String {
    &storage.owner
}


