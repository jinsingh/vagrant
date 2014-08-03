# Adding user for Trevor Rea
class users::trevorr {

  users::account {'trevorr':
    fullname => 'Trevor Rea',
    email    => 't.rea@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDE2fXP62Ce/wrVX8LAMt6mzF9wPXZ4QmVooYSp6VedPtnIhDz6Ej1R5rJ9CG8tjOjWKVTti3rZclB0I3cSLDV068Ke/fDxdyY3h/sRFYBRskx+sjJPDoa41UShHdfdQ975JbnRR5M6Y0BGsP4FBuh+ZTSbQd8wSrtWCFpUUWQPFQHVXas6BfveR9h374tFL7BQn3407QuqBEMd5tQaQrp5BZ/LL92UiGJz4v5h+ApTfc3GOPFJSYUSYl94wr9m+OmORxR5W1Pf/04MIrJtS2wy6H7w6cRdsSuVMLlCv7Rocmt/FMRP0L/yvS9OLW+3iY2diqkoNqkC3UU79VXytvGt',
  }
}
