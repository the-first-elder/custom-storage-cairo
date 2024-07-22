use starknet::ContractAddress;
use super::imports::{UsersInfo, Status};

#[starknet::interface]
pub trait profile<TContractState> { fn upload(ref self: TContractState, name: felt252, bio: felt252,  status: Status);
fn reveal(self: @TContractState)-> UsersInfo;
}

#[starknet::contract]
pub mod Profile {
    use core::num::traits::Zero;
    use starknet::get_caller_address;
    use starknet::get_contract_address;
    use starknet::ContractAddress;
    use super::{UsersInfo, Status};

    #[storage]
    struct Storage {
        userInfo: LegacyMap::<ContractAddress, UsersInfo>
    }
   
    #[abi(embed_v0)]
    impl profileImpl of super::profile<ContractState> {
    fn upload(ref self: ContractState, name: felt252, bio: felt252,  status: Status){
        let data = UsersInfo{
            name, bio, status
        };
        let user = get_caller_address();
        self.userInfo.write(user, data);
    }

     fn reveal(self: @ContractState)->UsersInfo {
        self.userInfo.read(get_caller_address())
     }
    }
}
