enum FilterFormsEnum {
  todos(0, 'Todos'),
  ativados(1, 'Ativados'),
  desativados(2, 'Desativados');

  final String label;
  final int value;

  const FilterFormsEnum(this.value, this.label);
}
