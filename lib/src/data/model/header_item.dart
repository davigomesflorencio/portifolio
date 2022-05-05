class HeaderItem {
  final String title;
  final Function()? onTap;
  late bool isButton;

  HeaderItem({
    required this.title,
    required this.onTap,
    this.isButton = false,
  });
}
