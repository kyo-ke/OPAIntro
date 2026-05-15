package example.authz

default allow := false

allow if {
    role := data.example.authz.roles[input.user.name]
    allowed_actions := data.example.authz.role_permissions[role]
    input.action in allowed_actions
}

deny contains msg if {
    not allow
    msg := sprintf("user %s is not allowed to %s", [input.user.name, input.action])
}