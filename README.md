# DrivrDrivr

## Usage

1) Navigate to the app directory of the project.
2) Run `ruby application.rb ../input.txt` (replace `../input.txt` with your own file path if needed).
3) Check the root directory for your `output.txt` to validate the desired scope of the exercise.

## Design Notes

**Synopsis**: An input file is passed into the application by a user in exchange for a generated text report of drivers' trip data. (See input.txt/output.txt for example input & results)

### Models

1) **Driver**: Driver class
2) **Trip**: Trip class

### Services

1) **Receiver**: Receives the input passed from `Application` and hands the message params to the dispatcher
2) **Dispatcher**: Dispatches the messages for routing and model instantiation (`Driver` & `Trip`)
3) **Reporter**: Generates output.txt derived from the processed messages

### Saver

1) **DriverTrip**: Associates trips to their corresponding drivers if speed is less than 5mph or greater than 100 mph

### Helper

1) **Calculate**: A behavoral class for calculating speed
   
## Testing Appoach

1) RSpec is used test models and calculations.



