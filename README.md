Mail The Parents 1.0
====================

A Perl script that automates the sending of letters to all the parents of a class of pupils. 

Write the message *once* and send it to everyone, complete with names and dates.


## Prerequisites

**Perl:** You'll of course need an installation of Perl, and you'll need to do some very simple edits in a text editor to get this script to work. Any text editor will do as long as it stores plain text.

**No Fear:** While you do not need to know Perl directly, you'll have to be unafraid of making edits within the code such as changing the message body stored within the code, or changing a filename or two.

**Address Lists:** You'll also need to know how to edit a comma separated list of ID's, names and addresses. Don't worry, it's not hard. You make a list, and then separate each entry with a comma and save it... (D'oh!) 

Note: In the code herein a semi-colon is used instead of a comma, since the semi-colon is less common than the comma. There are also a few quirks as to how names have to be stored in the lists, but I'll get back to that in the user guide.


### Extra Files Needed

You'll need three files with comma separated lists to make this work:

1. Names and addresses of the pupils, including a line ID for each pupil (1, 2, 3, etc).
2. Names and addresses of the parents, with a reference to the ID of their offspring.
3. Optional: Dates and times for the meeting, also with a reference to the ID of the pupil in question.

Note: The code herein separates each entry with semi-colons instead of commas, as the semi-colon a much less common character.

Don't worry. Example files are shipped with the code. Just edit them as needed.


## Important

This is a light-wheight application. It is not meant for sending out thousands of letters. It's made only to ease the everyday humdrum of sending out letters to parents of the pupils you're currently teaching. This is why simple lists in CSV files are used instead of more serious database calls. 

You can fork and change the code to your likeing, though, as per license.

## License

The code herein is provided as-is and licensed under the GNU GPL V3 http://www.gnu.org/licenses/gpl.html
