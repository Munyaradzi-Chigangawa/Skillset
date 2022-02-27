
class Profile {
  String name;
  String profession;
  String location;
  String image;
  String about;
  String call;
  String email;
  String linkedin;
  String whatsapp;
  String phone;

  Profile();

  Profile.fromMap(Map<String, dynamic> data){
    name = data['name'];
    profession = data['profession'];
    location = data['location'];
    image = data['image'];
    about = data['about'];
    call = data['call'];
    linkedin = data['linkedin'];
    email = data['email'];
    whatsapp = data['whatsapp'];
    phone = data['phone'];
    
 }

 Map<String, dynamic> toMap() {
   return{
    'name' : name,
    'profession' : profession,
    'location' : location,
    'image' : image,
    'about' : about,
    'call' : call,
    'linkedin' : linkedin,
    'email': email,
    'whatsapp' : whatsapp,
    'phone' : phone
   };
  }
}