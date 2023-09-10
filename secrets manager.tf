
##############################---secrets-manager---##############################

resource "aws_secretsmanager_secret" "my-secrets" {
  name                    = "my-secrets"
  recovery_window_in_days = 0
}

##############################---saved-key-pair-in secrets-manager---##############################

resource "aws_secretsmanager_secret_version" "ssh-key" {
  secret_id     = aws_secretsmanager_secret.my-secrets.id
  secret_string = tls_private_key.ssh-key.public_key_openssh
}