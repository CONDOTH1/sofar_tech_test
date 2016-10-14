## SoFar Sounds Tech Test

#### Description of Completed Work

This project includes the works completed based on the specification of the test. It has a user interface which gives a clear view of the data that has been gathered. The aim of this project is to connect with an external api and manage the collected via the connection. This project achieves that utilising Ruby on Rails.

This project has been constructed as a 'functioning' website. The idea is that a user can start the rails server and click ```Import Music From Api``` which will open the connection with the api and pull in the data. This connection is managed via the controller which captures the specific data and passes it to the model which saves it to the relevant databases. The schema of the databases emulates that of the uml provided with this test specification. This data is then extracted from the databases and passed back up to the controller then onto the view.

While it takes a bit of time for the api connection and data management to complete it will provide a clear view of the data and its organisation.

#### Restrictions

This 'site' is still a work in progress, but is not designed to be a fully functioning site, it was purely designed to give a decent visualisation of the progress of this test. This site has been set up to allow for 'CRUD' but hasn't yet been fine tuned to allow every element to be managed so efficiently. The primary goal is to visualise the outcome of this test. It's also worth noting that this application only saves the data that comes as a complete set from the api (data that has a video, artist, city, and songs), this is something that I want to further in future.


#### Future Works

Going forward I would like to make this as a fully function project. Ideally I would like to achieve the streamed lined 'CRUD' for each object. I would also like to design and improve the rating system for artists and songs. I think a log in and out option feature would be great also. These would have been achieved (and hopefully will be in the future) however due to time constraints they aren't yet available.

#### Testing

Testing has been completed with the use of Capybara and Rspec. These manage the feature and unit tests respectively. VCR and Webmock have been used to emulate the api call. While the tests can take up to 30 seconds this is due to the sheer amount of data from the recorded api.

#### Techniques

- Test Driven Development
- Object Orientated Programming
- DRY
- Single Responsibility Principle

#### Technologies

- Rails 5.0.0.1
- Ruby 2.3.0
- Rspec
- Capybara
- Webmock
- VCR
- Postgresql

#### Run

To run this application please use a postgresql database. If this hasn't been installed it can be done quickly with brew ```brew install postgresql```. Then clone this repo and when in this directory in the terminal run ```bundle install```. Then run ```rails db:create``` and ```rails db:migrate```, this should set up the databases and relevant schema. Once that's done you should be able to run ```rails s``` which should start localhost 3000. Then go to your browser, i've been using chrome while working on this, and got to ```http://localhost:3000/artists``` or ```http://localhost:3000```. Then push the ```Import Music From Api``` button on the navigation bar. This should begin the connection with the api.
