# Lcd-test

**Introduction**

This is an LCD number displayer application coded in Ruby.

In the project you will find the main application file called `lcdTest.rb` and a file with its tests called `lcdTest_testing.rb`

In order to run the program in your pc you need to have ruby installed in your local machine.

**Set Up**

In order to use this application as a console game you should follow the next steps:

1. clone the project into your machine
2. open the console and go to the projects folder
3. Open the `lcdTest.rb`
4. Uncomment the last lines as it is indicated and save
5. Run `ruby lcdTest.rb` in your console

### That's it!

**Instructions**

Input: You should enter several sets of numbers separated by a white space. Each set of numbers is formed by 2 numbers separated by a `,`. Te first number is the size uf the number and it has to be between the values 1 and 10, the second number is the number that is about to be printed. The last set of numbers has to be `0,0`, to end the application.

EXAMPLE:

**Input:**

2,12345 3,67890 0,0

**Output:**  
 <pre>  
   _ _  _ _         _ _
|     |    | |   | |
|  _ _| _ _| |_ _| |_ _
| |        |     |     |
| |_ _  _ _|     |  _ _|

 _ _ _  _ _ _   _ _ _   _ _ _   _ _ _
|            | |     | |     | |     |
|            | |     | |     | |     |
|_ _ _       | |_ _ _| |_ _ _| |     |
|     |      | |     |       | |     |
|     |      | |     |       | |     |
|_ _ _|      | |_ _ _|  _ _ _| |_ _ _|
