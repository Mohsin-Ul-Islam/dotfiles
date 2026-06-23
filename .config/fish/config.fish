if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"

ssh-add -l >/dev/null 2>&1

if test $status -eq 2
    rm -f $SSH_AUTH_SOCK

    eval (ssh-agent -c -a $SSH_AUTH_SOCK) >/dev/null
end
