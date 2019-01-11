# Drive Tracking

## Usage

1) Navigate to the lib directory of the project.
2) Run `ruby application.rb ../input.txt` (replace `../input.txt` with your own file path if needed)
3) Check the root directory for your `output.txt` to validate the desired scope of the exercise

## Design Notes

An input file is passed into the application by a user in exchange for a generated text report of drivers' trip data

### Models

1) **Driver**: Driver class with necessary getter methods
2) **Trip**: Trip class with necessary gett/attr methods

### Services

1) **MessageHandler**: Receives the input passed from `Application` and hands the message params to the dispatcher.
2) **MessageDispatcher**: Processes the messages for routing and model instantiation (`Driver` & `Trip`)
3) **Reporter**: Generates output.txt

### Saver

1) **DriverTrip**: Associates trips to their corresponding drivers if speed less than 5mph or greater than 100 mph

### Helper

1) **Calculate**: A behavoral class for calculating speed
   
## Testing Appoach

1) RSpec is used test model creation and behavior with mocked data



