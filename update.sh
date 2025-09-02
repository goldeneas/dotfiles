if [[ $# < 1 ]]; then
    echo "You need to specify one of these args: [nvim, zsh, tmux]"
    exit 0
fi

target=$1

if [[ $target == "nvim" ]]; then
    echo "Removing nvim folder..."
    rm -rf nvim

    echo "Updating nvim..."
    cp -rf $HOME/.config/nvim .

    echo "Done!"
    exit 1
fi

if [[ $target == "zsh" ]]; then
    echo "Removing zsh folder..."
    rm .zshrc

    echo "Updating zsh..."
    cp $HOME/.zshrc .

    echo "Done!"
    exit 1
fi

if [[ $target == "tmux" ]]; then
    echo "Removing tmux folder..."
    rm .tmux.conf

    echo "Updating tmux..."
    cp $HOME/.tmux.conf .

    echo "Done!"
    exit 1
fi
