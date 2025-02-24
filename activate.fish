# We have to do some prancing around in case we're navigating through a symlink
set aws_funcs_script awsfuncs
set dir (status dirname)
set f (status filename)
set fullname "$dir/$f"
set fullname (realpath -- $fullname)
set dir (dirname -- $fullname)
if test -z $dir
    set dir .
end
fish_add_path -pP $dir
#aliases
#
#{ cat awsfuncs-sch; echo; echo 'alias -p;'; } | bash --noprofile --norc -s | cut -d '=' -f 1 | cut -d ' ' -f 2

function invoke_bash
    bash --norc --noprofile $argv
end

function public_aliases
    begin
        cat -- "$dir/$aws_funcs_script"
        printf "\n alias -p;"
    end | invoke_bash -s | cut -d '=' -f 1 | cut -d ' ' -f 2 | grep -v '^_' | tr \n ' '
end

function public_functions
    begin
        cat -- "$dir/$aws_funcs_script"
        printf "\n declare -F;"
    end | invoke_bash -s | cut -d ' ' -f 3 | grep -v '^_' | tr \n ' '
end

function public_members
    begin
        public_aliases
        public_functions
    end | sort
end

complete -c uaws -fra (bash -c "source '$dir/awsfuncs'; declare -F" | cut -d ' ' -f 3 | grep -v '^_' | tr \n ' ')
complete -c maws -fra (public_members)

