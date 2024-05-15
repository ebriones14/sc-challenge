# sc-challenge

## Overview

The `ClientManager` is a Ruby script designed to manage and search client data from a JSON file. It provides functionalities to search clients by name and identify duplicate email addresses.


## Features

- **Search Clients by Name:** Find and display clients whose names match a given search query.
- **Find Duplicate Emails:** Identify and display email addresses that appear more than once in the client list.


## Prerequisites

- Ruby (version 2.5 or later)
- A JSON file containing client data with each client having a `full_name` and an `email`.

**Command-Line Interface:** The script provides a simple command-line interface with the following options:
- **Search clients by name:** Enter `1` and then type the name or partial name of the client you are searching for.
- **Find duplicate emails:** Enter `2` to check for any duplicate email addresses in the client list.
- **Exit:** Enter `3` to exit the program.

## Example

### Searching for Clients by Name

1. Run the script:
```ruby client_manager.rb```

2. Select the search option by entering `1`.

3. Enter the search query, for example, `John`.

The script will display:

```John Doe - john.doe@example.com```

### Finding Duplicate Emails

1. Run the script:
```ruby client_manager.rb```

2. Select the duplicate email check by entering `2`.
The script will display duplicate emails if any are found, or notify you if there are no duplicates:
```
Duplicate emails found:
- john.doe@example.com
- jane.smith@example.com
or
No duplicate emails found.
```
