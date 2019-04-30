import '../model/company.dart';

class RepoData {
  static final Company bmk = new Company(
    name: "Bharat Makwana",
    about:
        "I am aspiring android developer i am also hardwhare engineer i have experiance in verios of technologies like social media Markeetting, Graphics Designing and many others",
    backdropPhoto: "assets/bharat.jpg",
    courses: <Course>[
      new Course(
        title: "Exploring Flutter",
        thumbnail: "assets/ex_flutter.png",
        url: "https://github.com/bharatmk257/Exploring_flutter",
      ),
      new Course(
        title: "Exploring Android",
        thumbnail: "assets/ex_android.png",
        url: "https://github.com/bharatmk257/Exploring_android",
      ),
      new Course(
        title: "Fuchsia Intro",
        thumbnail: "assets/fuchsia_tweet.png",
        url: "https://github.com/bharatmk257/awesome-fuchsia",
      ),
    ],
    location: "Ahmedabad, India",
    logo: "assets/logo.jpg",
  );
}
