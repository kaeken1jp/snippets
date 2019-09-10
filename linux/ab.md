[ab - Apache HTTP server benchmarking tool - Apache HTTP Server Version 2.4](https://httpd.apache.org/docs/2.4/programs/ab.html)


```sh
ab [options .....]  URL
```

```sh
$ ab -n 100 -c 10 http://example.com/
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking example.com (be patient).....done


Server Software:        ECS
Server Hostname:        example.com
Server Port:            80

Document Path:          /
Document Length:        1270 bytes

Concurrency Level:      10
Time taken for tests:   2.692 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      161451 bytes
HTML transferred:       127000 bytes
Requests per second:    37.15 [#/sec] (mean)
Time per request:       269.184 [ms] (mean)
Time per request:       26.918 [ms] (mean, across all concurrent requests)
Transfer rate:          58.57 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       86  112  18.5    109     181
Processing:    87  113  23.5    108     182
Waiting:       87  113  23.3    108     182
Total:        175  225  36.5    221     325

Percentage of the requests served within a certain time (ms)
  50%    221
  66%    236
  75%    243
  80%    249
  90%    279
  95%    303
  98%    304
  99%    325
 100%    325 (longest request)
 ```
 
 ```
 Server Software − It is the name of the web server returned in the HTTP header of the first successful return.

Server Hostname − It is the DNS or IP address given on the command line.

Server Port − It is the port to which ab is connecting. If no port is given on the command line, this will default to 80 for http and 443 for https.

SSL/TLS Protocol − This is the protocol parameter negotiated between the client and server. This will only be printed if SSL is used.

Document Path − This is the request URI parsed from the command line string.

Document Length − It is the size in bytes of the first successfully returned document. If the document length changes during testing, the response is considered an error.

Concurrency Level − This is the number of concurrent clients (equivalent to web browsers) used during the test.

Time Taken for Tests − This is the time taken from the moment the first socket connection is created to the moment the last response is received.

Complete Requests − The number of successful responses received.

Failed Requests − The number of requests that were considered a failure. If the number is greater than zero, another line will be printed showing the number of requests that failed due to connecting, reading, incorrect content length, or exceptions.

Total Transferred − The total number of bytes received from the server. This number is essentially the number of bytes sent over the wire.

HTML Transferred − The total number of document bytes received from the server. This number excludes bytes received in HTTP headers

Requests per second − This is the number of requests per second. This value is the result of dividing the number of requests by the total time taken.

Time per request − The average time spent per request. The first value is calculated with the formula concurrency * timetaken * 1000 / done while the second value is calculated with the formula timetaken * 1000 / done

Transfer rate − The rate of transfer as calculated by the formula totalread / 1024 / timetaken.
 ```
 
 
