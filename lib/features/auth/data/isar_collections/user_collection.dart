// import 'package:isar/isar.dart';

// part 'user_collection.g.dart';

// @Collection()
// class UserCollection {
//   Id id = Isar.autoIncrement;
//   @Index(unique: true, replace: true)
//   final int userId;
//   final String firstName;
//   final String lastName;
//   final String username;
//   final String email;
//   final bool isActive;
//   final bool isCategorySelected;
//   final bool isArtistSelected;
//   final bool isVenueSelected;
//   final String accessToken;
//   final String refreshToken;

//   UserCollection({
//     required this.userId,
//     required this.firstName,
//     required this.lastName,
//     required this.username,
//     required this.email,
//     required this.isActive,
//     required this.isCategorySelected,
//     required this.isArtistSelected,
//     required this.isVenueSelected,
//     required this.accessToken,
//     required this.refreshToken,
//   });

//   @override
//   bool operator ==(covariant UserCollection other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.userId == userId &&
//         other.firstName == firstName &&
//         other.lastName == lastName &&
//         other.username == username &&
//         other.email == email &&
//         other.isActive == isActive &&
//         other.isCategorySelected == isCategorySelected &&
//         other.isArtistSelected == isArtistSelected &&
//         other.isVenueSelected == isVenueSelected &&
//         other.accessToken == accessToken &&
//         other.refreshToken == refreshToken;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         userId.hashCode ^
//         firstName.hashCode ^
//         lastName.hashCode ^
//         username.hashCode ^
//         email.hashCode ^
//         isActive.hashCode ^
//         isCategorySelected.hashCode ^
//         isArtistSelected.hashCode ^
//         isVenueSelected.hashCode ^
//         accessToken.hashCode ^
//         refreshToken.hashCode;
//   }
// }
