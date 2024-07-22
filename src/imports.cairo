#[derive(Copy, Clone, Drop, Debug, PartialEq, Serde, starknet::Store)]
pub struct UsersInfo {
    pub name: felt252,
    pub bio: felt252,
    pub status: Status,
}

#[derive(Copy, Drop, Debug, PartialEq, Serde, starknet::Store)]
pub enum Status {
    Married: felt252,
    Single: felt252,
}

