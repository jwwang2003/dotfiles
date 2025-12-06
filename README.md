# dotfiles

```
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```
BRANCH=linux
dotfiles show "$BRANCH":.ssh/config > /tmp/ssh-config.$BRANCH
code --diff /tmp/ssh-config.$BRANCH ~/.ssh/config
```