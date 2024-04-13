rm -rf nvim
rm .zshrc
rm .tmux.conf

cp -rf $HOME/.config/nvim .
cp $HOME/.zshrc .
cp $HOME/.tmux.conf .
