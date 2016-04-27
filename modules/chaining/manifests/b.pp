class chaining::b {
  exec { '/bin/bash -c "exit 1"': }
  notify { 'This is class b': }
}
