// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_collection.dart';

// // **************************************************************************
// // IsarCollectionGenerator
// // **************************************************************************

// // coverage:ignore-file
// // ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

// extension GetUserCollectionCollection on Isar {
//   IsarCollection<UserCollection> get userCollections => this.collection();
// }

// const UserCollectionSchema = CollectionSchema(
//   name: r'UserCollection',
//   id: 1551134645489327298,
//   properties: {
//     r'accessToken': PropertySchema(
//       id: 0,
//       name: r'accessToken',
//       type: IsarType.string,
//     ),
//     r'email': PropertySchema(
//       id: 1,
//       name: r'email',
//       type: IsarType.string,
//     ),
//     r'firstName': PropertySchema(
//       id: 2,
//       name: r'firstName',
//       type: IsarType.string,
//     ),
//     r'hashCode': PropertySchema(
//       id: 3,
//       name: r'hashCode',
//       type: IsarType.long,
//     ),
//     r'isActive': PropertySchema(
//       id: 4,
//       name: r'isActive',
//       type: IsarType.bool,
//     ),
//     r'isArtistSelected': PropertySchema(
//       id: 5,
//       name: r'isArtistSelected',
//       type: IsarType.bool,
//     ),
//     r'isCategorySelected': PropertySchema(
//       id: 6,
//       name: r'isCategorySelected',
//       type: IsarType.bool,
//     ),
//     r'isVenueSelected': PropertySchema(
//       id: 7,
//       name: r'isVenueSelected',
//       type: IsarType.bool,
//     ),
//     r'lastName': PropertySchema(
//       id: 8,
//       name: r'lastName',
//       type: IsarType.string,
//     ),
//     r'refreshToken': PropertySchema(
//       id: 9,
//       name: r'refreshToken',
//       type: IsarType.string,
//     ),
//     r'userId': PropertySchema(
//       id: 10,
//       name: r'userId',
//       type: IsarType.long,
//     ),
//     r'username': PropertySchema(
//       id: 11,
//       name: r'username',
//       type: IsarType.string,
//     )
//   },
//   estimateSize: _userCollectionEstimateSize,
//   serialize: _userCollectionSerialize,
//   deserialize: _userCollectionDeserialize,
//   deserializeProp: _userCollectionDeserializeProp,
//   idName: r'id',
//   indexes: {
//     r'userId': IndexSchema(
//       id: -2005826577402374815,
//       name: r'userId',
//       unique: true,
//       replace: true,
//       properties: [
//         IndexPropertySchema(
//           name: r'userId',
//           type: IndexType.value,
//           caseSensitive: false,
//         )
//       ],
//     )
//   },
//   links: {},
//   embeddedSchemas: {},
//   getId: _userCollectionGetId,
//   getLinks: _userCollectionGetLinks,
//   attach: _userCollectionAttach,
//   version: '3.1.0+1',
// );

// int _userCollectionEstimateSize(
//   UserCollection object,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   var bytesCount = offsets.last;
//   bytesCount += 3 + object.accessToken.length * 3;
//   bytesCount += 3 + object.email.length * 3;
//   bytesCount += 3 + object.firstName.length * 3;
//   bytesCount += 3 + object.lastName.length * 3;
//   bytesCount += 3 + object.refreshToken.length * 3;
//   bytesCount += 3 + object.username.length * 3;
//   return bytesCount;
// }

// void _userCollectionSerialize(
//   UserCollection object,
//   IsarWriter writer,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   writer.writeString(offsets[0], object.accessToken);
//   writer.writeString(offsets[1], object.email);
//   writer.writeString(offsets[2], object.firstName);
//   writer.writeLong(offsets[3], object.hashCode);
//   writer.writeBool(offsets[4], object.isActive);
//   writer.writeBool(offsets[5], object.isArtistSelected);
//   writer.writeBool(offsets[6], object.isCategorySelected);
//   writer.writeBool(offsets[7], object.isVenueSelected);
//   writer.writeString(offsets[8], object.lastName);
//   writer.writeString(offsets[9], object.refreshToken);
//   writer.writeLong(offsets[10], object.userId);
//   writer.writeString(offsets[11], object.username);
// }

