# Getting Remote State To Work with localstack

This is a simple repo with two terraform configurations. I'm trying to get this to work with localstack, using the `tflocal` command.

Here's what I'm trying to do:

1. In one tab, run `localstack start`.
2. To create a bucket and dynamoDB for a backend state store, I do `cd remote-state` and then run:
  * `tflocal init`
  * `tflocal apply`
3. `cd ../dyna1` to get to the user of the bucket.
4. `tflocal init`.  This FAILS:

>
>    Initializing the backend...
> 
>     Successfully configured the backend "s3"! Terraform will automatically
>     use this backend unless the backend configuration changes.
>     Error refreshing state: InvalidAccessKeyId: The AWS Access Key Id you provided does not exist in our records.
>     	status code: 403, request id: MGA0GGVFPW1KWQQX, host id: lA/GmUGh9yTep73w5kuUps71WCSDcFxnHsANkWLNhhoptQtr1pfXB0zrgStR7y6EhtEaToL5mpY=

 
 Why am I getting the InvalidAccessKeyId when using tflocal?
