set dir (realpath (status dirname))
if test -z $dir
    set dir .
end
fish_add_path -pP $dir
complete -c uaws -fra (bash -c "source '$dir/awsfuncs'; declare -F" | cut -d ' ' -f 3 | grep -v '^_' | tr \n ' ')