// UserCollection _userCollectionDeserialize(
//   Id id,
//   IsarReader reader,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   final object = UserCollection(
//     accessToken: reader.readString(offsets[0]),
//     email: reader.readString(offsets[1]),
//     firstName: reader.readString(offsets[2]),
//     isActive: reader.readBool(offsets[4]),
//     isArtistSelected: reader.readBool(offsets[5]),
//     isCategorySelected: reader.readBool(offsets[6]),
//     isVenueSelected: reader.readBool(offsets[7]),
//     lastName: reader.readString(offsets[8]),
//     refreshToken: reader.readString(offsets[9]),
//     userId: reader.readLong(offsets[10]),
//     username: reader.readString(offsets[11]),
//   );
//   object.id = id;
//   return object;
// }

// P _userCollectionDeserializeProp<P>(
//   IsarReader reader,
//   int propertyId,
//   int offset,
//   Map<Type, List<int>> allOffsets,
// ) {
//   switch (propertyId) {
//     case 0:
//       return (reader.readString(offset)) as P;
//     case 1:
//       return (reader.readString(offset)) as P;
//     case 2:
//       return (reader.readString(offset)) as P;
//     case 3:
//       return (reader.readLong(offset)) as P;
//     case 4:
//       return (reader.readBool(offset)) as P;
//     case 5:
//       return (reader.readBool(offset)) as P;
//     case 6:
//       return (reader.readBool(offset)) as P;
//     case 7:
//       return (reader.readBool(offset)) as P;
//     case 8:
//       return (reader.readString(offset)) as P;
//     case 9:
//       return (reader.readString(offset)) as P;
//     case 10:
//       return (reader.readLong(offset)) as P;
//     case 11:
//       return (reader.readString(offset)) as P;
//     default:
//       throw IsarError('Unknown property with id $propertyId');
//   }
// }

// Id _userCollectionGetId(UserCollection object) {
//   return object.id;
// }

// List<IsarLinkBase<dynamic>> _userCollectionGetLinks(UserCollection object) {
//   return [];
// }

// void _userCollectionAttach(
//     IsarCollection<dynamic> col, Id id, UserCollection object) {
//   object.id = id;
// }

// extension UserCollectionByIndex on IsarCollection<UserCollection> {
//   Future<UserCollection?> getByUserId(int userId) {
//     return getByIndex(r'userId', [userId]);
//   }

//   UserCollection? getByUserIdSync(int userId) {
//     return getByIndexSync(r'userId', [userId]);
//   }

//   Future<bool> deleteByUserId(int userId) {
//     return deleteByIndex(r'userId', [userId]);
//   }

//   bool deleteByUserIdSync(int userId) {
//     return deleteByIndexSync(r'userId', [userId]);
//   }

//   Future<List<UserCollection?>> getAllByUserId(List<int> userIdValues) {
//     final values = userIdValues.map((e) => [e]).toList();
//     return getAllByIndex(r'userId', values);
//   }

//   List<UserCollection?> getAllByUserIdSync(List<int> userIdValues) {
//     final values = userIdValues.map((e) => [e]).toList();
//     return getAllByIndexSync(r'userId', values);
//   }

//   Future<int> deleteAllByUserId(List<int> userIdValues) {
//     final values = userIdValues.map((e) => [e]).toList();
//     return deleteAllByIndex(r'userId', values);
//   }

//   int deleteAllByUserIdSync(List<int> userIdValues) {
//     final values = userIdValues.map((e) => [e]).toList();
//     return deleteAllByIndexSync(r'userId', values);
//   }

//   Future<Id> putByUserId(UserCollection object) {
//     return putByIndex(r'userId', object);
//   }

//   Id putByUserIdSync(UserCollection object, {bool saveLinks = true}) {
//     return putByIndexSync(r'userId', object, saveLinks: saveLinks);
//   }

//   Future<List<Id>> putAllByUserId(List<UserCollection> objects) {
//     return putAllByIndex(r'userId', objects);
//   }

//   List<Id> putAllByUserIdSync(List<UserCollection> objects,
//       {bool saveLinks = true}) {
//     return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
//   }
// }

// extension UserCollectionQueryWhereSort
//     on QueryBuilder<UserCollection, UserCollection, QWhere> {
//   QueryBuilder<UserCollection, UserCollection, QAfterWhere> anyId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(const IdWhereClause.any());
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhere> anyUserId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         const IndexWhereClause.any(indexName: r'userId'),
//       );
//     });
//   }
// }

