Reading Progress
================

This is an example blog application that preserves the user's reading progress
across different devices/browsers by storing it remotely.

In a live app, an authentication system should be put in place to identify the
user. For demonstration purposes we're using the user's IP, but this is far from
an ideal solution and should not be employed in production.

Getting Started
---------------
To install the application, clone the repo:

```
$ git clone git://github.com/alessandro1997/reading-progress.git
```

Then copy and edit the configuration files:

```
$ cp config/database.example.yml config/database.yml
$ cp config/application.example.yml config/application.yml
```

When you're done, set up the database:

```
$ rake db:setup
```

You're all set! You can now start the application with Foreman:

```
$ foreman start
```

Documentation and Support
-------------------------
All documentation is contained in the [GitHub repository](https://github.com/alessandro1997/reading-progress).
If you need support, you can ping me on Twitter ([@alessandro1997](https://twitter.com/alessandro1997)).

Issues
-------------
Report any issues on [GitHub](https://github.com/alessandro1997/reading-progress).

Contributing
------------
1. Fork it (https://github.com/alessandro1997/reading-progress/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Credits
-------
This application was developed by [Alessandro Desantis](http://alessandro1997.github.io).

License
-------
This application is released under the MIT license.
