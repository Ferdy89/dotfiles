# Loads anything thrown into the this_machine/ subdirectory, enabling
# per-machine customizations

for file in "$ZSH_CUSTOM"/this_machine/*.zsh; do
  source "$file"
done