// extension UserCollectionQueryWhere
//     on QueryBuilder<UserCollection, UserCollection, QWhereClause> {
//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idEqualTo(
//       Id id) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IdWhereClause.between(
//         lower: id,
//         upper: id,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idNotEqualTo(
//       Id id) {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(
//               IdWhereClause.lessThan(upper: id, includeUpper: false),
//             )
//             .addWhereClause(
//               IdWhereClause.greaterThan(lower: id, includeLower: false),
//             );
//       } else {
//         return query
//             .addWhereClause(
//               IdWhereClause.greaterThan(lower: id, includeLower: false),
//             )
//             .addWhereClause(
//               IdWhereClause.lessThan(upper: id, includeUpper: false),
//             );
//       }
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idGreaterThan(
//       Id id,
//       {bool include = false}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         IdWhereClause.greaterThan(lower: id, includeLower: include),
//       );
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idLessThan(
//       Id id,
//       {bool include = false}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         IdWhereClause.lessThan(upper: id, includeUpper: include),
//       );
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idBetween(
//     Id lowerId,
//     Id upperId, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IdWhereClause.between(
//         lower: lowerId,
//         includeLower: includeLower,
//         upper: upperId,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> userIdEqualTo(
//       int userId) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.equalTo(
//         indexName: r'userId',
//         value: [userId],
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause>
//       userIdNotEqualTo(int userId) {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'userId',
//               lower: [],
//               upper: [userId],
//               includeUpper: false,
//             ))
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'userId',
//               lower: [userId],
//               includeLower: false,
//               upper: [],
//             ));
//       } else {
//         return query
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'userId',
//               lower: [userId],
//               includeLower: false,
//               upper: [],
//             ))
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'userId',
//               lower: [],
//               upper: [userId],
//               includeUpper: false,
//             ));
//       }
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause>
//       userIdGreaterThan(
//     int userId, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'userId',
//         lower: [userId],
//         includeLower: include,
//         upper: [],
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause>
//       userIdLessThan(
//     int userId, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'userId',
//         lower: [],
//         upper: [userId],
//         includeUpper: include,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> userIdBetween(
//     int lowerUserId,
//     int upperUserId, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.between(
//         indexName: r'userId',
//         lower: [lowerUserId],
//         includeLower: includeLower,
//         upper: [upperUserId],
//         includeUpper: includeUpper,
//       ));
//     });
//   }
// }

// extension UserCollectionQueryFilter
//     on QueryBuilder<UserCollection, UserCollection, QFilterCondition> {
//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'accessToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'accessToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'accessToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'accessToken',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'accessToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'accessToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'accessToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'accessToken',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'accessToken',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       accessTokenIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'accessToken',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'email',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'email',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'email',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'email',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'email',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'email',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'email',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'email',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'email',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       emailIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'email',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'firstName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'firstName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'firstName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'firstName',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'firstName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'firstName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'firstName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'firstName',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'firstName',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       firstNameIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'firstName',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       hashCodeEqualTo(int value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'hashCode',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       hashCodeGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'hashCode',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       hashCodeLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'hashCode',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       hashCodeBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'hashCode',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition> idEqualTo(
//       Id value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'id',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       idGreaterThan(
//     Id value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'id',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       idLessThan(
//     Id value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'id',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition> idBetween(
//     Id lower,
//     Id upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'id',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       isActiveEqualTo(bool value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'isActive',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       isArtistSelectedEqualTo(bool value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'isArtistSelected',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       isCategorySelectedEqualTo(bool value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'isCategorySelected',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       isVenueSelectedEqualTo(bool value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'isVenueSelected',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'lastName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'lastName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'lastName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'lastName',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'lastName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'lastName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'lastName',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'lastName',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'lastName',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       lastNameIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'lastName',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'refreshToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'refreshToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'refreshToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'refreshToken',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'refreshToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'refreshToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'refreshToken',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'refreshToken',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'refreshToken',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       refreshTokenIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'refreshToken',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       userIdEqualTo(int value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'userId',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       userIdGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'userId',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       userIdLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'userId',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       userIdBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'userId',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'username',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'username',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'username',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'username',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'username',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'username',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'username',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'username',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'username',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
//       usernameIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'username',
//         value: '',
//       ));
//     });
//   }
// }

// extension UserCollectionQueryObject
//     on QueryBuilder<UserCollection, UserCollection, QFilterCondition> {}

// extension UserCollectionQueryLinks
//     on QueryBuilder<UserCollection, UserCollection, QFilterCondition> {}

// extension UserCollectionQuerySortBy
//     on QueryBuilder<UserCollection, UserCollection, QSortBy> {
//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByAccessToken() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'accessToken', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByAccessTokenDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'accessToken', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByEmail() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'email', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByEmailDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'email', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByFirstName() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstName', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByFirstNameDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstName', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByHashCode() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'hashCode', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByHashCodeDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'hashCode', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByIsActive() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isActive', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsActiveDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isActive', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsArtistSelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isArtistSelected', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsArtistSelectedDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isArtistSelected', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsCategorySelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isCategorySelected', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsCategorySelectedDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isCategorySelected', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsVenueSelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isVenueSelected', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByIsVenueSelectedDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isVenueSelected', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByLastName() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'lastName', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByLastNameDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'lastName', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByRefreshToken() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'refreshToken', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByRefreshTokenDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'refreshToken', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByUserId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'userId', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByUserIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'userId', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByUsername() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'username', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       sortByUsernameDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'username', Sort.desc);
//     });
//   }
// }

// extension UserCollectionQuerySortThenBy
//     on QueryBuilder<UserCollection, UserCollection, QSortThenBy> {
//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByAccessToken() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'accessToken', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByAccessTokenDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'accessToken', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByEmail() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'email', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByEmailDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'email', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByFirstName() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstName', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByFirstNameDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'firstName', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByHashCode() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'hashCode', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByHashCodeDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'hashCode', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenById() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'id', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'id', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByIsActive() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isActive', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsActiveDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isActive', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsArtistSelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isArtistSelected', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsArtistSelectedDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isArtistSelected', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsCategorySelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isCategorySelected', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsCategorySelectedDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isCategorySelected', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsVenueSelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isVenueSelected', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByIsVenueSelectedDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'isVenueSelected', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByLastName() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'lastName', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByLastNameDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'lastName', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByRefreshToken() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'refreshToken', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByRefreshTokenDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'refreshToken', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByUserId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'userId', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByUserIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'userId', Sort.desc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByUsername() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'username', Sort.asc);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
//       thenByUsernameDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'username', Sort.desc);
//     });
//   }
// }

// extension UserCollectionQueryWhereDistinct
//     on QueryBuilder<UserCollection, UserCollection, QDistinct> {
//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByAccessToken(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'accessToken', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByEmail(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByFirstName(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByHashCode() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'hashCode');
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByIsActive() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'isActive');
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct>
//       distinctByIsArtistSelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'isArtistSelected');
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct>
//       distinctByIsCategorySelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'isCategorySelected');
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct>
//       distinctByIsVenueSelected() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'isVenueSelected');
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByLastName(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct>
//       distinctByRefreshToken({bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'refreshToken', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByUserId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'userId');
//     });
//   }

//   QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByUsername(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
//     });
//   }
// }

// extension UserCollectionQueryProperty
//     on QueryBuilder<UserCollection, UserCollection, QQueryProperty> {
//   QueryBuilder<UserCollection, int, QQueryOperations> idProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'id');
//     });
//   }

//   QueryBuilder<UserCollection, String, QQueryOperations> accessTokenProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'accessToken');
//     });
//   }

//   QueryBuilder<UserCollection, String, QQueryOperations> emailProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'email');
//     });
//   }

//   QueryBuilder<UserCollection, String, QQueryOperations> firstNameProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'firstName');
//     });
//   }

//   QueryBuilder<UserCollection, int, QQueryOperations> hashCodeProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'hashCode');
//     });
//   }

//   QueryBuilder<UserCollection, bool, QQueryOperations> isActiveProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'isActive');
//     });
//   }

//   QueryBuilder<UserCollection, bool, QQueryOperations>
//       isArtistSelectedProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'isArtistSelected');
//     });
//   }

//   QueryBuilder<UserCollection, bool, QQueryOperations>
//       isCategorySelectedProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'isCategorySelected');
//     });
//   }

//   QueryBuilder<UserCollection, bool, QQueryOperations>
//       isVenueSelectedProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'isVenueSelected');
//     });
//   }

//   QueryBuilder<UserCollection, String, QQueryOperations> lastNameProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'lastName');
//     });
//   }

//   QueryBuilder<UserCollection, String, QQueryOperations>
//       refreshTokenProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'refreshToken');
//     });
//   }

//   QueryBuilder<UserCollection, int, QQueryOperations> userIdProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'userId');
//     });
//   }

//   QueryBuilder<UserCollection, String, QQueryOperations> usernameProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'username');
//     });
//   }
// }
