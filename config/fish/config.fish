if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end

#starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
source /home/aqua/Softwares/google-cloud-sdk/path.fish.inc

# The next line enables shell command completion for gcloud.
#source /home/aqua/Softwares/google-cloud-sdk/completion.fish.inc

# set up android sdk
set -x ANDROID_SDK_ROOT /usr/local/android-sdk
fish_add_path /usr/local/android-sdk/cmdline-tools/latest/bin
