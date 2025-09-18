class GridViewLayoutArgs {
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const GridViewLayoutArgs({
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
  });

  GridViewLayoutArgs copyWith({
    int? crossAxisCount,
    double? childAspectRatio,
    double? crossAxisSpacing,
    double? mainAxisSpacing,
  }) {
    return GridViewLayoutArgs(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      childAspectRatio: childAspectRatio ?? this.childAspectRatio,
      crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing,
    );
  }
}
