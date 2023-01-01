Edit corresponding csv file with notepad or notepad++, save as UTF-8 encoded text.

Mail the result to me: stifu@codecreator.net.

If there's no localization file for your language, create it from en.csv file and don't forget to edit the language code in the first line.

If you want to encode localization file yourself, you need W3 strings encoder.

Here's an encoding example:
w3strings.exe --encode en.csv --id-space 7517

If you have w3strings.exe in your PATH variable, you can also use the provided batch script encodestrings.bat.
