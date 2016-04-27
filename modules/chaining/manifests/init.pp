class chaining {

  $chained_classes = ['chaining::a', 'chaining::b', 'chaining::c', 'chaining::d']

  anchor { 'begin': } ->
  class { $chained_classes: } ->
  anchor { 'end': }

  # class { $chained_packages:
  #   require => Anchor['begin'],
  #   before => Anchor['end'],
  # }

}
