module hello_world::check;

use std::string::String;

public enum Storage has copy, drop  {
    Empty,
    String(String),
    Special {
        content: vector<u8>,
        encoding: u8
    }
}

public fun create_empty_storage(): Storage { Storage::Empty}

public fun create_string_storage(str: String): Storage {
    Storage::String(str)
}

public fun create_special_storage(
    content: vector<u8>,
    encoding: u8
): Storage {
    Storage::Special{content, encoding}
}

public fun check_if_empty(s: Storage): bool {
    match(s){
        Storage::Empty => true,
        _ => false
    }
}

public fun check_if_string(s: Storage): bool {
    match(s){
        Storage::String(_) => true,
        _ => false
    }
}

public fun check_if_special(s: Storage): bool {
    match(s){
        Storage::Special{..} => true,
        _ =>  false
            }
}

public fun return_storage_values_as_string(s: Storage): String {
    match(s){
        Storage::Empty => b"".to_string(),
        Storage::String(str) => str,
        Storage::Special { content, encoding} => {
            match(encoding){
                0 => content.to_string(),
                1 => sui::hex::decode(content).to_string(),
                _ => abort,
            }
        }

    }
}