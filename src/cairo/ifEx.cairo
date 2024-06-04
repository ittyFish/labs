use debug::PrintTrait;

fn main(){
    let isGood = true;
    let num :u8 = 8;

    if isGood  && num >0 {
        'cairo isGood is true'.print();
    }
    else {
        'itty false'.print();
    }
}