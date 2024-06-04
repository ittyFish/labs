
fn main(x: felt252 , y: felt252){
    assert(x != y, 'error ,is not equal to y');
}

#[test]
fn test_main(){
    main(1,2);
}