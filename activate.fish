# We have to do some prancing around in case we're navigating through a symlink
set dir (status dirname)
set f (status filename)
set fullname "$dir/$f"
set fullname (realpath -- $fullname)
set dir (dirname -- $fullname)
if test -z $dir
    set dir .
end
fish_add_path -pP $dir
complete -c uaws -fra (bash -c "source '$dir/awsfuncs'; declare -F" | cut -d ' ' -f 3 | grep -v '^_' | tr \n ' ')
