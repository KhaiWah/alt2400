About this Project
______________________________________________________________________________________________________________________________________________________________________________________

The purpose of this assignment was to learn how to use GitHub, Google Cloud Platform (GCP), Docker, Terraform, and GitHub Actions together to create a basic automated pipeline.

Before starting this project, I did not have much experience with setting up cloud resources or creating automated workflows.

The main goal was to create a pipeline that could process data, store information using GCP services, and automate parts of the deployment process.



Goal
____________________________________________________________________________________________________________________________________________________________________________

- Creating a GitHub repository to store my project files.
- Creating a project board to keep track of tasks through user stories.
- Learning how Docker containers work.
- Setting up GitHub Actions for automation.
- Using Terraform to create and manage cloud resources.
- Connecting the project to Google Cloud Platform.



GitHub and Repository creation
_________________________________________________________________________________________________________________________________________________________________________

I created a GitHub repository to store the files for this project.
I also created a KanBan project board to organize the steps of the project. The board helped me keep track of what tasks were completed and what tasks still needed work.
Also the tasks were written as user stories.

Example from instructor:

Example user story
This is a more complicated user story, I don't expect this level of detail, but I should be able to understand what you consider to be success for a given task
" As an instructor I want to be able to create courses so I can integrate my courses into the platform"
Acceptance criteria:
Instructor user type is created/detected/verified
Instructors can make POST request to endpoint to create courses
Courses automatically create tags with instructor reference 
Instructors can add labs to their course through separate POST endpoint and that endpoint will apply the required tag



Google Cloud Resources and Storage
_________________________________________________________________________________________________________________________________________________________________

The cloud storage used in this project was Google Cloud Storage.

I used Google Cloud Storage because it provides a place to store data and project resources in the cloud.

The Cloud Storage was used for providing the resources for the keys that we specifically needed such as:

- credentials
- service account
- workload identity provider



Pipeline
_____________________________________________________________________________________________________________________________________________________________________

The purpose of my pipeline is to process and store data where I learned different parts of a cloud system.

The basic process is:

1. Data is collected.
2. Data is processed through the application.
3. The processed information is stored using GCP resources.
4. The data can be accessed later if needed.



Docker Container
____________________________________________________________________________________________________________________________________________________________________

I used Docker to package the application into a container.

Before this project, I was not very familiar with containers. I learned that Docker helps make sure an application runs the same way in different environments.

Steps:

- Creating a Dockerfile.
- Building the application container.
- Testing that the container works.
- Preparing it for deployment.



