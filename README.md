# Drive Tracking

## Usage

1) Navigate to the lib directory of the project.
2) Run `ruby application.rb ../input.txt` (replace `../input.txt` with your own file path if needed)
3) Check the root directory for your `output.txt` to validate the desired scope of the exercise

## Design Notes

I approached the project as a receiver that generates a report based on the messages passed from the input (file provided by the user in this case).

### Models

1) **Driver**: Driver class with necessary getter/attr methods
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

1) I used RSpec to test model creation and behavior, simulating input with mocked data.



