if [[ $# < 1 ]]; then
    echo "You need to specify one of these args: [nvim, zsh, tmux]"
    exit 0
fi

target=$1
local_config_path=./home/.config

if [[ $target == "nvim" ]]; then
    echo "Removing nvim folder..."
    rm -rf $local_config_path/nvim

    echo "Updating nvim..."
    cp -rf $HOME/.config/nvim $local_config_path

    echo "Done!"
    exit 1
fi

if [[ $target == "zsh" ]]; then
    echo "Removing zsh folder..."
    rm $local_config_path/.zshrc

    echo "Updating zsh..."
    cp $HOME/.zshrc $local_config_path

    echo "Done!"
    exit 1
fi

if [[ $target == "tmux" ]]; then
    echo "Removing tmux folder..."
    rm $local_config_path/.tmux.conf

    echo "Updating tmux..."
    cp $HOME/.tmux.conf $local_config_path

    echo "Done!"
    exit 1
fi
