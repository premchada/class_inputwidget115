class Food {
  String? thName;
  String? enName;
  int? price;
  String? foodValue;

  //constructor
  Food(this.thName, this.enName, this.price, this.foodValue);

  somemethod(){
    
  }

  static getFood() {
    return [
      Food('พิซซ่า', 'Pizza', 99, 'pizza'),
      Food('สเต็ก', 'Steak', 99, 'steak'),
      Food('ชาบู', 'Shabu', 99, 'shabu'),
      Food('ซูชิ', 'Sushi', 99, 'sushi'),
      Food('กิมจิ', 'kimji', 99, 'kimji'),
    ];
  }
}
