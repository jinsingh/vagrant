# Adding user for Chijioke Amago
class users::chijiokea {

  users::account {'chijiokea':
    fullname => 'Chijioke Amago',
    email    => 'camago@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCr5XNPabJrhw1D89my9d229qcSTlv0ALrwbKGLoIMDeY/u9ogzpOrkJtx/dO3XqJcL37a6iqzJziiuCNK+/If868A7P+HHEeJz6Zj2OLn6I8FeKRpo/2bUkcBnv361osq4NUSp9aizzbCicfsCaH6lcPrm9/1FEnWfyF8rrMYm5dL8iNNP3Ta2uudwK7jbkpyFj4q8/mglEhM2ieJsz9UEF89xRS0x2S414VtM3HvHq7dk3H8lUnWPSCNpGS+qrciYCUy0Gj2X5zyH4GPrh57JTtPDv5GFLVEFzW28mCP69SIf364BO7YaQ/YgLOwA4ZUnwJu6kfGPQnX0u/ie+8Df',
  }
}
