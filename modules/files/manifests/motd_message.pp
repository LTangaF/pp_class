define files::motd_message (
  $message = $title,
  $order   = 10,
) {
  concat::fragment { $message:
    target  => '/etc/motd',
    content => $message,
    order   => $order,
  }
}
