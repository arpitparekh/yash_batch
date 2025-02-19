class UserData{
  String? key;
  String? name;
  String? phone_number;

  UserData({required this.key, required this.name, required this.phone_number});

  UserData.create(String k, String n, String p) {
    key = k;
    name = n;
    phone_number = p;
  }

}