# macKar

> Self macOS configure for developers

**TL;DR:**

Tired of reconfiguring your macOS, this is my solution!

**Long version**

As a consultant or a person or move to new device in short period, you want to have a full and quick automatic configuration for your macOS to save your time and make your life easier. Here I create a repo with all tool that I found useful and cool for developers in all these years.

Why do I call it macKar? In Persian if you add "Kar" postfix to a word means a person who use or good in working with that. In the same time "mak-kar" is an adjective in Persian which means cunning. Pretty cool mix of English and Persian, hah?

## What it will install?

(It will update soon)

- homebrew
- curl
- wget
- axel
- oh-my-zsh (+configuration)
- git
- ctags
- nvim (+configuration)
- tmux (TODO)s
- z
- fzf
- bat
- tig
- docker (TODO)
- IntelliJ (TODO)
- Miniconda (TODO)
- Sublime 3 (+configuration)
- VSCode (+configuration)
- Jetbrains Mono font

## Usage

⚠️🚨 This repo is under development!

```
cd ~
git clone git@github.com:mousavi86/mackar.git
cd mackar
sh ./run.sh
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mousavi86/mackar

### How

1. Create a file inside of installers directory and call it `<app_name>.sh`.
2. Create a function in that file by this naming convention `install_<app_name>`.
3. Add all installing formula under that function
4. Run the script again. :)

### Test

TODO
