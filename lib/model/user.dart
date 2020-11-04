class User {
  String name;
  int age;
  String imageUrl;

  // default 값을 정해 줄 수 있음
  User(this.name, this.age, {this.imageUrl = 'https://www.flaticon.com/svg/static/icons/svg/1159/1159797.svg'});
}