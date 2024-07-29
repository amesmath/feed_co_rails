# FeedCo
### POC Rails Application for Feed Merchandising Company

![Logo](https://github.com/amesmath/feed_co_rails/blob/main/app/assets/images/feed_co_desktop.png)


### Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/amesmath/feed_co_rails.git
    cd yourrepository
    ```

2. **Install Ruby dependencies**:
    Ensure you have the correct Ruby version installed. Check the `.ruby-version` file if it exists. Use a version manager like `rbenv` or `rvm` to install the required Ruby version.
    ```sh
    rbenv install <ruby-version>  # If using rbenv
    rvm install <ruby-version>    # If using rvm
    ```

    Install the gems specified in the `Gemfile`:
    ```sh
    bundle install
    ```

3. **Set up the database**:
    Create and migrate the database:
    ```sh
    rails db:create
    rails db:migrate
    ```

    There is extensive Feed Merchandising seed data in the seeds.rb file:
    ```sh
    rails db:seed
    ```

4. **Install JavaScript dependencies**:
    If your application uses a JavaScript package manager like Yarn:
    ```sh
    yarn install
    ```

5. **Start the Rails server**:
    ```sh
    rails server
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
