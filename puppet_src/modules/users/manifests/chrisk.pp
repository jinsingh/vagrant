#Adding user for Christophe Kalista
class users::chrisk {

  users::account {'chrisk':
    fullname => 'Christophe Kalista',
    email    => 'c.kalista@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCsOlB4hXoCrn+b0jYZNoB772MObkaeCnnaSwqeHZpOBF+k+CMNn4/qOuUskVqeRUVjSEgiWqpw2cv+5oVq/HXEdAY8GkzPnuYYFR+siWSAAO1flHnQrNlfMs7KQ8PmtbIYjjRpLVejBmr5551yqJpCsPsUbso1OhRvbgn2EykzFeerlspkGcEYYWZ/o5ugT8P+B7eKe+a+XQt0Em+KP4ST9nI7g+zcrCbzURUcF926aOS0if3dxAWXfiOU1dYthcnjEgF7a7uYKX0+zYWa8n3SDZMpzMYWtAm0ACee7jts4a5s/vz32GUeNdP8ys4JB7g3py9BzUikJksppjoZCPMJ',
  }
}