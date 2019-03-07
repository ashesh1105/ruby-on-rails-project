# Two options to create Time object:
# 1) Time.new:
# Allows custom optional arguments for year, month, day, hour, min and sec
today_now = Time.new
p today_now.class # prints Time
p today_now # prints current time in yyyy-mm-dd hh:mm:ss +/-<gmt_offset>

# Stores a custom moment in Time
# Format: Time.new(year, month, day, hour, min, sec)
p Time.new(2018, 5, 18, 7, 30, 55)  # prints 2018-05-18 07:30:55 -0700

# 2) Time.now:
today_now = Time.now
p today_now.class # prints Time
p today_now # prints current time in yyyy-mm-dd hh:mm:ss +/-<gmt_offset>


### Instance methods on Time object:
today = Time.now
p today # prints current time in yyyy-mm-dd hh:mm:ss +/-<gmt_offset>
p today.month # Prints current month, like 3
p today.day # prints current day, like 6
p today.year # prints current year, like 2019
puts
p today.hour  # prints current hour, like 23
p today.min   # prints current min, like 6
p today.sec   # prints current sec, like 47
puts
p today.yday  # prints current day of the year, like 65 (as of Mar 06, 2019)
p today.wday  # day in the week, like 3, starts at 0 (Sunday) to 6 (Saturday)
puts

### Predicate (boolean) methods on Time object:
today = Time.new(1991, 4, 12)
p today # prints current time in yyyy-mm-dd hh:mm:ss +/-<gmt_offset>
p today.monday? # prints false
p today.tuesday? # prints false
p today.wednesday? # prints false
p today.thursday? # prints false
p today.friday? # prints true
p today.saturday? # prints false
p today.sunday? # prints false

p today.dst?  # prints true, meaning this time fell during daylight saving time

### Add of subtract Time by Seconds
start_of_year = Time.new(2016, 1, 1)
p start_of_year # 2016-01-01 00:00:00 -0800
# You can add Seconds to current time:
p start_of_year + 60  # prints 2016-01-01 00:01:00 -0800, 1 min more than earlier time!
p start_of_year - 60  # prints 2015-12-31 23:59:00 -0800, 1 min less than earlier time
p start_of_year + (24 * 60 * 60)  # prints 2016-01-02 00:00:00 -0800 (+1 Day!)
puts

### Comparable Methods on a Time object:
birthday = Time.new(2016, 4, 12)
summer = Time.new(2016, 6, 21)
independence_day = Time.new(2016, 7, 4)
winter = Time.new(2016, 12, 21)

puts birthday < summer  # prints true
puts birthday == Time.new(2016, 4, 12)  # prints true
puts independence_day >= summer # pritns true
# independence_day being compared to same day but with hour as 1, not midnight:
puts independence_day == Time.new(2016, 7, 4, 1)  # prints false
puts independence_day.between?(birthday, winter)  # prints true
puts independence_day.between?(birthday, summer)  # prints false
puts birthday.between?(Time.new(2016, 1, 1), winter)  # prints true


### Convert Ruby Time object to another objects:
someday = Time.new(2000, 2, 15)
p someday.yday  # prints 46(th day in current year)
p someday.wday  # prints 2(th day in current week)
p someday.mday  # prints 15(th day in current month)

p someday.to_s  # prints "2000-02-15 00:00:00 -0800"
p someday.to_s.class  # prints String
p someday.ctime # prints human readable string: "Tue Feb 15 00:00:00 2000"
p someday.to_a  # prints array: [0, 0, 0, 15, 2, 2000, 2, 46, false, "PST"]
# Format for this array is: hour, min, sec, dd, mm, yyyy, day_of_week, day_of_year, daylight_saving?, timezone

### Convert Time Object to Formatted String: .strfttime method
## Google for strftime (string format time) and you'll get this:
# https://apidock.com/ruby/DateTime/strftime
puts
today = Time.new(2019, 1, 1)
# Use these symbols %B, %d, etc., to format your Date the way you need it!
p today.strftime("%B %d, %Y")  # prints "January 01 2019"
p today.strftime("%B %d, %y")  # prints "January 01 2019"
# You can re arrange of format this in anyway!
p today.strftime("%d of %B, %Y")  # "01 of January, 2019"


### .parse and .strptime Methods:
## .parse method uses default configurations but .strptime method can take
# arguments like which part of string is month, day, year, etc:
require 'time'  # include time module in your script. Needed for .parse and .strptime!
time = Time.parse("2016-03-07")
p time.class  # prints Time
p time.strftime("%B %d %Y") # prints  "March 07 2016"

# Sometimes we might get strings in a different way and we might need to tell Ruby
# to read it in a certain way and parse, this is done via .strptime method:
# For example, see the difference in parsing by two methods below:
p Time.parse("03-04-2019")  # prints 2019-04-03 00:00:00 -0700, so April 03
p Time.strptime("03-04-2019", "%m-%d-%Y") # prints 2019-03-04 00:00:00 -0800, which is Mar 04!
