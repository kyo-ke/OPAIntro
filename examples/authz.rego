package example.authz

default allow := false

allow if {
    input.user.role == "admin"
}

deny contains msg if {
    not allow
    msg := "user is not allowed"
}