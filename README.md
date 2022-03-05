# README

This application will process DMARC Reports from a MailGun account.
You will need to provide an environment variable at startup
MAILGUN_INGRESS_SIGNING_KEY=<your signing key>

to run the app:

```bash
MAILGUN_INGRESS_SIGNING_KEY=<your signing key> rails s
```

To run the tests:

```bash
rake test
```

To load reports locally:
Copy your reports to a directory, then from the ruby console run
```ruby
ParseDirectory.new('/path/to/directory').process
```
