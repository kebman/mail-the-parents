Mail The Parents 1.0
====================

A free Perl script that automates the sending of letters to all the parents of a class of pupils. 

Write the message *once* and send it to everyone, complete with names and dates.


## Prerequisites

**Perl:** You'll of course need an installation of Perl, and you'll need to do some very simple edits in a text editor to get this script to work. Any text editor will do as long as it stores plain text.

**No Fear:** While you do not need to know Perl directly, you'll have to be unafraid of making edits within the code such as changing the message body, or changing a filename or two.

**Address Lists:** You'll also need to know how to edit a list of ID's, names and addresses. You then save the list in what's known as a CSV file. More on that further down.


## Files Needed

To run the code, you'll of course need the Perl script itself. Additionally you also need three CSV files, so called 'comma separated lists' with ID's, names and addresses. 

*Note: While such lists are usually separated each entry with a comma, in the code herein all entries are separated with a semi-colon instead. The reason for this is becayse commas are already used in the lists for other purposes, and also because the semi-colon i smuch less common than commas.*

Don't worry. Example files are shipped with the code. Just edit them as needed.


### Overview of Needed Lists

1. **pupil.csv**: Names and addresses of the pupils, including a line ID for each pupil (1, 2, 3, etc).
2. **parents.csv**: Names and addresses of the parents, with a reference to the ID of their offspring.
3. **dates.csv**: Optional dates and times for the meeting, also with a reference to the ID of the pupil in question.


## Important

This is a light-wheight application. It is not meant for sending out thousands of letters. It's made only to ease the everyday humdrum of sending out letters to parents of the pupils you're currently teaching. This is why simple lists in CSV files are used instead of more serious database calls. 

You can fork and change the code to your likeing, though, as per license.

## License

The code herein is provided as-is and licensed under the GNU GPL V3 http://www.gnu.org/licenses/gpl.html
