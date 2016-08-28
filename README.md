# FedenaSdk

Ruby wrapper for fedena api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fedena_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fedena_sdk

## Usage

Initialize sdk
```ruby
client = FedenaSdk.authenticate(
client_id: "<client_id",
client_secret: "<client_secret>",
uri: 'fedena_instance_uri>',
redirect_uri: "redirect_uri_of_your_app");
```

### Generate access token
#### Using username and password
```ruby
FedenaSdk.access_token_from_password('username','password','redirect_uri');
```

##### Using authcode

* Get authorise url
```ruby
client.auth_code.authorize_url(:redirect_uri => '')
```
* Get auth code from url

* Generate token
```ruby
token = client.auth_code.get_token(auth_code,{:redirect_uri => ''},:header_format=>"Token token=\"%s\"")
```

### News

* Get all News

```ruby
FedenaSdk::News.all
```

### User

* Get user details

```ruby
FedenaSdk::User.find('username')
```

### School

* Get current school details

```ruby
FedenaSdk::School.current_school
```

### Attendance
* Get attendance status of a student

```ruby
FedenaSdk::Attendance.show(admission_no,date=>'10-12-2014')
```
* Search in attendance entries

```ruby
FedenaSdk::Attendance.search(query)
```

* Marking attendance

```ruby
attendance = FedenaSdk::Attendance.new(student_admission_no: "", forenoon: "", afternoon: "", date: "", batch_name: "", reason: "")
attendance.save
```

* Deleting attendance object

```ruby
attendance.destroy
```

* Deleting attendance entry by admission_no and date

```ruby
FedenaSdk::Attendance.destroy(admission_no,date)
```
### Course

* Get all  courses

```ruby
FedenaSdk::Course.all
```

### Batch

* Search for batches

```ruby
FedenaSdk::Batch.search(query)
```

### Student

* Search for students

```ruby
FedenaSdk::Student.search(admission_no_like: "123")
```

* Find student by admission_no

```ruby
FedenaSdk::Student.find(<admission_no>)
```
### BiometricInformation

* Get biometric information

```ruby
FedenaSdk::BiometricInformation.find(<biometric_id>)
```
### EmployeeAttendance
### Employee
### EmployeeCategory
### EmployeeDepartment
* Get all employee departments

```ruby
FedenaSdk::EmployeeDepartment.all
```
### EmployeeGrade
### EmployeeLeaveType

* Get all leave types
```ruby
FedenaSdk::EmployeeLeaveType.all
```

### EmployeePosition

* Get all employe postions
```ruby
 FedenaSdk::EmployeePosition.all
```

### Event
### ExamGroup

* Search for exam groups
```ruby
FedenaSdk::ExamGroup.search("<query>")
```

### ExamScore
### FinanceTransaction
* Search for finance transaction

```ruby
FedenaSdk::FinanceTransaction.search("<query>")
```

### GradingLevel
### Payroll
### PayrollGroup
### Reminder
### StudentCategory

* Get all student categories
```ruby
FedenaSdk::StudentCategory.all
```

### Subject
### Timetable

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tachyons/fedena-sdk-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
