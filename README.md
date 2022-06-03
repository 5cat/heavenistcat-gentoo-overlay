# Add instructions
## Manual way
add the following file to `/etc/portage/repos.conf/heavenistcat.conf`:
```
[librewolf]
location = /var/db/repos/heavenistcat
sync-type = git
sync-uri = https://github.com/5cat/heavenistcat-gentoo-overlay.git
```
then run `emaint -r librewolf sync`

## Eselect Way
```
eselect repository add heavenistcat git https://github.com/5cat/heavenistcat-gentoo-overlay.git
```
then run `emaint -r librewolf sync`
