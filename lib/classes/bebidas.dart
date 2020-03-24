
class Post {

  final String name;
  final String tagline;
  final String image;
  final String firstbrewed;
  final String description;


  Post({ this.name, this.tagline, this.image, this.firstbrewed, this.description});
    factory Post.fromJson(Map<String, dynamic> json) {
      return Post(
        name: json['name'],
        tagline: json['tagline'],
        image: json['image_url'],
        firstbrewed: json['first_brewed'],
        description: json['description'],
        );


    }
}

