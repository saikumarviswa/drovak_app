class Post {

  //--- Name Of City
  final String name;
  //-- image
  final String image;
  //--- population
  final String population;
  //--- country
  final String country;

  Post({this.name,this.country,this.population,this.image});

  static List<Post> allPosts()
  {
    var lstOfCities = new List<Post>();

    lstOfCities.add(new Post(name:"AP23K1324 Driving Very Rash On Jubliee Hills Road no -12",country: "India",population: "19 mill",image: "compImage.png"));
    lstOfCities.add(new Post(name:"AP23K1324 Driving Very Rash On Jubliee Hills Road no -12", country: "Britain",population: "8 mill",image: "compImage.png"));
    lstOfCities.add(new Post(name:"AP23K1324 Driving Very Rash On Jubliee Hills Road no -12", country: "Canada",population: "2.4 mill",image: "compImage.png"));
    lstOfCities.add(new Post(name:"AP23K1324 Driving Very Rash On Jubliee Hills Road no -12", country: "USA",population: "8.1 mill",image: "compImage.png"));
    lstOfCities.add(new Post(name:"AP23K1324 Driving Very Rash On Jubliee Hills Road no -12", country: "France",population: "2.2 mill",image: "compImage.png"));
    lstOfCities.add(new Post(name:"AP23K1324 Driving Very Rash On Jubliee Hills Road no -12", country: "Germany",population: "3.7 mill",image: "compImage.png"));
    return lstOfCities;
  }
}