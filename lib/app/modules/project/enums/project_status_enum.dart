enum ProjectStatusE {
  EM_ANDAMENTO(label: 'Em andamento'),
  FINALIZADO(label: 'Finalizado');

  final String label;

  const ProjectStatusE({required this.label});
}
