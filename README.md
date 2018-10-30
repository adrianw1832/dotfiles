## My dotfiles

These are my config files that I am using at the moment. As much as I am using
Git to keep a version control on them, it is also to share my configs in the
hope that someone will find something useful in here.

I would strongly suggest that you understand what the setting does before
copying and using it as what might work for me, might not work for you.

### Setting up with ansible

Run ```ansible-playbook -i ansible/inventory ansible/site.yml -c local``` at
the root of this repo.

Check the dest of the dotfiles in ```ansible/roles/development/vars/main.yml```
since it makes some assumptions as to where the symlinked files should be.
