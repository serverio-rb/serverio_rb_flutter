class State {
  final String os;
  final String arch;
  final String host;
  final String kernel;
  final String uptime;

  State({
    required this.os,
    required this.arch,
    required this.host,
    required this.kernel,
    required this.uptime,
  });
}
