# filezilla snippets

## command line interface
https://wiki.filezilla-project.org/Command-line_arguments_(Client)

```
# Synopsis
filezilla [<FTP URL>]
filezilla -h, --help
filezilla -s, --site-manager
filezilla -c, --site=<string>
filezilla -l, --logontype=<string>
filezilla -a, --local=<string>
filezilla --close
filezilla --verbose
filezilla -v, --version

# Options
<FTP URL>
Accepts all URLs of the form

[protocol://][user[:pass]@]host[:port][/path]
eg.  sftp://username:password@server:port
Valid protocols are ftp:// (the default if omitted), ftps://, ftpes:// and sftp://

-h, --help
Shows the help dialog.

-s, --sitemanager
Start with opened Site Manager. 

May not be used together with -c nor with URL parameter.

-c, --site=<string>
Connect to specified Site Manager site. 

Site name requirements:

Site has to be given as complete path, with a slash as separation character.
Any slash or backslash that is part of a segment has to be escaped with a backslash.
Path has to be prefixed with 0 for user defined entries or 1 for default entries.
Site path may not contain double quotation marks.

Example:

filezilla --site="0/foo/bar/sl\/ash"
Connects to the user site "sl/ash" in the site directory "foo/bar".


-l, --logontype=(ask|interactive)
Logon type, can only be used together with FTP URL. Argument has to be either 'ask' or 'interactive'. 

FileZilla will ask for any logon information not supplied in the FTP URL before connecting. Useful for custom scripts or shortcuts.


-a, --local=<string>
Sets the local site (left-hand side) to the given path. (Requires version 3.7.1-rc1 or higher) 

Use double quotation for paths with spaces in them. 

Example:

filezilla --site="0/site1" --local="C:\site1 downloads"
filezilla ftp://username:password@ftp.server2.com --local="C:\server2 downloads"
Connects to the user site "site1" and sets the local folder to C:\site1 downloads.

Connects to server2 URL and sets the local folder to C:\server2 downloads.


--close (Windows only)
Closes all running instances of FileZilla.

--verbose
Verbose log messages from wxWidgets.

-v, --version
Print version information to stdout and exit.
```


