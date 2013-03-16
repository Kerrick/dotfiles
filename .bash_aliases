pwsafe()
{
  pwgen -1cnsy -N1 --sha1=$GPG_PRIVATE_KEY_PATH#$1@$2 24
}

