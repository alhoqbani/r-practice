# Processing The Apache Log Files

# Log Format:
# %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"
# https://httpd.apache.org/docs/2.4/mod/mod_log_config.html#formats

"
%h Remote hostname
%l Remote logname
%u Remote user
%t Time the request was received, in the format
    [18/Sep/2011:19:18:28 -0400]
    The last number indicates the timezone offset from GMT
\"%r\" First line of request.
%>s final status
%O Bytes sent, including headers.
\"%{Referer}i\" 
\"%{User-Agent}i\"
"

access.log <- read.table('data-raw/thesaudilaw.com.log/access.log.1')
head(access.log, 1)

# Resources ---------------------------------------------------------------
links <- c(
  "https://www.r-bloggers.com/log-file-analysis-with-r/"
)

# Date and Time Columns
access.log$V4 <- strptime(access.log$V4, "[%d/%b/%Y:%H:%M:%S", tz = 'GMT')

N <- length(access.log$V4)
access.log$V4[2:N] - access.log$V4[1:(N-1)]

