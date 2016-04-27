class role::mailserver {
  include profile::postfix
  include profile::spamassassin
  include profile::clamav
}
