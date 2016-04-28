class system::audit {
  file { '/etc/issue':
    audit => all,
  }
}
