module hello_world::encode;

use sui::bcs;
use std::string::String;

//mock data to encode
public struct Data has drop {
    number: u64,
    string: String,
    value: bool,
}

public fun create_data(
    number: u64,
    string: String,
    value: bool
): Data{
    Data{number, string, value}
}

public fun get_field_from_data(obj: Data, number: u64): bool {
    if(obj.number == number) {
        return true
    }else{
        return false
    }
    
} 

public fun encode_data_struct(obj: Data): vector<u8> {
   bcs::to_bytes(&obj)

}

public fun decode_data_struct(bytes: vector<u8>): Data {
    let mut bcs = bcs::new(bytes);
    let number = bcs.peel_u64();
    let string = bcs.peel_vec_u8().to_string();
    let value = bcs.peel_bool();
    Data { number, string, value }
}
