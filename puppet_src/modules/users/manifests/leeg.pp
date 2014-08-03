# Adding user for Lee Gathercole
class users::leeg {

  users::account {'leeg':
    fullname => 'Lee Gathercole',
    email    => 'l.gathercole@abacogroup.eu',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC2UVcq3Rh4l65a9eNd5riAxHS6JctzgKWTlMbh48Ab5fl0MgBg3Bg/EVvytabXtXZksjyZKcOOdG7u7u1daCo2mWQSujmTijLD1Vet4haozkWdOyNLfMRaNKQ/vsKVHt8veJqNYRVYI9+PV2wcuMQg5fVUf5oWaMWFlrjvek9So+MB8cfLUemWXf/ndgBQNzeONGA1We4rYXcqkEj7LGRLcFfcNlL1ynDVyQ8QQlbZ8K/PW3O9zJsvwXkNaNwwLO52zCBkmPdK8Os7QzGn9TGTPzEcdAn/bg7JhJylGFu9Rwlmp7QGUt2F8oiZpMWq+FEpLIg8Nu2JItF0/m7iqysT',
  }
}
