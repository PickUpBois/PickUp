# PickUp

# Developer Instructions

## Install CocoaPods

Cocoapods is what we would be using for managing the dependencies in our app, such as the Firebase-sdk.

Open up your terminal and type:

`shell
sudo gem install cocoapods
`

Here is a <a href=https://guides.cocoapods.org/using/getting-started>guide<a> for any additional details on CocoaPods.

## Github-Xcode Tutorial

### Cloning the Repository

In the home view of Xcode, there is an option called "Clone an existing project".
If you are not logged in to GitHub on Xcode, it would ask you for an access token.

To get your access token, go to Githup. Then, go to settings -> developer settings -> personal access token.

Check all of the permissions for your token, and click "Generate token". Make sure you save your token somewhere on
your computer because you will never see it again.

Use this token to log into Github on Xcode. Then, when cloning this repository, if you do not see the repo, enter this url on xcode to clone the repository:

`
https://github.com/PickUpBois/PickUp.git
`

### Pulling changes from the remote branch
If you are currently on the main branch, to get the most recent changes from the remote main branch, on Xcode, go to Source Control -> Pull and
your the files should be updated with the most recent changes.

### Creating a new branch

To create a new branch, click on the Source Control Organizer which is the second item in the Xcode organizer that is located on top left pane of the editory. 
The icon of the item looks like an "X" embedded on a square. When you are there, click on branches, then right click on your current branch (most likely main). Click,
"branch from X" where X is the name of your current branch, and ta da, you have created a new branch.

### Commiting and Pushing changes
To commit your changes, go to Source Control -> Commit to commit your changes. Make sure to enter a commit message in the buttom portion of the screen.
Once you've committed, click on Source Control -> Push to push your changes. Now, a remote branch with the same name as your current branch will be updated with your
most recent changes.

### Additonal Notes
There's still a lot to learn about GitHub so please follow this <a href="https://guides.github.com/"> guide </a> to learn more about the basics of GitHub.
