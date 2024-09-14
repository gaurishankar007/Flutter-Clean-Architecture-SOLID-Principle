class SearchParameter {
  final String searchKey;
  final int? isVerified;

  const SearchParameter({
    required this.searchKey,
  }) : isVerified = null;

  const SearchParameter.verified({
    required this.searchKey,
  }) : isVerified = 1;

  const SearchParameter.unverified({
    required this.searchKey,
  }) : isVerified = 0;

  Map<String, dynamic> toJson() => {
        'search_key': searchKey,
        'is_verified': isVerified,
      };
}
