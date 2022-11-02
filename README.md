# ZemogaTestiOS

This App was developed as a test to enter Zemoga.

## Requirements

1. Load the posts from the JSON API and populate the view. DONE
2. Each cell/row should show the title of the post without clipping ( dynamic height ). DONE
3. Once a Post is tapped, the user should be taken to a Post Details Screen. DONE
4. The post details screen should contain:
        The post title and description. DONE
        The post author information. DONE
        The list of comments. DONE
5. Implement a mechanism to favorite/unfavorite a post. 
        Favorite posts should be at the top of the list.DONE
        Favorite posts should have a star indicator. DONE
6. Implement a mechanism to delete a post.DONE
7. Implement a mechanism to remove all posts except from the favorites ones. DONE
8. Implement a mechanism to load all posts from the API. DONE
9. Add meaningful Unit Tests


## Extras

1. Provide an off line solution where:
        User should be able to see previously loaded posts. DONE
         User should be able to see post details. DONE
2. Incorporate a RFP (Reactive Functional Programming) solution as part of your implementation wherever it makes sense


## How to run the app

1. Download the zip file from this github repository and uncompress it
2. Open XCode and select 'open a project or file'
3. Select the folder called 'TestZemoga'
4. Once the project is loaded hit Cmd+R or click the play button at the top left
5. The app should be running now


## App's Architecture

The app uses a simple MVVM pattern that helps to separate the responsibilities of the different components.
It also implements an offline alternative using UserDefaults and storing there as you load or delete posts
There are no third party libraries used in this project, everything is 100% native of iOS