# Ensuring previously added users are removed
class users::remove_users {
  $users_to_remove = ['danielt', 'oliverh', 'chriss', 'simons', 'ocarleton', 'rafal']
  ensure_resource( 'user', $users_to_remove, ensure => absent )
}