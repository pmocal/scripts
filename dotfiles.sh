#this script allows me to easily install my dotfiles on any machine i use, symlinking them into root and storing away existing dotfiles

echo "Have you already cloned the desired dotfiles into the directory ~/dotfiles on this machine?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
			files="bashrc bash_profile vimrc" #desired dotfiles

			echo "Moving old dotfiles to directory ~/olddotfiles and renaming them without the leading dot"
			cd ~
			mkdir ~/olddotfiles
			for file in $files; do
				mv ~/.$file ~/olddotfiles/
                mv ~/olddotfiles/.$file ~/olddotfiles/$file
			done

			echo "Symlinking new dotfiles, located in ~/dotfiles, to files with leading dot in root"
			cd ~/dotfiles
			for file in $files; do
				ln -s ~/dotfiles/$file ~/.$file
			done

            source ~/.bashrc
            source ~/.bash_profile

            ;;
        No )
			echo "Please do that first and then run this script."
			exit
			;;
    esac
done

