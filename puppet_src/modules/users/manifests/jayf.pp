# Adding user for Jay Fitzsimmons
class users::jayf {

  users::account {'jayf':
    fullname => 'Jay Fitzsimmons',
    email    => 'j.fitzsimmons@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCycYufLrlDZUS/1+j8qgIIPLQ7vh9QY4Nx5F3qwdmslP09mrrqQ5Fa31yIUVheHrcIplPhTMt0SCZUIDXndnuNYY+mNhdXt9eOXoIiil/+8HfsjjhmnC6pMmozAFpyU5o1P+jgDreafHO73w4xqyWLNQId1pIfLK/TygNTDXjCBjizNeYrNjGSTr8U3/1iBnRzcdzZje3IEyLpQUAK03QffWr96zlYTuewQqa+ojhEp9qb2WioAdt/tMhHsLPBnul1rKn1/UtKYJoTEk+V+yN7JK5CO6CdKMHt92A+UO03Kia125FNsJ7aNVV4hwlV7JQTCoqLv5ZSnkf+IfKFtSVh',
  }
}
