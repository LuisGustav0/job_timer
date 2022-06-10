enum ProjectStatusE {
  em_andamento(label: 'Em andamento'),
  finalizado(label: 'Finalizado');

  final String label;

  const ProjectStatusE({required this.label});
}
